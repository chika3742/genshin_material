import "package:collection/collection.dart";

import "../../core/asset_cache.dart";
import "../../models/character.dart";
import "../../models/common.dart";

extension IdConverterExtension on AssetData {
  VariantId? getLocalCharacterId(int hyvId, {required int elementId}) {
    return variants.values.firstWhereOrNull((v) {
      return characterOf(v).hyvIds.contains(hyvId)
          && v.element == getLocalElementId(elementId);
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
}
