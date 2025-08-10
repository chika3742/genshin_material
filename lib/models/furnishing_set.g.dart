// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furnishing_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Furnishing _$FurnishingFromJson(Map<String, dynamic> json) => _Furnishing(
      id: json['id'] as String,
      hyvId: (json['hyvId'] as num).toInt(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      source: json['source'] == null
          ? null
          : ItemSource.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FurnishingToJson(_Furnishing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hyvId': instance.hyvId,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'source': instance.source,
    };

_FurnishingSetMeta _$FurnishingSetMetaFromJson(Map<String, dynamic> json) =>
    _FurnishingSetMeta(
      setTypes: (json['setTypes'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$FurnishingSetMetaToJson(_FurnishingSetMeta instance) =>
    <String, dynamic>{
      'setTypes': instance.setTypes,
    };

_FurnishingSetComponent _$FurnishingSetComponentFromJson(
        Map<String, dynamic> json) =>
    _FurnishingSetComponent(
      furnishingId: json['furnishingId'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$FurnishingSetComponentToJson(
        _FurnishingSetComponent instance) =>
    <String, dynamic>{
      'furnishingId': instance.furnishingId,
      'quantity': instance.quantity,
    };

_FurnishingSet _$FurnishingSetFromJson(Map<String, dynamic> json) =>
    _FurnishingSet(
      id: json['id'] as String,
      hyvId: (json['hyvId'] as num).toInt(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      favoriteCharacterHyvIds:
          (json['favoriteCharacterHyvIds'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
      consistsOf: (json['consistsOf'] as List<dynamic>)
          .map(
              (e) => FurnishingSetComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FurnishingSetToJson(_FurnishingSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hyvId': instance.hyvId,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'favoriteCharacterHyvIds': instance.favoriteCharacterHyvIds,
      'consistsOf': instance.consistsOf,
    };
