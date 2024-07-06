
import "../core/asset_cache.dart";
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

Iterable<Character> getCharactersUsingMaterial(
    Material material,
    Iterable<Character> characters,
    Map<MaterialId, List<CharacterId>> specialCharactersUsingMaterials,
) {
  return characters.where((c) {
    if (specialCharactersUsingMaterials[material.id]?.contains(c.id) == true) {
      return true;
    }
    return materialUsagePredicate(material, c.materials);
  });
}

Iterable<Weapon> getWeaponsUsingMaterial(
  Material material,
  Iterable<Weapon> items,
) {
  return items.where((w) {
    return materialUsagePredicate(material, w.materials);
  });
}
