import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/level_slider.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/material.dart";
import "package:genshin_material/utils/material_calculator.dart";

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

AssetData _buildTestAssetData({
  Map<String, Material> materials = const {},
  Map<String, int> materialSortOrder = const {},
}) {
  return AssetData(
    assetDir: "",
    version: AssetReleaseVersion(
      createdAt: DateTime(2024),
      dataVersion: "test",
      channel: AssetChannel.dev,
      distUrl: "",
      schemaVersion: 0,
    ),
    characters: {},
    characterIngredients: IngredientConfigurations(
      expItems: [],
      rarities: {},
      sliders: [],
      ingredientTables: {},
    ),
    weapons: {},
    weaponIngredients: IngredientConfigurations(
      expItems: [],
      rarities: {},
      sliders: [],
      ingredientTables: {},
    ),
    weaponSubStats: {},
    weaponTypes: {},
    elements: {},
    materials: materials,
    materialCategories: {},
    materialSortOrder: materialSortOrder,
    dailyMaterials: DailyMaterials(talent: {}, weapon: {}),
    specialCharactersUsingMaterials: {},
    artifactSets: {},
    artifactPieceTypes: {},
    stats: {},
    artifactPossibleSubStats: [],
    artifactPieces: {},
    artifactTags: [],
    furnishingSets: {},
    furnishings: {},
    furnishingSetTypes: {},
    dropRates: [],
  );
}

IngredientConfigurations _buildIngredientConf({
  required int rarity,
  required Purpose purpose,
  required Map<int, List<Ingredient>> levels,
  List<ExpItem> expItems = const [],
}) {
  return IngredientConfigurations(
    expItems: expItems,
    rarities: {
      rarity: IngredientPurposes(purposes: {purpose: "table"}),
    },
    sliders: [],
    ingredientTables: {
      "table": IngredientLevels(
        sliderTicks: levels.keys.toList()..sort(),
        levels: levels,
      ),
    },
  );
}

Material _buildMaterial(String id, String category) {
  return Material(
    id: id,
    hyvId: 0,
    name: LocalizedText(locales: {}),
    jaPronunciation: "",
    imageUrl: "",
    rarity: 1,
    category: category,
  );
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

    test("fullQuantity が null なら null を返す", () {
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

    test("lackNums が null なら null を返す", () {
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

    test("通常素材: lackNum - (fullQuantity - currentQuantity)", () {
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

    test("通常素材: itemId が lackNums に存在しない場合は null", () {
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

    test("exp 素材: isDefault=true のアイテムを使って計算する", () {
      // isDefault=true の test_exp_item_1 (5000/item) が選ばれる
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

    test("exp 素材: 割り切れない場合は切り上げ", () {
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
    final assetData = _buildTestAssetData();
    const target = _TestTarget(id: "char_a", rarity: 5, materials: {});

    test("fixed 素材を複数レベルにわたって合算する", () {
      final conf = _buildIngredientConf(
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

    test("exp 素材は null キーで集計される", () {
      final conf = _buildIngredientConf(
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

    test("byType + 'id:' 定義で素材 ID が解決される", () {
      const targetWithMat = _TestTarget(
        id: "char_b",
        rarity: 4,
        materials: {"ascension_gem": "id:vayuda_turquoise_sliver"},
      );
      final conf = _buildIngredientConf(
        rarity: 4,
        purpose: Purpose.ascension,
        levels: {
          20: [const Ingredient.byType(type: "ascension_gem", quantity: 1)],
        },
      );
      final result = calculateFullQuantities(assetData, [Purpose.ascension], conf, targetWithMat);
      expect(result, {"vayuda_turquoise_sliver": 1});
    });

    test("複数 Purpose の同一素材が合算される", () {
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

    test("range.start と一致するレベルは除外される (start 排他)", () {
      final assetData = _buildTestAssetData(
        materials: {
          "mat_a": _buildMaterial("mat_a", "cat"),
          "mat_b": _buildMaterial("mat_b", "cat"),
        },
      );
      final conf = _buildIngredientConf(
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

    test("range.end と一致するレベルは含まれる (end 包含)", () {
      final assetData = _buildTestAssetData(
        materials: {
          "mat_c": _buildMaterial("mat_c", "cat"),
          "mat_d": _buildMaterial("mat_d", "cat"),
        },
      );
      final conf = _buildIngredientConf(
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

    test("範囲にマッチするレベルが存在しない場合は空リストを返す", () {
      final conf = _buildIngredientConf(
        rarity: 5,
        purpose: Purpose.ascension,
        levels: {
          20: [const Ingredient.fixed(itemId: "mat_e", quantity: 1)],
          60: [const Ingredient.fixed(itemId: "mat_e", quantity: 1)],
        },
      );
      final result = generateMaterialCardsFromRange(
        _buildTestAssetData(),
        conf,
        target,
        {Purpose.ascension: const LevelRangeValues(25, 30)},
      );
      expect(result, isEmpty);
    });

    test("exp が先頭、sortOrder 大の素材が末尾になる", () {
      final assetData = _buildTestAssetData(
        materials: {
          "mat_low": _buildMaterial("mat_low", "cat"),
          "mat_high": _buildMaterial("mat_high", "cat"),
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
      // exp(priority=0) が先頭、mat_low(5) が次、mat_high(10) が末尾
      expect(ids, [null, "mat_low", "mat_high"]);
    });
  });
}
