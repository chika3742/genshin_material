import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/level_range_values.dart";
import "package:genshin_material/models/material_bookmark_frame.dart";
import "package:genshin_material/utils/ingredients_converter.dart";

import "../../utils/asset_data.dart";

void main() {
  group("getConcreteItemId", () {
    final assetData = buildTestAssetData(
      materials: {
        "gem_lv1": buildTestMaterial(id: "gem_lv1", groupId: "gem", craftLevel: 1),
        "gem_lv2": buildTestMaterial(id: "gem_lv2", groupId: "gem", craftLevel: 2),
      },
    );

    test("prefers targetSpecific over the materials definition", () {
      final character = buildTestCharacter(
        id: "char_1",
        materials: const {"gem": "id:gem_lv1"},
      );

      expect(
        getConcreteItemId(
          const Ingredient.byType(
            type: "gem",
            quantity: 1,
            targetSpecific: {"char_1": "special_gem"},
          ),
          character,
          assetData,
        ),
        "special_gem",
      );
    });

    test("falls back to the materials definition when targetSpecific has no entry", () {
      final character = buildTestCharacter(
        id: "char_1",
        materials: const {"gem": "id:gem_lv1"},
      );

      expect(
        getConcreteItemId(
          const Ingredient.byType(
            type: "gem",
            quantity: 1,
            targetSpecific: {"char_2": "special_gem"},
          ),
          character,
          assetData,
        ),
        "gem_lv1",
      );
    });

    test("returns null when the targetSpecific entry is null", () {
      final character = buildTestCharacter(
        id: "char_1",
        materials: const {"gem": "id:gem_lv1"},
      );

      expect(
        getConcreteItemId(
          const Ingredient.byType(
            type: "gem",
            quantity: 1,
            targetSpecific: {"char_1": null},
          ),
          character,
          assetData,
        ),
        isNull,
      );
    });

    test("resolves an id: definition as is", () {
      final character = buildTestCharacter(
        id: "char_1",
        materials: const {"gem": "id:gem_lv2"},
      );

      expect(
        getConcreteItemId(
          const Ingredient.byType(type: "gem", quantity: 1),
          character,
          assetData,
        ),
        "gem_lv2",
      );
    });

    test("resolves a group: definition by both groupId and craftLevel", () {
      final character = buildTestCharacter(
        id: "char_1",
        materials: const {"gem": "group:gem"},
      );

      expect(
        getConcreteItemId(
          const Ingredient.byType(type: "gem", quantity: 1, craftLevel: 2),
          character,
          assetData,
        ),
        "gem_lv2",
      );
      expect(
        getConcreteItemId(
          const Ingredient.byType(type: "gem", quantity: 1, craftLevel: 1),
          character,
          assetData,
        ),
        "gem_lv1",
      );
    });

    test("returns null when the type has no definition", () {
      final character = buildTestCharacter(id: "char_1");

      expect(
        getConcreteItemId(
          const Ingredient.byType(type: "gem", quantity: 1),
          character,
          assetData,
        ),
        isNull,
      );
    });

    // Pins the current behaviour: a group: definition matching no material
    // trips the assert instead of returning null the way every other failure
    // path in this function does. In a release build the assert is stripped
    // and the `material!` right after it throws a TypeError instead. Update
    // this test when the production code starts returning null.
    test("throws when a group: definition matches no material", () {
      final character = buildTestCharacter(
        id: "char_1",
        materials: const {"gem": "group:gem"},
      );

      expect(
        () => getConcreteItemId(
          const Ingredient.byType(type: "gem", quantity: 1, craftLevel: 99),
          character,
          assetData,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test("throws on an unknown type prefix", () {
      final character = buildTestCharacter(
        id: "char_1",
        materials: const {"gem": "unknown:gem"},
      );

      expect(
        () => getConcreteItemId(
          const Ingredient.byType(type: "gem", quantity: 1),
          character,
          assetData,
        ),
        throwsA("Unknown type: unknown"),
      );
    });

    test("returns itemId for a fixed ingredient and exp for an exp one", () {
      final character = buildTestCharacter(id: "char_1");

      expect(
        getConcreteItemId(
          const Ingredient.fixed(itemId: "mora", quantity: 100),
          character,
          assetData,
        ),
        "mora",
      );
      expect(
        getConcreteItemId(
          const Ingredient.exp(exp: 1000),
          character,
          assetData,
        ),
        "exp",
      );
    });
  });

  group("narrowLevelMap", () {
    final map = {
      20: const [Ingredient.exp(exp: 20)],
      30: const [Ingredient.exp(exp: 30)],
      40: const [Ingredient.exp(exp: 40)],
      50: const [Ingredient.exp(exp: 50)],
    };

    test("excludes start and includes end", () {
      expect(
        narrowLevelMap(map, const LevelRangeValues(20, 40)).keys,
        [30, 40],
      );
    });

    test("returns an empty map when nothing falls in the range", () {
      expect(narrowLevelMap(map, const LevelRangeValues(40, 40)), isEmpty);
    });
  });

  group("runInMapKeyRange", () {
    final map = {
      20: const [Ingredient.exp(exp: 20)],
      30: const [Ingredient.exp(exp: 30)],
      40: const [Ingredient.exp(exp: 40)],
    };

    test("calls back only for levels above start and up to end", () {
      final calledLevels = <int>[];
      runInMapKeyRange(map, const LevelRangeValues(20, 40), (level, _) {
        calledLevels.add(level);
      });

      expect(calledLevels, [30, 40]);
    });

    test("never calls back when nothing falls in the range", () {
      var callCount = 0;
      runInMapKeyRange(map, const LevelRangeValues(40, 40), (_, _) {
        callCount++;
      });

      expect(callCount, 0);
    });
  });

  group("toMaterialBookmarkFrames", () {
    final assetData = buildTestAssetData(
      materials: {
        "gem_lv1": buildTestMaterial(id: "gem_lv1", groupId: "gem", craftLevel: 1),
      },
    );

    test("converts an ordinary material into a normal frame", () {
      final frames = toMaterialBookmarkFrames(
        level: 40,
        ingredients: const [Ingredient.fixed(itemId: "mora", quantity: 100)],
        purposeType: Purpose.elementalSkill,
        characterOrWeapon: buildTestCharacter(id: "char_1"),
        assetData: assetData,
      );

      expect(frames, [
        const MaterialBookmarkFrame(
          materialId: "mora",
          level: 40,
          quantity: 100,
          purposeType: Purpose.elementalSkill,
        ),
      ]);
    });

    test("converts an exp ingredient into an exp frame", () {
      final frames = toMaterialBookmarkFrames(
        level: 40,
        ingredients: const [Ingredient.exp(exp: 1000)],
        purposeType: Purpose.ascension,
        characterOrWeapon: buildTestCharacter(id: "char_1"),
        assetData: assetData,
      );

      expect(frames, [
        const MaterialBookmarkFrame.exp(level: 40, exp: 1000),
      ]);
    });

    test("skips ingredients that resolve to a null material id", () {
      final frames = toMaterialBookmarkFrames(
        level: 40,
        ingredients: const [
          // The character has no "gem" definition, so this resolves to null.
          Ingredient.byType(type: "gem", quantity: 1),
          Ingredient.fixed(itemId: "mora", quantity: 100),
        ],
        purposeType: Purpose.ascension,
        characterOrWeapon: buildTestCharacter(id: "char_1"),
        assetData: assetData,
      );

      expect(frames, hasLength(1));
      expect((frames.single as MaterialBookmarkFrameNormal).materialId, "mora");
    });
  });

  group("mergeMaterialBookmarkFrames", () {
    test("sums quantities sharing the same (purposeType, level)", () {
      final merged = mergeMaterialBookmarkFrames(const [
        MaterialBookmarkFrame(
          materialId: "mora",
          level: 40,
          quantity: 100,
          purposeType: Purpose.ascension,
        ),
        MaterialBookmarkFrame(
          materialId: "mora",
          level: 40,
          quantity: 200,
          purposeType: Purpose.ascension,
        ),
      ]);

      expect(merged, hasLength(1));
      expect(merged.single.id, "mora");
      expect(merged.single.levels, [
        const MaterialBookmarkFrame(
          materialId: "mora",
          level: 40,
          quantity: 300,
          purposeType: Purpose.ascension,
        ),
      ]);
      expect(merged.single.sum, 300);
    });

    test("keeps frames apart when purposeType or level differs", () {
      final merged = mergeMaterialBookmarkFrames(const [
        MaterialBookmarkFrame(
          materialId: "mora",
          level: 40,
          quantity: 100,
          purposeType: Purpose.ascension,
        ),
        MaterialBookmarkFrame(
          materialId: "mora",
          level: 40,
          quantity: 200,
          purposeType: Purpose.normalAttack,
        ),
        MaterialBookmarkFrame(
          materialId: "mora",
          level: 50,
          quantity: 300,
          purposeType: Purpose.ascension,
        ),
      ]);

      expect(merged, hasLength(1));
      expect(merged.single.levels, hasLength(3));
      expect(merged.single.sum, 600);
    });

    test("groups exp frames separately from normal ones", () {
      final merged = mergeMaterialBookmarkFrames(const [
        MaterialBookmarkFrame(
          materialId: "mora",
          level: 40,
          quantity: 100,
          purposeType: Purpose.ascension,
        ),
        MaterialBookmarkFrame.exp(level: 40, exp: 1000),
        MaterialBookmarkFrame.exp(level: 40, exp: 2000),
      ]);

      expect(merged, hasLength(2));

      final normal = merged.firstWhere((e) => e.id == "mora");
      expect(normal.isExp, isFalse);
      expect(normal.sum, 100);

      final exp = merged.firstWhere((e) => e.id == null);
      expect(exp.isExp, isTrue);
      expect(exp.levels, [
        const MaterialBookmarkFrame.exp(level: 40, exp: 3000),
      ]);
      expect(exp.sum, 3000);
    });
  });

  group("sortMaterials", () {
    test("orders by exp first, then the id: and category: sort priorities", () {
      final assetData = buildTestAssetData(
        materials: {
          "gem": buildTestMaterial(id: "gem", category: "gems"),
          "mora": buildTestMaterial(id: "mora", category: "currency"),
        },
        materialSortOrder: const {
          "id:mora": 20,
          "category:gems": 10,
        },
      );

      final sorted = sortMaterials(
        [
          MaterialCardMaterial(
            id: "mora",
            levels: const [
              MaterialBookmarkFrame(
                materialId: "mora",
                level: 40,
                quantity: 1,
                purposeType: Purpose.ascension,
              ),
            ],
          ),
          MaterialCardMaterial(
            id: "gem",
            levels: const [
              MaterialBookmarkFrame(
                materialId: "gem",
                level: 40,
                quantity: 1,
                purposeType: Purpose.ascension,
              ),
            ],
          ),
          MaterialCardMaterial(
            levels: const [MaterialBookmarkFrame.exp(level: 40, exp: 1000)],
          ),
        ],
        assetData,
      );

      expect(sorted.map((e) => e.id), [null, "gem", "mora"]);
    });
  });
}
