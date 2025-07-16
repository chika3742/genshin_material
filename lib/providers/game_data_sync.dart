import "dart:developer";

import "package:collection/collection.dart";
import "package:drift/drift.dart" hide JsonKey;
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../components/game_data_sync_indicator.dart";
import "../core/asset_cache.dart";
import "../core/hoyolab_api.dart";
import "../core/secure_storage.dart";
import "../database.dart";
import "../db/in_game_character_state_db_extension.dart";
import "../db/in_game_weapon_state_db_extension.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "../models/weapon.dart";
import "database_provider.dart";
import "preferences.dart";
import "versions.dart";

part "game_data_sync.freezed.dart";
part "game_data_sync.g.dart";

const _fetchTtl = Duration(minutes: 3);

@riverpod
class GameDataSyncCached extends _$GameDataSyncCached {
  @override
  Future<GameDataSyncResult?> build({ required String variantId, String? weaponId }) async {
    final db = ref.watch(appDatabaseProvider);
    final uid = ref.watch(preferencesStateNotifierProvider.select((e) => e.hyvUid));

    if (uid == null) return null;

    final stateCache = switch (weaponId) {
      null => await db.getCharacterState(uid, variantId),
      final String weaponId => await db.getWeaponState(uid, variantId, weaponId),
    };

    // return cached data
    if (stateCache != null) {
      final isObsolete = stateCache.lastUpdated.isBefore(DateTime.now().subtract(_fetchTtl));

      state = AsyncValue.data(GameDataSyncResult(
        isStale: isObsolete,
        levels: stateCache.purposes,
        equippedWeaponId: switch (stateCache) {
          InGameCharacterState(:final equippedWeaponId) => equippedWeaponId,
          _ => null,
        },
      ));
      if (!isObsolete) {
        return state.value!;
      }
    }

    // fetch from server
    state = AsyncValue.data(await ref.watch(gameDataSyncProvider(
      variantId: variantId,
      weaponId: weaponId,
    ).future));

    final levels = state.value?.levels;
    if (levels == null) {
      // error
      return state.value!;
    }

    // save cache
    if (weaponId == null) {
      await db.setCharacterState(InGameCharacterStateCompanion.insert(
        characterId: variantId,
        uid: uid,
        equippedWeaponId: Value.absentIfNull(state.value!.equippedWeaponId),
        purposes: levels,
        lastUpdated: Value(DateTime.now()),
      ));
    } else {
      await db.setWeaponLevels(uid, variantId, weaponId, levels[Purpose.ascension] ?? 1);
    }

    return state.value!;
  }
}

@riverpod
Future<GameDataSyncResult> gameDataSync(Ref ref, { required String variantId, String? weaponId }) async {
  final assetData = ref.watch(assetDataProvider).value;
  final (uid, server) = ref.watch(preferencesStateNotifierProvider.select((e) => (e.hyvUid, e.hyvServer)));
  final hoyolabCookie = await getHoyolabCookie();

  print("evaluated gameDataSync");

  if (uid == null || server == null || hoyolabCookie == null) {
    return GameDataSyncResult(
      errorType: GameDataSyncErrorType.unknown,
      error: "One or more of Hoyolab server, uid, cookie is not set",
    );
  }
  if (assetData == null) {
    return GameDataSyncResult(
      errorType: GameDataSyncErrorType.unknown,
      error: "Asset data is not loaded",
    );
  }

  final api = HoyolabApi(
    cookie: hoyolabCookie,
    uid: uid,
    region: server,
  );

  final (character, variant) = _extractCharacter(assetData.characters, variantId);

  final charaInfo = await HoyolabApiUtils.loopUntilCharacter(
    character.hyvIds,
    (page) {
      return HoyolabApi.queue.run(() => api.avatarList(
        page,
        elementIds: [assetData.elements[variant.element]!.hyvId],
        weaponCatIds: [assetData.weaponTypes[variant.weaponType]!.hyvId],
      ));
    },
  );

  if (charaInfo == null) {
    return GameDataSyncResult(
      errorType: GameDataSyncErrorType.characterDoesNotExist,
    );
  }

  final equippedWeaponId = assetData.weapons.values
      .firstWhereOrNull((e) => e.hyvId == charaInfo.weapon?.id)?.id;

  if (weaponId == null) { // to fetch character levels
    return GameDataSyncResult(
      levels: _toCharacterLevels(charaInfo),
      equippedWeaponId: equippedWeaponId,
    );
  } else { // to fetch weapon levels
    // check if the weapon is equipped
    if (charaInfo.weapon == null || equippedWeaponId != weaponId) {
      return GameDataSyncResult(
        errorType: GameDataSyncErrorType.weaponNotEquipped,
      );
    }

    return GameDataSyncResult(
      levels: {
        Purpose.ascension: charaInfo.weapon!.currentLevel,
      },
    );
  }
}

@riverpod
Future<Map<String, int>> bagLackNum(Ref ref, { required String variantId, String? weaponId }) async {
  final assetData = ref.watch(assetDataProvider).value;
  final prefs = ref.watch(preferencesStateNotifierProvider);
  final hoyolabCookie = await getHoyolabCookie();

  if (prefs.hyvServer == null || prefs.hyvUid == null || hoyolabCookie == null) {
    throw StateError("Hoyolab server, uid, or cookie is not set");
  }
  if (assetData == null) {
    throw StateError("Asset data is not loaded");
  }

  final api = HoyolabApi(
    cookie: hoyolabCookie,
    uid: prefs.hyvUid!,
    region: prefs.hyvServer!,
  );

  final (character, variant) = _extractCharacter(assetData.characters, variantId);

  // fetch material lack numbers
  final calcResult = await HoyolabApi.queue.run(() => _computeBag(
    api: api,
    assetData: assetData,
    ids: character.hyvIds,
    variant: variant,
    weaponId: weaponId,
  ));

  return Map.fromEntries(calcResult!.overallConsume.map((e) {
    final materialId = assetData.materials.entries.firstWhere((m) => m.value.hyvId == e.id).key;
    return MapEntry(materialId, e.lackNum);
  }));
}

@riverpod
GameDataSyncStatus gameDataSyncState(Ref ref, { required String variantId, String? weaponId }) {
  final snapshots = [
    ref.watch(gameDataSyncCachedProvider(variantId: variantId, weaponId: weaponId)),
    ref.watch(bagLackNumProvider(variantId: variantId, weaponId: weaponId)),
  ];

  final syncResult = snapshots.first.value as GameDataSyncResult?;

  print(syncResult);

  if (snapshots.any((snapshot) => snapshot.isLoading) || syncResult?.isStale == true) {
    return const GameDataSyncStatus.syncing();
  }
  if (snapshots.any((snapshot) => snapshot.hasError)) {
    return GameDataSyncStatus.error(error: snapshots.map((e) => e.error));
  }
  if (syncResult?.errorType != null) {
    return GameDataSyncStatus.fromErrorType(syncResult!.errorType!, syncResult.error);
  }

  return GameDataSyncStatus.synced();
}

@riverpod
class ResinSyncStateNotifier extends _$ResinSyncStateNotifier {
  @override
  GameDataSyncStatus build() {
    return const GameDataSyncStatus.synced();
  }

  Future<void> syncResin() async {
    final prefs = ref.read(preferencesStateNotifierProvider);

    if (!prefs.syncResin) {
      return;
    }

    assert(prefs.hyvServer != null && prefs.hyvUid != null);

    final hoyolabCookie = await getHoyolabCookie();
    if (hoyolabCookie == null) {
      state = const GameDataSyncStatus.error(error: "No hoyolab cookie");
      return; // error
    }
    final api = HoyolabApi(cookie: hoyolabCookie, uid: prefs.hyvUid!, region: prefs.hyvServer!);

    state = const GameDataSyncStatus.syncing();

    try {
      final dailyNote = await api.getDailyNote();
      await ref.read(preferencesStateNotifierProvider.notifier)
          .setResinWithRecoveryTime(dailyNote.currentResin, int.parse(dailyNote.resinRecoveryTime));
    } on Exception catch (e, st) {
      state = GameDataSyncStatus.error(error: e);
      log("Error syncing resin", error: e, stackTrace: st);
      return; // error
    }

    state = const GameDataSyncStatus.synced();
  }
}

@Freezed(copyWith: true)
sealed class GameDataSyncResult with _$GameDataSyncResult {
  const factory GameDataSyncResult({
    Map<Purpose, int>? levels,
    String? equippedWeaponId,
    GameDataSyncErrorType? errorType,
    Object? error,
    @Default(false) bool isStale,
  }) = _GameDataSyncResult;
}

/// If character does not exist, return null.
Map<Purpose, int> _toCharacterLevels(AvatarListResultItem charaInfo) {
  final result = <Purpose, int>{};

  result[Purpose.ascension] = int.parse(charaInfo.currentLevel);

  final skills = charaInfo.skills.where((element) => element.maxLevel != 1);
  skills.forEachIndexed((index, element) {
    final purpose = switch (index) {
      0 => Purpose.normalAttack,
      1 => Purpose.elementalSkill,
      2 => Purpose.elementalBurst,
      _ => throw "Invalid talent index",
    };
    result[purpose] = element.currentLevel;
  });

  return result;
}

Future<CalcResult?> _computeBag({
  required HoyolabApi api,
  required AssetData assetData,
  required List<int> ids,
  required CharacterOrVariant variant,
  String? weaponId,
}) async {
  final avatarId = await _determineAvatarId(
    api: api,
    ids: ids,
    weaponTypeFilter: assetData.weaponTypes[variant.weaponType]!.hyvId,
  );

  final computeReq = _createCalcComputeRequest(
    variant: variant,
    assetData: assetData,
    avatarId: avatarId,
    weapon: weaponId != null ? assetData.weapons[weaponId] : null,
  );

  return await api.batchCompute([computeReq]);
}

CalcComputeItem _createCalcComputeRequest({
  required CharacterOrVariant variant,
  required AssetData assetData,
  required int avatarId,
  Weapon? weapon,
}) {
  CalcComputeItem item = const CalcComputeItem();

  // append character info to the compute request
  item = item.copyWith(
    avatarId: avatarId,
    currentAvatarLevel: 1,
    elementAttrId: assetData.elements[variant.element]!.hyvId,
    targetAvatarLevel: assetData.characterIngredients.purposes[Purpose.ascension]!.levels.keys.last,
    skills: variant.talents.values.map((e) => CalcComputeSkill(
      id: e.idList.first,
      currentLevel: 1,
      targetLevel: assetData.characterIngredients.purposes[Purpose.normalAttack]!.levels.keys.last,
    )).toList(),
  );

  if (weapon != null) {
    // append weapon info to the compute request
    item = item.copyWith(
      weapon: CalcComputeWeapon(
        id: weapon.hyvId,
        currentLevel: 1,
        targetLevel: assetData.weaponIngredients.rarities[weapon.rarity]!.levels.keys.last,
        rarity: weapon.rarity,
        name: weapon.name.localized,
      ),
    );
  }

  return item;
}

Future<int> _determineAvatarId({
  required HoyolabApi api,
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
  final variant = characters[variantId] as CharacterOrVariant;
  final group = switch (variant) {
    ListedCharacter() => variant,
    CharacterVariant(:final parentId) => characters[parentId] as CharacterGroup,
    _ => throw StateError("Invalid variant: $variantId"),
  };
  return (group, variant);
}

enum GameDataSyncErrorType {
  characterDoesNotExist,
  mustBeResonatedWithStatue,
  weaponNotEquipped,
  unknown,
}
