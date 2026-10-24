import "dart:async";
import "dart:math";

import "package:clock/clock.dart";
import "package:collection/collection.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/asset_cache.dart";
import "../../core/pref_keys.dart";
import "../../db/extensions/in_game_character_state_db_extension.dart";
import "../../models/character.dart";
import "../../models/common.dart";
import "../../models/weapon.dart";
import "../../providers/database_provider.dart";
import "../../providers/hoyolab_api.dart";
import "../../providers/hoyolab_game_server.dart";
import "../../providers/pref_notifier.dart";
import "../../providers/versions.dart";
import "../models/bag_counts.dart";
import "../models/hoyolab_api.dart";
import "../services/hoyolab/hoyolab_api_utils.dart";
import "avatar_to_companion_extension.dart";

part "bag_counts_repository.g.dart";

const _cacheTtl = Duration(minutes: 3);

/// Returns `null` if sync is disabled.
@riverpod
class BagCountsNotifier extends _$BagCountsNotifier {
  var _expired = false;

  @override
  Future<BagCounts?> build(BagCountRequests requests) async {
    _expired = false;

    if (!ref.watch(isLinkedWithHoyolabProvider)
        || !ref.watch(prefProvider(PrefKeys.syncBagLackNums))) {
      return null; // sync is disabled
    }

    final assetData = ref.watch(assetDataProvider).requireValue;

    for (final v in requests.variantIds) {
      final variant = assetData.variants[v];
      if (variant == null) {
        throw ArgumentError.value(v, "variantId", "variant not found");
      }
      if (variant.disableSync) {
        throw ArgumentError.value(v, "variantId", "variant's sync is disabled");
      }
    }

    for (final w in requests.weaponIds) {
      final weapon = assetData.weapons[w];
      if (weapon == null) {
        throw ArgumentError.value(w, "weaponId", "weapon not found");
      }
      if (weapon.disableSync) {
        throw ArgumentError.value(w, "weaponId", "weapon's sync is disabled");
      }
    }

    final api = await ref.watch(hoyolabGameApiProvider.future);

    final requestPairs = [
      for (var i = 0; i < max(requests.variantIds.length, requests.weaponIds.length); i++) (
        variantId: requests.variantIds.elementAtOrNull(i),
        weaponId: requests.weaponIds.elementAtOrNull(i),
      ),
    ];

    final items = <CalcComputeItem>[];
    for (final (:variantId, :weaponId) in requestPairs) {
      final variant = variantId != null ? assetData.variants[variantId]! : null;

      items.add(_createCalcComputeRequest(
        assetData: assetData,
        character: variant != null ? (
          variant: variant,
          avatarId: await _resolveAvatarId(ref, assetData.characterOf(variant)),
        ) : null,
        weapon: weaponId != null ? assetData.weapons[weaponId] : null,
      ));
    }

    final result = await api.batchCompute(items);

    final counts = Map.fromEntries(result.overallConsume.map((e) {
      final material = assetData.materials.values.firstWhereOrNull((m) => m.hyvId == e.id);
      if (material == null) {
        return null;
      }
      return MapEntry(material.id, e.num - e.lackNum);
    }).nonNulls);

    // keep the result for a while after fetching
    final link = ref.keepAlive();
    final timer = Timer(_cacheTtl, () {
      _expired = true;
      link.close();
    });
    ref.onDispose(timer.cancel);
    ref.onResume(() => Future.microtask(refreshIfExpired));

    return counts;
  }

  void refreshIfExpired() {
    if (_expired && ref.mounted) {
      ref.invalidateSelf();
    }
  }
}

Future<int> _resolveAvatarId(Ref ref, Character character) async {
  if (character.hyvIds.length == 1) {
    return character.hyvIds.single;
  }

  final db = ref.read(appDatabaseProvider);
  final uid = ref.read(hoyolabGameServerProvider).requireUid;
  final cached = await db.getSavedHyvId(uid, character.hyvIds);
  if (cached != null) {
    return cached;
  }

  final assetData = ref.read(assetDataProvider).requireValue;
  final api = await ref.read(hoyolabGameApiProvider.future);
  final found = await HoyolabApiUtils.loopUntilCharacter(character.hyvIds, (page) {
    // not filtering by element because Traveler's current element does not
    // matter.
    return api.avatarList(
      page,
      weaponCatIds: [assetData.weaponTypes[character.weaponType]!.hyvId],
    );
  });
  if (found == null) {
    return character.hyvIds.first;
  }
  await db.setCharacterState(found.toDbCompanion(uid, clock.now()));
  return found.id;
}

CalcComputeItem _createCalcComputeRequest({
  required AssetData assetData,
  ({CharacterVariant variant, int avatarId})? character,
  Weapon? weapon,
}) {
  CalcComputeItem item = const CalcComputeItem();

  if (character != null) {
    final (:variant, :avatarId) = character;
    final hyvIdIndex = assetData.characterOf(variant).hyvIds.indexOf(avatarId);

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
        id: e.idList.length == 1 ? e.idList.single : e.idList[hyvIdIndex],
        currentLevel: 1,
        targetLevel: skillsTargetLv,
      )).toList(),
    );
  }

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
