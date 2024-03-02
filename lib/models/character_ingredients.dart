import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";

part "character_ingredients.freezed.dart";
part "character_ingredients.g.dart";

@freezed
class CharacterIngredients with _$CharacterIngredients {
  const CharacterIngredients._();

  const factory CharacterIngredients({
    required List<ExpItem> expItems,
    required Map<int, CharacterIngredientsPurposes> rarities,
  }) = _CharacterIngredients;

  factory CharacterIngredients.fromJson(Map<String, dynamic> json) =>
      _$CharacterIngredientsFromJson(json);
}

@freezed
class ExpItem with _$ExpItem {
  const factory ExpItem({
    required String itemId,
    required int expPerItem,
  }) = _ExpItem;

  factory ExpItem.fromJson(Map<String, dynamic> json) =>
      _$ExpItemFromJson(json);
}

@freezed
class CharacterIngredientsPurposes with _$CharacterIngredientsPurposes {
  const factory CharacterIngredientsPurposes({
    required Map<Purpose, CharacterIngredientsLevels> purposes,
  }) = _CharacterIngredientsPurposes;

  factory CharacterIngredientsPurposes.fromJson(Map<String, dynamic> json) =>
      _$CharacterIngredientsPurposesFromJson(json);
}

@freezed
class CharacterIngredientsLevels with _$CharacterIngredientsLevels {
  const factory CharacterIngredientsLevels({
    required Map<int, List<CharacterIngredient>> levels,
  }) = _CharacterIngredientsLevels;

  factory CharacterIngredientsLevels.fromJson(Map<String, dynamic> json) =>
      _$CharacterIngredientsLevelsFromJson(json);
}

@freezed
sealed class CharacterIngredient with _$CharacterIngredient {
  const CharacterIngredient._();

  const factory CharacterIngredient.byType({
    required CharacterIngredientType type,
    required int quantity,
    int? craftLevel,
  }) = CharacterIngredientByType;

  const factory CharacterIngredient.exp({
    required int exp,
  }) = CharacterIngredientExp;

  const factory CharacterIngredient.fixed({
    required String itemId,
    required int quantity,
  }) = CharacterIngredientWithFixedId;

  factory CharacterIngredient.fromJson(Map<String, dynamic> json) =>
      _$CharacterIngredientFromJson(json);
}
