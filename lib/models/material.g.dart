// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Material _$MaterialFromJson(Map<String, dynamic> json) => _Material(
      id: json['id'] as String,
      hyvId: (json['hyvId'] as num).toInt(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
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

Map<String, dynamic> _$MaterialToJson(_Material instance) => <String, dynamic>{
      'id': instance.id,
      'hyvId': instance.hyvId,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'rarity': instance.rarity,
      'category': instance.category,
      'groupId': instance.groupId,
      'craftLevel': instance.craftLevel,
      'availableDays':
          instance.availableDays?.map((e) => _$DayOfWeekEnumMap[e]!).toList(),
      'source': instance.source,
    };

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

Map<String, dynamic> _$TeyvatMapItemSourceToJson(
        TeyvatMapItemSource instance) =>
    <String, dynamic>{
      'typeId': instance.typeId,
      'center': instance.center,
      'runtimeType': instance.$type,
    };

TextItemSource _$TextItemSourceFromJson(Map<String, dynamic> json) =>
    TextItemSource(
      text: LocalizedText.fromJson(json['text'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TextItemSourceToJson(TextItemSource instance) =>
    <String, dynamic>{
      'text': instance.text,
      'runtimeType': instance.$type,
    };

_MaterialsMeta _$MaterialsMetaFromJson(Map<String, dynamic> json) =>
    _MaterialsMeta(
      categories: (json['categories'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
      sortOrder: Map<String, int>.from(json['sortOrder'] as Map),
      daily: DailyMaterials.fromJson(json['daily'] as Map<String, dynamic>),
      specialCharactersUsingMaterials:
          (json['specialCharactersUsingMaterials'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$MaterialsMetaToJson(_MaterialsMeta instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'sortOrder': instance.sortOrder,
      'daily': instance.daily,
      'specialCharactersUsingMaterials':
          instance.specialCharactersUsingMaterials,
    };

_DailyMaterials _$DailyMaterialsFromJson(Map<String, dynamic> json) =>
    _DailyMaterials(
      talent: (json['talent'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => DailyMaterial.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      weapon: (json['weapon'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => DailyMaterial.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$DailyMaterialsToJson(_DailyMaterials instance) =>
    <String, dynamic>{
      'talent': instance.talent,
      'weapon': instance.weapon,
    };

_DailyMaterial _$DailyMaterialFromJson(Map<String, dynamic> json) =>
    _DailyMaterial(
      description:
          LocalizedText.fromJson(json['description'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DailyMaterialToJson(_DailyMaterial instance) =>
    <String, dynamic>{
      'description': instance.description,
      'items': instance.items,
    };
