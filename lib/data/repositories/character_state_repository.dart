import "package:clock/clock.dart";
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/asset_cache.dart";
import "../../core/errors.dart";
import "../../database.dart";
import "../../db/in_game_character_state_db_extension.dart";
import "../../models/common.dart";
import "../../providers/database_provider.dart";
import "../../providers/hoyolab_api.dart";
import "../../providers/hoyolab_game_server.dart";
import "../../providers/versions.dart";
import "../services/hoyolab/hoyolab_api_utils.dart";
import "avatar_to_companion_extension.dart";
import "id_converters.dart";

part "character_state_repository.g.dart";
part "character_state_repository.freezed.dart";

// TODO: implement fetchAll cooldown
// ignore: unused_element
const _ttlWholeCharacters = Duration(minutes: 5);

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
    final db = ref.read(appDatabaseProvider);
    final api = await ref.read(hoyolabGameApiProvider.future);
    final uid = ref.read(hoyolabGameServerProvider.select((s) => s.uidOrNull))!;

    final characters = await HoyolabApiUtils.listAllCharacters(api.avatarList);
    final now = clock.now();
    await db.setCharacterStates(
      characters.map((character) => character.toDbCompanion(uid, now)).toList(),
    );
  }

  static Future<void> executeFetchAll(MutationTarget ref) {
    return fetchAllMutation.run(ref, (tsx) {
      return tsx.get(characterStateRepositoryProvider.notifier)._fetchAll();
    }).then<void>((_) {}, onError: handleError);
  }
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
