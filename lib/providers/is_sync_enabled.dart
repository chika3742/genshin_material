import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/pref_keys.dart";
import "../models/character.dart";
import "hoyolab_game_server.dart";
import "pref_notifier.dart";
import "versions.dart";

part "is_sync_enabled.g.dart";

@riverpod
bool isCharacterSyncEnabled(Ref ref, {required String variantId, String? weaponId}) {
  final assetData = ref.watch(assetDataProvider).requireValue;
  final variant = assetData.characters[variantId];
  if (variant == null || variant is! CharacterOrVariant) {
    throw ArgumentError("Character or variant not found");
  }

  final weapon = assetData.weapons[weaponId];
  if (weaponId != null && weapon == null) {
    throw ArgumentError("Weapon not found");
  }

  return ref.watch(isLinkedWithHoyolabProvider)
      && ref.watch(prefProvider(PrefKeys.syncCharaState))
      && (weapon == null || !weapon.disableSync)
      && !(variant as CharacterOrVariant).disableSync;
}

@riverpod
bool isBagLackNumSyncEnabled(Ref ref, {required String variantId}) {
  final assetData = ref.watch(assetDataProvider).requireValue;
  final variant = assetData.characters[variantId];
  if (variant == null || variant is! CharacterOrVariant) {
    throw ArgumentError("Character or variant not found");
  }

  return ref.watch(isLinkedWithHoyolabProvider)
      && ref.watch(prefProvider(PrefKeys.syncBagLackNums))
      && !(variant as CharacterOrVariant).disableSync;
}
