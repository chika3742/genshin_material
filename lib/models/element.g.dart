// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElementImpl _$$ElementImplFromJson(Map<String, dynamic> json) =>
    _$ElementImpl(
      hyvId: json['hyvId'] as int,
      imageUrl: json['imageUrl'] as String,
      text: LocalizedText.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ElementImplToJson(_$ElementImpl instance) =>
    <String, dynamic>{
      'hyvId': instance.hyvId,
      'imageUrl': instance.imageUrl,
      'text': instance.text,
    };
