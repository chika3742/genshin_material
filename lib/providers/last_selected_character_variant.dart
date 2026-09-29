import "package:collection/collection.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/asset_cache.dart";
import "../core/pref_keys.dart";
import "../models/character.dart";
import "../models/common.dart";
import "pref_notifier.dart";
import "versions.dart";

part "last_selected_character_variant.g.dart";

/// The variant the user last selected on the details page of the character
/// group [groupId], or `null` when none has been selected yet.
///
/// The selection is persisted per group, so a stored id that the group no
/// longer lists (for one, after an asset update) is ignored.
@riverpod
class LastSelectedCharacterVariant extends _$LastSelectedCharacterVariant {
  @override
  CharacterId? build(CharacterId groupId) {
    final group = _groupOf(ref.watch(assetDataProvider).requireValue);
    final stored = ref.watch(prefProvider(PrefKeys.lastSelectedCharacterVariantIds));
    return group.variantIds.firstWhereOrNull(stored.contains);
  }

  /// Persists [variantId] as the selection for the group, replacing the
  /// group's previous one while leaving other groups' selections untouched.
  Future<void> set(CharacterId variantId) {
    final group = _groupOf(ref.read(assetDataProvider).requireValue);
    if (!group.variantIds.contains(variantId)) {
      throw ArgumentError.value(variantId, "variantId", "Not a variant of $groupId");
    }

    final stored = ref.read(prefProvider(PrefKeys.lastSelectedCharacterVariantIds));
    return ref.read(prefProvider(PrefKeys.lastSelectedCharacterVariantIds).notifier).set([
      ...stored.whereNot(group.variantIds.contains),
      variantId,
    ]);
  }

  CharacterGroup _groupOf(AssetData assetData) {
    final character = assetData.characters[groupId];
    if (character is! CharacterGroup) {
      throw ArgumentError.value(groupId, "groupId", "Not a character group");
    }
    return character;
  }
}
