
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
      "imageUrl": "https://example.com/foo.png",
      "smallImageUrl": "https://example.com/foo.png",
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
