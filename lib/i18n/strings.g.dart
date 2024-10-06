/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 357 (178 per locale)

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
	String get appName => '原神素材ノート';
	late final _StringsCommonJa common = _StringsCommonJa._(_root);
	late final _StringsTutorialJa tutorial = _StringsTutorialJa._(_root);
	Map<String, String> get talentTypes => {
		'normalAttack': '通常攻撃',
		'elementalSkill': '元素スキル',
		'elementalBurst': '元素爆発',
	};
	late final _StringsUpdatesJa updates = _StringsUpdatesJa._(_root);
	late final _StringsErrorsJa errors = _StringsErrorsJa._(_root);
	late final _StringsPagesJa pages = _StringsPagesJa._(_root);
	late final _StringsBookmarksPageJa bookmarksPage = _StringsBookmarksPageJa._(_root);
	late final _StringsCharacterDetailsPageJa characterDetailsPage = _StringsCharacterDetailsPageJa._(_root);
	late final _StringsWeaponDetailsPageJa weaponDetailsPage = _StringsWeaponDetailsPageJa._(_root);
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
	TextSpan seconds({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
		other: () => TextSpan(children: [
			nBuilder(n),
			unit('秒'),
		]),
	);
	TextSpan minutes({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
		other: () => TextSpan(children: [
			nBuilder(n),
			unit('分'),
		]),
	);
	TextSpan hours({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
		other: () => TextSpan(children: [
			nBuilder(n),
			unit('時間'),
		]),
	);
	String get element => '元素';
	String get rarity => 'レアリティ';
	String get weaponType => '武器種';
	String get clear => 'クリア';
	String get save => '保存';
	String get next => '次へ';
	String get change => '変更';
	String get pleaseSelect => '選択してください';
	String get bookmarkSaved => 'ブックマークしました';
	String get none => 'なし';
	String get sliderTips => 'スライダーが反応しづらい場合、丸い部分を長押ししたままスライドするか、選択範囲の外側をスライドするとスムーズに操作できます。';
	String selected({required Object character}) => '選択中: ${character}';
}

// Path: tutorial
class _StringsTutorialJa {
	_StringsTutorialJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get indexSheet => '目次の表示';
	String get indexSheetDesc => 'このボタンをタップすると、お探しの項目へ素早く移動できます。';
}

// Path: updates
class _StringsUpdatesJa {
	_StringsUpdatesJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get downloading => 'データ更新をダウンロードしています…';
	String get failedToLoad => 'データの読み込みに失敗しました。「設定」→「アセットデータを再ダウンロード」から再ダウンロードをお試しください。';
	String get failedToDownload => 'データ更新のダウンロードに失敗しました。';
	String get failedToInstall => 'データ更新のインストールに失敗しました。';
	String get failedToCheck => 'データ更新の確認に失敗しました。';
	String get schemaVersionMismatch => 'アプリを最新版にアップデートしてください。';
	String get noInternet => 'インターネット接続をご確認ください。';
	String get noUpdateAvailable => 'アップデートはありません';
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
	String get tryAgainLater => 'しばらくしてから再度お試しください。';
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

// Path: bookmarksPage
class _StringsBookmarksPageJa {
	_StringsBookmarksPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noBookmarks => 'ブックマークがありません。「データベース」タブから探してみましょう！';
	String get character => 'キャラクター';
	String get weapon => '武器';
	String get artifactSet => '聖遺物セット';
	String get artifactPiece => '聖遺物';
	String get main => 'メイン';
	String get sub => 'サブ';
	String get unBookmark => 'ブックマークを解除';
	String get unBookmarkConfirm => 'このブックマークを解除しますか？';
}

// Path: characterDetailsPage
class _StringsCharacterDetailsPageJa {
	_StringsCharacterDetailsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get charaLevelUpAndAscensionMaterials => 'キャラクターLvアップ・突破素材';
	String get talentLevelUpMaterials => '天賦Lvアップ素材';
}

// Path: weaponDetailsPage
class _StringsWeaponDetailsPageJa {
	_StringsWeaponDetailsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get characterToEquip => '武器を装備させるキャラクター';
	String get skillEffect => 'スキル効果';
	String get ascension => '武器Lvアップ・突破素材';
}

// Path: materialDetailsPage
class _StringsMaterialDetailsPageJa {
	_StringsMaterialDetailsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get charactersUsing => 'この素材を使用するキャラクター';
	String get weaponsUsing => 'この素材を使用する武器';
	String get availableToday => '本日入手可能';
	String get source => '入手方法';
	String get toTeyvatMap => 'テイワットマップへ';
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
	String get effectList => 'セット効果リスト';
	String get kindOfEffect => '効果の種類';
	String get effectFilteringNote => '※本フィルタリング機能は☆5聖遺物に対してのみ機能します。また、選択したものをすべて満たす聖遺物を表示します。';
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
	String get bookmarkArtifacts => '聖遺物をブックマーク';
	String get characterToEquip => '聖遺物を装備させるキャラクター';
	String get chooseSecondSet => '2個目のセットを選択';
	String get chooseSecondSetDesc => '2個目の聖遺物セットを選択してください';
	String get mainStat => 'メインステータス';
	String mainStatWithPieceType({required Object pieceType}) => '${_root.artifactDetailsPage.mainStat} (${pieceType})';
	String get subStats => 'サブステータス';
	String get unspecified => '指定しない';
	String nSet({required Object n}) => '${n}セット';
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
	String get fullRecoveryTime => '全回復する時刻';
	String get recoveredTime => '全回復した時刻';
	String get untilFullRecovery => '全回復まであと';
	String get wastedResin => '無駄にした樹脂';
	String get tomorrow => '明日';
	String get alreadyFull => 'すでに全回復しました';
	String get howToUse => '使い方';
	String get howToUseContent => '現在の樹脂数を入力すると、入力した地点での時間を基準に、樹脂が全回復する時刻と、全回復するまでの時間を計算します。\n${_root.pages.hoyolabIntegrationSettings}で連携すると、現在の樹脂数を同期できるようになります。この機能を利用する場合「${_root.resinCalcPage.recoveredTime}」「${_root.resinCalcPage.wastedResin}」は、最後に樹脂を使用もしくはアイテム等で回復してから一度も同期していなかった場合には、正確に算出されませんのでご了承ください。\n';
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
	String get display => '表示';
	String get showItemNameOnCard => '素材のアイテム名を表示';
	String get showItemNameOnCardDesc => '使用数を表示するカードにアイテム名を表示します。';
	String get lackNumDisplayMethod => 'バッグ内不足数の表示方法';
	String get lackNumDisplayMethodDesc => '素材の不足数をどのように表示するか選択します。';
	Map<String, String> get lackNumDisplayMethodValues => {
		'alternate': 'すべて交互に表示',
		'requiredNumOnly': '必要数のみ表示',
		'lackNumOnly': '不足数のみ表示',
		'craftedLackNumOnly': '合成後の不足数のみ表示',
	};
	String get dailyResetServer => '日替わり素材のサーバー時間';
	String get dailyResetServerDesc => '日替わり素材が更新される時間の基準とするゲームサーバーを選択します。';
	String get assetData => 'アセットデータ';
	String get checkAssetUpdate => 'アセットデータの更新を確認';
	String get checkAssetUpdateDesc => 'アプリ内データのアップデートをチェックします。';
	String get reDownloadAssets => 'アセットデータを再ダウンロード';
	String get reDownloadAssetsDesc => 'アプリの画像やキャラクター等が正常に読み込まれない場合にお試しください。';
	String get others => 'その他';
	String get openSourceLicenses => 'オープンソースライセンス';
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
	String get noGameRoleFound => 'ゲームデータが見つかりません';
	String get failedToSyncGameData => 'ゲームデータの同期に失敗しました。';
	String get failedToLoadPermissionState => 'アクセス許可状態の取得に失敗しました。';
	String get characterDataAccessNotAllowed => 'キャラクターデータへのアクセスが許可されていません。HoYoLAB連携設定より許可してください。';
	String get characterDoesNotExist => 'キャラクターを所持していません。';
	String get realtimeNotesNotEnabled => 'リアルタイムノートが有効化されていません。HoYoLAB連携設定より有効化してください。';
	String get loginExpired => '一度連携を解除し、再度ログインしてください。';
	String get accessPermission => 'アクセス許可';
	String get doYouWantToEnableRealtimeNotes => 'リアルタイムノートを有効化しますか？';
	String get characterDataAccess => 'キャラクターデータへのアクセス';
	String get enableRealtimeNotes => 'リアルタイムノートの有効化';
	String get enableRealtimeNotesDesc => '現在の天然樹脂の数を同期できるようになります。';
	String get syncSettings => '同期設定';
	String get syncResin => 'ゲーム内の樹脂数と同期する';
	String get syncCharaState => 'ゲーム内のキャラレベルを同期する';
	String get syncBagCounts => 'ゲーム内の素材の所持数を同期する';
	String get mustBeResonatedWithStatue => '旅人のレベルを同期するには、七天神像で該当する元素と共鳴する必要があります。';
	String get charaSyncSuccess => 'ゲームデータと同期しました';
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
	@override String get appName => 'Genshin Material Notebook';
	@override late final _StringsCommonEn common = _StringsCommonEn._(_root);
	@override late final _StringsTutorialEn tutorial = _StringsTutorialEn._(_root);
	@override Map<String, String> get talentTypes => {
		'normalAttack': 'Normal Attack',
		'elementalSkill': 'Elemental Skill',
		'elementalBurst': 'Elemental Burst',
	};
	@override late final _StringsUpdatesEn updates = _StringsUpdatesEn._(_root);
	@override late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
	@override late final _StringsPagesEn pages = _StringsPagesEn._(_root);
	@override late final _StringsBookmarksPageEn bookmarksPage = _StringsBookmarksPageEn._(_root);
	@override late final _StringsCharacterDetailsPageEn characterDetailsPage = _StringsCharacterDetailsPageEn._(_root);
	@override late final _StringsWeaponDetailsPageEn weaponDetailsPage = _StringsWeaponDetailsPageEn._(_root);
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
	@override TextSpan seconds({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'),
		other: () => TextSpan(children: [
			nBuilder(n),
			const TextSpan(text: ' '),
			unit('seconds'),
		]),
		one: () => TextSpan(children: [
			nBuilder(n),
			const TextSpan(text: ' '),
			unit('second'),
		]),
	);
	@override TextSpan minutes({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'),
		other: () => TextSpan(children: [
			nBuilder(n),
			const TextSpan(text: ' '),
			unit('minutes'),
		]),
		one: () => TextSpan(children: [
			nBuilder(n),
			const TextSpan(text: ' '),
			unit('minute'),
		]),
	);
	@override TextSpan hours({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'),
		other: () => TextSpan(children: [
			nBuilder(n),
			const TextSpan(text: ' '),
			unit('hours'),
		]),
		one: () => TextSpan(children: [
			nBuilder(n),
			const TextSpan(text: ' '),
			unit('hour'),
		]),
	);
	@override String get element => 'Element';
	@override String get rarity => 'Rarity';
	@override String get weaponType => 'Weapon Type';
	@override String get clear => 'Clear';
	@override String get save => 'Save';
	@override String get next => 'Next';
	@override String get change => 'Change';
	@override String get pleaseSelect => 'Please select';
	@override String get bookmarkSaved => 'Bookmark saved';
	@override String get none => 'None';
	@override String get sliderTips => 'If the slider is unresponsive, try long-pressing the handle and sliding, or sliding outside the selection range for smoother operation.';
	@override String get expandAll => 'Expand all';
	@override String get collapseAll => 'Collapse all';
	@override String get schemaVersionMismatch => 'Cannot update assets. Please update the app.';
}

// Path: tutorial
class _StringsTutorialEn extends _StringsTutorialJa {
	_StringsTutorialEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get indexSheet => 'Table of contents';
	@override String get indexSheetDesc => 'Tap this button to quickly navigate to the section you\'re looking for.';
}

// Path: updates
class _StringsUpdatesEn extends _StringsUpdatesJa {
	_StringsUpdatesEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get downloading => 'Downloading data updates...';
	@override String get failedToLoad => 'Failed to load data. Try re-downloading from \'Settings\' -> \'Re-download Assets\'.';
	@override String get failedToDownload => 'Failed to download data update.';
	@override String get failedToInstall => 'Failed to install data update.';
	@override String get failedToCheck => 'Failed to check for data update.';
	@override String get schemaVersionMismatch => 'Please update the app to the latest version.';
	@override String get noInternet => 'Please check your internet connection.';
	@override String get noUpdateAvailable => 'No update available.';
	@override String get completed => 'Data update completed.';
	@override String get installing => 'Installing...';
	@override String get pleaseWaitUntilComplete => 'Please wait until data update is complete.';
	@override String get failedToUpdate => 'Failed to update assets. Please try again later.';
}

// Path: errors
class _StringsErrorsEn extends _StringsErrorsJa {
	_StringsErrorsEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get characterNotFound => 'Character not found';
	@override String get materialNotFound => 'Material not found';
	@override String get artifactNotFound => 'Artifact not found';
	@override String get tryAgainLater => 'Please try again later.';
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

// Path: bookmarksPage
class _StringsBookmarksPageEn extends _StringsBookmarksPageJa {
	_StringsBookmarksPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get noBookmarks => 'No bookmarks yet. Try finding something in the Database tab!';
	@override String get character => 'Character';
	@override String get weapon => 'Weapon';
	@override String get artifactSet => 'Artifact Set';
	@override String get artifactPiece => 'Artifact';
	@override String get main => 'Main';
	@override String get sub => 'Sub';
	@override String get unBookmark => 'Remove bookmark';
	@override String get unBookmarkConfirm => 'Remove this bookmark?';
}

// Path: characterDetailsPage
class _StringsCharacterDetailsPageEn extends _StringsCharacterDetailsPageJa {
	_StringsCharacterDetailsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get charaLevelUpAndAscensionMaterials => 'Character Lv Up & Ascension Materials';
	@override String get talentLevelUpMaterials => 'Talent Lv Up Materials';
}

// Path: weaponDetailsPage
class _StringsWeaponDetailsPageEn extends _StringsWeaponDetailsPageJa {
	_StringsWeaponDetailsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get characterToEquip => 'Character to Equip this Weapon';
	@override String get skillEffect => 'Skill Effect';
	@override String get ascension => 'Weapon Lv Up & Ascension Materials';
}

// Path: materialDetailsPage
class _StringsMaterialDetailsPageEn extends _StringsMaterialDetailsPageJa {
	_StringsMaterialDetailsPageEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get charactersUsing => 'Characters Using This Material';
	@override String get weaponsUsing => 'Weapons Using This Material';
	@override String get availableToday => 'Available Today';
	@override String get source => 'How to Obtain';
	@override String get toTeyvatMap => 'To Teyvat Map';
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
	@override String get effectList => 'Effect List';
	@override String get kindOfEffect => 'Kind of Effect';
	@override String get effectFilteringNote => '* This filtering only applies to 5-star artifacts only. Selecting multiple options will show artifacts that have all selected tags.';
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
	@override String get bookmarkArtifacts => 'Bookmark Artifacts';
	@override String get characterToEquip => 'Character to Equip';
	@override String get chooseSecondSet => 'Select the Second One';
	@override String get chooseSecondSetDesc => 'Choose the second artifact set.';
	@override String get mainStat => 'Main Stat';
	@override String mainStatWithPieceType({required Object pieceType}) => '${_root.artifactDetailsPage.mainStat} (${pieceType})';
	@override String get subStats => 'Sub Stats';
	@override String get unspecified => 'Unspecified';
	@override String nSet({required Object n}) => '${n}-Pieces';
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
	@override String get fullRecoveryTime => 'Full Recovery Time';
	@override String get recoveredTime => 'Recovered Time';
	@override String get untilFullRecovery => 'Until Full Recovery';
	@override String get wastedResin => 'Wasted Resin';
	@override String get tomorrow => 'Tomorrow';
	@override String get alreadyFull => 'Already fully recovered';
	@override String get howToUse => 'How to Use';
	@override String get howToUseContent => 'Enter your current resin count to calculate the time when your resin will be fully recovered and the time remaining until full recovery based on the time you entered.\nBy linking with ${_root.pages.hoyolabIntegrationSettings}, you can synchronize your current resin count. If you use this feature, please note that "${_root.resinCalcPage.recoveredTime}" and "${_root.resinCalcPage.wastedResin}" will not be accurately calculated if you have not synchronized after using resin for the last time or recovering it with items, etc.\n';
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
	@override String get display => 'Display';
	@override String get showItemNameOnCard => 'Show Item Name on Card';
	@override String get showItemNameOnCardDesc => 'Show the item name on the card that displays the number of uses.';
	@override String get dailyResetServer => 'Daily Material Server Time';
	@override String get dailyResetServerDesc => 'Select the game server to use as the reference time for daily materials reset.';
	@override String get assetData => 'Assets';
	@override String get checkAssetUpdate => 'Check Asset Update';
	@override String get checkAssetUpdateDesc => 'Check for updates to the app\'s assets.';
	@override String get reDownloadAssets => 'Re-download Assets';
	@override String get reDownloadAssetsDesc => 'Please try this if the assets of the app are not loading properly.';
	@override String get others => 'Others';
	@override String get openSourceLicenses => 'Open Source Licenses';
	@override String get noUpdateAvailable => 'No update available.';
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
	@override String get noGameRoleFound => 'No game user found.';
	@override String get failedToSyncGameData => 'Failed to sync game data.';
	@override String get failedToLoadPermissionState => 'Failed to load permission state.';
	@override String get characterDataAccessNotAllowed => 'Character data access is not allowed. Please allow access from HoYoLAB integration settings.';
	@override String get characterDoesNotExist => 'You do not own this character.';
	@override String get realtimeNotesNotEnabled => 'Real-time notes are not enabled. Please enable it in the HoYoLAB integration settings.';
	@override String get loginExpired => 'Please sign out and sign in again.';
	@override String get accessPermission => 'Access Permission';
	@override String get doYouWantToEnableRealtimeNotes => 'Enable Real-Time Notes?';
	@override String get characterDataAccess => 'Character Data Access';
	@override String get enableRealtimeNotes => 'Enable Real-Time Notes';
	@override String get enableRealtimeNotesDesc => 'You will be able to sync your current Original Resin count.';
	@override String get syncSettings => 'Sync Settings';
	@override String get syncResin => 'Sync In-Game Resin Count';
	@override String get syncCharaState => 'Sync In-Game Character Levels';
	@override String get mustBeResonatedWithStatue => 'This character must be resonated with the Statue of The Seven to be able to sync game data.';
	@override String get charaSyncSuccess => 'Successfully synced game data';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return '原神素材ノート';
			case 'common.ok': return 'OK';
			case 'common.cancel': return 'キャンセル';
			case 'common.signOut': return 'サインアウト';
			case 'common.tos': return '利用規約';
			case 'common.privacyPolicy': return 'プライバシーポリシー';
			case 'common.error': return 'エラーが発生しました。';
			case 'common.goalLevel': return '目標レベル';
			case 'common.currentLevel': return '現在レベル';
			case 'common.index': return '目次';
			case 'common.seconds': return ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
				n: n,
				resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
				other: () => TextSpan(children: [
					nBuilder(n),
					unit('秒'),
				]),
			);
			case 'common.minutes': return ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
				n: n,
				resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
				other: () => TextSpan(children: [
					nBuilder(n),
					unit('分'),
				]),
			);
			case 'common.hours': return ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
				n: n,
				resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
				other: () => TextSpan(children: [
					nBuilder(n),
					unit('時間'),
				]),
			);
			case 'common.element': return '元素';
			case 'common.rarity': return 'レアリティ';
			case 'common.weaponType': return '武器種';
			case 'common.clear': return 'クリア';
			case 'common.save': return '保存';
			case 'common.next': return '次へ';
			case 'common.change': return '変更';
			case 'common.pleaseSelect': return '選択してください';
			case 'common.bookmarkSaved': return 'ブックマークしました';
			case 'common.none': return 'なし';
			case 'common.sliderTips': return 'スライダーが反応しづらい場合、丸い部分を長押ししたままスライドするか、選択範囲の外側をスライドするとスムーズに操作できます。';
			case 'common.selected': return ({required Object character}) => '選択中: ${character}';
			case 'tutorial.indexSheet': return '目次の表示';
			case 'tutorial.indexSheetDesc': return 'このボタンをタップすると、お探しの項目へ素早く移動できます。';
			case 'talentTypes.normalAttack': return '通常攻撃';
			case 'talentTypes.elementalSkill': return '元素スキル';
			case 'talentTypes.elementalBurst': return '元素爆発';
			case 'updates.downloading': return 'データ更新をダウンロードしています…';
			case 'updates.failedToLoad': return 'データの読み込みに失敗しました。「設定」→「アセットデータを再ダウンロード」から再ダウンロードをお試しください。';
			case 'updates.failedToDownload': return 'データ更新のダウンロードに失敗しました。';
			case 'updates.failedToInstall': return 'データ更新のインストールに失敗しました。';
			case 'updates.failedToCheck': return 'データ更新の確認に失敗しました。';
			case 'updates.schemaVersionMismatch': return 'アプリを最新版にアップデートしてください。';
			case 'updates.noInternet': return 'インターネット接続をご確認ください。';
			case 'updates.noUpdateAvailable': return 'アップデートはありません';
			case 'updates.completed': return '更新が完了しました。';
			case 'updates.installing': return 'インストールしています...';
			case 'updates.pleaseWaitUntilComplete': return 'データ更新が完了するまでお待ちください。';
			case 'errors.characterNotFound': return 'キャラクターが見つかりません';
			case 'errors.materialNotFound': return '素材が見つかりません';
			case 'errors.artifactNotFound': return '聖遺物が見つかりません';
			case 'errors.tryAgainLater': return 'しばらくしてから再度お試しください。';
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
			case 'bookmarksPage.noBookmarks': return 'ブックマークがありません。「データベース」タブから探してみましょう！';
			case 'bookmarksPage.character': return 'キャラクター';
			case 'bookmarksPage.weapon': return '武器';
			case 'bookmarksPage.artifactSet': return '聖遺物セット';
			case 'bookmarksPage.artifactPiece': return '聖遺物';
			case 'bookmarksPage.main': return 'メイン';
			case 'bookmarksPage.sub': return 'サブ';
			case 'bookmarksPage.unBookmark': return 'ブックマークを解除';
			case 'bookmarksPage.unBookmarkConfirm': return 'このブックマークを解除しますか？';
			case 'characterDetailsPage.charaLevelUpAndAscensionMaterials': return 'キャラクターLvアップ・突破素材';
			case 'characterDetailsPage.talentLevelUpMaterials': return '天賦Lvアップ素材';
			case 'weaponDetailsPage.characterToEquip': return '武器を装備させるキャラクター';
			case 'weaponDetailsPage.skillEffect': return 'スキル効果';
			case 'weaponDetailsPage.ascension': return '武器Lvアップ・突破素材';
			case 'materialDetailsPage.charactersUsing': return 'この素材を使用するキャラクター';
			case 'materialDetailsPage.weaponsUsing': return 'この素材を使用する武器';
			case 'materialDetailsPage.availableToday': return '本日入手可能';
			case 'materialDetailsPage.source': return '入手方法';
			case 'materialDetailsPage.toTeyvatMap': return 'テイワットマップへ';
			case 'materialCard.reBookmark': return '現在の範囲で再ブックマーク';
			case 'materialCard.reBookmarkDesc': return '一旦この素材のブックマークを解除し、現在のスライダーの範囲で再度ブックマークします';
			case 'materialCard.unBookmark': return 'ブックマークを解除';
			case 'materialCard.unBookmarkDesc': return 'この素材のブックマークを解除します';
			case 'artifactsPage.bonusTypes.1-pc': return '1セット効果';
			case 'artifactsPage.bonusTypes.2-pc': return '2セット効果';
			case 'artifactsPage.bonusTypes.4-pc': return '4セット効果';
			case 'artifactsPage.effectList': return 'セット効果リスト';
			case 'artifactsPage.kindOfEffect': return '効果の種類';
			case 'artifactsPage.effectFilteringNote': return '※本フィルタリング機能は☆5聖遺物に対してのみ機能します。また、選択したものをすべて満たす聖遺物を表示します。';
			case 'artifactDetailsPage.maxRarity': return '最高レアリティ';
			case 'artifactDetailsPage.bookmarkSet': return 'セットをブックマーク';
			case 'artifactDetailsPage.bookmarkPiece': return '部位ごとにブックマーク';
			case 'artifactDetailsPage.bookmarkTwoAndTwoPcSet': return '2 + 2 セットをブックマーク';
			case 'artifactDetailsPage.bookmarkFourPcSet': return '4 セットをブックマーク';
			case 'artifactDetailsPage.bookmarkArtifacts': return '聖遺物をブックマーク';
			case 'artifactDetailsPage.characterToEquip': return '聖遺物を装備させるキャラクター';
			case 'artifactDetailsPage.chooseSecondSet': return '2個目のセットを選択';
			case 'artifactDetailsPage.chooseSecondSetDesc': return '2個目の聖遺物セットを選択してください';
			case 'artifactDetailsPage.mainStat': return 'メインステータス';
			case 'artifactDetailsPage.mainStatWithPieceType': return ({required Object pieceType}) => '${_root.artifactDetailsPage.mainStat} (${pieceType})';
			case 'artifactDetailsPage.subStats': return 'サブステータス';
			case 'artifactDetailsPage.unspecified': return '指定しない';
			case 'artifactDetailsPage.nSet': return ({required Object n}) => '${n}セット';
			case 'dailyPage.mondayAndThursday': return '月/木';
			case 'dailyPage.tuesdayAndFriday': return '火/金';
			case 'dailyPage.wednesdayAndSaturday': return '水/土';
			case 'dailyPage.talentMaterials': return '天賦素材';
			case 'dailyPage.weaponMaterials': return '武器素材';
			case 'resinCalcPage.currentResin': return '現在の樹脂数';
			case 'resinCalcPage.baseTime': return '入力した時刻';
			case 'resinCalcPage.fullRecoveryTime': return '全回復する時刻';
			case 'resinCalcPage.recoveredTime': return '全回復した時刻';
			case 'resinCalcPage.untilFullRecovery': return '全回復まであと';
			case 'resinCalcPage.wastedResin': return '無駄にした樹脂';
			case 'resinCalcPage.tomorrow': return '明日';
			case 'resinCalcPage.alreadyFull': return 'すでに全回復しました';
			case 'resinCalcPage.howToUse': return '使い方';
			case 'resinCalcPage.howToUseContent': return '現在の樹脂数を入力すると、入力した地点での時間を基準に、樹脂が全回復する時刻と、全回復するまでの時間を計算します。\n${_root.pages.hoyolabIntegrationSettings}で連携すると、現在の樹脂数を同期できるようになります。この機能を利用する場合「${_root.resinCalcPage.recoveredTime}」「${_root.resinCalcPage.wastedResin}」は、最後に樹脂を使用もしくはアイテム等で回復してから一度も同期していなかった場合には、正確に算出されませんのでご了承ください。\n';
			case 'morePage.accountDesc': return 'ブックマーク等をデバイス間で同期できます。';
			case 'morePage.hoyolabIntegrationSettingsDesc': return 'HoYoLABと連携し、ゲーム内のデータと同期できます。';
			case 'releaseNotesPage.featureUpdates': return '機能更新';
			case 'releaseNotesPage.assetUpdates': return 'データ更新';
			case 'settingsPage.display': return '表示';
			case 'settingsPage.showItemNameOnCard': return '素材のアイテム名を表示';
			case 'settingsPage.showItemNameOnCardDesc': return '使用数を表示するカードにアイテム名を表示します。';
			case 'settingsPage.lackNumDisplayMethod': return 'バッグ内不足数の表示方法';
			case 'settingsPage.lackNumDisplayMethodDesc': return '素材の不足数をどのように表示するか選択します。';
			case 'settingsPage.lackNumDisplayMethodValues.alternate': return 'すべて交互に表示';
			case 'settingsPage.lackNumDisplayMethodValues.requiredNumOnly': return '必要数のみ表示';
			case 'settingsPage.lackNumDisplayMethodValues.lackNumOnly': return '不足数のみ表示';
			case 'settingsPage.lackNumDisplayMethodValues.craftedLackNumOnly': return '合成後の不足数のみ表示';
			case 'settingsPage.dailyResetServer': return '日替わり素材のサーバー時間';
			case 'settingsPage.dailyResetServerDesc': return '日替わり素材が更新される時間の基準とするゲームサーバーを選択します。';
			case 'settingsPage.assetData': return 'アセットデータ';
			case 'settingsPage.checkAssetUpdate': return 'アセットデータの更新を確認';
			case 'settingsPage.checkAssetUpdateDesc': return 'アプリ内データのアップデートをチェックします。';
			case 'settingsPage.reDownloadAssets': return 'アセットデータを再ダウンロード';
			case 'settingsPage.reDownloadAssetsDesc': return 'アプリの画像やキャラクター等が正常に読み込まれない場合にお試しください。';
			case 'settingsPage.others': return 'その他';
			case 'settingsPage.openSourceLicenses': return 'オープンソースライセンス';
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
			case 'hoyolab.noGameRoleFound': return 'ゲームデータが見つかりません';
			case 'hoyolab.failedToSyncGameData': return 'ゲームデータの同期に失敗しました。';
			case 'hoyolab.failedToLoadPermissionState': return 'アクセス許可状態の取得に失敗しました。';
			case 'hoyolab.characterDataAccessNotAllowed': return 'キャラクターデータへのアクセスが許可されていません。HoYoLAB連携設定より許可してください。';
			case 'hoyolab.characterDoesNotExist': return 'キャラクターを所持していません。';
			case 'hoyolab.realtimeNotesNotEnabled': return 'リアルタイムノートが有効化されていません。HoYoLAB連携設定より有効化してください。';
			case 'hoyolab.loginExpired': return '一度連携を解除し、再度ログインしてください。';
			case 'hoyolab.accessPermission': return 'アクセス許可';
			case 'hoyolab.doYouWantToEnableRealtimeNotes': return 'リアルタイムノートを有効化しますか？';
			case 'hoyolab.characterDataAccess': return 'キャラクターデータへのアクセス';
			case 'hoyolab.enableRealtimeNotes': return 'リアルタイムノートの有効化';
			case 'hoyolab.enableRealtimeNotesDesc': return '現在の天然樹脂の数を同期できるようになります。';
			case 'hoyolab.syncSettings': return '同期設定';
			case 'hoyolab.syncResin': return 'ゲーム内の樹脂数と同期する';
			case 'hoyolab.syncCharaState': return 'ゲーム内のキャラレベルを同期する';
			case 'hoyolab.syncBagCounts': return 'ゲーム内の素材の所持数を同期する';
			case 'hoyolab.mustBeResonatedWithStatue': return '旅人のレベルを同期するには、七天神像で該当する元素と共鳴する必要があります。';
			case 'hoyolab.charaSyncSuccess': return 'ゲームデータと同期しました';
			case 'whereToGet.chests': return '宝箱、任務報酬など';
			default: return null;
		}
	}
}

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Genshin Material Notebook';
			case 'common.ok': return 'OK';
			case 'common.cancel': return 'Cancel';
			case 'common.signOut': return 'Sign Out';
			case 'common.tos': return 'Terms of Use';
			case 'common.privacyPolicy': return 'Privacy Policy';
			case 'common.error': return 'An error occurred.';
			case 'common.goalLevel': return 'Goal Level';
			case 'common.currentLevel': return 'Current Level';
			case 'common.index': return 'Index';
			case 'common.seconds': return ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
				n: n,
				resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'),
				other: () => TextSpan(children: [
					nBuilder(n),
					const TextSpan(text: ' '),
					unit('seconds'),
				]),
				one: () => TextSpan(children: [
					nBuilder(n),
					const TextSpan(text: ' '),
					unit('second'),
				]),
			);
			case 'common.minutes': return ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
				n: n,
				resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'),
				other: () => TextSpan(children: [
					nBuilder(n),
					const TextSpan(text: ' '),
					unit('minutes'),
				]),
				one: () => TextSpan(children: [
					nBuilder(n),
					const TextSpan(text: ' '),
					unit('minute'),
				]),
			);
			case 'common.hours': return ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
				n: n,
				resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'),
				other: () => TextSpan(children: [
					nBuilder(n),
					const TextSpan(text: ' '),
					unit('hours'),
				]),
				one: () => TextSpan(children: [
					nBuilder(n),
					const TextSpan(text: ' '),
					unit('hour'),
				]),
			);
			case 'common.element': return 'Element';
			case 'common.rarity': return 'Rarity';
			case 'common.weaponType': return 'Weapon Type';
			case 'common.clear': return 'Clear';
			case 'common.save': return 'Save';
			case 'common.next': return 'Next';
			case 'common.change': return 'Change';
			case 'common.pleaseSelect': return 'Please select';
			case 'common.bookmarkSaved': return 'Bookmark saved';
			case 'common.none': return 'None';
			case 'common.sliderTips': return 'If the slider is unresponsive, try long-pressing the handle and sliding, or sliding outside the selection range for smoother operation.';
			case 'common.expandAll': return 'Expand all';
			case 'common.collapseAll': return 'Collapse all';
			case 'common.schemaVersionMismatch': return 'Cannot update assets. Please update the app.';
			case 'tutorial.indexSheet': return 'Table of contents';
			case 'tutorial.indexSheetDesc': return 'Tap this button to quickly navigate to the section you\'re looking for.';
			case 'talentTypes.normalAttack': return 'Normal Attack';
			case 'talentTypes.elementalSkill': return 'Elemental Skill';
			case 'talentTypes.elementalBurst': return 'Elemental Burst';
			case 'updates.downloading': return 'Downloading data updates...';
			case 'updates.failedToLoad': return 'Failed to load data. Try re-downloading from \'Settings\' -> \'Re-download Assets\'.';
			case 'updates.failedToDownload': return 'Failed to download data update.';
			case 'updates.failedToInstall': return 'Failed to install data update.';
			case 'updates.failedToCheck': return 'Failed to check for data update.';
			case 'updates.schemaVersionMismatch': return 'Please update the app to the latest version.';
			case 'updates.noInternet': return 'Please check your internet connection.';
			case 'updates.noUpdateAvailable': return 'No update available.';
			case 'updates.completed': return 'Data update completed.';
			case 'updates.installing': return 'Installing...';
			case 'updates.pleaseWaitUntilComplete': return 'Please wait until data update is complete.';
			case 'updates.failedToUpdate': return 'Failed to update assets. Please try again later.';
			case 'errors.characterNotFound': return 'Character not found';
			case 'errors.materialNotFound': return 'Material not found';
			case 'errors.artifactNotFound': return 'Artifact not found';
			case 'errors.tryAgainLater': return 'Please try again later.';
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
			case 'bookmarksPage.noBookmarks': return 'No bookmarks yet. Try finding something in the Database tab!';
			case 'bookmarksPage.character': return 'Character';
			case 'bookmarksPage.weapon': return 'Weapon';
			case 'bookmarksPage.artifactSet': return 'Artifact Set';
			case 'bookmarksPage.artifactPiece': return 'Artifact';
			case 'bookmarksPage.main': return 'Main';
			case 'bookmarksPage.sub': return 'Sub';
			case 'bookmarksPage.unBookmark': return 'Remove bookmark';
			case 'bookmarksPage.unBookmarkConfirm': return 'Remove this bookmark?';
			case 'characterDetailsPage.charaLevelUpAndAscensionMaterials': return 'Character Lv Up & Ascension Materials';
			case 'characterDetailsPage.talentLevelUpMaterials': return 'Talent Lv Up Materials';
			case 'weaponDetailsPage.characterToEquip': return 'Character to Equip this Weapon';
			case 'weaponDetailsPage.skillEffect': return 'Skill Effect';
			case 'weaponDetailsPage.ascension': return 'Weapon Lv Up & Ascension Materials';
			case 'materialDetailsPage.charactersUsing': return 'Characters Using This Material';
			case 'materialDetailsPage.weaponsUsing': return 'Weapons Using This Material';
			case 'materialDetailsPage.availableToday': return 'Available Today';
			case 'materialDetailsPage.source': return 'How to Obtain';
			case 'materialDetailsPage.toTeyvatMap': return 'To Teyvat Map';
			case 'materialCard.reBookmark': return 'Re-bookmark in current range';
			case 'materialCard.reBookmarkDesc': return 'Remove the bookmark of this material once, then bookmark it again in the current slider range';
			case 'materialCard.unBookmark': return 'Remove bookmark';
			case 'materialCard.unBookmarkDesc': return 'Remove the bookmark of this material';
			case 'artifactsPage.bonusTypes.1-pc': return '1-Pc Set Bonus';
			case 'artifactsPage.bonusTypes.2-pc': return '2-Pc Set Bonus';
			case 'artifactsPage.bonusTypes.4-pc': return '4-Pc Set Bonus';
			case 'artifactsPage.effectList': return 'Effect List';
			case 'artifactsPage.kindOfEffect': return 'Kind of Effect';
			case 'artifactsPage.effectFilteringNote': return '* This filtering only applies to 5-star artifacts only. Selecting multiple options will show artifacts that have all selected tags.';
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
			case 'artifactDetailsPage.bookmarkArtifacts': return 'Bookmark Artifacts';
			case 'artifactDetailsPage.characterToEquip': return 'Character to Equip';
			case 'artifactDetailsPage.chooseSecondSet': return 'Select the Second One';
			case 'artifactDetailsPage.chooseSecondSetDesc': return 'Choose the second artifact set.';
			case 'artifactDetailsPage.mainStat': return 'Main Stat';
			case 'artifactDetailsPage.mainStatWithPieceType': return ({required Object pieceType}) => '${_root.artifactDetailsPage.mainStat} (${pieceType})';
			case 'artifactDetailsPage.subStats': return 'Sub Stats';
			case 'artifactDetailsPage.unspecified': return 'Unspecified';
			case 'artifactDetailsPage.nSet': return ({required Object n}) => '${n}-Pieces';
			case 'dailyPage.mondayAndThursday': return 'Mon/Thu';
			case 'dailyPage.tuesdayAndFriday': return 'Tue/Fri';
			case 'dailyPage.wednesdayAndSaturday': return 'Wed/Sat';
			case 'dailyPage.talentMaterials': return 'Talent Materials';
			case 'dailyPage.weaponMaterials': return 'Weapon Materials';
			case 'resinCalcPage.currentResin': return 'Current Resin';
			case 'resinCalcPage.baseTime': return 'Base Time';
			case 'resinCalcPage.fullRecoveryTime': return 'Full Recovery Time';
			case 'resinCalcPage.recoveredTime': return 'Recovered Time';
			case 'resinCalcPage.untilFullRecovery': return 'Until Full Recovery';
			case 'resinCalcPage.wastedResin': return 'Wasted Resin';
			case 'resinCalcPage.tomorrow': return 'Tomorrow';
			case 'resinCalcPage.alreadyFull': return 'Already fully recovered';
			case 'resinCalcPage.howToUse': return 'How to Use';
			case 'resinCalcPage.howToUseContent': return 'Enter your current resin count to calculate the time when your resin will be fully recovered and the time remaining until full recovery based on the time you entered.\nBy linking with ${_root.pages.hoyolabIntegrationSettings}, you can synchronize your current resin count. If you use this feature, please note that "${_root.resinCalcPage.recoveredTime}" and "${_root.resinCalcPage.wastedResin}" will not be accurately calculated if you have not synchronized after using resin for the last time or recovering it with items, etc.\n';
			case 'morePage.accountDesc': return 'You can sync bookmarks etc. between devices.';
			case 'morePage.hoyolabIntegrationSettingsDesc': return 'Link with HoYoLAB to sync in-game data';
			case 'releaseNotesPage.featureUpdates': return 'Feature Updates';
			case 'releaseNotesPage.assetUpdates': return 'Asset Updates';
			case 'settingsPage.display': return 'Display';
			case 'settingsPage.showItemNameOnCard': return 'Show Item Name on Card';
			case 'settingsPage.showItemNameOnCardDesc': return 'Show the item name on the card that displays the number of uses.';
			case 'settingsPage.dailyResetServer': return 'Daily Material Server Time';
			case 'settingsPage.dailyResetServerDesc': return 'Select the game server to use as the reference time for daily materials reset.';
			case 'settingsPage.assetData': return 'Assets';
			case 'settingsPage.checkAssetUpdate': return 'Check Asset Update';
			case 'settingsPage.checkAssetUpdateDesc': return 'Check for updates to the app\'s assets.';
			case 'settingsPage.reDownloadAssets': return 'Re-download Assets';
			case 'settingsPage.reDownloadAssetsDesc': return 'Please try this if the assets of the app are not loading properly.';
			case 'settingsPage.others': return 'Others';
			case 'settingsPage.openSourceLicenses': return 'Open Source Licenses';
			case 'settingsPage.noUpdateAvailable': return 'No update available.';
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
			case 'hoyolab.noGameRoleFound': return 'No game user found.';
			case 'hoyolab.failedToSyncGameData': return 'Failed to sync game data.';
			case 'hoyolab.failedToLoadPermissionState': return 'Failed to load permission state.';
			case 'hoyolab.characterDataAccessNotAllowed': return 'Character data access is not allowed. Please allow access from HoYoLAB integration settings.';
			case 'hoyolab.characterDoesNotExist': return 'You do not own this character.';
			case 'hoyolab.realtimeNotesNotEnabled': return 'Real-time notes are not enabled. Please enable it in the HoYoLAB integration settings.';
			case 'hoyolab.loginExpired': return 'Please sign out and sign in again.';
			case 'hoyolab.accessPermission': return 'Access Permission';
			case 'hoyolab.doYouWantToEnableRealtimeNotes': return 'Enable Real-Time Notes?';
			case 'hoyolab.characterDataAccess': return 'Character Data Access';
			case 'hoyolab.enableRealtimeNotes': return 'Enable Real-Time Notes';
			case 'hoyolab.enableRealtimeNotesDesc': return 'You will be able to sync your current Original Resin count.';
			case 'hoyolab.syncSettings': return 'Sync Settings';
			case 'hoyolab.syncResin': return 'Sync In-Game Resin Count';
			case 'hoyolab.syncCharaState': return 'Sync In-Game Character Levels';
			case 'hoyolab.mustBeResonatedWithStatue': return 'This character must be resonated with the Statue of The Seven to be able to sync game data.';
			case 'hoyolab.charaSyncSuccess': return 'Successfully synced game data';
			case 'whereToGet.chests': return 'Chests, Quests';
			default: return null;
		}
	}
}
