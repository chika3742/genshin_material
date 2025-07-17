// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeaponIngredients _$WeaponIngredientsFromJson(Map<String, dynamic> json) =>
    _WeaponIngredients(
      expItems: (json['expItems'] as List<dynamic>)
          .map((e) => ExpItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      rarities: (json['rarities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k),
            WeaponIngredientsLevels.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$WeaponIngredientsToJson(_WeaponIngredients instance) =>
    <String, dynamic>{
      'expItems': instance.expItems,
      'rarities': instance.rarities.map((k, e) => MapEntry(k.toString(), e)),
    };

_WeaponIngredientsLevels _$WeaponIngredientsLevelsFromJson(
        Map<String, dynamic> json) =>
    _WeaponIngredientsLevels(
      sliderTicks: (json['sliderTicks'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      levels: (json['levels'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as List<dynamic>)
                .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$WeaponIngredientsLevelsToJson(
        _WeaponIngredientsLevels instance) =>
    <String, dynamic>{
      'sliderTicks': instance.sliderTicks,
      'levels': instance.levels.map((k, e) => MapEntry(k.toString(), e)),
    };
