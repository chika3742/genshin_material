// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furnishing_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Furnishing _$FurnishingFromJson(Map<String, dynamic> json) => _Furnishing(
  id: json['id'] as String,
  hyvId: (json['hyvId'] as num).toInt(),
  name: LocalizedText.fromJson(json['name']),
  jaPronunciation: json['jaPronunciation'] as String,
  imageUrl: json['imageUrl'] as String,
  source: json['source'] == null
      ? null
      : ItemSource.fromJson(json['source'] as Map<String, dynamic>),
);

_FurnishingSetMeta _$FurnishingSetMetaFromJson(Map<String, dynamic> json) =>
    _FurnishingSetMeta(
      setTypes: (json['setTypes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, LocalizedText.fromJson(e)),
      ),
    );

_FurnishingSetComponent _$FurnishingSetComponentFromJson(
  Map<String, dynamic> json,
) => _FurnishingSetComponent(
  furnishingId: json['furnishingId'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$FurnishingSetComponentToJson(
  _FurnishingSetComponent instance,
) => <String, dynamic>{
  'furnishingId': instance.furnishingId,
  'quantity': instance.quantity,
};

_FurnishingSet _$FurnishingSetFromJson(
  Map<String, dynamic> json,
) => _FurnishingSet(
  id: json['id'] as String,
  hyvId: (json['hyvId'] as num).toInt(),
  name: LocalizedText.fromJson(json['name']),
  jaPronunciation: json['jaPronunciation'] as String,
  imageUrl: json['imageUrl'] as String,
  type: json['type'] as String,
  favoriteCharacterHyvIds: (json['favoriteCharacterHyvIds'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  consistsOf: (json['consistsOf'] as List<dynamic>)
      .map((e) => FurnishingSetComponent.fromJson(e as Map<String, dynamic>))
      .toList(),
);
