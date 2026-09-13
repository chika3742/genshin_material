// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Material _$MaterialFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Material', json, ($checkedConvert) {
      final val = _Material(
        id: $checkedConvert('id', (v) => v as String),
        hyvId: $checkedConvert('hyvId', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        rarity: $checkedConvert('rarity', (v) => (v as num).toInt()),
        category: $checkedConvert('category', (v) => v as String),
        groupId: $checkedConvert('groupId', (v) => v as String?),
        craftLevel: $checkedConvert('craftLevel', (v) => (v as num?)?.toInt()),
        availableDays: $checkedConvert(
          'availableDays',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DayOfWeekEnumMap, e))
              .toList(),
        ),
        source: $checkedConvert(
          'source',
          (v) =>
              v == null ? null : ItemSource.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

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
    $checkedCreate('TeyvatMapItemSource', json, ($checkedConvert) {
      final val = TeyvatMapItemSource(
        typeId: $checkedConvert('typeId', (v) => v as String),
        center: $checkedConvert('center', (v) => v as String?),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

TextItemSource _$TextItemSourceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TextItemSource', json, ($checkedConvert) {
      final val = TextItemSource(
        text: $checkedConvert('text', (v) => LocalizedText.fromJson(v)),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

SourceListItemSource _$SourceListItemSourceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SourceListItemSource', json, ($checkedConvert) {
  final val = SourceListItemSource(
    list: $checkedConvert(
      'list',
      (v) => (v as List<dynamic>).map(LocalizedText.fromJson).toList(),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

_MaterialsMeta _$MaterialsMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MaterialsMeta', json, ($checkedConvert) {
      final val = _MaterialsMeta(
        categories: $checkedConvert(
          'categories',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, LocalizedText.fromJson(e)),
          ),
        ),
        sortOrder: $checkedConvert(
          'sortOrder',
          (v) => Map<String, int>.from(v as Map),
        ),
        daily: $checkedConvert(
          'daily',
          (v) => DailyMaterials.fromJson(v as Map<String, dynamic>),
        ),
        specialCharactersUsingMaterials: $checkedConvert(
          'specialCharactersUsingMaterials',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>).map((e) => e as String).toList(),
            ),
          ),
        ),
      );
      return val;
    });

_DailyMaterials _$DailyMaterialsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DailyMaterials', json, ($checkedConvert) {
      final val = _DailyMaterials(
        talent: $checkedConvert(
          'talent',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>)
                  .map((e) => DailyMaterial.fromJson(e as Map<String, dynamic>))
                  .toList(),
            ),
          ),
        ),
        weapon: $checkedConvert(
          'weapon',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>)
                  .map((e) => DailyMaterial.fromJson(e as Map<String, dynamic>))
                  .toList(),
            ),
          ),
        ),
      );
      return val;
    });

_DailyMaterial _$DailyMaterialFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DailyMaterial', json, ($checkedConvert) {
      final val = _DailyMaterial(
        description: $checkedConvert(
          'description',
          (v) => LocalizedText.fromJson(v),
        ),
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
      );
      return val;
    });
