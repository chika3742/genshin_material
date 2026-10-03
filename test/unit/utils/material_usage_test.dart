import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/utils/material_usage.dart";

import "../../utils/asset_data.dart";

void main() {
  final material = buildTestMaterial(id: "gem_lv1", groupId: "gem");

  group("getCharactersUsingMaterial", () {
    const groupId = CharacterId("group");

    final characters = [
      buildTestCharacter(id: CharacterId("user"), materials: const {"ascension": MaterialGroupRef("gem")}),
      buildTestCharacter(id: CharacterId("non_user"), materials: const {"ascension": MaterialGroupRef("other")}),
      buildTestCharacter(id: CharacterId("special"), materials: const {"ascension": MaterialGroupRef("other")}),
      // Only one variant uses the material, through its own definitions.
      buildTestCharacter(
        id: groupId,
        materials: const {"ascension": MaterialGroupRef("other")},
        variants: [
          buildTestCharacterVariant(
            id: VariantId("group_user"),
            characterId: groupId,
            materials: const {"talent": MaterialGroupRef("gem")},
          ),
          buildTestCharacterVariant(
            id: VariantId("group_special"),
            characterId: groupId,
            materials: const {"talent": MaterialGroupRef("other")},
          ),
        ],
      ),
    ];

    Iterable<CharacterOrVariantId> idsUsing(
      Map<MaterialId, List<CharacterOrVariantId>> special, [
      List<Character>? from,
    ]) {
      return buildTestAssetData(
        characters: {for (final c in from ?? characters) c.id: c},
        specialCharactersUsingMaterials: special,
      ).getCharactersUsingMaterial(material).map((e) => e.id);
    }

    test("returns the matching characters, and the matching variants of the others", () {
      expect(idsUsing(const {}), ["user", "group_user"]);
    });

    test("returns the group alone when its own definitions match", () {
      final characters = [
        buildTestCharacter(
          id: groupId,
          materials: const {"ascension": MaterialGroupRef("gem")},
          variants: [
            buildTestCharacterVariant(
              id: VariantId("group_user"),
              characterId: groupId,
              materials: const {"talent": MaterialGroupRef("gem")},
            ),
          ],
        ),
      ];

      expect(idsUsing(const {}, characters), ["group"]);
    });

    test("forces a match for characters listed in specialCharactersUsingMaterials", () {
      expect(
        idsUsing(const {"gem_lv1": [CharacterOrVariantId("special")]}),
        ["user", "special", "group_user"],
      );
    });

    test("forces a match for variants listed in specialCharactersUsingMaterials", () {
      expect(
        idsUsing(const {"gem_lv1": [CharacterOrVariantId("group_special")]}),
        ["user", "group_user", "group_special"],
      );
    });

    test("ignores special entries keyed by another material", () {
      expect(
        idsUsing(const {"gem_lv2": [CharacterOrVariantId("special")]}),
        ["user", "group_user"],
      );
    });
  });

  group("getWeaponsUsingMaterial", () {
    test("returns only the weapons whose definitions match, dropping those without materials", () {
      final weapons = [
        buildTestWeapon(id: "user", materials: const {"ascension": MaterialIdRef("gem_lv1")}),
        buildTestWeapon(id: "non_user", materials: const {"ascension": MaterialIdRef("gem_lv2")}),
        buildTestWeapon(id: "no_materials"),
      ];

      expect(
        buildTestAssetData(
          weapons: {for (final w in weapons) w.id: w},
        ).getWeaponsUsingMaterial(material).map((e) => e.id),
        ["user"],
      );
    });
  });
}
