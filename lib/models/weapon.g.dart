// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponDataImpl _$$WeaponDataImplFromJson(Map<String, dynamic> json) =>
    _$WeaponDataImpl(
      types: (json['types'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$WeaponDataImplToJson(_$WeaponDataImpl instance) =>
    <String, dynamic>{
      'types': instance.types,
    };
