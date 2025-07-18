import "package:freezed_annotation/freezed_annotation.dart";

import "character_ingredients.dart";
import "ingredient.dart";

part "weapon_ingredients.freezed.dart";
part "weapon_ingredients.g.dart";

@freezed
sealed class WeaponIngredients with _$WeaponIngredients {
  const factory WeaponIngredients({
    required List<ExpItem> expItems,
    required Map<int, WeaponIngredientsLevels> rarities,
  }) = _WeaponIngredients;

  factory WeaponIngredients.fromJson(Map<String, dynamic> json) =>
      _$WeaponIngredientsFromJson(json);
}

@freezed
sealed class WeaponIngredientsLevels with _$WeaponIngredientsLevels {
  const factory WeaponIngredientsLevels({
    required List<int> sliderTicks,
    required Map<int, List<Ingredient>> levels,
  }) = _WeaponIngredientsLevels;

  factory WeaponIngredientsLevels.fromJson(Map<String, dynamic> json) =>
      _$WeaponIngredientsLevelsFromJson(json);
}
