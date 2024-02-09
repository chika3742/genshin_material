import "package:freezed_annotation/freezed_annotation.dart";

part "localized_text.freezed.dart";
part "localized_text.g.dart";

@freezed
class LocalizedText with _$LocalizedText {
  const factory LocalizedText({
    required Map<String, String> locales,
  }) = _LocalizedText;

  factory LocalizedText.fromJson(Map<String, dynamic> json) =>
      _$LocalizedTextFromJson(json);
}
