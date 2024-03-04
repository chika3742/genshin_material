// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialImpl _$$MaterialImplFromJson(Map<String, dynamic> json) =>
    _$MaterialImpl(
      id: json['id'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      rarity: json['rarity'] as int,
      category: $enumDecode(_$MaterialCategoryEnumMap, json['category']),
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
      'category': _$MaterialCategoryEnumMap[instance.category]!,
      'groupId': instance.groupId,
      'craftLevel': instance.craftLevel,
    };

const _$MaterialCategoryEnumMap = {
  MaterialCategory.exp: 'exp',
  MaterialCategory.gems: 'gems',
  MaterialCategory.elementalStone: 'elementalStone',
  MaterialCategory.local: 'local',
  MaterialCategory.talentBook: 'talentBook',
  MaterialCategory.talentBoss: 'talentBoss',
  MaterialCategory.common: 'common',
  MaterialCategory.others: 'others',
};
