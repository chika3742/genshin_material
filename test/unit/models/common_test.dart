import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:path/path.dart" as path;

import "../../utils/asset_data.dart";

void main() {
  group("Purpose.fromTalentType", () {
    test("Resolves every declared purpose from its name", () {
      for (final purpose in Purpose.values) {
        expect(Purpose.fromTalentType(purpose.name), purpose);
      }
    });

    test("Throws a StateError for an unknown talent type", () {
      expect(
        () => Purpose.fromTalentType("unknownTalent"),
        throwsStateError,
      );
    });

    test("Throws a StateError for an empty talent type", () {
      expect(() => Purpose.fromTalentType(""), throwsStateError);
    });
  });

  group("MaterialTargetType.fromWeaponNullity", () {
    test("Resolves to character when the weapon id is null", () {
      expect(
        MaterialTargetType.fromWeaponNullity(null),
        MaterialTargetType.character,
      );
    });

    test("Resolves to weapon when the weapon id is present", () {
      expect(
        MaterialTargetType.fromWeaponNullity("weapon_1"),
        MaterialTargetType.weapon,
      );
    });

    test("Resolves to weapon even for an empty weapon id", () {
      // The factory only inspects nullity, so an empty id still counts as a weapon.
      expect(
        MaterialTargetType.fromWeaponNullity(""),
        MaterialTargetType.weapon,
      );
    });
  });

  group("MaterialTargetType.getExpItemConf", () {
    const characterExpItem = ExpItem(
      itemId: "character_exp_item",
      expPerItem: 20000,
      isDefault: true,
    );
    const weaponExpItem = ExpItem(
      itemId: "weapon_exp_item",
      expPerItem: 10000,
    );

    final assetData = buildTestAssetData(
      characterIngredients: buildIngredientConfigurations(
        rarity: 5,
        purpose: Purpose.ascension,
        levels: const {},
        expItems: const [characterExpItem],
      ),
      weaponIngredients: buildIngredientConfigurations(
        rarity: 5,
        purpose: Purpose.ascension,
        levels: const {},
        expItems: const [weaponExpItem],
      ),
    );

    test("Reads the exp items of the character configuration", () {
      expect(
        MaterialTargetType.character.getExpItemConf(assetData),
        const [characterExpItem],
      );
    });

    test("Reads the exp items of the weapon configuration", () {
      expect(
        MaterialTargetType.weapon.getExpItemConf(assetData),
        const [weaponExpItem],
      );
    });
  });

  group("getBlankImagePath", () {
    test("Appends img/blank.png to the local asset path", () {
      expect(
        getBlankImagePath(path.join("var", "assets", "current")),
        path.join("var", "assets", "current", "img", "blank.png"),
      );
    });

    test("Returns a relative path when the local asset path is empty", () {
      expect(getBlankImagePath(""), path.join("img", "blank.png"));
    });
  });

  group("DayOfWeek", () {
    test("Maps every entry onto the matching DateTime weekday constant", () {
      expect(
        DayOfWeek.values.map((e) => e.value).toList(),
        [
          DateTime.monday,
          DateTime.tuesday,
          DateTime.wednesday,
          DateTime.thursday,
          DateTime.friday,
          DateTime.saturday,
          DateTime.sunday,
        ],
      );
    });
  });

  group("GameServer", () {
    test("Declares the timezone offset of each server", () {
      expect(
        GameServer.america.serverTimeZoneOffset,
        const Duration(hours: -5),
      );
      expect(GameServer.europe.serverTimeZoneOffset, const Duration(hours: 1));
      expect(GameServer.asia.serverTimeZoneOffset, const Duration(hours: 8));
    });
  });
}
