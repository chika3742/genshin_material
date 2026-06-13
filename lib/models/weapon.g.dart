// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Weapon _$WeaponFromJson(Map<String, dynamic> json) => _Weapon(
  id: json['id'] as String,
  disableSync: json['disableSync'] as bool? ?? false,
  hyvId: (json['hyvId'] as num).toInt(),
  name: LocalizedText.fromJson(json['name']),
  jaPronunciation: json['jaPronunciation'] as String,
  imageUrl: json['imageUrl'] as String,
  rarity: (json['rarity'] as num).toInt(),
  subStat: json['subStat'] as String?,
  weaponAffixDesc: json['weaponAffixDesc'] == null
      ? null
      : LocalizedText.fromJson(json['weaponAffixDesc']),
  type: json['type'] as String,
  materials: Map<String, String>.from(json['materials'] as Map),
  source: json['source'] == null
      ? null
      : ItemSource.fromJson(json['source'] as Map<String, dynamic>),
);

_WeaponsMeta _$WeaponsMetaFromJson(Map<String, dynamic> json) => _WeaponsMeta(
  subStats: (json['subStats'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, LocalizedText.fromJson(e)),
  ),
  types: (json['types'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, WeaponTypeInfo.fromJson(e as Map<String, dynamic>)),
  ),
);

_WeaponTypeInfo _$WeaponTypeInfoFromJson(Map<String, dynamic> json) =>
    _WeaponTypeInfo(
      hyvId: (json['hyvId'] as num).toInt(),
      name: LocalizedText.fromJson(json['name']),
    );
