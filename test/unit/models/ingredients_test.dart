import "package:flutter_test/flutter_test.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";

void main() {
  group("IngredientConfigurations.getLevels", () {
    const ascensionLevels = IngredientLevels(
      sliderTicks: [1, 20, 40],
      levels: {
        20: [Ingredient.fixed(itemId: "iron_chunk", quantity: 3)],
        40: [Ingredient.fixed(itemId: "iron_chunk", quantity: 6)],
      },
    );
    const talentLevels = IngredientLevels(
      sliderTicks: [1, 2, 3],
      levels: {
        2: [Ingredient.fixed(itemId: "teachings", quantity: 3)],
      },
    );

    const conf = IngredientConfigurations(
      expItems: [],
      rarities: {
        4: IngredientPurposes(
          purposes: {
            Purpose.ascension: "ascension_4",
            Purpose.normalAttack: "talent_4",
          },
        ),
        5: IngredientPurposes(
          purposes: {Purpose.ascension: "ascension_5"},
        ),
      },
      sliders: [],
      ingredientTables: {
        "ascension_4": ascensionLevels,
        "talent_4": talentLevels,
        "ascension_5": IngredientLevels(sliderTicks: [], levels: {}),
      },
    );

    test("Resolves the table registered for the rarity and the purpose", () {
      expect(
        conf.getLevels(rarity: 4, purpose: Purpose.ascension),
        ascensionLevels,
      );
      expect(
        conf.getLevels(rarity: 4, purpose: Purpose.normalAttack),
        talentLevels,
      );
    });

    test("Resolves a different table for another rarity", () {
      expect(
        conf.getLevels(rarity: 5, purpose: Purpose.ascension),
        const IngredientLevels(sliderTicks: [], levels: {}),
      );
    });

    test("Throws when the rarity is not registered", () {
      // rarities[rarity] is force-unwrapped, so an unknown rarity is fatal.
      expect(
        () => conf.getLevels(rarity: 3, purpose: Purpose.ascension),
        throwsA(isA<TypeError>()),
      );
    });

    test("Throws when the purpose is not registered for the rarity", () {
      expect(
        () => conf.getLevels(rarity: 5, purpose: Purpose.elementalBurst),
        throwsA(isA<TypeError>()),
      );
    });

    test("Throws when the referenced table is missing", () {
      const brokenConf = IngredientConfigurations(
        expItems: [],
        rarities: {
          4: IngredientPurposes(purposes: {Purpose.ascension: "missing"}),
        },
        sliders: [],
        ingredientTables: {},
      );

      expect(
        () => brokenConf.getLevels(rarity: 4, purpose: Purpose.ascension),
        throwsA(isA<TypeError>()),
      );
    });
  });

  group("Ingredient.fromJson", () {
    test("Builds an IngredientByType for the byType discriminator", () {
      final ingredient = Ingredient.fromJson({
        "runtimeType": "byType",
        "type": "ascension_gem",
        "quantity": 3,
        "craftLevel": 2,
        "targetSpecific": {"variant": "gem_pyro", "missing": null},
      });

      expect(ingredient, isA<IngredientByType>());
      final byType = ingredient as IngredientByType;
      expect(byType.type, "ascension_gem");
      expect(byType.quantity, 3);
      expect(byType.craftLevel, 2);
      expect(byType.targetSpecific, {"variant": "gem_pyro", "missing": null});
    });

    test("Leaves the optional fields of IngredientByType null", () {
      final ingredient = Ingredient.fromJson({
        "runtimeType": "byType",
        "type": "ascension_gem",
        "quantity": 1,
      }) as IngredientByType;

      expect(ingredient.craftLevel, isNull);
      expect(ingredient.targetSpecific, isNull);
    });

    test("Builds an IngredientExp for the exp discriminator", () {
      final ingredient = Ingredient.fromJson({
        "runtimeType": "exp",
        "exp": 120000,
      });

      expect(ingredient, isA<IngredientExp>());
      expect((ingredient as IngredientExp).exp, 120000);
    });

    test("Builds an IngredientWithFixedId for the fixed discriminator", () {
      final ingredient = Ingredient.fromJson({
        "runtimeType": "fixed",
        "itemId": "mora",
        "quantity": 20000,
      });

      expect(ingredient, isA<IngredientWithFixedId>());
      final fixed = ingredient as IngredientWithFixedId;
      expect(fixed.itemId, "mora");
      expect(fixed.quantity, 20000);
    });

    test("Throws for an unknown discriminator", () {
      expect(
        () => Ingredient.fromJson({"runtimeType": "unknown", "quantity": 1}),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });

    test("Throws when the discriminator is missing", () {
      expect(
        () => Ingredient.fromJson({"itemId": "mora", "quantity": 1}),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });
  });

  group("ExpItem.fromJson", () {
    test("Defaults isDefault to false when it is absent", () {
      final item = ExpItem.fromJson({
        "itemId": "heros_wit",
        "expPerItem": 20000,
      });

      expect(item.itemId, "heros_wit");
      expect(item.expPerItem, 20000);
      expect(item.isDefault, isFalse);
    });

    test("Reads isDefault when it is present", () {
      final item = ExpItem.fromJson({
        "itemId": "heros_wit",
        "expPerItem": 20000,
        "isDefault": true,
      });

      expect(item.isDefault, isTrue);
    });
  });
}
