import "dart:async";

import "package:clock/clock.dart";
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/asset_cache.dart";
import "../../core/pref_keys.dart";
import "../../db/database.dart";
import "../../db/extensions/in_game_character_state_db_extension.dart";
import "../../models/common.dart";
import "../../providers/database_provider.dart";
import "../../providers/hoyolab_api.dart";
import "../../providers/hoyolab_game_server.dart";
import "../../providers/pref_notifier.dart";
import "../../providers/versions.dart";
import "../services/hoyolab/hoyolab_api_utils.dart";
import "avatar_to_companion_extension.dart";
import "id_converters.dart";

part "character_state_repository.g.dart";
part "character_state_repository.freezed.dart";

const characterFetchAllCooldown = Duration(minutes: 3);

@riverpod
Stream<List<InGameCharacterState>?> _cachedCharacterStates(Ref ref) async* {
  final db = ref.watch(appDatabaseProvider);
  final uid = ref.watch(hoyolabGameServerProvider.select((s) => s.uidOrNull));
  if (uid == null) {
    yield null;
    return;
  }

  yield* db.watchCharacterStates(uid);
}

@riverpod
class CharacterStateRepository extends _$CharacterStateRepository {
  static final fetchAllMutation = Mutation<void>();

  @override
  Future<Map<String, CharacterState>?> build() async {
    final assetData = await ref.watch(assetDataProvider.future);
    final charaStates = await ref.watch(_cachedCharacterStatesProvider.future);
    if (charaStates == null) {
      return null;
    }

    return Map.fromEntries(charaStates.map((chara) {
      final localCharacterId = assetData.getLocalCharacterId(
        chara.characterId,
        elementId: chara.elementId,
      );
      if (localCharacterId == null) {
        return null;
      }

      return MapEntry(
        localCharacterId,
        CharacterState.fromDatabase(chara, assetData),
      );
    }).nonNulls);
  }

  Future<void> _fetchAll() async {
    if (!ref.read(isFetchAllCharactersAvailableProvider)) {
      throw StateError("Character fetch-all is on cooldown.");
    }

    final db = ref.read(appDatabaseProvider);
    final api = await ref.read(hoyolabGameApiProvider.future);
    final uid = ref.read(hoyolabGameServerProvider.select((s) => s.uidOrNull))!;

    final characters = await HoyolabApiUtils.listAllCharacters(api.avatarList);
    final now = clock.now();
    await db.setCharacterStates(
      characters.map((character) => character.toDbCompanion(uid, now)).toList(),
    );

    ref.read(prefProvider(PrefKeys.lastCharacterFetchAll).notifier).set(now);
  }

  static Future<void> executeFetchAll(MutationTarget ref) {
    return fetchAllMutation.run(ref, (tsx) {
      return tsx.get(characterStateRepositoryProvider.notifier)._fetchAll();
    });
  }
}

/// Whether fetching all characters is available now. Rebuilds itself when the
/// cooldown ends.
@riverpod
bool isFetchAllCharactersAvailable(Ref ref) {
  final lastRun = ref.watch(prefProvider(PrefKeys.lastCharacterFetchAll));
  final remaining = lastRun?.add(characterFetchAllCooldown).difference(clock.now());
  if (remaining == null || remaining <= .zero) {
    return true;
  }

  final timer = Timer(remaining, ref.invalidateSelf);
  ref.onDispose(timer.cancel);
  return false;
}

@freezed
sealed class CharacterState with _$CharacterState {
  const factory CharacterState({
    required Map<Purpose, int> levels,
    /// `null` means an unknown item where ID mapping failed, for example
    /// because it does not exist in the asset data.
    required String? equippedWeaponId,
    required Map<Purpose, int> weaponLevels,
    required DateTime lastUpdatedAt,
  }) = _CharacterState;

  factory CharacterState.fromDatabase(InGameCharacterState chara, AssetData assetData) {
    return CharacterState(
      levels: chara.purposes,
      equippedWeaponId: assetData.getLocalWeaponId(chara.equippedWeaponId),
      weaponLevels: chara.weaponPurposes,
      lastUpdatedAt: chara.lastUpdated,
    );
  }
}
