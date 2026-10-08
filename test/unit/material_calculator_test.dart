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

  @override
  MaterialTargetType get targetType => .character;
}

void main() {
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
