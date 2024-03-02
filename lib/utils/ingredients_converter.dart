import "../components/level_slider.dart";
import "../core/asset_cache.dart";
import "../models/bookmarkable_material.dart";
import "../models/character.dart";
import "../models/character_ingredients.dart";

List<IngredientsWithLevel> levelMapToList(Map<int, List<CharacterIngredient>> map) {
  return map.entries.map((e) => IngredientsWithLevel(level: e.key, ingredients: e.value)).toList();
}

String getConcreteItemId(CharacterIngredient ingredient, CharacterMaterialDefinitions definitions) {
  return switch (ingredient) {
    CharacterIngredientByType() => () {
      final [defType, expr] = definitions.withType(ingredient.type).split(":");
      if (defType == "id") {
        return expr;
      }
      if (defType == "group") {
        return AssetDataCache.instance.materials!
            .firstWhere((e) => e.groupId == expr && e.craftLevel == ingredient.craftLevel).id;
      }

      throw "Unknown type: $defType";
    }(),
    CharacterIngredientWithFixedId(:final itemId) => itemId,
    _ => "exp",
  };
}

Map<int, List<CharacterIngredient>> narrowLevelMap(Map<int, List<CharacterIngredient>> map, LevelRangeValues levelRangeValues) {
  return Map.fromEntries(map.entries.where((e) => e.key >= levelRangeValues.start && e.key <= levelRangeValues.end));
}

/// Merge the ingredients of the same id in the list.
List<BookmarkableMaterial> toBookmarkableMaterials(List<IngredientsWithLevel> ingredients, CharacterMaterialDefinitions definitions) {
  final merged = <String, List<BookmarkableMaterialLevel>>{};
  for (final ingredient in ingredients) {
    for (final i in ingredient.ingredients) {
      final itemId = getConcreteItemId(i, definitions);
      merged[itemId] ??= [];
      merged[itemId]!.add(
        switch (i) {
          CharacterIngredientExp(:final exp) => BookmarkableMaterialLevel.exp(
            level: ingredient.level,
            exp: exp,
          ),
          CharacterIngredientWithFixedId(:final quantity) =>
              BookmarkableMaterialLevel(
                level: ingredient.level,
                quantity: quantity,
              ),
          CharacterIngredientByType(:final quantity) =>
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
  ).toList();
}
