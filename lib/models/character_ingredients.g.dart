// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterIngredientsImpl _$$CharacterIngredientsImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterIngredientsImpl(
      expItems: (json['expItems'] as List<dynamic>)
          .map((e) => ExpItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      purposes: (json['purposes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$PurposeEnumMap, k),
            CharacterIngredientsLevels.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$CharacterIngredientsImplToJson(
        _$CharacterIngredientsImpl instance) =>
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

_$ExpItemImpl _$$ExpItemImplFromJson(Map<String, dynamic> json) =>
    _$ExpItemImpl(
      itemId: json['itemId'] as String,
      expPerItem: json['expPerItem'] as int,
    );

Map<String, dynamic> _$$ExpItemImplToJson(_$ExpItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'expPerItem': instance.expPerItem,
    };

_$CharacterIngredientsLevelsImpl _$$CharacterIngredientsLevelsImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterIngredientsLevelsImpl(
      levels: (json['levels'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as List<dynamic>)
                .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$CharacterIngredientsLevelsImplToJson(
        _$CharacterIngredientsLevelsImpl instance) =>
    <String, dynamic>{
      'levels': instance.levels.map((k, e) => MapEntry(k.toString(), e)),
    };
