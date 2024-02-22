import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/character_ingredients.dart";

void main() {
  test("Can parse CharacterIngredients JSON", () {
    final json = {
      "expItems": [
        {"itemId": "exp1", "expPerItem": 100},
        {"itemId": "exp2", "expPerItem": 200},
      ],
      "purposeTypes": {
        "ascension": {
          "rarities": {
            "1": {
              "levels": {
                "2": [
                  {"runtimeType": "byType", "type": "common", "quantity": 3},
                  {"runtimeType": "fixed", "itemId": "item4", "quantity": 4},
                  {"runtimeType": "exp", "exp": 2000},
                ],
                "3": [
                  {"runtimeType": "fixed", "itemId": "item5", "quantity": 5},
                  {"runtimeType": "fixed", "itemId": "item6", "quantity": 6},
                ],
              },
            },
          },
        },
      },
    };

    final parsed = CharacterIngredients.fromJson(json);

    debugPrint(parsed.toString());
  });
}
