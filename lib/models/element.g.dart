// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Element _$ElementFromJson(Map<String, dynamic> json) => _Element(
  hyvId: (json['hyvId'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  text: LocalizedText.fromJson(json['text'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ElementToJson(_Element instance) => <String, dynamic>{
  'hyvId': instance.hyvId,
  'imageUrl': instance.imageUrl,
  'text': instance.text,
};
