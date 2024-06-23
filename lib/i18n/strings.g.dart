/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 220 (110 per locale)
///
/// Built on 2024-06-23 at 08:41 UTC

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
	late final _StringsUpdatesJa updates = _StringsUpdatesJa._(_root);
	late final _StringsErrorsJa errors = _StringsErrorsJa._(_root);
	late final _StringsPagesJa pages = _StringsPagesJa._(_root);
	late final _StringsCharacterDetailsPageJa characterDetailsPage = _StringsCharacterDetailsPageJa._(_root);
	late final _StringsMaterialDetailsPageJa materialDetailsPage = _StringsMaterialDetailsPageJa._(_root);
	late final _StringsMaterialCardJa materialCard = _StringsMaterialCardJa._(_root);
	late final _StringsArtifactsPageJa artifactsPage = _StringsArtifactsPageJa._(_root);
	late final _StringsArtifactDetailsPageJa artifactDetailsPage = _StringsArtifactDetailsPageJa._(_root);
	late final _StringsDailyPageJa dailyPage = _StringsDailyPageJa._(_root);
	late final _StringsResinCalcPageJa resinCalcPage = _StringsResinCalcPageJa._(_root);
	late final _StringsMorePageJa morePage = _StringsMorePageJa._(_root);
	late final _StringsReleaseNotesPageJa releaseNotesPage = _StringsReleaseNotesPageJa._(_root);
	late final _StringsSettingsPageJa settingsPage = _StringsSettingsPageJa._(_root);
	late final _StringsHoyolabJa hoyolab = _StringsHoyolabJa._(_root);
	Map<String, String> get whereToGet => {
		'chests': '宝箱、任務報酬など',
	};
}

// Path: common
class _StringsCommonJa {
	_StringsCommonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get ok => 'OK';
	String get cancel => 'キャンセル';
	String get signOut => 'サインアウト';
	String get tos => '利用規約';
	String get privacyPolicy => 'プライバシーポリシー';
	String get error => 'エラーが発生しました。';
	String get goalLevel => '目標レベル';
	String get currentLevel => '現在レベル';
	String get index => '目次';
	String get expandAll => '全て展開';
	String get collapseAll => '全て折りたたむ';
	String minutes({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n,
		other: '${n}分',
	);
	String hours({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n,
		other: '${n}時間',
	);
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
	String get materialNotFound => '素材が見つかりません';
	String get artifactNotFound => '聖遺物が見つかりません';
}

// Path: pages
class _StringsPagesJa {
	_StringsPagesJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get characters => 'キャラクター';
	String characterDetails({required Object character}) => '${character} - キャラクター';
	String get weapons => '武器';
	String weaponDetails({required Object weapon}) => '${weapon} - 武器';
	String get materials => '素材一覧(逆引き)';
	String materialDetails({required Object material}) => '${material} - 素材';
	String get artifacts => '聖遺物';
	String artifactDetails({required Object artifact}) => '${artifact} - 聖遺物';
	String get settings => '設定';
	String get account => 'アカウント';
	String get releaseNotes => '更新履歴';
	String get bookmarks => 'ブックマーク';
	String get database => 'データベース';
	String get daily => '日替わり素材';
	String get tools => 'ツール';
	String get resinCalc => '樹脂回復時刻計算機';
	String get wishes => '祈願天井カウンター';
	String get more => 'その他';
	String get hoyolabIntegrationSettings => 'HoYoLAB連携設定';
}

// Path: characterDetailsPage
class _StringsCharacterDetailsPageJa {
	_StringsCharacterDetailsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get charaLevelUpAndAscensionMaterials => 'キャラクターLvアップ・突破素材';
	String get talentLevelUpMaterials => '天賦Lvアップ素材';
}

// Path: materialDetailsPage
class _StringsMaterialDetailsPageJa {
	_StringsMaterialDetailsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get charactersUsing => 'この素材を使用するキャラクター';
	String get weaponsUsing => 'この素材を使用する武器';
}

// Path: materialCard
class _StringsMaterialCardJa {
	_StringsMaterialCardJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get reBookmark => '現在の範囲で再ブックマーク';
	String get reBookmarkDesc => '一旦この素材のブックマークを解除し、現在のスライダーの範囲で再度ブックマークします';
	String get unBookmark => 'ブックマークを解除';
	String get unBookmarkDesc => 'この素材のブックマークを解除します';
}

// Path: artifactsPage
class _StringsArtifactsPageJa {
	_StringsArtifactsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	Map<String, String> get bonusTypes => {
		'1-pc': '1セット効果',
		'2-pc': '2セット効果',
		'4-pc': '4セット効果',
	};
	Map<String, String> get pieceTypes => {
		'flower': '生の花',
		'plume': '死の羽',
		'sands': '時の砂',
		'goblet': '空の杯',
		'circlet': '理の冠',
	};
}

// Path: artifactDetailsPage
class _StringsArtifactDetailsPageJa {
	_StringsArtifactDetailsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get maxRarity => '最高レアリティ';
	String get bookmarkSet => 'セットをブックマーク';
	String get bookmarkPiece => '部位ごとにブックマーク';
	String get bookmarkTwoAndTwoPcSet => '2 + 2 セットをブックマーク';
	String get bookmarkFourPcSet => '4 セットをブックマーク';
}

// Path: dailyPage
class _StringsDailyPageJa {
	_StringsDailyPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get mondayAndThursday => '月/木';
	String get tuesdayAndFriday => '火/金';
	String get wednesdayAndSaturday => '水/土';
	String get talentMaterials => '天賦素材';
	String get weaponMaterials => '武器素材';
}

// Path: resinCalcPage
class _StringsResinCalcPageJa {
	_StringsResinCalcPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get currentResin => '現在の樹脂数';
	String get baseTime => '入力した時刻';
	String get fullyReplenishedBy => '全回復する時刻';
	String get untilFull => '全回復まであと';
	String get wastedResin => '無駄にした樹脂';
}

// Path: morePage
class _StringsMorePageJa {
	_StringsMorePageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get accountDesc => 'ブックマーク等をデバイス間で同期できます。';
	String get hoyolabIntegrationSettingsDesc => 'HoYoLABと連携し、ゲーム内のデータと同期できます。';
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

// Path: hoyolab
class _StringsHoyolabJa {
	_StringsHoyolabJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get signIn => 'HoYoLABにサインイン';
	String get signOut => 'HoYoLABとの連携を解除';
	String get signInNote => '※ソーシャルログインは利用できません。ユーザー名/メールアドレスとパスワードでログインしてください。';
	String get failedToSignIn => 'HoYoLABへのサインインに失敗しました。';
	String get signOutConfirm => 'HoYoLABとの連携を解除しますか？';
	String get credentialVerificationFailed => 'ログイン情報の検証に失敗しました。再度ログインしてください。';
	String get changeServer => 'サーバーの変更';
	String get serverSelect => 'サーバー選択';
	String current({required Object server}) => '現在の設定: ${server}';
	String get noServerSelected => 'サーバーが選択されていません';
	String get userInfo => 'ユーザー情報';
	String get failedToLoadServerList => 'サーバーリストの読み込みに失敗しました。';
	String get failedToLoadGameRole => 'ゲームデータの読み込みに失敗しました。';
	String get charaDataSyncInProgress => 'ゲームデータと同期しています...';
	String get noGameRoleFound => 'ゲームデータが見つかりません';
	String get failedToSyncGameData => 'ゲームデータの同期に失敗しました。';
	String get failedToLoadPermissionState => 'アクセス許可状態の取得に失敗しました。';
	String get characterDataAccessNotAllowed => 'キャラクターデータへのアクセスが許可されていません。HoYoLAB連携設定より許可してください。';
	String get characterDoesNotExist => 'キャラクターを所持していません。';
	String get realtimeNotesNotEnabled => 'リアルタイムノートが有効化されていません。HoYoLAB連携設定より有効化してください。';
	String get loginExpired => '一度連携を解除し、再度ログインしてください。';
	String get doYouWantToAllowCharaDataAccess => 'キャラクターデータへのアクセスを本アプリに許可しますか？';
	String get doYouWantToEnableRealtimeNotes => 'リアルタイムノートを有効化しますか？';
	String get charaDataAccessDesc => 'ゲーム内のキャラクターレベルや天賦レベルの同期が出来るようになります。';
	String get characterDataAccess => 'キャラクターデータへのアクセス';
	String get enableRealtimeNotes => 'リアルタイムノートの有効化';
	String get enableRealtimeNotesDesc => '現在の天然樹脂の数を同期できるようになります。';
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
	@override late final _StringsUpdatesEn updates = _StringsUpdatesEn._(_root);
	@override late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
	@override late final _StringsPagesEn pages = _StringsPagesEn._(_root);
	@override late final _StringsCharacterDetailsPageEn characterDetailsPage = _StringsCharacterDetailsPageEn._(_root);
	@override late final _StringsMaterialDetailsPageEn materialDetailsPage = _StringsMaterialDetailsPageEn._(_root);
	@override late final _StringsMaterialCardEn materialCard = _StringsMaterialCardEn._(_root);
	@override late final _StringsArtifactsPageEn artifactsPage = _StringsArtifactsPageEn._(_root);
	@override late final _StringsArtifactDetailsPageEn artifactDetailsPage = _StringsArtifactDetailsPageEn._(_root);
	@override late final _StringsDailyPageEn dailyPage = _StringsDailyPageEn._(_root);
	@override late final _StringsResinCalcPageEn resinCalcPage = _StringsResinCalcPageEn._(_root);
	@override late final _StringsMorePageEn morePage = _StringsMorePageEn._(_root);
	@override late final _StringsReleaseNotesPageEn releaseNotesPage = _StringsReleaseNotesPageEn._(_root);
	@override late final _StringsSettingsPageEn settingsPage = _StringsSettingsPageEn._(_root);
	@override late final _StringsHoyolabEn hoyolab = _StringsHoyolabEn._(_root);
	@override Map<String, String> get whereToGet => {
		'chests': 'Chests, Quests',
	};
}

// Path: common
class _StringsCommonEn extends _StringsCommonJa {
	_StringsCommonEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get ok => 'OK';
	@override String get cancel => 'Cancel';
	@override String get signOut => 'Sign Out';
	@override String get tos => 'Terms of Use';
	@override String get privacyPolicy => 'Privacy Policy';
	@override String get error => 'An error occurred.';
	@override String get goalLevel => 'Goal Level';
	@override String get currentLevel => 'Current Level';
	@override String get index => 'Index';
	@override String get expandAll => 'Expand all';
	@override String get collapseAll => 'Collapse all';
	@override String minutes({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		other: '${n} minutes',
		one: '${n} minute',
	);
	@override String hours({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		other: '${n} hours',
		one: '${n} hour',
	);
}

// Path: updates
class _StringsUpdatesEn extends _StringsUpdatesJa {
	_StringsUpdatesEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get downloading => 'Downloading data updates...';
	@override String get failed => 'Failed to load data. Try re-downloading from \'Settings\' -> \'Re-download Assets\'.';
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
	@override String get materialNotFound => 'Material not found';
	@override String get artifactNotFound => 'Artifact not found';
}

// Path: pages
class _StringsPagesEn extends _StringsPagesJa {
	_StringsPagesEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get characters => 'Characters';
	@override String characterDetails({required Object character}) => '${character} - Character';
	@override String get weapons => 'Weapons';
	@override String weaponDetails({required Object weapon}) => '${weapon} - Weapon';
	@override String get materials => 'Materials';
	@override String materialDetails({required Object material}) => '${material} - Material';
	@override String get artifacts => 'Artifacts';
	@override String artifactDetails({required Object artifact}) => '${artifact} - Artifact';
	@override String get settings => 'Settings';
	@override String get account => 'Account';
	@override String get releaseNotes => 'Release Notes';
	@override String get bookmarks => 'Bookmarks';
	@override String get database => 'Database';
	@override String get daily => 'Daily';
	@override String get tools => 'Tools';
	@override String get resinCalc => 'Resin Replenish Calculator';
	@override String get wishes => 'Wish Pity Counter';
	@override String get more => 'More';
	@override String get hoyolabIntegrationSettings => 'HoYoLAB Integration Settings';
}

// Path: characterDetailsPage
class _StringsCharacterDetailsPageEn extends _StringsCharacterDetailsPageJa {
	_StringsCharacterDetailsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get charaLevelUpAndAscensionMaterials => 'Character Lv Up & Ascension Materials';
	@override String get talentLevelUpMaterials => 'Talent Lv Up Materials';
}

// Path: materialDetailsPage
class _StringsMaterialDetailsPageEn extends _StringsMaterialDetailsPageJa {
	_StringsMaterialDetailsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get charactersUsing => 'Characters Using This Material';
	@override String get weaponsUsing => 'Weapons Using This Material';
}

// Path: materialCard
class _StringsMaterialCardEn extends _StringsMaterialCardJa {
	_StringsMaterialCardEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get reBookmark => 'Re-bookmark in current range';
	@override String get reBookmarkDesc => 'Remove the bookmark of this material once, then bookmark it again in the current slider range';
	@override String get unBookmark => 'Remove bookmark';
	@override String get unBookmarkDesc => 'Remove the bookmark of this material';
}

// Path: artifactsPage
class _StringsArtifactsPageEn extends _StringsArtifactsPageJa {
	_StringsArtifactsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override Map<String, String> get bonusTypes => {
		'1-pc': '1-Pc Set Bonus',
		'2-pc': '2-Pc Set Bonus',
		'4-pc': '4-Pc Set Bonus',
	};
	@override Map<String, String> get pieceTypes => {
		'flower': 'Flower of Life',
		'plume': 'Plume of Death',
		'sands': 'Sands of Eon',
		'goblet': 'Goblet of Eonothem',
		'circlet': 'Circlet of Logos',
	};
}

// Path: artifactDetailsPage
class _StringsArtifactDetailsPageEn extends _StringsArtifactDetailsPageJa {
	_StringsArtifactDetailsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get maxRarity => 'Max Rarity';
	@override String get bookmarkSet => 'Bookmark Set(s)';
	@override String get bookmarkPiece => 'Bookmark by Piece';
	@override String get bookmarkTwoAndTwoPcSet => 'Bookmark 2+2 Pc Set';
	@override String get bookmarkFourPcSet => 'Bookmark 4 Pc Set';
}

// Path: dailyPage
class _StringsDailyPageEn extends _StringsDailyPageJa {
	_StringsDailyPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get mondayAndThursday => 'Mon/Thu';
	@override String get tuesdayAndFriday => 'Tue/Fri';
	@override String get wednesdayAndSaturday => 'Wed/Sat';
	@override String get talentMaterials => 'Talent Materials';
	@override String get weaponMaterials => 'Weapon Materials';
}

// Path: resinCalcPage
class _StringsResinCalcPageEn extends _StringsResinCalcPageJa {
	_StringsResinCalcPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get currentResin => 'Current Resin';
	@override String get baseTime => 'Base Time';
	@override String get fullyReplenishedBy => 'Fully Replenished By';
	@override String get untilFull => 'Until Full';
	@override String get wastedResin => 'Wasted Resin';
}

// Path: morePage
class _StringsMorePageEn extends _StringsMorePageJa {
	_StringsMorePageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get accountDesc => 'You can sync bookmarks etc. between devices.';
	@override String get hoyolabIntegrationSettingsDesc => 'Link with HoYoLAB to sync in-game data';
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
	@override String get reDownloadAssetsDesc => 'Please try this if the assets of the app are not loading properly.';
}

// Path: hoyolab
class _StringsHoyolabEn extends _StringsHoyolabJa {
	_StringsHoyolabEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Sign in to HoYoLAB';
	@override String get signOut => 'Sign out from HoYoLAB';
	@override String get signInNote => '* Social login is not supported. You need to sign in with your email/username and password.';
	@override String get failedToSignIn => 'Failed to sign in to HoYoLAB';
	@override String get signOutConfirm => 'Unlink HoYoLAB?';
	@override String get credentialVerificationFailed => 'Failed to verify login information. Please sign in again.';
	@override String get changeServer => 'Change server';
	@override String get serverSelect => 'Server select';
	@override String current({required Object server}) => 'Current: ${server}';
	@override String get noServerSelected => 'No server selected';
	@override String get userInfo => 'User Info';
	@override String get failedToLoadServerList => 'Failed to load server list.';
	@override String get failedToLoadGameRole => 'Failed to load game user info.';
	@override String get charaDataSyncInProgress => 'Game data sync in progress...';
	@override String get noGameRoleFound => 'No game user found.';
	@override String get failedToSyncGameData => 'Failed to sync game data.';
	@override String get failedToLoadPermissionState => 'Failed to load permission state.';
	@override String get characterDataAccessNotAllowed => 'Character data access is not allowed. Please allow access from HoYoLAB integration settings.';
	@override String get characterDoesNotExist => 'You do not own this character.';
	@override String get realtimeNotesNotEnabled => 'Real-time notes are not enabled. Please enable it in the HoYoLAB integration settings.';
	@override String get loginExpired => 'Please sign out and sign in again.';
	@override String get doYouWantToAllowCharaDataAccess => 'Do you want to allow access to character data?';
	@override String get doYouWantToEnableRealtimeNotes => 'Enable Real-Time Notes?';
	@override String get charaDataAccessDesc => 'You will be able to sync character levels and talent levels in the game.';
	@override String get characterDataAccess => 'Character Data Access';
	@override String get enableRealtimeNotes => 'Enable Real-Time Notes';
	@override String get enableRealtimeNotesDesc => 'You will be able to sync your current Original Resin count.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.ok': return 'OK';
			case 'common.cancel': return 'キャンセル';
			case 'common.signOut': return 'サインアウト';
			case 'common.tos': return '利用規約';
			case 'common.privacyPolicy': return 'プライバシーポリシー';
			case 'common.error': return 'エラーが発生しました。';
			case 'common.goalLevel': return '目標レベル';
			case 'common.currentLevel': return '現在レベル';
			case 'common.index': return '目次';
			case 'common.expandAll': return '全て展開';
			case 'common.collapseAll': return '全て折りたたむ';
			case 'common.minutes': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n,
				other: '${n}分',
			);
			case 'common.hours': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n,
				other: '${n}時間',
			);
			case 'talentTypes.normalAttack': return '通常攻撃';
			case 'talentTypes.elementalSkill': return '元素スキル';
			case 'talentTypes.elementalBurst': return '元素爆発';
			case 'updates.downloading': return 'データ更新をダウンロードしています…';
			case 'updates.failed': return 'データの読み込みに失敗しました。「設定」→「アセットデータを再ダウンロード」から再ダウンロードをお試しください。';
			case 'updates.completed': return '更新が完了しました。';
			case 'updates.installing': return 'インストールしています...';
			case 'updates.pleaseWaitUntilComplete': return 'データ更新が完了するまでお待ちください。';
			case 'errors.characterNotFound': return 'キャラクターが見つかりません';
			case 'errors.materialNotFound': return '素材が見つかりません';
			case 'errors.artifactNotFound': return '聖遺物が見つかりません';
			case 'pages.characters': return 'キャラクター';
			case 'pages.characterDetails': return ({required Object character}) => '${character} - キャラクター';
			case 'pages.weapons': return '武器';
			case 'pages.weaponDetails': return ({required Object weapon}) => '${weapon} - 武器';
			case 'pages.materials': return '素材一覧(逆引き)';
			case 'pages.materialDetails': return ({required Object material}) => '${material} - 素材';
			case 'pages.artifacts': return '聖遺物';
			case 'pages.artifactDetails': return ({required Object artifact}) => '${artifact} - 聖遺物';
			case 'pages.settings': return '設定';
			case 'pages.account': return 'アカウント';
			case 'pages.releaseNotes': return '更新履歴';
			case 'pages.bookmarks': return 'ブックマーク';
			case 'pages.database': return 'データベース';
			case 'pages.daily': return '日替わり素材';
			case 'pages.tools': return 'ツール';
			case 'pages.resinCalc': return '樹脂回復時刻計算機';
			case 'pages.wishes': return '祈願天井カウンター';
			case 'pages.more': return 'その他';
			case 'pages.hoyolabIntegrationSettings': return 'HoYoLAB連携設定';
			case 'characterDetailsPage.charaLevelUpAndAscensionMaterials': return 'キャラクターLvアップ・突破素材';
			case 'characterDetailsPage.talentLevelUpMaterials': return '天賦Lvアップ素材';
			case 'materialDetailsPage.charactersUsing': return 'この素材を使用するキャラクター';
			case 'materialDetailsPage.weaponsUsing': return 'この素材を使用する武器';
			case 'materialCard.reBookmark': return '現在の範囲で再ブックマーク';
			case 'materialCard.reBookmarkDesc': return '一旦この素材のブックマークを解除し、現在のスライダーの範囲で再度ブックマークします';
			case 'materialCard.unBookmark': return 'ブックマークを解除';
			case 'materialCard.unBookmarkDesc': return 'この素材のブックマークを解除します';
			case 'artifactsPage.bonusTypes.1-pc': return '1セット効果';
			case 'artifactsPage.bonusTypes.2-pc': return '2セット効果';
			case 'artifactsPage.bonusTypes.4-pc': return '4セット効果';
			case 'artifactsPage.pieceTypes.flower': return '生の花';
			case 'artifactsPage.pieceTypes.plume': return '死の羽';
			case 'artifactsPage.pieceTypes.sands': return '時の砂';
			case 'artifactsPage.pieceTypes.goblet': return '空の杯';
			case 'artifactsPage.pieceTypes.circlet': return '理の冠';
			case 'artifactDetailsPage.maxRarity': return '最高レアリティ';
			case 'artifactDetailsPage.bookmarkSet': return 'セットをブックマーク';
			case 'artifactDetailsPage.bookmarkPiece': return '部位ごとにブックマーク';
			case 'artifactDetailsPage.bookmarkTwoAndTwoPcSet': return '2 + 2 セットをブックマーク';
			case 'artifactDetailsPage.bookmarkFourPcSet': return '4 セットをブックマーク';
			case 'dailyPage.mondayAndThursday': return '月/木';
			case 'dailyPage.tuesdayAndFriday': return '火/金';
			case 'dailyPage.wednesdayAndSaturday': return '水/土';
			case 'dailyPage.talentMaterials': return '天賦素材';
			case 'dailyPage.weaponMaterials': return '武器素材';
			case 'resinCalcPage.currentResin': return '現在の樹脂数';
			case 'resinCalcPage.baseTime': return '入力した時刻';
			case 'resinCalcPage.fullyReplenishedBy': return '全回復する時刻';
			case 'resinCalcPage.untilFull': return '全回復まであと';
			case 'resinCalcPage.wastedResin': return '無駄にした樹脂';
			case 'morePage.accountDesc': return 'ブックマーク等をデバイス間で同期できます。';
			case 'morePage.hoyolabIntegrationSettingsDesc': return 'HoYoLABと連携し、ゲーム内のデータと同期できます。';
			case 'releaseNotesPage.featureUpdates': return '機能更新';
			case 'releaseNotesPage.assetUpdates': return 'データ更新';
			case 'settingsPage.assetData': return 'アセットデータ';
			case 'settingsPage.reDownloadAssets': return 'アセットデータを再ダウンロード';
			case 'settingsPage.reDownloadAssetsDesc': return 'アプリの画像やキャラクター等が正常に読み込まれない場合にお試しください。';
			case 'hoyolab.signIn': return 'HoYoLABにサインイン';
			case 'hoyolab.signOut': return 'HoYoLABとの連携を解除';
			case 'hoyolab.signInNote': return '※ソーシャルログインは利用できません。ユーザー名/メールアドレスとパスワードでログインしてください。';
			case 'hoyolab.failedToSignIn': return 'HoYoLABへのサインインに失敗しました。';
			case 'hoyolab.signOutConfirm': return 'HoYoLABとの連携を解除しますか？';
			case 'hoyolab.credentialVerificationFailed': return 'ログイン情報の検証に失敗しました。再度ログインしてください。';
			case 'hoyolab.changeServer': return 'サーバーの変更';
			case 'hoyolab.serverSelect': return 'サーバー選択';
			case 'hoyolab.current': return ({required Object server}) => '現在の設定: ${server}';
			case 'hoyolab.noServerSelected': return 'サーバーが選択されていません';
			case 'hoyolab.userInfo': return 'ユーザー情報';
			case 'hoyolab.failedToLoadServerList': return 'サーバーリストの読み込みに失敗しました。';
			case 'hoyolab.failedToLoadGameRole': return 'ゲームデータの読み込みに失敗しました。';
			case 'hoyolab.charaDataSyncInProgress': return 'ゲームデータと同期しています...';
			case 'hoyolab.noGameRoleFound': return 'ゲームデータが見つかりません';
			case 'hoyolab.failedToSyncGameData': return 'ゲームデータの同期に失敗しました。';
			case 'hoyolab.failedToLoadPermissionState': return 'アクセス許可状態の取得に失敗しました。';
			case 'hoyolab.characterDataAccessNotAllowed': return 'キャラクターデータへのアクセスが許可されていません。HoYoLAB連携設定より許可してください。';
			case 'hoyolab.characterDoesNotExist': return 'キャラクターを所持していません。';
			case 'hoyolab.realtimeNotesNotEnabled': return 'リアルタイムノートが有効化されていません。HoYoLAB連携設定より有効化してください。';
			case 'hoyolab.loginExpired': return '一度連携を解除し、再度ログインしてください。';
			case 'hoyolab.doYouWantToAllowCharaDataAccess': return 'キャラクターデータへのアクセスを本アプリに許可しますか？';
			case 'hoyolab.doYouWantToEnableRealtimeNotes': return 'リアルタイムノートを有効化しますか？';
			case 'hoyolab.charaDataAccessDesc': return 'ゲーム内のキャラクターレベルや天賦レベルの同期が出来るようになります。';
			case 'hoyolab.characterDataAccess': return 'キャラクターデータへのアクセス';
			case 'hoyolab.enableRealtimeNotes': return 'リアルタイムノートの有効化';
			case 'hoyolab.enableRealtimeNotesDesc': return '現在の天然樹脂の数を同期できるようになります。';
			case 'whereToGet.chests': return '宝箱、任務報酬など';
			default: return null;
		}
	}
}

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.ok': return 'OK';
			case 'common.cancel': return 'Cancel';
			case 'common.signOut': return 'Sign Out';
			case 'common.tos': return 'Terms of Use';
			case 'common.privacyPolicy': return 'Privacy Policy';
			case 'common.error': return 'An error occurred.';
			case 'common.goalLevel': return 'Goal Level';
			case 'common.currentLevel': return 'Current Level';
			case 'common.index': return 'Index';
			case 'common.expandAll': return 'Expand all';
			case 'common.collapseAll': return 'Collapse all';
			case 'common.minutes': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				other: '${n} minutes',
				one: '${n} minute',
			);
			case 'common.hours': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				other: '${n} hours',
				one: '${n} hour',
			);
			case 'talentTypes.normalAttack': return 'Normal Attack';
			case 'talentTypes.elementalSkill': return 'Elemental Skill';
			case 'talentTypes.elementalBurst': return 'Elemental Burst';
			case 'updates.downloading': return 'Downloading data updates...';
			case 'updates.failed': return 'Failed to load data. Try re-downloading from \'Settings\' -> \'Re-download Assets\'.';
			case 'updates.completed': return 'Data update completed.';
			case 'updates.installing': return 'Installing...';
			case 'updates.pleaseWaitUntilComplete': return 'Please wait until data update is complete.';
			case 'errors.characterNotFound': return 'Character not found';
			case 'errors.materialNotFound': return 'Material not found';
			case 'errors.artifactNotFound': return 'Artifact not found';
			case 'pages.characters': return 'Characters';
			case 'pages.characterDetails': return ({required Object character}) => '${character} - Character';
			case 'pages.weapons': return 'Weapons';
			case 'pages.weaponDetails': return ({required Object weapon}) => '${weapon} - Weapon';
			case 'pages.materials': return 'Materials';
			case 'pages.materialDetails': return ({required Object material}) => '${material} - Material';
			case 'pages.artifacts': return 'Artifacts';
			case 'pages.artifactDetails': return ({required Object artifact}) => '${artifact} - Artifact';
			case 'pages.settings': return 'Settings';
			case 'pages.account': return 'Account';
			case 'pages.releaseNotes': return 'Release Notes';
			case 'pages.bookmarks': return 'Bookmarks';
			case 'pages.database': return 'Database';
			case 'pages.daily': return 'Daily';
			case 'pages.tools': return 'Tools';
			case 'pages.resinCalc': return 'Resin Replenish Calculator';
			case 'pages.wishes': return 'Wish Pity Counter';
			case 'pages.more': return 'More';
			case 'pages.hoyolabIntegrationSettings': return 'HoYoLAB Integration Settings';
			case 'characterDetailsPage.charaLevelUpAndAscensionMaterials': return 'Character Lv Up & Ascension Materials';
			case 'characterDetailsPage.talentLevelUpMaterials': return 'Talent Lv Up Materials';
			case 'materialDetailsPage.charactersUsing': return 'Characters Using This Material';
			case 'materialDetailsPage.weaponsUsing': return 'Weapons Using This Material';
			case 'materialCard.reBookmark': return 'Re-bookmark in current range';
			case 'materialCard.reBookmarkDesc': return 'Remove the bookmark of this material once, then bookmark it again in the current slider range';
			case 'materialCard.unBookmark': return 'Remove bookmark';
			case 'materialCard.unBookmarkDesc': return 'Remove the bookmark of this material';
			case 'artifactsPage.bonusTypes.1-pc': return '1-Pc Set Bonus';
			case 'artifactsPage.bonusTypes.2-pc': return '2-Pc Set Bonus';
			case 'artifactsPage.bonusTypes.4-pc': return '4-Pc Set Bonus';
			case 'artifactsPage.pieceTypes.flower': return 'Flower of Life';
			case 'artifactsPage.pieceTypes.plume': return 'Plume of Death';
			case 'artifactsPage.pieceTypes.sands': return 'Sands of Eon';
			case 'artifactsPage.pieceTypes.goblet': return 'Goblet of Eonothem';
			case 'artifactsPage.pieceTypes.circlet': return 'Circlet of Logos';
			case 'artifactDetailsPage.maxRarity': return 'Max Rarity';
			case 'artifactDetailsPage.bookmarkSet': return 'Bookmark Set(s)';
			case 'artifactDetailsPage.bookmarkPiece': return 'Bookmark by Piece';
			case 'artifactDetailsPage.bookmarkTwoAndTwoPcSet': return 'Bookmark 2+2 Pc Set';
			case 'artifactDetailsPage.bookmarkFourPcSet': return 'Bookmark 4 Pc Set';
			case 'dailyPage.mondayAndThursday': return 'Mon/Thu';
			case 'dailyPage.tuesdayAndFriday': return 'Tue/Fri';
			case 'dailyPage.wednesdayAndSaturday': return 'Wed/Sat';
			case 'dailyPage.talentMaterials': return 'Talent Materials';
			case 'dailyPage.weaponMaterials': return 'Weapon Materials';
			case 'resinCalcPage.currentResin': return 'Current Resin';
			case 'resinCalcPage.baseTime': return 'Base Time';
			case 'resinCalcPage.fullyReplenishedBy': return 'Fully Replenished By';
			case 'resinCalcPage.untilFull': return 'Until Full';
			case 'resinCalcPage.wastedResin': return 'Wasted Resin';
			case 'morePage.accountDesc': return 'You can sync bookmarks etc. between devices.';
			case 'morePage.hoyolabIntegrationSettingsDesc': return 'Link with HoYoLAB to sync in-game data';
			case 'releaseNotesPage.featureUpdates': return 'Feature Updates';
			case 'releaseNotesPage.assetUpdates': return 'Asset Updates';
			case 'settingsPage.assetData': return 'Assets';
			case 'settingsPage.reDownloadAssets': return 'Re-download Assets';
			case 'settingsPage.reDownloadAssetsDesc': return 'Please try this if the assets of the app are not loading properly.';
			case 'hoyolab.signIn': return 'Sign in to HoYoLAB';
			case 'hoyolab.signOut': return 'Sign out from HoYoLAB';
			case 'hoyolab.signInNote': return '* Social login is not supported. You need to sign in with your email/username and password.';
			case 'hoyolab.failedToSignIn': return 'Failed to sign in to HoYoLAB';
			case 'hoyolab.signOutConfirm': return 'Unlink HoYoLAB?';
			case 'hoyolab.credentialVerificationFailed': return 'Failed to verify login information. Please sign in again.';
			case 'hoyolab.changeServer': return 'Change server';
			case 'hoyolab.serverSelect': return 'Server select';
			case 'hoyolab.current': return ({required Object server}) => 'Current: ${server}';
			case 'hoyolab.noServerSelected': return 'No server selected';
			case 'hoyolab.userInfo': return 'User Info';
			case 'hoyolab.failedToLoadServerList': return 'Failed to load server list.';
			case 'hoyolab.failedToLoadGameRole': return 'Failed to load game user info.';
			case 'hoyolab.charaDataSyncInProgress': return 'Game data sync in progress...';
			case 'hoyolab.noGameRoleFound': return 'No game user found.';
			case 'hoyolab.failedToSyncGameData': return 'Failed to sync game data.';
			case 'hoyolab.failedToLoadPermissionState': return 'Failed to load permission state.';
			case 'hoyolab.characterDataAccessNotAllowed': return 'Character data access is not allowed. Please allow access from HoYoLAB integration settings.';
			case 'hoyolab.characterDoesNotExist': return 'You do not own this character.';
			case 'hoyolab.realtimeNotesNotEnabled': return 'Real-time notes are not enabled. Please enable it in the HoYoLAB integration settings.';
			case 'hoyolab.loginExpired': return 'Please sign out and sign in again.';
			case 'hoyolab.doYouWantToAllowCharaDataAccess': return 'Do you want to allow access to character data?';
			case 'hoyolab.doYouWantToEnableRealtimeNotes': return 'Enable Real-Time Notes?';
			case 'hoyolab.charaDataAccessDesc': return 'You will be able to sync character levels and talent levels in the game.';
			case 'hoyolab.characterDataAccess': return 'Character Data Access';
			case 'hoyolab.enableRealtimeNotes': return 'Enable Real-Time Notes';
			case 'hoyolab.enableRealtimeNotesDesc': return 'You will be able to sync your current Original Resin count.';
			case 'whereToGet.chests': return 'Chests, Quests';
			default: return null;
		}
	}
}
