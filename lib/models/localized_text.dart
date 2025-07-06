import "package:freezed_annotation/freezed_annotation.dart";

import "../i18n/strings.g.dart";

part "localized_text.freezed.dart";
part "localized_text.g.dart";

@freezed
sealed class LocalizedText with _$LocalizedText {
  const LocalizedText._();

  const factory LocalizedText({
    required Map<String, String> locales,
  }) = _LocalizedText;

  factory LocalizedText.fromJson(Map<String, dynamic> json) =>
      _$LocalizedTextFromJson(json);

  String get localized => locales[LocaleSettings.currentLocale.languageCode]!
      .replaceAll("\u00B7", "\u30FB"); // 半角中黒を全角中黒に変換
}
