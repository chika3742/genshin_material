import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "ingredient.dart";

part "character_ingredients.freezed.dart";
part "character_ingredients.g.dart";

@freezed
sealed class CharacterIngredients with _$CharacterIngredients {
  const CharacterIngredients._();

  const factory CharacterIngredients({
    required List<ExpItem> expItems,
    required Map<Purpose, CharacterIngredientsLevels> purposes,
  }) = _CharacterIngredients;

  factory CharacterIngredients.fromJson(Map<String, dynamic> json) =>
      _$CharacterIngredientsFromJson(json);
}

@freezed
sealed class ExpItem with _$ExpItem {
  const factory ExpItem({
    required String itemId,
    required int expPerItem,
  }) = _ExpItem;

  factory ExpItem.fromJson(Map<String, dynamic> json) =>
      _$ExpItemFromJson(json);
}

@freezed
sealed class CharacterIngredientsLevels with _$CharacterIngredientsLevels {
  const factory CharacterIngredientsLevels({
    required List<int> sliderTicks,
    required Map<int, List<Ingredient>> levels,
  }) = _CharacterIngredientsLevels;

  factory CharacterIngredientsLevels.fromJson(Map<String, dynamic> json) =>
      _$CharacterIngredientsLevelsFromJson(json);
}
