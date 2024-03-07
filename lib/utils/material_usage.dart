import "../models/character.dart";
import "../models/material.dart";

List<CharacterWithSmallImage> getCharactersUsingMaterial(Material material, List<Character> characters) {
  return characters.where((c) {
    if (c is! CharacterWithSmallImage) {
      return false;
    }

    return c.materials.entries.any((entry) {
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
  }).toList().cast<CharacterWithSmallImage>();
}
