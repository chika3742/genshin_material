// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizedReleaseNote _$LocalizedReleaseNoteFromJson(
  Map<String, dynamic> json,
) => LocalizedReleaseNote(
  releasedOn: json['releasedOn'] as String,
  version: json['version'] as String,
  contents: LocalizedText.fromJson(json['contents']),
);
