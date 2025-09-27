// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishesMeta _$WishesMetaFromJson(Map<String, dynamic> json) => _WishesMeta(
  userAgent: json['userAgent'] as String,
  gachaTypes: (json['gachaTypes'] as List<dynamic>)
      .map((e) => GachaType.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WishesMetaToJson(_WishesMeta instance) =>
    <String, dynamic>{
      'userAgent': instance.userAgent,
      'gachaTypes': instance.gachaTypes,
    };

_GachaType _$GachaTypeFromJson(Map<String, dynamic> json) => _GachaType(
  id: json['id'] as String,
  title: LocalizedText.fromJson(json['title'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GachaTypeToJson(_GachaType instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};
