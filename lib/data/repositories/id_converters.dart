import "package:collection/collection.dart";

import "../../core/asset_cache.dart";
import "../../models/character.dart";
import "../../models/common.dart";

extension on Map<String, Character> {
  CharacterGroup? findParent(String id) {
    final parent = this[id];
    return parent is CharacterGroup ? parent : null;
  }
}

extension IdConverterExtension on AssetData {
  String? getLocalCharacterId(int hyvId, {required int elementId}) {
    return characters.values.firstWhereOrNull((c) {
      return switch (c) {
        ListedCharacter(:final hyvIds) => hyvIds.contains(hyvId),
        CharacterVariant(:final parentId, :final element)
          => characters.findParent(parentId)?.hyvIds.contains(hyvId) == true
            && element == getLocalElementId(elementId),
        _ => false,
      };
    })?.id;
  }

  String? getLocalWeaponId(int hyvId) {
    return weapons.values.firstWhereOrNull((w) => w.hyvId == hyvId)?.id;
  }

  String getLocalElementId(int hyvId) {
    return elements.entries.firstWhere((e) => e.value.hyvId == hyvId).key;
  }

  int getRemoteElementId(TeyvatElement element) {
    return elements[element]!.hyvId;
  }

  int getRemoteWeaponCategoryId(WeaponType weaponType) {
    return weaponTypes[weaponType]!.hyvId;
  }

  List<int>? variantIdToCharacterHyvIds(String variantId) {
    final variant = characters[variantId];
    return switch (variant) {
      ListedCharacter(:final hyvIds) => hyvIds,
      CharacterVariant(:final parentId) => characters.findParent(parentId)?.hyvIds,
      _ => null,
    };
  }
}
