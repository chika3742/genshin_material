import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";

part "ingredients.g.dart";
part "ingredients.freezed.dart";

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
sealed class Ingredient with _$Ingredient {
  const factory Ingredient.byType({
    required String type,
    required int quantity,
    int? craftLevel,
    Map<String, MaterialId?>? targetSpecific,
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

@freezed
sealed class SliderEntry with _$SliderEntry {
  const factory SliderEntry({
    required LocalizedText title,
    required List<Purpose> purposes,
  }) = _SliderEntry;

  factory SliderEntry.fromJson(Map<String, dynamic> json) =>
      _$SliderEntryFromJson(json);
}

@freezed
sealed class IngredientLevels with _$IngredientLevels {
  const factory IngredientLevels({
    required List<int> sliderTicks,
    required Map<int, List<Ingredient>> levels,
  }) = _IngredientLevels;

  factory IngredientLevels.fromJson(Map<String, dynamic> json) =>
      _$IngredientLevelsFromJson(json);
}

@freezed
sealed class IngredientPurposes with _$IngredientPurposes {
  const factory IngredientPurposes({
    required Map<Purpose, String> purposes,
  }) = _IngredientPurposes;

  factory IngredientPurposes.fromJson(Map<String, dynamic> json) =>
      _$IngredientPurposesFromJson(json);
}

@freezed
sealed class IngredientConfigurations with _$IngredientConfigurations {
  const IngredientConfigurations._();

  const factory IngredientConfigurations({
    required List<ExpItem> expItems,
    required Map<int, IngredientPurposes> rarities,
    required List<SliderEntry> sliders,
    required Map<String, IngredientLevels> ingredientTables,
    required String defaultExpItemId,
  }) = _IngredientConfigurations;

  factory IngredientConfigurations.fromJson(Map<String, dynamic> json) =>
      _$IngredientConfigurationsFromJson(json);

  IngredientLevels getLevels({required int rarity, required Purpose purpose}) {
    return ingredientTables[rarities[rarity]!.purposes[purpose]]!;
  }
}
