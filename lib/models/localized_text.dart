import "package:freezed_annotation/freezed_annotation.dart";

import "../i18n/strings.g.dart";

part "localized_text.freezed.dart";

@Freezed(toJson: false)
sealed class LocalizedText with _$LocalizedText {
  const LocalizedText._();

  const factory LocalizedText({
    required Map<String, String> locales,
  }) = TranslatableLocalizedText;

  const factory LocalizedText.untranslatable({
    required String text,
  }) = UntranslatableLocalizedText;

  factory LocalizedText.fromJson(dynamic json) {
    return switch (json) {
      final String text => LocalizedText.untranslatable(text: text),
      _ => LocalizedText(locales: json["locales"].cast<String, String>()),
    };
  }

  String get localized => switch (this) {
    TranslatableLocalizedText(:final locales) => locales[LocaleSettings.currentLocale.languageCode]!
        .replaceAll("\u00B7", "\u30FB"), // 半角中黒を全角中黒に変換
    UntranslatableLocalizedText(:final text) => text,
  };
}
