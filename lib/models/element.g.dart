// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElementImpl _$$ElementImplFromJson(Map<String, dynamic> json) =>
    _$ElementImpl(
      imageUrl: json['imageUrl'] as String,
      text: LocalizedText.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ElementImplToJson(_$ElementImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'text': instance.text,
    };
