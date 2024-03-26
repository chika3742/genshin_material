import "package:collection/collection.dart";

import "../components/level_slider.dart";
import "../core/asset_cache.dart";
import "../models/bookmarkable_material.dart";
import "../models/common.dart";
import "../models/ingredient.dart";

List<IngredientsWithLevel> levelMapToList(Map<int, List<Ingredient>> map) {
  return map.entries.map((e) => IngredientsWithLevel(level: e.key, ingredients: e.value)).toList();
}

String getConcreteItemId(Ingredient ingredient, MaterialDefinitions definitions) {
  return switch (ingredient) {
    IngredientByType() => () {
        final definition = definitions[ingredient.type];
        if (definition == null) {
          throw "Unknown type: ${ingredient.type}";
        }

        final [defType, expr] = definition.split(":");
        if (defType == "id") {
          return expr;
        }
        if (defType == "group") {
          return AssetDataCache.instance.materials!
              .firstWhere(
                (e) => e.groupId == expr &&
                    e.craftLevel == ingredient.craftLevel,
              )
              .id;
        }

        throw "Unknown type: $defType";
      }(),
    IngredientWithFixedId(:final itemId) => itemId,
    _ => "exp",
  };
}

Map<int, List<Ingredient>> narrowLevelMap(
  Map<int, List<Ingredient>> map,
  LevelRangeValues levelRangeValues,
) {
  return Map.fromEntries(
    map.entries.where(
      (e) => e.key > levelRangeValues.start && e.key <= levelRangeValues.end,
    ),
  );
}

/// Merge the ingredients of the same id in the list.
List<BookmarkableMaterial> toBookmarkableMaterials(
  List<IngredientsWithLevel> ingredients,
  MaterialDefinitions definitions,
) {
  final merged = <String, List<BookmarkableMaterialLevel>>{};
  for (final ingredient in ingredients) {
    for (final i in ingredient.ingredients) {
      final itemId = getConcreteItemId(i, definitions);
      merged[itemId] ??= [];
      merged[itemId]!.add(
        switch (i) {
          IngredientExp(:final exp) => BookmarkableMaterialLevel.exp(
            level: ingredient.level,
            exp: exp,
          ),
          IngredientWithFixedId(:final quantity) =>
              BookmarkableMaterialLevel(
                level: ingredient.level,
                quantity: quantity,
              ),
          IngredientByType(:final quantity) =>
              BookmarkableMaterialLevel(
                level: ingredient.level,
                quantity: quantity,
              ),
        },
      );
    }
  }
  return merged.entries.map(
    (e) => BookmarkableMaterial(
      id: e.key,
      levels: e.value,
    ),
  ).toList().sorted((a, b) => a.sortOrder.compareTo(b.sortOrder));
}
