import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/localized_text.dart";

void main() {
  // The values below are fixtures owned by this test, never strings pulled from
  // the app translations, so switching the locale here stays self-contained.
  const jaValue = "ja-value";
  const enValue = "en-value";

  // LocaleSettings is global, so every test restores the base locale.
  tearDown(() => LocaleSettings.setLocaleSync(AppLocale.ja));

  group("localized", () {
    const text = LocalizedText(
      locales: {"ja": jaValue, "en": enValue},
    );

    test("Returns the entry of the current locale", () {
      LocaleSettings.setLocaleSync(AppLocale.ja);
      expect(text.localized, jaValue);

      LocaleSettings.setLocaleSync(AppLocale.en);
      expect(text.localized, enValue);
    });

    test("Converts a halfwidth middle dot into a fullwidth one", () {
      LocaleSettings.setLocaleSync(AppLocale.ja);
      expect(
        const LocalizedText(locales: {"ja": "a·b·c"}).localized,
        "a・b・c",
      );
    });

    test("Leaves a fullwidth middle dot untouched", () {
      LocaleSettings.setLocaleSync(AppLocale.ja);
      expect(
        const LocalizedText(locales: {"ja": "a・b"}).localized,
        "a・b",
      );
    });

    test("Throws when the current locale is missing from the map", () {
      // There is no fallback locale: the entry is force-unwrapped.
      LocaleSettings.setLocaleSync(AppLocale.en);
      expect(
        () => const LocalizedText(locales: {"ja": jaValue}).localized,
        throwsA(isA<TypeError>()),
      );
    });
  });

  group("LocalizedText.untranslatable", () {
    test("Returns the same text regardless of the current locale", () {
      const text = LocalizedText.untranslatable(text: "Mondstadt");

      LocaleSettings.setLocaleSync(AppLocale.ja);
      expect(text.localized, "Mondstadt");

      LocaleSettings.setLocaleSync(AppLocale.en);
      expect(text.localized, "Mondstadt");
    });

    test("Keeps a halfwidth middle dot as is", () {
      // The replacement only applies to the translatable variant.
      expect(
        const LocalizedText.untranslatable(text: "a·b").localized,
        "a·b",
      );
    });
  });

  group("LocalizedText.fromJson", () {
    test("Builds an untranslatable text from a bare string", () {
      final text = LocalizedText.fromJson("Mondstadt");

      expect(text, isA<UntranslatableLocalizedText>());
      expect(text.localized, "Mondstadt");
    });

    test("Builds a translatable text from a locales map", () {
      final text = LocalizedText.fromJson({
        "locales": <String, dynamic>{"ja": jaValue, "en": enValue},
      });

      expect(text, isA<TranslatableLocalizedText>());
      expect((text as TranslatableLocalizedText).locales, {
        "ja": jaValue,
        "en": enValue,
      });
    });

    test("Builds a translatable text with no entry at all", () {
      final text = LocalizedText.fromJson({"locales": <String, dynamic>{}});

      expect((text as TranslatableLocalizedText).locales, isEmpty);
    });
  });
}
