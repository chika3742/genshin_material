// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DropRateEntry _$DropRateEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DropRateEntry', json, ($checkedConvert) {
      final val = _DropRateEntry(
        description: $checkedConvert(
          'description',
          (v) => LocalizedText.fromJson(v),
        ),
        note: $checkedConvert(
          'note',
          (v) => v == null ? null : LocalizedText.fromJson(v),
        ),
        target: $checkedConvert(
          'target',
          (v) => DropRateTarget.fromJson(v as Map<String, dynamic>),
        ),
        originalRate: $checkedConvert(
          'originalRate',
          (v) => (v as List<dynamic>)
              .map((e) => DropRate.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        condensedAvailable: $checkedConvert(
          'condensedAvailable',
          (v) => v as bool,
        ),
      );
      return val;
    });

_DropRateTarget _$DropRateTargetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DropRateTarget', json, ($checkedConvert) {
      final val = _DropRateTarget(
        category: $checkedConvert('category', (v) => v as String?),
        rarity: $checkedConvert('rarity', (v) => (v as num?)?.toInt()),
        ids: $checkedConvert(
          'ids',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DropRateTargetToJson(_DropRateTarget instance) =>
    <String, dynamic>{
      'category': instance.category,
      'rarity': instance.rarity,
      'ids': instance.ids,
    };

_DropRate _$DropRateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DropRate', json, ($checkedConvert) {
      final val = _DropRate(
        lowerAR: $checkedConvert('lowerAR', (v) => (v as num).toInt()),
        rate: $checkedConvert('rate', (v) => (v as num).toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$DropRateToJson(_DropRate instance) => <String, dynamic>{
  'lowerAR': instance.lowerAR,
  'rate': instance.rate,
};
