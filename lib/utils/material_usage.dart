import "../core/asset_cache.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/material.dart";
import "../models/weapon.dart";

extension MaterialUsageExtension on AssetData {
  Iterable<CharacterSummary> getCharactersUsingMaterial(Material material) {
    final special = specialCharactersUsingMaterials[material.id] ?? const [];
    bool uses(CharacterOrVariantId id, MaterialDefinitions definitions) =>
        special.contains(id) || definitions.entries.any((e) => e.value.matches(material));

    return characters.values.expand<CharacterSummary>((c) {
      if (uses(c.id, c.materials)) {
        return [c];
      }
      return c.variants.where((v) => uses(v.id, v.materials));
    });
  }

  Iterable<Weapon> getWeaponsUsingMaterial(Material material) {
    return weapons.values.where((w) {
      return w.materials != null
          && w.materials!.entries.any((e) => e.value.matches(material));
    });
  }
}
