
import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/character.dart";

void main() {
  test("Can parse NormalCharacterMaterialDefinition JSON", () {
    const json = {
      "runtimeType": "normal",
      "primary": "01",
      "elementalStone": "02",
      "local": "03",
      "secondary": "04",
      "talentPrimary": "05",
      "talentBoss": "06",
    };

    final parsed = CharacterMaterialDefinitions.fromJson(json);

    debugPrint(parsed.toString());
  });

  test("Can parse MaterialIdPerType JSON string", () {
    const json = {
      "types": {
        "normal": "01",
        "skill": "02",
        "burst": "03",
      },
    };

    final parsed = MaterialIdPerType.fromJson(json);

    debugPrint(parsed.toString());
  });

  test("Can parse MaterialIdPerLevelPerType JSON", () {
    const json = {
      "runtimeType": "byLevel",
      "types": {
        "normal": {
          "levels": {
            "2": "01",
            "3": "02",
            "4": "03",
          },
        },
        "skill": {
          "levels": {
            "2": "04",
            "3": "05",
            "4": "06",
          },
        },
        "burst": {
          "levels": {
            "2": "07",
            "3": "08",
            "4": "09",
          },
        },
      },
    };

    debugPrint(MaterialIdPerType.fromJson(json).toString());
  });

  test("Can parse TravelerTalentMaterialDefinition JSON", () {
    const json = {
      "talentPrimary": {
        "types": {
          "normal": "01",
        },
      },
      "talentSecondary": {
        "types": {
          "normal": "02",
        },
      },
      "talentBoss": {
        "types": {
          "normal": "03",
        },
      },
    };

    debugPrint(TravelerTalentMaterialDefinitions.fromJson(json).toString());
  });

  test("Can parse ListedCharacter", () {
    const json = {
      "id": "foo",
      "rid": "bar",
      "jaPronunciation": "フー",
      "name": {
        "locales": {
          "ja": "ふー",
          "en": "Foo",
        },
      },
      "rarity": 5,
      "weaponType": "sword",
      "element": "pyro",
      "materials": {
        "primary": "a",
        "elementalStone": "b",
        "local": "c",
        "secondary": "d",
        "talentPrimary": "e",
        "talentBoss": "f",
      },
    };

    debugPrint(Character.fromJson(json).toString());
  });
}
