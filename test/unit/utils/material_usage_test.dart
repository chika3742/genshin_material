import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/material_usage.dart";

import "../../utils/asset_data.dart";

void main() {
  final material = buildTestMaterial(id: "gem_lv1", groupId: "gem");

  group("materialUsagePredicate", () {
    test("returns true when group: matches the groupId", () {
      expect(materialUsagePredicate(material, const {"ascension": "group:gem"}), isTrue);
    });

    test("returns false when group: does not match the groupId", () {
      expect(materialUsagePredicate(material, const {"ascension": "group:other"}), isFalse);
    });

    test("returns true when id: matches the material id", () {
      expect(materialUsagePredicate(material, const {"ascension": "id:gem_lv1"}), isTrue);
    });

    test("returns false when id: does not match the material id", () {
      expect(materialUsagePredicate(material, const {"ascension": "id:gem_lv2"}), isFalse);
    });

    test("ignores the runtimeType key even when it matches", () {
      expect(materialUsagePredicate(material, const {"runtimeType": "id:gem_lv1"}), isFalse);
    });

    test("returns false for an unknown prefix", () {
      expect(materialUsagePredicate(material, const {"ascension": "unknown:gem_lv1"}), isFalse);
    });

    test("returns false for empty definitions", () {
      expect(materialUsagePredicate(material, const {}), isFalse);
    });
  });

  group("getCharactersUsingMaterial", () {
    final characters = [
      buildTestCharacter(id: "user", materials: const {"ascension": "group:gem"}),
      buildTestCharacter(id: "non_user", materials: const {"ascension": "group:other"}),
      buildTestCharacter(id: "special", materials: const {"ascension": "group:other"}),
    ];

    test("returns only the characters whose definitions match", () {
      expect(
        getCharactersUsingMaterial(material, characters, const {}).map((e) => e.id),
        ["user"],
      );
    });

    test("forces a match for characters listed in specialCharactersUsingMaterials", () {
      expect(
        getCharactersUsingMaterial(material, characters, const {
          "gem_lv1": ["special"],
        }).map((e) => e.id),
        ["user", "special"],
      );
    });

    test("ignores special entries keyed by another material", () {
      expect(
        getCharactersUsingMaterial(material, characters, const {
          "gem_lv2": ["special"],
        }).map((e) => e.id),
        ["user"],
      );
    });
  });

  group("getWeaponsUsingMaterial", () {
    test("returns only the weapons whose definitions match, dropping those without materials", () {
      final weapons = [
        buildTestWeapon(id: "user", materials: const {"ascension": "id:gem_lv1"}),
        buildTestWeapon(id: "non_user", materials: const {"ascension": "id:gem_lv2"}),
        buildTestWeapon(id: "no_materials"),
      ];

      expect(
        getWeaponsUsingMaterial(material, weapons).map((e) => e.id),
        ["user"],
      );
    });
  });
}
