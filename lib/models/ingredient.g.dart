// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientByTypeImpl _$$IngredientByTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientByTypeImpl(
      type: json['type'] as String,
      quantity: json['quantity'] as int,
      craftLevel: json['craftLevel'] as int?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IngredientByTypeImplToJson(
        _$IngredientByTypeImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'quantity': instance.quantity,
      'craftLevel': instance.craftLevel,
      'runtimeType': instance.$type,
    };

_$IngredientExpImpl _$$IngredientExpImplFromJson(Map<String, dynamic> json) =>
    _$IngredientExpImpl(
      exp: json['exp'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IngredientExpImplToJson(_$IngredientExpImpl instance) =>
    <String, dynamic>{
      'exp': instance.exp,
      'runtimeType': instance.$type,
    };

_$IngredientWithFixedIdImpl _$$IngredientWithFixedIdImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientWithFixedIdImpl(
      itemId: json['itemId'] as String,
      quantity: json['quantity'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IngredientWithFixedIdImplToJson(
        _$IngredientWithFixedIdImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'runtimeType': instance.$type,
    };
