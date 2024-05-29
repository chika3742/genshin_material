import "package:collection/collection.dart";

import "../components/level_slider.dart";
import "../core/asset_cache.dart";
import "../models/bookmarkable_material.dart";
import "../models/common.dart";
import "../models/ingredient.dart";

List<IngredientsWithLevelAndPurpose> ingredientsMapToList(Map<int, List<Ingredient>> map, Purpose purposeType) {
  return map.entries.map(
    (e) => IngredientsWithLevelAndPurpose(
      level: e.key,
      ingredients: e.value,
      purposeType: purposeType,
    ),
  ).toList();
}

String getConcreteItemId(Ingredient ingredient, MaterialDefinitions definitions, AssetData assetData) {
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
          return assetData.materials.values
              .firstWhere(
                (e) => e.groupId == expr && e.craftLevel == ingredient.craftLevel,
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
  List<IngredientsWithLevelAndPurpose> ingredientsList,
  MaterialDefinitions definitions,
  AssetData assetData,
) {
  final merged = <String, List<BookmarkableMaterialLevel>>{};
  for (final ingredients in ingredientsList) {
    for (final ingredient in ingredients.ingredients) {
      final itemId = getConcreteItemId(ingredient, definitions, assetData);
      (merged[itemId] ??= []).add(
        switch (ingredient) {
          IngredientExp(:final exp) => BookmarkableMaterialLevel.exp(
            level: ingredients.level,
            exp: exp,
          ),
          IngredientWithFixedId(:final quantity) =>
              BookmarkableMaterialLevel(
                level: ingredients.level,
                quantity: quantity,
                purposeType: ingredients.purposeType,
              ),
          IngredientByType(:final quantity) =>
              BookmarkableMaterialLevel(
                level: ingredients.level,
                quantity: quantity,
                purposeType: ingredients.purposeType,
              ),
        },
      );
    }
  }
  return merged.entries.map(
    (e) => BookmarkableMaterial(
      id: e.key,
      levels: e.value,
      assetData: assetData,
    ),
  ).toList().sorted((a, b) => a.sortPriority.compareTo(b.sortPriority));
}
