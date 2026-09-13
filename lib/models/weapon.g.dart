// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Weapon _$WeaponFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Weapon', json, ($checkedConvert) {
      final val = _Weapon(
        id: $checkedConvert('id', (v) => v as String),
        disableSync: $checkedConvert('disableSync', (v) => v as bool? ?? false),
        hyvId: $checkedConvert('hyvId', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        rarity: $checkedConvert('rarity', (v) => (v as num).toInt()),
        subStat: $checkedConvert('subStat', (v) => v as String?),
        weaponAffixDesc: $checkedConvert(
          'weaponAffixDesc',
          (v) => v == null ? null : LocalizedText.fromJson(v),
        ),
        type: $checkedConvert('type', (v) => v as String),
        materials: $checkedConvert(
          'materials',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ),
        ),
        levelingDescription: $checkedConvert(
          'levelingDescription',
          (v) => v == null ? null : LocalizedText.fromJson(v),
        ),
        source: $checkedConvert(
          'source',
          (v) =>
              v == null ? null : ItemSource.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

_WeaponsMeta _$WeaponsMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WeaponsMeta', json, ($checkedConvert) {
      final val = _WeaponsMeta(
        subStats: $checkedConvert(
          'subStats',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, LocalizedText.fromJson(e)),
          ),
        ),
        types: $checkedConvert(
          'types',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) =>
                MapEntry(k, WeaponTypeInfo.fromJson(e as Map<String, dynamic>)),
          ),
        ),
      );
      return val;
    });

_WeaponTypeInfo _$WeaponTypeInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WeaponTypeInfo', json, ($checkedConvert) {
      final val = _WeaponTypeInfo(
        hyvId: $checkedConvert('hyvId', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
      );
      return val;
    });
