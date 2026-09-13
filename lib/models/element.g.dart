// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Element _$ElementFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Element', json, ($checkedConvert) {
      final val = _Element(
        hyvId: $checkedConvert('hyvId', (v) => (v as num).toInt()),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        text: $checkedConvert('text', (v) => LocalizedText.fromJson(v)),
      );
      return val;
    });
