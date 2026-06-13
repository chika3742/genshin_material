// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Material _$MaterialFromJson(Map<String, dynamic> json) => _Material(
  id: json['id'] as String,
  hyvId: (json['hyvId'] as num).toInt(),
  name: LocalizedText.fromJson(json['name']),
  jaPronunciation: json['jaPronunciation'] as String,
  imageUrl: json['imageUrl'] as String,
  rarity: (json['rarity'] as num).toInt(),
  category: json['category'] as String,
  groupId: json['groupId'] as String?,
  craftLevel: (json['craftLevel'] as num?)?.toInt(),
  availableDays: (json['availableDays'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$DayOfWeekEnumMap, e))
      .toList(),
  source: json['source'] == null
      ? null
      : ItemSource.fromJson(json['source'] as Map<String, dynamic>),
);

const _$DayOfWeekEnumMap = {
  DayOfWeek.monday: 'monday',
  DayOfWeek.tuesday: 'tuesday',
  DayOfWeek.wednesday: 'wednesday',
  DayOfWeek.thursday: 'thursday',
  DayOfWeek.friday: 'friday',
  DayOfWeek.saturday: 'saturday',
  DayOfWeek.sunday: 'sunday',
};

TeyvatMapItemSource _$TeyvatMapItemSourceFromJson(Map<String, dynamic> json) =>
    TeyvatMapItemSource(
      typeId: json['typeId'] as String,
      center: json['center'] as String?,
      $type: json['runtimeType'] as String?,
    );

TextItemSource _$TextItemSourceFromJson(Map<String, dynamic> json) =>
    TextItemSource(
      text: LocalizedText.fromJson(json['text']),
      $type: json['runtimeType'] as String?,
    );

SourceListItemSource _$SourceListItemSourceFromJson(
  Map<String, dynamic> json,
) => SourceListItemSource(
  list: (json['list'] as List<dynamic>).map(LocalizedText.fromJson).toList(),
  $type: json['runtimeType'] as String?,
);

_MaterialsMeta _$MaterialsMetaFromJson(Map<String, dynamic> json) =>
    _MaterialsMeta(
      categories: (json['categories'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, LocalizedText.fromJson(e)),
      ),
      sortOrder: Map<String, int>.from(json['sortOrder'] as Map),
      daily: DailyMaterials.fromJson(json['daily'] as Map<String, dynamic>),
      specialCharactersUsingMaterials:
          (json['specialCharactersUsingMaterials'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>).map((e) => e as String).toList(),
            ),
          ),
    );

_DailyMaterials _$DailyMaterialsFromJson(Map<String, dynamic> json) =>
    _DailyMaterials(
      talent: (json['talent'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => DailyMaterial.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
      weapon: (json['weapon'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => DailyMaterial.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

_DailyMaterial _$DailyMaterialFromJson(Map<String, dynamic> json) =>
    _DailyMaterial(
      description: LocalizedText.fromJson(json['description']),
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );
