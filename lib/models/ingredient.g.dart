// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientByType _$IngredientByTypeFromJson(Map<String, dynamic> json) =>
    IngredientByType(
      type: json['type'] as String,
      quantity: (json['quantity'] as num).toInt(),
      craftLevel: (json['craftLevel'] as num?)?.toInt(),
      specificCharacters:
          (json['specificCharacters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$IngredientByTypeToJson(IngredientByType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'quantity': instance.quantity,
      'craftLevel': instance.craftLevel,
      'specificCharacters': instance.specificCharacters,
      'runtimeType': instance.$type,
    };

IngredientExp _$IngredientExpFromJson(Map<String, dynamic> json) =>
    IngredientExp(
      exp: (json['exp'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$IngredientExpToJson(IngredientExp instance) =>
    <String, dynamic>{
      'exp': instance.exp,
      'runtimeType': instance.$type,
    };

IngredientWithFixedId _$IngredientWithFixedIdFromJson(
        Map<String, dynamic> json) =>
    IngredientWithFixedId(
      itemId: json['itemId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$IngredientWithFixedIdToJson(
        IngredientWithFixedId instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'runtimeType': instance.$type,
    };
