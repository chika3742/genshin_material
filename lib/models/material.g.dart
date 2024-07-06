// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialImpl _$$MaterialImplFromJson(Map<String, dynamic> json) =>
    _$MaterialImpl(
      id: json['id'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      rarity: json['rarity'] as int,
      category: json['category'] as String,
      groupId: json['groupId'] as String?,
      craftLevel: json['craftLevel'] as int?,
      availableDays: (json['availableDays'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DayOfWeekEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$MaterialImplToJson(_$MaterialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'rarity': instance.rarity,
      'category': instance.category,
      'groupId': instance.groupId,
      'craftLevel': instance.craftLevel,
      'availableDays':
          instance.availableDays?.map((e) => _$DayOfWeekEnumMap[e]!).toList(),
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

_$MaterialsMetaImpl _$$MaterialsMetaImplFromJson(Map<String, dynamic> json) =>
    _$MaterialsMetaImpl(
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

Map<String, dynamic> _$$MaterialsMetaImplToJson(_$MaterialsMetaImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'sortOrder': instance.sortOrder,
      'daily': instance.daily,
      'specialCharactersUsingMaterials':
          instance.specialCharactersUsingMaterials,
    };

_$DailyMaterialsImpl _$$DailyMaterialsImplFromJson(Map<String, dynamic> json) =>
    _$DailyMaterialsImpl(
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

Map<String, dynamic> _$$DailyMaterialsImplToJson(
        _$DailyMaterialsImpl instance) =>
    <String, dynamic>{
      'talent': instance.talent,
      'weapon': instance.weapon,
    };

_$DailyMaterialImpl _$$DailyMaterialImplFromJson(Map<String, dynamic> json) =>
    _$DailyMaterialImpl(
      description:
          LocalizedText.fromJson(json['description'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DailyMaterialImplToJson(_$DailyMaterialImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'items': instance.items,
    };
