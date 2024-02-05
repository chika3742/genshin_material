// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReleaseNoteImpl _$$ReleaseNoteImplFromJson(Map<String, dynamic> json) =>
    _$ReleaseNoteImpl(
      releasedOn: json['releasedOn'] as String,
      version: json['version'] as String,
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$$ReleaseNoteImplToJson(_$ReleaseNoteImpl instance) =>
    <String, dynamic>{
      'releasedOn': instance.releasedOn,
      'version': instance.version,
      'contents': instance.contents,
    };
