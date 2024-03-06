// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialDataImpl _$$MaterialDataImplFromJson(Map<String, dynamic> json) =>
    _$MaterialDataImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => Material.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => MaterialCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortOrder: Map<String, int>.from(json['sortOrder'] as Map),
    );

Map<String, dynamic> _$$MaterialDataImplToJson(_$MaterialDataImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'categories': instance.categories,
      'sortOrder': instance.sortOrder,
    };

_$MaterialImpl _$$MaterialImplFromJson(Map<String, dynamic> json) =>
    _$MaterialImpl(
      id: json['id'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      rarity: json['rarity'] as int,
      category: json['category'] as String,
      groupId: json['groupId'] as String?,
      craftLevel: json['craftLevel'] as int?,
    );

Map<String, dynamic> _$$MaterialImplToJson(_$MaterialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'rarity': instance.rarity,
      'category': instance.category,
      'groupId': instance.groupId,
      'craftLevel': instance.craftLevel,
    };

_$MaterialCategoryImpl _$$MaterialCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialCategoryImpl(
      id: json['id'] as String,
      text: LocalizedText.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MaterialCategoryImplToJson(
        _$MaterialCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
