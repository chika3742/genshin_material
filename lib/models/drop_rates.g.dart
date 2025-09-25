// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DropRateEntry _$DropRateEntryFromJson(Map<String, dynamic> json) =>
    _DropRateEntry(
      description:
          LocalizedText.fromJson(json['description'] as Map<String, dynamic>),
      note: json['note'] == null
          ? null
          : LocalizedText.fromJson(json['note'] as Map<String, dynamic>),
      target: DropRateTarget.fromJson(json['target'] as Map<String, dynamic>),
      originalRate: (json['originalRate'] as List<dynamic>)
          .map((e) => DropRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      condensedAvailable: json['condensedAvailable'] as bool,
    );

Map<String, dynamic> _$DropRateEntryToJson(_DropRateEntry instance) =>
    <String, dynamic>{
      'description': instance.description,
      'note': instance.note,
      'target': instance.target,
      'originalRate': instance.originalRate,
      'condensedAvailable': instance.condensedAvailable,
    };

_DropRateTarget _$DropRateTargetFromJson(Map<String, dynamic> json) =>
    _DropRateTarget(
      category: json['category'] as String?,
      rarity: (json['rarity'] as num?)?.toInt(),
      ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DropRateTargetToJson(_DropRateTarget instance) =>
    <String, dynamic>{
      'category': instance.category,
      'rarity': instance.rarity,
      'ids': instance.ids,
    };

_DropRate _$DropRateFromJson(Map<String, dynamic> json) => _DropRate(
      lowerAR: (json['lowerAR'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$DropRateToJson(_DropRate instance) => <String, dynamic>{
      'lowerAR': instance.lowerAR,
      'rate': instance.rate,
    };
