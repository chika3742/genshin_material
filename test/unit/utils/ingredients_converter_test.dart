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

    test("targetSpecific に自身の id があれば materials の定義より優先される", () {
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

    test("targetSpecific に自身の id が無ければ materials の定義に従う", () {
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

    test("targetSpecific の値が null なら null を返す", () {
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

    test("id: 形式の定義をそのまま解決する", () {
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

    test("group: 形式は groupId と craftLevel の両方が一致する素材を引く", () {
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

    test("該当する type の定義が無ければ null を返す", () {
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

    test("未知の type prefix なら throw する", () {
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

    test("IngredientWithFixedId は itemId を、IngredientExp は exp を返す", () {
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

    test("start は含まず end は含む", () {
      expect(
        narrowLevelMap(map, const LevelRangeValues(20, 40)).keys,
        [30, 40],
      );
    });

    test("範囲に何も入らなければ空の Map を返す", () {
      expect(narrowLevelMap(map, const LevelRangeValues(40, 40)), isEmpty);
    });
  });

  group("runInMapKeyRange", () {
    final map = {
      20: const [Ingredient.exp(exp: 20)],
      30: const [Ingredient.exp(exp: 30)],
      40: const [Ingredient.exp(exp: 40)],
    };

    test("start は含まず end は含む範囲だけコールバックが呼ばれる", () {
      final calledLevels = <int>[];
      runInMapKeyRange(map, const LevelRangeValues(20, 40), (level, _) {
        calledLevels.add(level);
      });

      expect(calledLevels, [30, 40]);
    });

    test("範囲に何も入らなければコールバックは呼ばれない", () {
      var callCount = 0;
      runInMapKeyRange(map, const LevelRangeValues(40, 40), (_, __) {
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

    test("通常の素材は MaterialBookmarkFrameNormal に変換される", () {
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

    test("exp 材は MaterialBookmarkFrameExp に変換される", () {
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

    test("materialId が null になる要素はスキップされる", () {
      final frames = toMaterialBookmarkFrames(
        level: 40,
        ingredients: const [
          // "gem" の定義を持たないキャラなので null になる
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
    test("同一の (purposeType, level) は数量が合算される", () {
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

    test("purposeType か level が異なれば別のフレームとして残る", () {
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

    test("exp フレームと通常フレームが混在しても素材ごとに分かれる", () {
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
    test("id: の優先度、category: の優先度、exp の順で並ぶ", () {
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
