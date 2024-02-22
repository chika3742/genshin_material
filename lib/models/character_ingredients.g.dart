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
      purposeTypes: (json['purposeTypes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$PurposeTypeEnumMap, k),
            CharacterIngredientsRarities.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$CharacterIngredientsImplToJson(
        _$CharacterIngredientsImpl instance) =>
    <String, dynamic>{
      'expItems': instance.expItems,
      'purposeTypes': instance.purposeTypes
          .map((k, e) => MapEntry(_$PurposeTypeEnumMap[k]!, e)),
    };

const _$PurposeTypeEnumMap = {
  PurposeType.ascension: 'ascension',
  PurposeType.normalAttack: 'normalAttack',
  PurposeType.elementalSkill: 'elementalSkill',
  PurposeType.elementalBurst: 'elementalBurst',
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

_$CharacterIngredientsRaritiesImpl _$$CharacterIngredientsRaritiesImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterIngredientsRaritiesImpl(
      rarities: (json['rarities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k),
            CharacterIngredientsLevels.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$CharacterIngredientsRaritiesImplToJson(
        _$CharacterIngredientsRaritiesImpl instance) =>
    <String, dynamic>{
      'rarities': instance.rarities.map((k, e) => MapEntry(k.toString(), e)),
    };

_$CharacterIngredientsLevelsImpl _$$CharacterIngredientsLevelsImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterIngredientsLevelsImpl(
      levels: (json['levels'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as List<dynamic>)
                .map((e) =>
                    CharacterIngredient.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$CharacterIngredientsLevelsImplToJson(
        _$CharacterIngredientsLevelsImpl instance) =>
    <String, dynamic>{
      'levels': instance.levels.map((k, e) => MapEntry(k.toString(), e)),
    };

_$CharacterIngredientByTypeImpl _$$CharacterIngredientByTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterIngredientByTypeImpl(
      type: $enumDecode(_$CharacterIngredientTypeEnumMap, json['type']),
      quantity: json['quantity'] as int,
      craftLevel: json['craftLevel'] as int?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterIngredientByTypeImplToJson(
        _$CharacterIngredientByTypeImpl instance) =>
    <String, dynamic>{
      'type': _$CharacterIngredientTypeEnumMap[instance.type]!,
      'quantity': instance.quantity,
      'craftLevel': instance.craftLevel,
      'runtimeType': instance.$type,
    };

const _$CharacterIngredientTypeEnumMap = {
  CharacterIngredientType.common: 'common',
};

_$CharacterIngredientExpImpl _$$CharacterIngredientExpImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterIngredientExpImpl(
      exp: json['exp'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterIngredientExpImplToJson(
        _$CharacterIngredientExpImpl instance) =>
    <String, dynamic>{
      'exp': instance.exp,
      'runtimeType': instance.$type,
    };

_$CharacterIngredientWithFixedIdImpl
    _$$CharacterIngredientWithFixedIdImplFromJson(Map<String, dynamic> json) =>
        _$CharacterIngredientWithFixedIdImpl(
          itemId: json['itemId'] as String,
          quantity: json['quantity'] as int,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CharacterIngredientWithFixedIdImplToJson(
        _$CharacterIngredientWithFixedIdImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'runtimeType': instance.$type,
    };
