// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponImpl _$$WeaponImplFromJson(Map<String, dynamic> json) => _$WeaponImpl(
      id: json['id'] as String,
      hyvId: (json['hyvId'] as num).toInt(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      rarity: (json['rarity'] as num).toInt(),
      subStat: json['subStat'] as String?,
      weaponAffixDesc: json['weaponAffixDesc'] == null
          ? null
          : LocalizedText.fromJson(
              json['weaponAffixDesc'] as Map<String, dynamic>),
      type: json['type'] as String,
      materials: Map<String, String>.from(json['materials'] as Map),
      source: json['source'] == null
          ? null
          : ItemSource.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeaponImplToJson(_$WeaponImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hyvId': instance.hyvId,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'rarity': instance.rarity,
      'subStat': instance.subStat,
      'weaponAffixDesc': instance.weaponAffixDesc,
      'type': instance.type,
      'materials': instance.materials,
      'source': instance.source,
    };

_$WeaponsMetaImpl _$$WeaponsMetaImplFromJson(Map<String, dynamic> json) =>
    _$WeaponsMetaImpl(
      subStats: (json['subStats'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
      types: (json['types'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, WeaponTypeInfo.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$WeaponsMetaImplToJson(_$WeaponsMetaImpl instance) =>
    <String, dynamic>{
      'subStats': instance.subStats,
      'types': instance.types,
    };

_$WeaponTypeInfoImpl _$$WeaponTypeInfoImplFromJson(Map<String, dynamic> json) =>
    _$WeaponTypeInfoImpl(
      hyvId: (json['hyvId'] as num).toInt(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeaponTypeInfoImplToJson(
        _$WeaponTypeInfoImpl instance) =>
    <String, dynamic>{
      'hyvId': instance.hyvId,
      'name': instance.name,
    };
