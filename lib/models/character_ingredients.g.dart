// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterIngredients _$CharacterIngredientsFromJson(
        Map<String, dynamic> json) =>
    _CharacterIngredients(
      expItems: (json['expItems'] as List<dynamic>)
          .map((e) => ExpItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      purposes: (json['purposes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$PurposeEnumMap, k),
            CharacterIngredientsLevels.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$CharacterIngredientsToJson(
        _CharacterIngredients instance) =>
    <String, dynamic>{
      'expItems': instance.expItems,
      'purposes':
          instance.purposes.map((k, e) => MapEntry(_$PurposeEnumMap[k]!, e)),
    };

const _$PurposeEnumMap = {
  Purpose.ascension: 'ascension',
  Purpose.normalAttack: 'normalAttack',
  Purpose.elementalSkill: 'elementalSkill',
  Purpose.elementalBurst: 'elementalBurst',
};

_ExpItem _$ExpItemFromJson(Map<String, dynamic> json) => _ExpItem(
      itemId: json['itemId'] as String,
      expPerItem: (json['expPerItem'] as num).toInt(),
    );

Map<String, dynamic> _$ExpItemToJson(_ExpItem instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'expPerItem': instance.expPerItem,
    };

_CharacterIngredientsLevels _$CharacterIngredientsLevelsFromJson(
        Map<String, dynamic> json) =>
    _CharacterIngredientsLevels(
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

Map<String, dynamic> _$CharacterIngredientsLevelsToJson(
        _CharacterIngredientsLevels instance) =>
    <String, dynamic>{
      'sliderTicks': instance.sliderTicks,
      'levels': instance.levels.map((k, e) => MapEntry(k.toString(), e)),
    };
