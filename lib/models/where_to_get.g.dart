// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'where_to_get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WhereToGetTextImpl _$$WhereToGetTextImplFromJson(Map<String, dynamic> json) =>
    _$WhereToGetTextImpl(
      text: json['text'] == null
          ? null
          : LocalizedText.fromJson(json['text'] as Map<String, dynamic>),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$$WhereToGetTextImplToJson(
        _$WhereToGetTextImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'key': instance.key,
    };
