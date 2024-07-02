import "../models/character.dart";
import "../models/common.dart";
import "../models/material.dart";
import "../models/weapon.dart";

bool materialUsagePredicate(
  Material material,
  MaterialDefinitions definitions,
) {
  return definitions.entries.any((entry) {
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

Iterable<CharacterWithSmallImage> getCharactersUsingMaterial(
  Material material,
  Iterable<Character> items,
) {
  return items.where((c) {
    if (c is! CharacterWithSmallImage) {
      return false;
    }

    return materialUsagePredicate(material, c.materials);
  }).cast<CharacterWithSmallImage>();
}

Iterable<Weapon> getWeaponsUsingMaterial(
  Material material,
  Iterable<Weapon> items,
) {
  return items.where((w) {
    return materialUsagePredicate(material, w.materials);
  });
}
