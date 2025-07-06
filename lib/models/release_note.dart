import "package:freezed_annotation/freezed_annotation.dart";

part "release_note.freezed.dart";
part "release_note.g.dart";

@freezed
sealed class ReleaseNote with _$ReleaseNote {
  const factory ReleaseNote({
    required String releasedOn,
    required String version,
    required String contents,
  }) = _ReleaseNote;

  factory ReleaseNote.fromJson(Map<String, dynamic> json) =>
      _$ReleaseNoteFromJson(json);
}
