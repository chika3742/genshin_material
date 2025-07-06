// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReleaseNote _$ReleaseNoteFromJson(Map<String, dynamic> json) => _ReleaseNote(
      releasedOn: json['releasedOn'] as String,
      version: json['version'] as String,
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$ReleaseNoteToJson(_ReleaseNote instance) =>
    <String, dynamic>{
      'releasedOn': instance.releasedOn,
      'version': instance.version,
      'contents': instance.contents,
    };
