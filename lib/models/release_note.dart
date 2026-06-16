import "package:freezed_annotation/freezed_annotation.dart";

import "localized_text.dart";

part "release_note.freezed.dart";
part "release_note.g.dart";

@Freezed(toJson: false)
sealed class ReleaseNote with _$ReleaseNote {
  const factory ReleaseNote({
    required String releasedOn,
    required String version,
    required LocalizedText contents,
  }) = LocalizedReleaseNote;

  factory ReleaseNote.fromJson(Map<String, dynamic> json) =>
      _$ReleaseNoteFromJson(json);
}
