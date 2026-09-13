// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizedReleaseNote _$LocalizedReleaseNoteFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('LocalizedReleaseNote', json, ($checkedConvert) {
  final val = LocalizedReleaseNote(
    releasedOn: $checkedConvert('releasedOn', (v) => v as String),
    version: $checkedConvert('version', (v) => v as String),
    contents: $checkedConvert('contents', (v) => LocalizedText.fromJson(v)),
  );
  return val;
});
