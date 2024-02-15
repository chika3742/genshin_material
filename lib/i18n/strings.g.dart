/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 34 (17 per locale)
///
/// Built on 2024-02-15 at 07:32 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';

export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ja;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ja) // set locale
/// - Locale locale = AppLocale.ja.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ja) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ja(languageCode: 'ja', build: Translations.build),
	en(languageCode: 'en', build: _StringsEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of tr).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = tr.someKey.anotherKey;
/// String b = tr['someKey.anotherKey']; // Only for edge cases!
Translations get tr => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final tr = Translations.of(context); // Get tr variable.
/// String a = tr.someKey.anotherKey; // Use tr variable.
/// String b = tr['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.tr.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get tr => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final tr = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsCommonJa common = _StringsCommonJa._(_root);
	late final _StringsUpdatesJa updates = _StringsUpdatesJa._(_root);
	late final _StringsHomeNavDestinationsJa homeNavDestinations = _StringsHomeNavDestinationsJa._(_root);
	late final _StringsPagesJa pages = _StringsPagesJa._(_root);
	late final _StringsMorePageJa morePage = _StringsMorePageJa._(_root);
}

// Path: common
class _StringsCommonJa {
	_StringsCommonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get tos => '利用規約';
	String get privacyPolicy => 'プライバシーポリシー';
}

// Path: updates
class _StringsUpdatesJa {
	_StringsUpdatesJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get downloading => 'データ更新をダウンロードしています…';
	String get failed => 'データ更新に失敗しました。アプリを再起動すると再試行します。';
	String get completed => '更新が完了しました。';
	String get installing => 'インストールしています...';
	String get pleaseWaitUntilComplete => 'データ更新が完了するまでお待ちください。';
}

// Path: homeNavDestinations
class _StringsHomeNavDestinationsJa {
	_StringsHomeNavDestinationsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get bookmarks => 'ブックマーク';
	String get database => 'データベース';
	String get daily => '日替わり素材';
	String get tools => 'ツール';
	String get more => 'その他';
}

// Path: pages
class _StringsPagesJa {
	_StringsPagesJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get characters => 'キャラクター';
	String get settings => '設定';
	String get account => 'アカウント';
	String get releaseNotes => '更新履歴';
}

// Path: morePage
class _StringsMorePageJa {
	_StringsMorePageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get accountDesc => 'ブックマーク等をデバイス間で同期できます。';
}

// Path: <root>
class _StringsEn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsCommonEn common = _StringsCommonEn._(_root);
	@override late final _StringsUpdatesEn updates = _StringsUpdatesEn._(_root);
	@override late final _StringsHomeNavDestinationsEn homeNavDestinations = _StringsHomeNavDestinationsEn._(_root);
	@override late final _StringsPagesEn pages = _StringsPagesEn._(_root);
	@override late final _StringsMorePageEn morePage = _StringsMorePageEn._(_root);
}

// Path: common
class _StringsCommonEn extends _StringsCommonJa {
	_StringsCommonEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get tos => 'Terms of Use';
	@override String get privacyPolicy => 'Privacy Policy';
}

// Path: updates
class _StringsUpdatesEn extends _StringsUpdatesJa {
	_StringsUpdatesEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get downloading => 'Downloading data updates...';
	@override String get failed => 'Failed to update data. Restarting app to retry.';
	@override String get completed => 'Data update completed.';
	@override String get installing => 'Installing...';
	@override String get pleaseWaitUntilComplete => 'Please wait until data update is complete.';
}

// Path: homeNavDestinations
class _StringsHomeNavDestinationsEn extends _StringsHomeNavDestinationsJa {
	_StringsHomeNavDestinationsEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get bookmarks => 'Bookmarks';
	@override String get database => 'Database';
	@override String get daily => 'Daily';
	@override String get tools => 'Tools';
	@override String get more => 'More';
}

// Path: pages
class _StringsPagesEn extends _StringsPagesJa {
	_StringsPagesEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get characters => 'Characters';
	@override String get settings => 'Settings';
	@override String get account => 'Account';
	@override String get releaseNotes => 'Release Notes';
}

// Path: morePage
class _StringsMorePageEn extends _StringsMorePageJa {
	_StringsMorePageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get accountDesc => 'You can sync bookmarks etc. between devices.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.tos': return '利用規約';
			case 'common.privacyPolicy': return 'プライバシーポリシー';
			case 'updates.downloading': return 'データ更新をダウンロードしています…';
			case 'updates.failed': return 'データ更新に失敗しました。アプリを再起動すると再試行します。';
			case 'updates.completed': return '更新が完了しました。';
			case 'updates.installing': return 'インストールしています...';
			case 'updates.pleaseWaitUntilComplete': return 'データ更新が完了するまでお待ちください。';
			case 'homeNavDestinations.bookmarks': return 'ブックマーク';
			case 'homeNavDestinations.database': return 'データベース';
			case 'homeNavDestinations.daily': return '日替わり素材';
			case 'homeNavDestinations.tools': return 'ツール';
			case 'homeNavDestinations.more': return 'その他';
			case 'pages.characters': return 'キャラクター';
			case 'pages.settings': return '設定';
			case 'pages.account': return 'アカウント';
			case 'pages.releaseNotes': return '更新履歴';
			case 'morePage.accountDesc': return 'ブックマーク等をデバイス間で同期できます。';
			default: return null;
		}
	}
}

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.tos': return 'Terms of Use';
			case 'common.privacyPolicy': return 'Privacy Policy';
			case 'updates.downloading': return 'Downloading data updates...';
			case 'updates.failed': return 'Failed to update data. Restarting app to retry.';
			case 'updates.completed': return 'Data update completed.';
			case 'updates.installing': return 'Installing...';
			case 'updates.pleaseWaitUntilComplete': return 'Please wait until data update is complete.';
			case 'homeNavDestinations.bookmarks': return 'Bookmarks';
			case 'homeNavDestinations.database': return 'Database';
			case 'homeNavDestinations.daily': return 'Daily';
			case 'homeNavDestinations.tools': return 'Tools';
			case 'homeNavDestinations.more': return 'More';
			case 'pages.characters': return 'Characters';
			case 'pages.settings': return 'Settings';
			case 'pages.account': return 'Account';
			case 'pages.releaseNotes': return 'Release Notes';
			case 'morePage.accountDesc': return 'You can sync bookmarks etc. between devices.';
			default: return null;
		}
	}
}
