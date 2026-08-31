import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/level_range_values.dart";
import "package:genshin_material/utils/material_calculator.dart";

import "../utils/asset_data.dart";

class _TestTarget with CharacterOrWeapon {
  @override
  final String id;
  @override
  final int rarity;
  @override
  final MaterialDefinitions materials;

  const _TestTarget({
    required this.id,
    required this.rarity,
    required this.materials,
  });
}

void main() {
  group("calculateLackNum", () {
    final expConf = IngredientConfigurations(
      expItems: [
        const ExpItem(itemId: "test_exp_item_2", expPerItem: 1000, isDefault: false),
        const ExpItem(itemId: "test_exp_item_1", expPerItem: 5000, isDefault: true),
      ],
      rarities: {},
      sliders: [],
      ingredientTables: {},
    );

    test("returns null when fullQuantity is null", () {
      expect(
        calculateLackNum(
          expConf,
          {"iron_chunk": 5},
          itemId: "iron_chunk",
          fullQuantity: null,
          currentQuantity: 0,
        ),
        isNull,
      );
    });

    test("returns null when lackNums is null", () {
      expect(
        calculateLackNum(
          expConf,
          null,
          itemId: "iron_chunk",
          fullQuantity: 10,
          currentQuantity: 0,
        ),
        isNull,
      );
    });

    test("ordinary material: lackNum - (fullQuantity - currentQuantity)", () {
      expect(
        calculateLackNum(
          expConf,
          {"iron_chunk": 12},
          itemId: "iron_chunk",
          fullQuantity: 10,
          currentQuantity: 3,
        ),
        5, // 12 - (10 - 3) = 5
      );
    });

    test("ordinary material: returns null when itemId is absent from lackNums", () {
      expect(
        calculateLackNum(
          expConf,
          {"other_item": 5},
          itemId: "iron_chunk",
          fullQuantity: 10,
          currentQuantity: 0,
        ),
        isNull,
      );
    });

    test("exp material: calculates with the isDefault=true item", () {
      // test_exp_item_1 (5000/item), the isDefault=true one, is picked
      // need=10000, ceil(10000/5000)=2, lackNums=3 → 3-2=1
      expect(
        calculateLackNum(
          expConf,
          {"test_exp_item_1": 3},
          itemId: null,
          fullQuantity: 10000,
          currentQuantity: 0,
        ),
        1,
      );
    });

    test("exp material: rounds up when the division is not exact", () {
      final conf = IngredientConfigurations(
        expItems: [const ExpItem(itemId: "exp_book", expPerItem: 2000, isDefault: true)],
        rarities: {},
        sliders: [],
        ingredientTables: {},
      );
      // need=6500, ceil(6500/2000)=4, lackNums=5 → 5-4=1
      expect(
        calculateLackNum(
          conf,
          {"exp_book": 5},
          itemId: null,
          fullQuantity: 6500,
          currentQuantity: 0,
        ),
        1,
      );
    });
  });

  group("calculateFullQuantities", () {
    final assetData = buildTestAssetData();
    const target = _TestTarget(id: "char_a", rarity: 5, materials: {});

    test("sums a fixed material across several levels", () {
      final conf = buildIngredientConfigurations(
        rarity: 5,
        purpose: Purpose.ascension,
        levels: {
          20: [const Ingredient.fixed(itemId: "iron_chunk", quantity: 3)],
          40: [const Ingredient.fixed(itemId: "iron_chunk", quantity: 5)],
        },
      );
      final result = calculateFullQuantities(assetData, [Purpose.ascension], conf, target);
      expect(result, {"iron_chunk": 8});
    });

    test("aggregates exp materials under a null key", () {
      final conf = buildIngredientConfigurations(
        rarity: 5,
        purpose: Purpose.ascension,
        levels: {
          20: [const Ingredient.exp(exp: 10000)],
          40: [const Ingredient.exp(exp: 20000)],
        },
        expItems: [const ExpItem(itemId: "exp_book", expPerItem: 5000, isDefault: true)],
      );
      final result = calculateFullQuantities(assetData, [Purpose.ascension], conf, target);
      expect(result, {null: 30000});
    });

    test("resolves the material id from a byType + 'id:' definition", () {
      const targetWithMat = _TestTarget(
        id: "char_b",
        rarity: 4,
        materials: {"ascension_gem": "id:vayuda_turquoise_sliver"},
      );
      final conf = buildIngredientConfigurations(
        rarity: 4,
        purpose: Purpose.ascension,
        levels: {
          20: [const Ingredient.byType(type: "ascension_gem", quantity: 1)],
        },
      );
      final result = calculateFullQuantities(assetData, [Purpose.ascension], conf, targetWithMat);
      expect(result, {"vayuda_turquoise_sliver": 1});
    });

    test("sums the same material across several purposes", () {
      final conf = IngredientConfigurations(
        expItems: [],
        rarities: {
          5: IngredientPurposes(purposes: {
            Purpose.ascension: "asc",
            Purpose.normalAttack: "talent",
          }),
        },
        sliders: [],
        ingredientTables: {
          "asc": IngredientLevels(
            sliderTicks: [20],
            levels: {
              20: [const Ingredient.fixed(itemId: "shared_item", quantity: 3)],
            },
          ),
          "talent": IngredientLevels(
            sliderTicks: [2],
            levels: {
              2: [const Ingredient.fixed(itemId: "shared_item", quantity: 2)],
            },
          ),
        },
      );
      final result = calculateFullQuantities(
        assetData,
        [Purpose.ascension, Purpose.normalAttack],
        conf,
        target,
      );
      expect(result, {"shared_item": 5}); // 3 + 2
    });
  });

  group("generateMaterialCardsFromRange", () {
    const target = _TestTarget(id: "char_d", rarity: 5, materials: {});

    test("excludes the level equal to range.start (start is exclusive)", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a", category: "cat"),
          "mat_b": buildTestMaterial(id: "mat_b", category: "cat"),
        },
      );
      final conf = buildIngredientConfigurations(
        rarity: 5,
        purpose: Purpose.ascension,
        levels: {
          20: [const Ingredient.fixed(itemId: "mat_a", quantity: 1)],
          40: [const Ingredient.fixed(itemId: "mat_b", quantity: 1)],
        },
      );
      final result = generateMaterialCardsFromRange(
        assetData,
        conf,
        target,
        {Purpose.ascension: const LevelRangeValues(20, 40)},
      );
      final ids = result.map((e) => e.id).toList();
      expect(ids, ["mat_b"]);
    });

    test("includes the level equal to range.end (end is inclusive)", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_c": buildTestMaterial(id: "mat_c", category: "cat"),
          "mat_d": buildTestMaterial(id: "mat_d", category: "cat"),
        },
      );
      final conf = buildIngredientConfigurations(
        rarity: 5,
        purpose: Purpose.ascension,
        levels: {
          40: [const Ingredient.fixed(itemId: "mat_c", quantity: 1)],
          60: [const Ingredient.fixed(itemId: "mat_d", quantity: 1)],
        },
      );
      final result = generateMaterialCardsFromRange(
        assetData,
        conf,
        target,
        {Purpose.ascension: const LevelRangeValues(20, 60)},
      );
      final ids = result.map((e) => e.id).toList();
      expect(ids, ["mat_c", "mat_d"]);
    });

    test("returns an empty list when no level falls in the range", () {
      final conf = buildIngredientConfigurations(
        rarity: 5,
        purpose: Purpose.ascension,
        levels: {
          20: [const Ingredient.fixed(itemId: "mat_e", quantity: 1)],
          60: [const Ingredient.fixed(itemId: "mat_e", quantity: 1)],
        },
      );
      final result = generateMaterialCardsFromRange(
        buildTestAssetData(),
        conf,
        target,
        {Purpose.ascension: const LevelRangeValues(25, 30)},
      );
      expect(result, isEmpty);
    });

    test("puts exp first and the material with the largest sortOrder last", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_low": buildTestMaterial(id: "mat_low", category: "cat"),
          "mat_high": buildTestMaterial(id: "mat_high", category: "cat"),
        },
        materialSortOrder: {
          "id:mat_low": 5,
          "id:mat_high": 10,
        },
      );
      final conf = IngredientConfigurations(
        expItems: [const ExpItem(itemId: "exp_book", expPerItem: 5000, isDefault: true)],
        rarities: {
          5: IngredientPurposes(purposes: {Purpose.ascension: "asc"}),
        },
        sliders: [],
        ingredientTables: {
          "asc": IngredientLevels(
            sliderTicks: [20, 40],
            levels: {
              20: [
                const Ingredient.fixed(itemId: "mat_low", quantity: 1),
                const Ingredient.exp(exp: 5000),
              ],
              40: [const Ingredient.fixed(itemId: "mat_high", quantity: 1)],
            },
          ),
        },
      );
      final result = generateMaterialCardsFromRange(
        assetData,
        conf,
        target,
        {Purpose.ascension: const LevelRangeValues(0, 100)},
      );
      final ids = result.map((e) => e.id).toList();
      // exp (priority=0) first, then mat_low (5), then mat_high (10)
      expect(ids, [null, "mat_low", "mat_high"]);
    });
  });
}
