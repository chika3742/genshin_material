import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/material_usage.dart";

import "../../utils/asset_data.dart";

void main() {
  final material = buildTestMaterial(id: "gem_lv1", groupId: "gem");

  group("materialUsagePredicate", () {
    test("group: が groupId と一致すれば true", () {
      expect(materialUsagePredicate(material, const {"ascension": "group:gem"}), isTrue);
    });

    test("group: が groupId と一致しなければ false", () {
      expect(materialUsagePredicate(material, const {"ascension": "group:other"}), isFalse);
    });

    test("id: が素材の id と一致すれば true", () {
      expect(materialUsagePredicate(material, const {"ascension": "id:gem_lv1"}), isTrue);
    });

    test("id: が素材の id と一致しなければ false", () {
      expect(materialUsagePredicate(material, const {"ascension": "id:gem_lv2"}), isFalse);
    });

    test("runtimeType キーは一致していても無視される", () {
      expect(materialUsagePredicate(material, const {"runtimeType": "id:gem_lv1"}), isFalse);
    });

    test("未知の prefix なら false", () {
      expect(materialUsagePredicate(material, const {"ascension": "unknown:gem_lv1"}), isFalse);
    });

    test("定義が空なら false", () {
      expect(materialUsagePredicate(material, const {}), isFalse);
    });
  });

  group("getCharactersUsingMaterial", () {
    final characters = [
      buildTestCharacter(id: "user", materials: const {"ascension": "group:gem"}),
      buildTestCharacter(id: "non_user", materials: const {"ascension": "group:other"}),
      buildTestCharacter(id: "special", materials: const {"ascension": "group:other"}),
    ];

    test("素材定義が一致するキャラだけを返す", () {
      expect(
        getCharactersUsingMaterial(material, characters, const {}).map((e) => e.id),
        ["user"],
      );
    });

    test("specialCharactersUsingMaterials に載っているキャラは強制的にヒットする", () {
      expect(
        getCharactersUsingMaterial(material, characters, const {
          "gem_lv1": ["special"],
        }).map((e) => e.id),
        ["user", "special"],
      );
    });

    test("別の素材に紐づく特例は影響しない", () {
      expect(
        getCharactersUsingMaterial(material, characters, const {
          "gem_lv2": ["special"],
        }).map((e) => e.id),
        ["user"],
      );
    });
  });

  group("getWeaponsUsingMaterial", () {
    final weapons = [
      buildTestWeapon(id: "user", materials: const {"ascension": "id:gem_lv1"}),
      buildTestWeapon(id: "non_user", materials: const {"ascension": "id:gem_lv2"}),
      buildTestWeapon(id: "no_materials"),
    ];

    test("素材定義が一致する武器だけを返す", () {
      expect(
        getWeaponsUsingMaterial(material, weapons).map((e) => e.id),
        ["user"],
      );
    });

    test("materials が null の武器は除外される", () {
      expect(
        getWeaponsUsingMaterial(material, weapons).map((e) => e.id),
        isNot(contains("no_materials")),
      );
    });
  });
}
