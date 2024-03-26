import "package:freezed_annotation/freezed_annotation.dart";

part "ingredient.freezed.dart";
part "ingredient.g.dart";

@freezed
sealed class Ingredient with _$Ingredient {
  const factory Ingredient.byType({
    required String type,
    required int quantity,
    int? craftLevel,
  }) = IngredientByType;

  const factory Ingredient.exp({
    required int exp,
  }) = IngredientExp;

  const factory Ingredient.fixed({
    required String itemId,
    required int quantity,
  }) = IngredientWithFixedId;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
