// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponDataImpl _$$WeaponDataImplFromJson(Map<String, dynamic> json) =>
    _$WeaponDataImpl(
      subStats: (json['subStats'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
      types: (json['types'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
      items: (json['items'] as List<dynamic>)
          .map((e) => Weapon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeaponDataImplToJson(_$WeaponDataImpl instance) =>
    <String, dynamic>{
      'subStats': instance.subStats,
      'types': instance.types,
      'items': instance.items,
    };

_$WeaponImpl _$$WeaponImplFromJson(Map<String, dynamic> json) => _$WeaponImpl(
      id: json['id'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      rarity: json['rarity'] as int,
      subStat: json['subStat'] as String?,
      type: json['type'] as String,
      materials: Map<String, String>.from(json['materials'] as Map),
      whereToGet: json['whereToGet'] == null
          ? null
          : WhereToGet.fromJson(json['whereToGet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeaponImplToJson(_$WeaponImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'rarity': instance.rarity,
      'subStat': instance.subStat,
      'type': instance.type,
      'materials': instance.materials,
      'whereToGet': instance.whereToGet,
    };
