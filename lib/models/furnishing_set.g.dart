// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furnishing_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Furnishing _$FurnishingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Furnishing', json, ($checkedConvert) {
      final val = _Furnishing(
        id: $checkedConvert('id', (v) => v as String),
        hyvId: $checkedConvert('hyvId', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        source: $checkedConvert(
          'source',
          (v) =>
              v == null ? null : ItemSource.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

_FurnishingSetMeta _$FurnishingSetMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FurnishingSetMeta', json, ($checkedConvert) {
      final val = _FurnishingSetMeta(
        setTypes: $checkedConvert(
          'setTypes',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, LocalizedText.fromJson(e)),
          ),
        ),
      );
      return val;
    });

_FurnishingSetComponent _$FurnishingSetComponentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_FurnishingSetComponent', json, ($checkedConvert) {
  final val = _FurnishingSetComponent(
    furnishingId: $checkedConvert('furnishingId', (v) => v as String),
    quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$FurnishingSetComponentToJson(
  _FurnishingSetComponent instance,
) => <String, dynamic>{
  'furnishingId': instance.furnishingId,
  'quantity': instance.quantity,
};

_FurnishingSet _$FurnishingSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FurnishingSet', json, ($checkedConvert) {
      final val = _FurnishingSet(
        id: $checkedConvert('id', (v) => v as String),
        hyvId: $checkedConvert('hyvId', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
        favoriteCharacterHyvIds: $checkedConvert(
          'favoriteCharacterHyvIds',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        consistsOf: $checkedConvert(
          'consistsOf',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    FurnishingSetComponent.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });
