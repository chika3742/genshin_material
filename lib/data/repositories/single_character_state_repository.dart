import "package:clock/clock.dart";
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/errors.dart";
import "../../db/in_game_character_state_db_extension.dart";
import "../../models/character.dart";
import "../../providers/database_provider.dart";
import "../../providers/hoyolab_api.dart";
import "../../providers/hoyolab_game_server.dart";
import "../../providers/versions.dart";
import "../services/hoyolab/hoyolab_api_utils.dart";
import "avatar_to_companion_extension.dart";
import "character_state_repository.dart";
import "id_converters.dart";

part "single_character_state_repository.g.dart";

const _ttlPerCharacter = Duration(seconds: 90);

@riverpod
class SingleCharacterStateRepository extends _$SingleCharacterStateRepository {
  static final fetchMutation = Mutation<FetchResult>();

  @override
  Future<CharacterState?> build(String variantId) async {
    return (await ref.watch(characterStateRepositoryProvider.selectAsync((d) => d?[variantId])));
  }

  Future<FetchResult> _fetch() async {
    final cachedValue = await _getCachedValue();
    if (cachedValue != null) {
      return FetchSuccess(
        state: cachedValue,
        isFresh: false,
      );
    }

    final db = ref.read(appDatabaseProvider);
    final assetData = await ref.read(assetDataProvider.future);
    final api = await ref.read(hoyolabGameApiProvider.future);
    final uid = ref.read(hoyolabGameServerProvider.select((s) => s.uidOrNull))!;

    final hyvIds = assetData.variantIdToCharacterHyvIds(variantId);
    if (hyvIds == null) {
      throw ArgumentError("Cannot find the remote character id for variant id.");
    }

    final character = assetData.characters[variantId]! as CharacterOrVariant;

    final result = await HoyolabApiUtils.loopUntilCharacter(hyvIds, (page) {
      return api.avatarList(
        page,
        elementIds: [assetData.getRemoteElementId(character.element)],
        weaponCatIds: [assetData.getRemoteWeaponCategoryId(character.weaponType)],
      );
    });
    if (result == null) {
      return FetchCharacterNotFound();
    }
    final companion = result.toDbCompanion(uid, clock.now());
    final inserted = await db.setCharacterState(companion);
    return FetchSuccess(
      state: CharacterState.fromDatabase(inserted, assetData),
      isFresh: true,
    );
  }

  static Future<void> executeFetch(MutationTarget ref, String variantId) {
    return fetchMutation(variantId).run(ref, (tsx) {
      return tsx.get(singleCharacterStateRepositoryProvider(variantId).notifier)
          ._fetch();
    }).then<void>((_) {}, onError: handleError);
  }

  /// Returns `null` if the cached value is stale.
  Future<CharacterState?> _getCachedValue() async {
    final current = await future;
    if (current != null && current.lastUpdatedAt.add(_ttlPerCharacter).isAfter(clock.now())) {
      return current;
    }
    return null;
  }
}

sealed class FetchResult {
  const FetchResult();
}

final class FetchSuccess extends FetchResult {
  final CharacterState state;
  final bool isFresh;

  const FetchSuccess({required this.state, required this.isFresh});
}

final class FetchCharacterNotFound extends FetchResult {
  const FetchCharacterNotFound();
}
