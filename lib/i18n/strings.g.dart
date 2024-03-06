/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 76 (38 per locale)
///
/// Built on 2024-03-06 at 04:29 UTC

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
	Map<String, String> get talentTypes => {
		'normalAttack': '通常攻撃',
		'elementalSkill': '元素スキル',
		'elementalBurst': '元素爆発',
	};
	Map<String, String> get weaponTypes => {
		'sword': '片手剣',
		'claymore': '両手剣',
		'polearm': '長柄武器',
		'bow': '弓',
		'catalyst': '法器',
	};
	late final _StringsUpdatesJa updates = _StringsUpdatesJa._(_root);
	late final _StringsErrorsJa errors = _StringsErrorsJa._(_root);
	late final _StringsPagesJa pages = _StringsPagesJa._(_root);
	late final _StringsCharacterDetailsPageJa characterDetailsPage = _StringsCharacterDetailsPageJa._(_root);
	late final _StringsMorePageJa morePage = _StringsMorePageJa._(_root);
	late final _StringsReleaseNotesPageJa releaseNotesPage = _StringsReleaseNotesPageJa._(_root);
	late final _StringsSettingsPageJa settingsPage = _StringsSettingsPageJa._(_root);
}

// Path: common
class _StringsCommonJa {
	_StringsCommonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get tos => '利用規約';
	String get privacyPolicy => 'プライバシーポリシー';
	String get error => 'エラーが発生しました。';
	String get goalLevel => '目標レベル';
	String get currentLevel => '現在レベル';
	String get index => '目次';
}

// Path: updates
class _StringsUpdatesJa {
	_StringsUpdatesJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get downloading => 'データ更新をダウンロードしています…';
	String get failed => 'データの読み込みに失敗しました。「設定」→「アセットデータを再ダウンロード」から再ダウンロードをお試しください。';
	String get completed => '更新が完了しました。';
	String get installing => 'インストールしています...';
	String get pleaseWaitUntilComplete => 'データ更新が完了するまでお待ちください。';
}

// Path: errors
class _StringsErrorsJa {
	_StringsErrorsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get characterNotFound => 'キャラクターが見つかりません';
}

// Path: pages
class _StringsPagesJa {
	_StringsPagesJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get characters => 'キャラクター';
	String characterDetails({required Object character}) => '${character} - キャラクター';
	String get materials => '素材一覧(逆引き)';
	String get settings => '設定';
	String get account => 'アカウント';
	String get releaseNotes => '更新履歴';
	String get bookmarks => 'ブックマーク';
	String get database => 'データベース';
	String get daily => '日替わり素材';
	String get tools => 'ツール';
	String get more => 'その他';
}

// Path: characterDetailsPage
class _StringsCharacterDetailsPageJa {
	_StringsCharacterDetailsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get charaLevelUpAndAscensionMaterials => 'キャラクターLvアップ・突破素材';
	String get talentLevelUpMaterials => '天賦Lvアップ素材';
}

// Path: morePage
class _StringsMorePageJa {
	_StringsMorePageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get accountDesc => 'ブックマーク等をデバイス間で同期できます。';
}

// Path: releaseNotesPage
class _StringsReleaseNotesPageJa {
	_StringsReleaseNotesPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get featureUpdates => '機能更新';
	String get assetUpdates => 'データ更新';
}

// Path: settingsPage
class _StringsSettingsPageJa {
	_StringsSettingsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get assetData => 'アセットデータ';
	String get reDownloadAssets => 'アセットデータを再ダウンロード';
	String get reDownloadAssetsDesc => 'アプリの画像やキャラクター等が正常に読み込まれない場合にお試しください。';
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
	@override Map<String, String> get talentTypes => {
		'normalAttack': 'Normal Attack',
		'elementalSkill': 'Elemental Skill',
		'elementalBurst': 'Elemental Burst',
	};
	@override Map<String, String> get weaponTypes => {
		'sword': 'Sword',
		'claymore': 'Claymore',
		'polearm': 'Polearm',
		'bow': 'Bow',
		'catalyst': 'Catalyst',
	};
	@override late final _StringsUpdatesEn updates = _StringsUpdatesEn._(_root);
	@override late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
	@override late final _StringsPagesEn pages = _StringsPagesEn._(_root);
	@override late final _StringsCharacterDetailsPageEn characterDetailsPage = _StringsCharacterDetailsPageEn._(_root);
	@override late final _StringsMorePageEn morePage = _StringsMorePageEn._(_root);
	@override late final _StringsReleaseNotesPageEn releaseNotesPage = _StringsReleaseNotesPageEn._(_root);
	@override late final _StringsSettingsPageEn settingsPage = _StringsSettingsPageEn._(_root);
}

// Path: common
class _StringsCommonEn extends _StringsCommonJa {
	_StringsCommonEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get tos => 'Terms of Use';
	@override String get privacyPolicy => 'Privacy Policy';
	@override String get error => 'An error occurred.';
	@override String get goalLevel => 'Goal Level';
	@override String get currentLevel => 'Current Level';
}

// Path: updates
class _StringsUpdatesEn extends _StringsUpdatesJa {
	_StringsUpdatesEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get downloading => 'Downloading data updates...';
	@override String get failed => 'Failed to load data. Try re-downloading from "Settings" -> "Re-download Assets".';
	@override String get completed => 'Data update completed.';
	@override String get installing => 'Installing...';
	@override String get pleaseWaitUntilComplete => 'Please wait until data update is complete.';
}

// Path: errors
class _StringsErrorsEn extends _StringsErrorsJa {
	_StringsErrorsEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get characterNotFound => 'Character not found';
}

// Path: pages
class _StringsPagesEn extends _StringsPagesJa {
	_StringsPagesEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get characters => 'Characters';
	@override String characterDetails({required Object character}) => '${character} - Character';
	@override String get settings => 'Settings';
	@override String get account => 'Account';
	@override String get releaseNotes => 'Release Notes';
	@override String get bookmarks => 'Bookmarks';
	@override String get database => 'Database';
	@override String get daily => 'Daily';
	@override String get tools => 'Tools';
	@override String get more => 'More';
}

// Path: characterDetailsPage
class _StringsCharacterDetailsPageEn extends _StringsCharacterDetailsPageJa {
	_StringsCharacterDetailsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get charaLevelUpAndAscensionMaterials => 'Character Lv Up & Ascension Materials';
	@override String get talentLevelUpMaterials => 'Talent Lv Up Materials';
}

// Path: morePage
class _StringsMorePageEn extends _StringsMorePageJa {
	_StringsMorePageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get accountDesc => 'You can sync bookmarks etc. between devices.';
}

// Path: releaseNotesPage
class _StringsReleaseNotesPageEn extends _StringsReleaseNotesPageJa {
	_StringsReleaseNotesPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get featureUpdates => 'Feature Updates';
	@override String get assetUpdates => 'Asset Updates';
}

// Path: settingsPage
class _StringsSettingsPageEn extends _StringsSettingsPageJa {
	_StringsSettingsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get assetData => 'Assets';
	@override String get reDownloadAssets => 'Re-download Assets';
	@override String get reDownloadAssetsDesc => 'Please try this if the images, characters, etc. of the app are not loading properly.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.tos': return '利用規約';
			case 'common.privacyPolicy': return 'プライバシーポリシー';
			case 'common.error': return 'エラーが発生しました。';
			case 'common.goalLevel': return '目標レベル';
			case 'common.currentLevel': return '現在レベル';
			case 'common.index': return '目次';
			case 'talentTypes.normalAttack': return '通常攻撃';
			case 'talentTypes.elementalSkill': return '元素スキル';
			case 'talentTypes.elementalBurst': return '元素爆発';
			case 'weaponTypes.sword': return '片手剣';
			case 'weaponTypes.claymore': return '両手剣';
			case 'weaponTypes.polearm': return '長柄武器';
			case 'weaponTypes.bow': return '弓';
			case 'weaponTypes.catalyst': return '法器';
			case 'updates.downloading': return 'データ更新をダウンロードしています…';
			case 'updates.failed': return 'データの読み込みに失敗しました。「設定」→「アセットデータを再ダウンロード」から再ダウンロードをお試しください。';
			case 'updates.completed': return '更新が完了しました。';
			case 'updates.installing': return 'インストールしています...';
			case 'updates.pleaseWaitUntilComplete': return 'データ更新が完了するまでお待ちください。';
			case 'errors.characterNotFound': return 'キャラクターが見つかりません';
			case 'pages.characters': return 'キャラクター';
			case 'pages.characterDetails': return ({required Object character}) => '${character} - キャラクター';
			case 'pages.materials': return '素材一覧(逆引き)';
			case 'pages.settings': return '設定';
			case 'pages.account': return 'アカウント';
			case 'pages.releaseNotes': return '更新履歴';
			case 'pages.bookmarks': return 'ブックマーク';
			case 'pages.database': return 'データベース';
			case 'pages.daily': return '日替わり素材';
			case 'pages.tools': return 'ツール';
			case 'pages.more': return 'その他';
			case 'characterDetailsPage.charaLevelUpAndAscensionMaterials': return 'キャラクターLvアップ・突破素材';
			case 'characterDetailsPage.talentLevelUpMaterials': return '天賦Lvアップ素材';
			case 'morePage.accountDesc': return 'ブックマーク等をデバイス間で同期できます。';
			case 'releaseNotesPage.featureUpdates': return '機能更新';
			case 'releaseNotesPage.assetUpdates': return 'データ更新';
			case 'settingsPage.assetData': return 'アセットデータ';
			case 'settingsPage.reDownloadAssets': return 'アセットデータを再ダウンロード';
			case 'settingsPage.reDownloadAssetsDesc': return 'アプリの画像やキャラクター等が正常に読み込まれない場合にお試しください。';
			default: return null;
		}
	}
}

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.tos': return 'Terms of Use';
			case 'common.privacyPolicy': return 'Privacy Policy';
			case 'common.error': return 'An error occurred.';
			case 'common.goalLevel': return 'Goal Level';
			case 'common.currentLevel': return 'Current Level';
			case 'talentTypes.normalAttack': return 'Normal Attack';
			case 'talentTypes.elementalSkill': return 'Elemental Skill';
			case 'talentTypes.elementalBurst': return 'Elemental Burst';
			case 'weaponTypes.sword': return 'Sword';
			case 'weaponTypes.claymore': return 'Claymore';
			case 'weaponTypes.polearm': return 'Polearm';
			case 'weaponTypes.bow': return 'Bow';
			case 'weaponTypes.catalyst': return 'Catalyst';
			case 'updates.downloading': return 'Downloading data updates...';
			case 'updates.failed': return 'Failed to load data. Try re-downloading from "Settings" -> "Re-download Assets".';
			case 'updates.completed': return 'Data update completed.';
			case 'updates.installing': return 'Installing...';
			case 'updates.pleaseWaitUntilComplete': return 'Please wait until data update is complete.';
			case 'errors.characterNotFound': return 'Character not found';
			case 'pages.characters': return 'Characters';
			case 'pages.characterDetails': return ({required Object character}) => '${character} - Character';
			case 'pages.settings': return 'Settings';
			case 'pages.account': return 'Account';
			case 'pages.releaseNotes': return 'Release Notes';
			case 'pages.bookmarks': return 'Bookmarks';
			case 'pages.database': return 'Database';
			case 'pages.daily': return 'Daily';
			case 'pages.tools': return 'Tools';
			case 'pages.more': return 'More';
			case 'characterDetailsPage.charaLevelUpAndAscensionMaterials': return 'Character Lv Up & Ascension Materials';
			case 'characterDetailsPage.talentLevelUpMaterials': return 'Talent Lv Up Materials';
			case 'morePage.accountDesc': return 'You can sync bookmarks etc. between devices.';
			case 'releaseNotesPage.featureUpdates': return 'Feature Updates';
			case 'releaseNotesPage.assetUpdates': return 'Asset Updates';
			case 'settingsPage.assetData': return 'Assets';
			case 'settingsPage.reDownloadAssets': return 'Re-download Assets';
			case 'settingsPage.reDownloadAssetsDesc': return 'Please try this if the images, characters, etc. of the app are not loading properly.';
			default: return null;
		}
	}
}
