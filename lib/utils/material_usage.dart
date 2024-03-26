import "../models/character.dart";
import "../models/common.dart";
import "../models/material.dart";
import "../models/weapon.dart";

bool materialUsagePredicate(
  Material material,
  WithMaterialDefinitions item,
) {
  return item.materials.entries.any((entry) {
    if (entry.key == "runtimeType") {
      return false;
    }

    final [type, expr] = entry.value.split(":");
    if (type == "group") {
      return expr == material.groupId;
    }
    if (type == "id") {
      return expr == material.id;
    }
    return false;
  });
}

List<CharacterWithSmallImage> getCharactersUsingMaterial(
  Material material,
  List<Character> items,
) {
  return items.where((c) {
    if (c is! CharacterWithSmallImage) {
      return false;
    }

    return materialUsagePredicate(material, c as WithMaterialDefinitions);
  }).toList().cast<CharacterWithSmallImage>();
}

List<Weapon> getWeaponsUsingMaterial(
  Material material,
  List<Weapon> items,
) {
  return items.where((w) {
    return materialUsagePredicate(material, w);
  }).toList();
}
