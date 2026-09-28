import "dart:developer";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../components/game_data_sync_indicator.dart";
import "../core/asset_cache.dart";
import "../core/pref_keys.dart";
import "../data/services/hoyolab/hoyolab_api_utils.dart";
import "../data/services/hoyolab/hoyolab_game_api.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "../models/weapon.dart";
import "../utils/lists.dart";
import "hoyolab_api.dart";
import "hoyolab_game_server.dart";
import "pref_notifier.dart";
import "resin.dart";
import "versions.dart";

part "game_data_sync.freezed.dart";
part "game_data_sync.g.dart";

/// Item id to lack numbers.
typedef ItemLackNums = Map<String, int>;

/// Represents a character for game data synchronization, including the variant ID
/// and an optional equipped weapon ID.
///
/// This class is used to encapsulate the minimal information required to identify
/// a character and its equipped weapon (if any) for synchronization purposes.
@freezed
sealed class GameDataSyncCharacter with _$GameDataSyncCharacter {
  const factory GameDataSyncCharacter({
    required String variantId,
    String? weaponId,
  }) = _GameDataSyncCharacter;

  /// Creates an [EqualityList] containing a single [GameDataSyncCharacter] instance
  /// with the given parameters.
  ///
  /// This is a convenience method for constructing a list with one character,
  /// useful for APIs or providers that expect an [EqualityList] of characters.
  static EqualityList<GameDataSyncCharacter> single({
    required String variantId,
    String? weaponId,
  }) {
    return EqualityList([
      GameDataSyncCharacter(variantId: variantId, weaponId: weaponId),
    ]);
  }
}

@freezed
sealed class _ComputeBagRequestItem with _$ComputeBagRequestItem {
  const factory _ComputeBagRequestItem({
    required List<int> ids,
    required CharacterOrVariant variant,
    String? weaponId,
  }) = __ComputeBagRequestItem;
}

@riverpod
Future<Map<String, int>?> bagLackNum(Ref ref, List<GameDataSyncCharacter> entries) async {
  final assetData = ref.watch(assetDataProvider).value;
  final syncBagLackNums = ref.watch(prefProvider(PrefKeys.syncBagLackNums));

  if (!ref.watch(isLinkedWithHoyolabProvider)) {
    log("Server not selected or sync feature disabled");
    return null;
  }
  if (!syncBagLackNums) {
    return null; // bag lack number sync is disabled
  }
  if (assetData == null) {
    throw StateError("Asset data is not loaded");
  }

  final api = await ref.watch(hoyolabGameApiProvider.future);

  final requests = entries.map((e) {
    final (character, variant) = _extractCharacter(assetData.characters, e.variantId);
    return _ComputeBagRequestItem(
      ids: character.hyvIds,
      variant: variant,
      weaponId: e.weaponId,
    );
  }).toList();

  // fetch material lack numbers
  final calcResult = await _computeBag(
    api: api,
    assetData: assetData,
    requests: requests,
  );

  return Map.fromEntries(calcResult.overallConsume.map((e) {
    final materialId = assetData.materials.entries.firstWhere((m) => m.value.hyvId == e.id).key;
    return MapEntry(materialId, e.lackNum);
  }));
}

@riverpod
GameDataSyncStatus? gameDataSyncState(Ref ref, { required String variantId, String? weaponId }) {
  final snapshot = ref.watch(bagLackNumProvider(GameDataSyncCharacter.single(variantId: variantId, weaponId: weaponId)));

  return switch (snapshot) {
    AsyncLoading() => const GameDataSyncStatus.syncing(),
    AsyncError(:final error) => GameDataSyncStatus.error(error: error),
    AsyncData(value: null) => null, // sync is disabled or no data available
    AsyncData() => const GameDataSyncStatus.synced(),
  };
}

@riverpod
class ResinSyncStateNotifier extends _$ResinSyncStateNotifier {
  @override
  GameDataSyncStatus build() {
    return const GameDataSyncStatus.synced();
  }

  Future<void> syncResin() async {
    final syncResin = ref.read(prefProvider(PrefKeys.syncResin));
    if (!syncResin) {
      return;
    }

    if (!ref.read(isLinkedWithHoyolabProvider)) {
      state = const GameDataSyncStatus.error(
        error: "One or more of Hoyolab server, uid, cookie is not set",
      );
      return; // error
    }

    state = const GameDataSyncStatus.syncing();

    try {
      final api = await ref.read(hoyolabGameApiProvider.future);
      final dailyNote = await api.getDailyNote();
      await ref.read(resinProvider.notifier)
          .setResinWithRecoveryTime(dailyNote.currentResin, int.parse(dailyNote.resinRecoveryTime));
    } on Exception catch (e, st) {
      state = GameDataSyncStatus.error(error: e);
      log("Error syncing resin", error: e, stackTrace: st);
      return; // error
    }

    state = const GameDataSyncStatus.synced();
  }
}

Future<CalcResult> _computeBag({
  required HoyolabGameApi api,
  required AssetData assetData,
  required List<_ComputeBagRequestItem> requests,
}) async {
  final apiRequests = <CalcComputeItem>[];

  for (final item in requests) {
    final avatarId = await _determineAvatarId(
      api: api,
      ids: item.ids,
      weaponTypeFilter: assetData.weaponTypes[item.variant.weaponType]!.hyvId,
    );

    final computeReq = _createCalcComputeRequest(
      variant: item.variant,
      assetData: assetData,
      avatarId: avatarId,
      weapon: item.weaponId != null ? assetData.weapons[item.weaponId] : null,
    );

    apiRequests.add(computeReq);
  }

  return await api.batchCompute(apiRequests);
}

CalcComputeItem _createCalcComputeRequest({
  required CharacterOrVariant variant,
  required AssetData assetData,
  required int avatarId,
  Weapon? weapon,
}) {
  CalcComputeItem item = const CalcComputeItem();

  final ascensionTargetLv = assetData.characterIngredients.getLevels(
    rarity: variant.rarity,
    purpose: Purpose.ascension,
  ).levels.keys.last;
  final skillsTargetLv = assetData.characterIngredients.getLevels(
    rarity: variant.rarity,
    purpose: Purpose.normalAttack,
  ).levels.keys.last;

  // append character info to the compute request
  item = item.copyWith(
    avatarId: avatarId,
    currentAvatarLevel: 1,
    elementAttrId: assetData.elements[variant.element]!.hyvId,
    targetAvatarLevel: ascensionTargetLv,
    skills: variant.talents.values.map((e) => CalcComputeSkill(
      id: e.idList.first,
      currentLevel: 1,
      targetLevel: skillsTargetLv,
    )).toList(),
  );

  if (weapon != null) {
    final weaponTargetLv = assetData.weaponIngredients.getLevels(
      rarity: weapon.rarity,
      purpose: Purpose.ascension,
    ).levels.keys.last;

    // append weapon info to the compute request
    item = item.copyWith(
      weapon: CalcComputeWeapon(
        id: weapon.hyvId,
        currentLevel: 1,
        targetLevel: weaponTargetLv,
        rarity: weapon.rarity,
        name: weapon.name.localized,
      ),
    );
  }

  return item;
}

Future<int> _determineAvatarId({
  required HoyolabGameApi api,
  required List<int> ids,
  required int weaponTypeFilter,
}) async {
  if (ids.length > 2) {
    final result = await HoyolabApiUtils.loopUntilCharacter(
      ids,
          (page) {
        return api.avatarList(
          page,
          elementIds: [],
          weaponCatIds: [weaponTypeFilter],
        );
      },
    );
    return result?.id ?? ids.first;
  } else {
    return ids.first;
  }
}

(CharacterWithLargeImage character, CharacterOrVariant variant) _extractCharacter(
  Map<String, Character> characters,
  String variantId,
) {
  final variant = characters[variantId]! as CharacterOrVariant;
  final group = switch (variant) {
    ListedCharacter() => variant as CharacterWithLargeImage,
    CharacterVariant(:final parentId) => characters[parentId]! as CharacterGroup,
    _ => throw StateError("Invalid variant: $variantId"),
  };
  return (group, variant);
}
