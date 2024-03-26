// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponIngredientsImpl _$$WeaponIngredientsImplFromJson(
        Map<String, dynamic> json) =>
    _$WeaponIngredientsImpl(
      expItems: (json['expItems'] as List<dynamic>)
          .map((e) => ExpItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      rarities: (json['rarities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k),
            WeaponIngredientsLevels.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$WeaponIngredientsImplToJson(
        _$WeaponIngredientsImpl instance) =>
    <String, dynamic>{
      'expItems': instance.expItems,
      'rarities': instance.rarities.map((k, e) => MapEntry(k.toString(), e)),
    };

_$WeaponIngredientsLevelsImpl _$$WeaponIngredientsLevelsImplFromJson(
        Map<String, dynamic> json) =>
    _$WeaponIngredientsLevelsImpl(
      levels: (json['levels'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as List<dynamic>)
                .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$WeaponIngredientsLevelsImplToJson(
        _$WeaponIngredientsLevelsImpl instance) =>
    <String, dynamic>{
      'levels': instance.levels.map((k, e) => MapEntry(k.toString(), e)),
    };
