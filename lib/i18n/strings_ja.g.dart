///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final tr = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// ja: '原神素材ノート'
	String get appName => '原神素材ノート';

	late final TranslationsCommonJa common = TranslationsCommonJa.internal(_root);
	late final TranslationsSearchJa search = TranslationsSearchJa.internal(_root);
	late final TranslationsTutorialJa tutorial = TranslationsTutorialJa.internal(_root);
	Map<String, String> get purposes => {
		'ascension': 'Lvアップ・突破',
		'normalAttack': '通常攻撃',
		'elementalSkill': '元素スキル',
		'elementalBurst': '元素爆発',
	};
	Map<String, String> get talentTypes => {
		'normalAttack': '通常攻撃',
		'elementalSkill': '元素スキル',
		'elementalBurst': '元素爆発',
	};
	late final TranslationsUpdatesJa updates = TranslationsUpdatesJa.internal(_root);
	late final TranslationsErrorsJa errors = TranslationsErrorsJa.internal(_root);
	late final TranslationsPagesJa pages = TranslationsPagesJa.internal(_root);
	late final TranslationsBookmarksPageJa bookmarksPage = TranslationsBookmarksPageJa.internal(_root);
	late final TranslationsCharacterDetailsPageJa characterDetailsPage = TranslationsCharacterDetailsPageJa.internal(_root);
	late final TranslationsWeaponDetailsPageJa weaponDetailsPage = TranslationsWeaponDetailsPageJa.internal(_root);
	late final TranslationsMaterialDetailsPageJa materialDetailsPage = TranslationsMaterialDetailsPageJa.internal(_root);
	late final TranslationsMaterialCardJa materialCard = TranslationsMaterialCardJa.internal(_root);
	late final TranslationsArtifactsPageJa artifactsPage = TranslationsArtifactsPageJa.internal(_root);
	late final TranslationsArtifactDetailsPageJa artifactDetailsPage = TranslationsArtifactDetailsPageJa.internal(_root);
	late final TranslationsFurnishingSetsPageJa furnishingSetsPage = TranslationsFurnishingSetsPageJa.internal(_root);
	late final TranslationsDailyPageJa dailyPage = TranslationsDailyPageJa.internal(_root);
	late final TranslationsResinCalcPageJa resinCalcPage = TranslationsResinCalcPageJa.internal(_root);
	late final TranslationsMorePageJa morePage = TranslationsMorePageJa.internal(_root);
	late final TranslationsReleaseNotesPageJa releaseNotesPage = TranslationsReleaseNotesPageJa.internal(_root);
	late final TranslationsSettingsPageJa settingsPage = TranslationsSettingsPageJa.internal(_root);
	late final TranslationsFarmCountSettingsPageJa farmCountSettingsPage = TranslationsFarmCountSettingsPageJa.internal(_root);
	late final TranslationsHoyolabJa hoyolab = TranslationsHoyolabJa.internal(_root);
	Map<String, String> get whereToGet => {
		'chests': '宝箱、任務報酬など',
	};
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'OK'
	String get ok => 'OK';

	/// ja: 'キャンセル'
	String get cancel => 'キャンセル';

	/// ja: 'サインアウト'
	String get signOut => 'サインアウト';

	/// ja: '利用規約'
	String get tos => '利用規約';

	/// ja: 'プライバシーポリシー'
	String get privacyPolicy => 'プライバシーポリシー';

	/// ja: 'エラーが発生しました。'
	String get error => 'エラーが発生しました。';

	/// ja: '目標レベル'
	String get goalLevel => '目標レベル';

	/// ja: '現在レベル'
	String get currentLevel => '現在レベル';

	/// ja: '目次'
	String get index => '目次';

	/// ja: '(other) {$n${unit(秒)}}'
	TextSpan seconds({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
		other: () => TextSpan(children: [
			nBuilder(n),
			unit('秒'),
		]),
	);

	/// ja: '(other) {$n${unit(分)}}'
	TextSpan minutes({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
		other: () => TextSpan(children: [
			nBuilder(n),
			unit('分'),
		]),
	);

	/// ja: '(other) {$n${unit(時間)}}'
	TextSpan hours({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge(
		n: n,
		resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'),
		other: () => TextSpan(children: [
			nBuilder(n),
			unit('時間'),
		]),
	);

	/// ja: '元素'
	String get element => '元素';

	/// ja: 'レアリティ'
	String get rarity => 'レアリティ';

	/// ja: '武器種'
	String get weaponType => '武器種';

	/// ja: 'クリア'
	String get clear => 'クリア';

	/// ja: '保存'
	String get save => '保存';

	/// ja: '次へ'
	String get next => '次へ';

	/// ja: '変更'
	String get change => '変更';

	/// ja: '選択してください'
	String get pleaseSelect => '選択してください';

	/// ja: '並べ替え'
	String get sort => '並べ替え';

	/// ja: '並べ替え方法'
	String get sortType => '並べ替え方法';

	Map<String, String> get sortTypes => {
		'defaultSort': 'デフォルト',
		'name': '名前順',
		'element': '元素順',
		'rarity': 'レアリティ順',
	};

	/// ja: '元に戻す'
	String get undo => '元に戻す';

	/// ja: 'ブックマークしました'
	String get bookmarkSaved => 'ブックマークしました';

	/// ja: '育成完了のブックマークを解除しました'
	String get removedObsoleteBookmarks => '育成完了のブックマークを解除しました';

	/// ja: 'なし'
	String get none => 'なし';

	/// ja: 'スライダーが反応しづらい場合、丸い部分を長押ししたままスライドするか、選択範囲の外側をスライドするとスムーズに操作できます。'
	String get sliderTips => 'スライダーが反応しづらい場合、丸い部分を長押ししたままスライドするか、選択範囲の外側をスライドするとスムーズに操作できます。';

	/// ja: '選択中: $character'
	String selected({required Object character}) => '選択中: ${character}';

	/// ja: '所持'
	String get possession => '所持';

	Map<String, String> get possessionStatus => {
		'owned': '所持',
		'notOwned': '未所持',
	};

	/// ja: 'HoYoLABと連携すると、所持状況を同期できます。'
	String get possessionNoteNotSignedIn => 'HoYoLABと連携すると、所持状況を同期できます。';

	/// ja: '1回以上キャラクターページを開いて同期したキャラクターのみが「所持」として表示されます。'
	String get possessionNote => '1回以上キャラクターページを開いて同期したキャラクターのみが「所持」として表示されます。';

	/// ja: '閉じる'
	String get dismiss => '閉じる';
}

// Path: search
class TranslationsSearchJa {
	TranslationsSearchJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '$targetを検索...'
	String hint({required Object target}) => '${target}を検索...';

	/// ja: '検索結果が見つかりません'
	String get noResults => '検索結果が見つかりません';

	late final TranslationsSearchTargetsJa targets = TranslationsSearchTargetsJa.internal(_root);
}

// Path: tutorial
class TranslationsTutorialJa {
	TranslationsTutorialJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '目次の表示'
	String get indexSheet => '目次の表示';

	/// ja: 'このボタンをタップすると、お探しの項目へ素早く移動できます。'
	String get indexSheetDesc => 'このボタンをタップすると、お探しの項目へ素早く移動できます。';
}

// Path: updates
class TranslationsUpdatesJa {
	TranslationsUpdatesJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'データ更新をダウンロードしています…'
	String get downloading => 'データ更新をダウンロードしています…';

	/// ja: 'データの読み込みに失敗しました。「設定」→「アセットデータを再ダウンロード」から再ダウンロードをお試しください。'
	String get failedToLoad => 'データの読み込みに失敗しました。「設定」→「アセットデータを再ダウンロード」から再ダウンロードをお試しください。';

	/// ja: 'データ更新のダウンロードに失敗しました。'
	String get failedToDownload => 'データ更新のダウンロードに失敗しました。';

	/// ja: 'データ更新のインストールに失敗しました。'
	String get failedToInstall => 'データ更新のインストールに失敗しました。';

	/// ja: 'データ更新の確認に失敗しました。'
	String get failedToCheck => 'データ更新の確認に失敗しました。';

	/// ja: 'アプリを最新版にアップデートしてください。'
	String get schemaVersionMismatch => 'アプリを最新版にアップデートしてください。';

	/// ja: 'アプリを最新版にアップデートしてください。'
	String get noCompatibleAsset => 'アプリを最新版にアップデートしてください。';

	/// ja: 'インターネット接続をご確認ください。'
	String get noInternet => 'インターネット接続をご確認ください。';

	/// ja: 'アップデートはありません'
	String get noUpdateAvailable => 'アップデートはありません';

	/// ja: '更新が完了しました。'
	String get completed => '更新が完了しました。';

	/// ja: 'インストールしています...'
	String get installing => 'インストールしています...';

	/// ja: 'データ更新が完了するまでお待ちください。'
	String get pleaseWaitUntilComplete => 'データ更新が完了するまでお待ちください。';
}

// Path: errors
class TranslationsErrorsJa {
	TranslationsErrorsJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'キャラクターが見つかりません'
	String get characterNotFound => 'キャラクターが見つかりません';

	/// ja: '武器が見つかりません'
	String get weaponNotFound => '武器が見つかりません';

	/// ja: '素材が見つかりません'
	String get materialNotFound => '素材が見つかりません';

	/// ja: '聖遺物が見つかりません'
	String get artifactNotFound => '聖遺物が見つかりません';

	/// ja: 'しばらくしてから再度お試しください。'
	String get tryAgainLater => 'しばらくしてから再度お試しください。';

	/// ja: 'データベースエラーが発生しました。'
	String get dbError => 'データベースエラーが発生しました。';
}

// Path: pages
class TranslationsPagesJa {
	TranslationsPagesJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'キャラクター'
	String get characters => 'キャラクター';

	/// ja: '$character - キャラクター'
	String characterDetails({required Object character}) => '${character} - キャラクター';

	/// ja: '武器'
	String get weapons => '武器';

	/// ja: '$weapon - 武器'
	String weaponDetails({required Object weapon}) => '${weapon} - 武器';

	/// ja: '素材一覧(逆引き)'
	String get materials => '素材一覧(逆引き)';

	/// ja: '$material - 素材'
	String materialDetails({required Object material}) => '${material} - 素材';

	/// ja: '聖遺物'
	String get artifacts => '聖遺物';

	/// ja: '$artifact - 聖遺物'
	String artifactDetails({required Object artifact}) => '${artifact} - 聖遺物';

	/// ja: '調度品セット'
	String get furnishingSets => '調度品セット';

	/// ja: '$furnishingSet - 調度品セット'
	String furnishingSetDetails({required Object furnishingSet}) => '${furnishingSet} - 調度品セット';

	/// ja: '調度品'
	String get furnishings => '調度品';

	/// ja: '$furnishing - 調度品'
	String furnishingDetails({required Object furnishing}) => '${furnishing} - 調度品';

	/// ja: '設定'
	String get settings => '設定';

	/// ja: '周回数目安の表示設定'
	String get farmCountSettings => '周回数目安の表示設定';

	/// ja: 'アカウント'
	String get account => 'アカウント';

	/// ja: '更新履歴'
	String get releaseNotes => '更新履歴';

	/// ja: 'ブックマーク'
	String get bookmarks => 'ブックマーク';

	/// ja: 'データベース'
	String get database => 'データベース';

	/// ja: '日替わり素材'
	String get daily => '日替わり素材';

	/// ja: 'ツール'
	String get tools => 'ツール';

	/// ja: '樹脂回復時刻計算機'
	String get resinCalc => '樹脂回復時刻計算機';

	/// ja: '祈願天井カウンター'
	String get wishes => '祈願天井カウンター';

	/// ja: 'その他'
	String get more => 'その他';

	/// ja: 'HoYoLAB連携設定'
	String get hoyolabIntegrationSettings => 'HoYoLAB連携設定';
}

// Path: bookmarksPage
class TranslationsBookmarksPageJa {
	TranslationsBookmarksPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ブックマークがありません。「データベース」タブから探してみましょう！'
	String get noBookmarks => 'ブックマークがありません。「データベース」タブから探してみましょう！';

	/// ja: 'キャラクター'
	String get character => 'キャラクター';

	/// ja: '武器'
	String get weapon => '武器';

	/// ja: '聖遺物セット'
	String get artifactSet => '聖遺物セット';

	/// ja: '聖遺物'
	String get artifactPiece => '聖遺物';

	/// ja: 'メイン'
	String get main => 'メイン';

	/// ja: 'サブ'
	String get sub => 'サブ';

	/// ja: 'ブックマークを解除'
	String get unBookmark => 'ブックマークを解除';

	/// ja: 'このブックマークを解除しますか？'
	String get unBookmarkConfirm => 'このブックマークを解除しますか？';

	/// ja: '使用先'
	String get byPurpose => '使用先';

	/// ja: '素材'
	String get byMaterial => '素材';

	/// ja: '調度品'
	String get furnishings => '調度品';

	/// ja: 'すべての調度品が作成済みです'
	String get allFurnishingsAreCrafted => 'すべての調度品が作成済みです';
}

// Path: characterDetailsPage
class TranslationsCharacterDetailsPageJa {
	TranslationsCharacterDetailsPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '装備中の武器'
	String get equippedWeapon => '装備中の武器';

	/// ja: '好きな調度品セット'
	String get favoriteFurnishingSets => '好きな調度品セット';
}

// Path: weaponDetailsPage
class TranslationsWeaponDetailsPageJa {
	TranslationsWeaponDetailsPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '武器を装備させるキャラクター'
	String get characterToEquip => '武器を装備させるキャラクター';

	/// ja: 'スキル効果'
	String get skillEffect => 'スキル効果';
}

// Path: materialDetailsPage
class TranslationsMaterialDetailsPageJa {
	TranslationsMaterialDetailsPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'この素材を使用するキャラクター'
	String get charactersUsing => 'この素材を使用するキャラクター';

	/// ja: 'この素材を使用する武器'
	String get weaponsUsing => 'この素材を使用する武器';

	/// ja: '本日入手可能'
	String get availableToday => '本日入手可能';

	/// ja: '入手方法'
	String get source => '入手方法';

	/// ja: 'テイワットマップへ'
	String get toTeyvatMap => 'テイワットマップへ';
}

// Path: materialCard
class TranslationsMaterialCardJa {
	TranslationsMaterialCardJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '現在の範囲で再ブックマーク'
	String get reBookmark => '現在の範囲で再ブックマーク';

	/// ja: '一旦この素材のブックマークを解除し、現在のスライダーの範囲で再度ブックマークします'
	String get reBookmarkDesc => '一旦この素材のブックマークを解除し、現在のスライダーの範囲で再度ブックマークします';

	/// ja: 'ブックマークを解除'
	String get unBookmark => 'ブックマークを解除';

	/// ja: 'この素材のブックマークを解除します'
	String get unBookmarkDesc => 'この素材のブックマークを解除します';

	/// ja: 'ブックマークを解除しました'
	String get unBookmarked => 'ブックマークを解除しました';
}

// Path: artifactsPage
class TranslationsArtifactsPageJa {
	TranslationsArtifactsPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	Map<String, String> get bonusTypes => {
		'1-pc': '1セット効果',
		'2-pc': '2セット効果',
		'4-pc': '4セット効果',
	};

	/// ja: 'セット効果リスト'
	String get effectList => 'セット効果リスト';

	/// ja: '効果の種類'
	String get kindOfEffect => '効果の種類';

	/// ja: '※本フィルタリング機能は☆5聖遺物に対してのみ機能します。また、選択したものをすべて満たす聖遺物を表示します。'
	String get effectFilteringNote => '※本フィルタリング機能は☆5聖遺物に対してのみ機能します。また、選択したものをすべて満たす聖遺物を表示します。';
}

// Path: artifactDetailsPage
class TranslationsArtifactDetailsPageJa {
	TranslationsArtifactDetailsPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '最高レアリティ'
	String get maxRarity => '最高レアリティ';

	/// ja: 'セットをブックマーク'
	String get bookmarkSet => 'セットをブックマーク';

	/// ja: '部位ごとにブックマーク'
	String get bookmarkPiece => '部位ごとにブックマーク';

	/// ja: '2 + 2 セットをブックマーク'
	String get bookmarkTwoAndTwoPcSet => '2 + 2 セットをブックマーク';

	/// ja: '4 セットをブックマーク'
	String get bookmarkFourPcSet => '4 セットをブックマーク';

	/// ja: '聖遺物をブックマーク'
	String get bookmarkArtifacts => '聖遺物をブックマーク';

	/// ja: '聖遺物を装備させるキャラクター'
	String get characterToEquip => '聖遺物を装備させるキャラクター';

	/// ja: '2個目のセットを選択'
	String get chooseSecondSet => '2個目のセットを選択';

	/// ja: '2個目の聖遺物セットを選択してください'
	String get chooseSecondSetDesc => '2個目の聖遺物セットを選択してください';

	/// ja: 'メインステータス'
	String get mainStat => 'メインステータス';

	/// ja: 'メインステータス ($pieceType)'
	String mainStatWithPieceType({required Object pieceType}) => '${_root.artifactDetailsPage.mainStat} (${pieceType})';

	/// ja: 'サブステータス'
	String get subStats => 'サブステータス';

	/// ja: '指定しない'
	String get unspecified => '指定しない';

	/// ja: '$nセット'
	String nSet({required Object n}) => '${n}セット';
}

// Path: furnishingSetsPage
class TranslationsFurnishingSetsPageJa {
	TranslationsFurnishingSetsPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '調度品一覧'
	String get furnishingList => '調度品一覧';

	/// ja: '種類'
	String get type => '種類';

	/// ja: '画像'
	String get image => '画像';

	/// ja: '名前'
	String get name => '名前';

	/// ja: '必要数 (長押しで一括変更)'
	String get requiredQuantity => '必要数 (長押しで一括変更)';

	/// ja: '入手方法'
	String get source => '入手方法';

	/// ja: '左右にスクロールできます'
	String get canBeScrolledHorizontally => '左右にスクロールできます';

	/// ja: '作成数をリセット'
	String get resetCraftCount => '作成数をリセット';

	/// ja: 'セット内の調度品の作成数をすべてリセットしますか？'
	String get resetCraftCountConfirm => 'セット内の調度品の作成数をすべてリセットしますか？';

	/// ja: 'この調度品セットが好きなキャラクター'
	String get favoredBy => 'この調度品セットが好きなキャラクター';

	/// ja: 'ブックマークしました'
	String get addedToBookmarks => 'ブックマークしました';

	/// ja: 'ブックマークを解除しました'
	String get removedFromBookmarks => 'ブックマークを解除しました';

	/// ja: 'この調度品を使用する調度品セット'
	String get furnishingSetsUsingThisFurnishing => 'この調度品を使用する調度品セット';
}

// Path: dailyPage
class TranslationsDailyPageJa {
	TranslationsDailyPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '月/木'
	String get mondayAndThursday => '月/木';

	/// ja: '火/金'
	String get tuesdayAndFriday => '火/金';

	/// ja: '水/土'
	String get wednesdayAndSaturday => '水/土';

	/// ja: '天賦素材'
	String get talentMaterials => '天賦素材';

	/// ja: '武器素材'
	String get weaponMaterials => '武器素材';
}

// Path: resinCalcPage
class TranslationsResinCalcPageJa {
	TranslationsResinCalcPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '現在の樹脂数'
	String get currentResin => '現在の樹脂数';

	/// ja: '樹脂数'
	String get resin => '樹脂数';

	/// ja: '回復時刻'
	String get recoveryTime => '回復時刻';

	/// ja: '回復まであと'
	String get untilRecovery => '回復まであと';

	/// ja: '$time${text(に全回復)}'
	TextSpan fullyReplenishedAt({required InlineSpan time, required InlineSpanBuilder text}) => TextSpan(children: [
		time,
		text('に全回復'),
	]);

	/// ja: '${text(あと)}$time'
	TextSpan recoversIn({required InlineSpanBuilder text, required InlineSpan time}) => TextSpan(children: [
		text('あと'),
		time,
	]);

	/// ja: '($time ${text(現在)})'
	TextSpan asOf({required InlineSpan time, required InlineSpanBuilder text}) => TextSpan(children: [
		const TextSpan(text: '('),
		time,
		const TextSpan(text: ' '),
		text('現在'),
		const TextSpan(text: ')'),
	]);

	/// ja: '全回復した時刻'
	String get recoveredTime => '全回復した時刻';

	/// ja: '無駄にした樹脂'
	String get wastedResin => '無駄にした樹脂';

	/// ja: '明日'
	String get tomorrow => '明日';

	/// ja: 'すでに全回復しました'
	String get alreadyFull => 'すでに全回復しました';

	/// ja: '使い方'
	String get howToUse => '使い方';

	/// ja: '現在の樹脂数を入力すると、入力した地点での時間を基準に、樹脂が全回復する時刻と、全回復するまでの時間を計算します。 HoYoLAB連携設定で連携すると、現在の樹脂数を同期できるようになります。この機能を利用する場合「全回復した時刻」「無駄にした樹脂」は、最後に樹脂を使用もしくはアイテム等で回復してから一度も同期していなかった場合には、正確に算出されませんのでご了承ください。 '
	String get howToUseContent => '現在の樹脂数を入力すると、入力した地点での時間を基準に、樹脂が全回復する時刻と、全回復するまでの時間を計算します。\n${_root.pages.hoyolabIntegrationSettings}で連携すると、現在の樹脂数を同期できるようになります。この機能を利用する場合「${_root.resinCalcPage.recoveredTime}」「${_root.resinCalcPage.wastedResin}」は、最後に樹脂を使用もしくはアイテム等で回復してから一度も同期していなかった場合には、正確に算出されませんのでご了承ください。\n';
}

// Path: morePage
class TranslationsMorePageJa {
	TranslationsMorePageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ブックマーク等をデバイス間で同期できます。'
	String get accountDesc => 'ブックマーク等をデバイス間で同期できます。';

	/// ja: 'HoYoLABと連携し、ゲーム内のデータと同期できます。'
	String get hoyolabIntegrationSettingsDesc => 'HoYoLABと連携し、ゲーム内のデータと同期できます。';

	/// ja: 'GitHub'
	String get github => 'GitHub';

	/// ja: '本アプリのソースコードを閲覧できます。'
	String get githubDesc => '本アプリのソースコードを閲覧できます。';

	/// ja: 'コーヒーをおごる'
	String get buyMeACoffee => 'コーヒーをおごる';

	/// ja: 'だいぶ喜びます。'
	String get buyMeACoffeeDesc => 'だいぶ喜びます。';

	/// ja: 'X（告知用）'
	String get x => 'X（告知用）';

	/// ja: '本アプリに関するお知らせを掲載しています。'
	String get xDesc => '本アプリに関するお知らせを掲載しています。';
}

// Path: releaseNotesPage
class TranslationsReleaseNotesPageJa {
	TranslationsReleaseNotesPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '機能更新'
	String get featureUpdates => '機能更新';

	/// ja: 'データ更新'
	String get assetUpdates => 'データ更新';
}

// Path: settingsPage
class TranslationsSettingsPageJa {
	TranslationsSettingsPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '表示'
	String get display => '表示';

	/// ja: '素材のアイテム名を表示'
	String get showItemNameOnCard => '素材のアイテム名を表示';

	/// ja: '使用数を表示するカードにアイテム名を表示します。'
	String get showItemNameOnCardDesc => '使用数を表示するカードにアイテム名を表示します。';

	/// ja: '日替わり素材のサーバー時間'
	String get dailyResetServer => '日替わり素材のサーバー時間';

	/// ja: '日替わり素材が更新される時間の基準とするゲームサーバーを選択します。'
	String get dailyResetServerDesc => '日替わり素材が更新される時間の基準とするゲームサーバーを選択します。';

	/// ja: '表示に使用する冒険ランクなどを設定できます。'
	String get farmCountSettingsDesc => '表示に使用する冒険ランクなどを設定できます。';

	/// ja: 'アセットデータ'
	String get assetData => 'アセットデータ';

	/// ja: 'アセットデータの更新を確認'
	String get checkAssetUpdate => 'アセットデータの更新を確認';

	/// ja: 'アプリ内データのアップデートをチェックします。'
	String get checkAssetUpdateDesc => 'アプリ内データのアップデートをチェックします。';

	/// ja: 'アセットデータを再ダウンロード'
	String get reDownloadAssets => 'アセットデータを再ダウンロード';

	/// ja: 'アプリの画像やキャラクター等が正常に読み込まれない場合にお試しください。'
	String get reDownloadAssetsDesc => 'アプリの画像やキャラクター等が正常に読み込まれない場合にお試しください。';

	/// ja: 'オープンソースライセンス'
	String get openSourceLicenses => 'オープンソースライセンス';
}

// Path: farmCountSettingsPage
class TranslationsFarmCountSettingsPageJa {
	TranslationsFarmCountSettingsPageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '周回目安回数を表示する'
	String get showFarmCount => '周回目安回数を表示する';

	/// ja: '冒険ランク'
	String get adventureRank => '冒険ランク';

	/// ja: '濃縮樹脂等使用時の獲得数の倍率'
	String get skipRate => '濃縮樹脂等使用時の獲得数の倍率';

	/// ja: 'ドロップ率一覧'
	String get dropRateList => 'ドロップ率一覧';

	/// ja: '種類'
	String get kind => '種類';

	/// ja: 'ドロップ率（個/回）'
	String get rate => 'ドロップ率（個/回）';

	/// ja: '備考'
	String get note => '備考';

	/// ja: '${n}倍'
	String multiplier({required Object n}) => '${n}倍';

	/// ja: '（濃縮樹脂を使用しない）'
	String get noUseCondensed => '（濃縮樹脂を使用しない）';
}

// Path: hoyolab
class TranslationsHoyolabJa {
	TranslationsHoyolabJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'HoYoLABにサインイン'
	String get signIn => 'HoYoLABにサインイン';

	/// ja: 'HoYoLAB連携について'
	String get aboutHeading => 'HoYoLAB連携について';

	/// ja: '本アプリ内でHoYoLABアカウントにログインすることで、もっと便利にアプリを利用できるようになります。例えば、バッグ内にあるアイテムの数、キャラクター・武器のレベルなどを本アプリに反映させ、バッグ内の不足数を直接確認することができます。 HoYoLABの認証情報、UIDは端末内に安全に保存され、HoYoLABのAPIと直接やり取りをする仕組みとなっています。私も含め、それ以外の外部にこれらのデータを送信することはありません。詳しいデータの流れや保存方法については、本アプリのソース公開をもって透明性を担保しています。 ※本機能はグローバル版（HoYoLAB）でのみ利用可能です。中国本土版（米游社）には対応していません。 ※万が一本機能の利用によってアカウントに何らかの問題が生じた場合、本アプリの開発者は一切の責任を負いかねますので、ご了承ください。 '
	String get about => '本アプリ内でHoYoLABアカウントにログインすることで、もっと便利にアプリを利用できるようになります。例えば、バッグ内にあるアイテムの数、キャラクター・武器のレベルなどを本アプリに反映させ、バッグ内の不足数を直接確認することができます。\n\nHoYoLABの認証情報、UIDは端末内に安全に保存され、HoYoLABのAPIと直接やり取りをする仕組みとなっています。私も含め、それ以外の外部にこれらのデータを送信することはありません。詳しいデータの流れや保存方法については、本アプリのソース公開をもって透明性を担保しています。\n\n※本機能はグローバル版（HoYoLAB）でのみ利用可能です。中国本土版（米游社）には対応していません。\n※万が一本機能の利用によってアカウントに何らかの問題が生じた場合、本アプリの開発者は一切の責任を負いかねますので、ご了承ください。\n';

	/// ja: 'HoYoLABとの連携を解除'
	String get signOut => 'HoYoLABとの連携を解除';

	/// ja: '※ソーシャルログインは利用できません。ユーザー名/メールアドレスとパスワードでログインしてください。'
	String get signInNote => '※ソーシャルログインは利用できません。ユーザー名/メールアドレスとパスワードでログインしてください。';

	/// ja: 'HoYoLABへのサインインに失敗しました。'
	String get failedToSignIn => 'HoYoLABへのサインインに失敗しました。';

	/// ja: 'HoYoLABとの連携を解除しますか？'
	String get signOutConfirm => 'HoYoLABとの連携を解除しますか？';

	/// ja: 'ログイン情報の検証に失敗しました。再度ログインしてください。'
	String get credentialVerificationFailed => 'ログイン情報の検証に失敗しました。再度ログインしてください。';

	/// ja: 'サーバーの変更'
	String get changeServer => 'サーバーの変更';

	/// ja: 'サーバー選択'
	String get serverSelect => 'サーバー選択';

	/// ja: '現在の設定: $server'
	String current({required Object server}) => '現在の設定: ${server}';

	/// ja: 'サーバーが選択されていません'
	String get noServerSelected => 'サーバーが選択されていません';

	/// ja: 'サーバーを選択してください'
	String get plsSelectServer => 'サーバーを選択してください';

	/// ja: 'ユーザー情報'
	String get userInfo => 'ユーザー情報';

	/// ja: 'サーバーリストの読み込みに失敗しました。'
	String get failedToLoadServerList => 'サーバーリストの読み込みに失敗しました。';

	/// ja: 'ゲームデータの読み込みに失敗しました。'
	String get failedToLoadGameRole => 'ゲームデータの読み込みに失敗しました。';

	/// ja: 'ゲームデータが見つかりません'
	String get noGameRoleFound => 'ゲームデータが見つかりません';

	/// ja: 'ゲームデータの同期に失敗しました。'
	String get failedToSyncGameData => 'ゲームデータの同期に失敗しました。';

	/// ja: 'アクセス許可状態の取得に失敗しました。'
	String get failedToLoadPermissionState => 'アクセス許可状態の取得に失敗しました。';

	/// ja: 'キャラクターデータへのアクセスが許可されていません。HoYoLAB連携設定より許可してください。'
	String get characterDataAccessNotAllowed => 'キャラクターデータへのアクセスが許可されていません。HoYoLAB連携設定より許可してください。';

	/// ja: 'キャラクターを所持していません。'
	String get characterDoesNotExist => 'キャラクターを所持していません。';

	/// ja: 'リアルタイムノートが有効化されていません。HoYoLAB連携設定より有効化してください。'
	String get realtimeNotesNotEnabled => 'リアルタイムノートが有効化されていません。HoYoLAB連携設定より有効化してください。';

	/// ja: '一度連携を解除し、再度ログインしてください。'
	String get loginExpired => '一度連携を解除し、再度ログインしてください。';

	/// ja: 'アクセス許可'
	String get accessPermission => 'アクセス許可';

	/// ja: 'リアルタイムノートを有効化しますか？'
	String get doYouWantToEnableRealtimeNotes => 'リアルタイムノートを有効化しますか？';

	/// ja: 'リアルタイムノートの有効化'
	String get enableRealtimeNotes => 'リアルタイムノートの有効化';

	/// ja: '現在の天然樹脂の数を同期できるようになります。'
	String get enableRealtimeNotesDesc => '現在の天然樹脂の数を同期できるようになります。';

	/// ja: '同期設定'
	String get syncSettings => '同期設定';

	/// ja: 'ゲーム内の樹脂数を同期する'
	String get syncResin => 'ゲーム内の樹脂数を同期する';

	/// ja: 'ゲーム内のキャラレベルを同期する'
	String get syncCharaState => 'ゲーム内のキャラレベルを同期する';

	/// ja: 'ゲーム内の武器レベルを同期する'
	String get syncWeaponState => 'ゲーム内の武器レベルを同期する';

	/// ja: 'ゲーム内のバッグ不足数を同期する'
	String get syncBagLackNums => 'ゲーム内のバッグ不足数を同期する';

	/// ja: '育成完了のブックマークを自動解除する'
	String get autoRemoveBookmarks => '育成完了のブックマークを自動解除する';

	/// ja: 'キャラクターページもしくは武器ページを開いた際、素材ブックマークを自動的に解除します。'
	String get autoRemoveBookmarksDesc => 'キャラクターページもしくは武器ページを開いた際、素材ブックマークを自動的に解除します。';

	/// ja: '旅人のレベルを同期するには、七天神像で該当する元素と共鳴する必要があります。'
	String get mustBeResonatedWithStatue => '旅人のレベルを同期するには、七天神像で該当する元素と共鳴する必要があります。';

	/// ja: 'このキャラクターはこの武器を装備していません。'
	String get weaponNotEquipped => 'このキャラクターはこの武器を装備していません。';

	/// ja: '不明なエラーが発生しました。'
	String get unknownError => '不明なエラーが発生しました。';

	/// ja: 'ゲームデータと同期しました'
	String get charaSyncSuccess => 'ゲームデータと同期しました';
}

// Path: search.targets
class TranslationsSearchTargetsJa {
	TranslationsSearchTargetsJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'キャラクター'
	String get characters => 'キャラクター';

	/// ja: '武器'
	String get weapons => '武器';

	/// ja: '素材'
	String get materials => '素材';

	/// ja: '聖遺物セット'
	String get artifactSets => '聖遺物セット';

	/// ja: '聖遺物部位'
	String get artifactPieces => '聖遺物部位';

	/// ja: '調度品セット'
	String get furnishingSets => '調度品セット';

	/// ja: '調度品'
	String get furnishings => '調度品';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => '原神素材ノート',
			'common.ok' => 'OK',
			'common.cancel' => 'キャンセル',
			'common.signOut' => 'サインアウト',
			'common.tos' => '利用規約',
			'common.privacyPolicy' => 'プライバシーポリシー',
			'common.error' => 'エラーが発生しました。',
			'common.goalLevel' => '目標レベル',
			'common.currentLevel' => '現在レベル',
			'common.index' => '目次',
			'common.seconds' => ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge( n: n, resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'), other: () => TextSpan(children: [ nBuilder(n), unit('秒'), ]), ), 
			'common.minutes' => ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge( n: n, resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'), other: () => TextSpan(children: [ nBuilder(n), unit('分'), ]), ), 
			'common.hours' => ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge( n: n, resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'), other: () => TextSpan(children: [ nBuilder(n), unit('時間'), ]), ), 
			'common.element' => '元素',
			'common.rarity' => 'レアリティ',
			'common.weaponType' => '武器種',
			'common.clear' => 'クリア',
			'common.save' => '保存',
			'common.next' => '次へ',
			'common.change' => '変更',
			'common.pleaseSelect' => '選択してください',
			'common.sort' => '並べ替え',
			'common.sortType' => '並べ替え方法',
			'common.sortTypes.defaultSort' => 'デフォルト',
			'common.sortTypes.name' => '名前順',
			'common.sortTypes.element' => '元素順',
			'common.sortTypes.rarity' => 'レアリティ順',
			'common.undo' => '元に戻す',
			'common.bookmarkSaved' => 'ブックマークしました',
			'common.removedObsoleteBookmarks' => '育成完了のブックマークを解除しました',
			'common.none' => 'なし',
			'common.sliderTips' => 'スライダーが反応しづらい場合、丸い部分を長押ししたままスライドするか、選択範囲の外側をスライドするとスムーズに操作できます。',
			'common.selected' => ({required Object character}) => '選択中: ${character}',
			'common.possession' => '所持',
			'common.possessionStatus.owned' => '所持',
			'common.possessionStatus.notOwned' => '未所持',
			'common.possessionNoteNotSignedIn' => 'HoYoLABと連携すると、所持状況を同期できます。',
			'common.possessionNote' => '1回以上キャラクターページを開いて同期したキャラクターのみが「所持」として表示されます。',
			'common.dismiss' => '閉じる',
			'search.hint' => ({required Object target}) => '${target}を検索...',
			'search.noResults' => '検索結果が見つかりません',
			'search.targets.characters' => 'キャラクター',
			'search.targets.weapons' => '武器',
			'search.targets.materials' => '素材',
			'search.targets.artifactSets' => '聖遺物セット',
			'search.targets.artifactPieces' => '聖遺物部位',
			'search.targets.furnishingSets' => '調度品セット',
			'search.targets.furnishings' => '調度品',
			'tutorial.indexSheet' => '目次の表示',
			'tutorial.indexSheetDesc' => 'このボタンをタップすると、お探しの項目へ素早く移動できます。',
			'purposes.ascension' => 'Lvアップ・突破',
			'purposes.normalAttack' => '通常攻撃',
			'purposes.elementalSkill' => '元素スキル',
			'purposes.elementalBurst' => '元素爆発',
			'talentTypes.normalAttack' => '通常攻撃',
			'talentTypes.elementalSkill' => '元素スキル',
			'talentTypes.elementalBurst' => '元素爆発',
			'updates.downloading' => 'データ更新をダウンロードしています…',
			'updates.failedToLoad' => 'データの読み込みに失敗しました。「設定」→「アセットデータを再ダウンロード」から再ダウンロードをお試しください。',
			'updates.failedToDownload' => 'データ更新のダウンロードに失敗しました。',
			'updates.failedToInstall' => 'データ更新のインストールに失敗しました。',
			'updates.failedToCheck' => 'データ更新の確認に失敗しました。',
			'updates.schemaVersionMismatch' => 'アプリを最新版にアップデートしてください。',
			'updates.noCompatibleAsset' => 'アプリを最新版にアップデートしてください。',
			'updates.noInternet' => 'インターネット接続をご確認ください。',
			'updates.noUpdateAvailable' => 'アップデートはありません',
			'updates.completed' => '更新が完了しました。',
			'updates.installing' => 'インストールしています...',
			'updates.pleaseWaitUntilComplete' => 'データ更新が完了するまでお待ちください。',
			'errors.characterNotFound' => 'キャラクターが見つかりません',
			'errors.weaponNotFound' => '武器が見つかりません',
			'errors.materialNotFound' => '素材が見つかりません',
			'errors.artifactNotFound' => '聖遺物が見つかりません',
			'errors.tryAgainLater' => 'しばらくしてから再度お試しください。',
			'errors.dbError' => 'データベースエラーが発生しました。',
			'pages.characters' => 'キャラクター',
			'pages.characterDetails' => ({required Object character}) => '${character} - キャラクター',
			'pages.weapons' => '武器',
			'pages.weaponDetails' => ({required Object weapon}) => '${weapon} - 武器',
			'pages.materials' => '素材一覧(逆引き)',
			'pages.materialDetails' => ({required Object material}) => '${material} - 素材',
			'pages.artifacts' => '聖遺物',
			'pages.artifactDetails' => ({required Object artifact}) => '${artifact} - 聖遺物',
			'pages.furnishingSets' => '調度品セット',
			'pages.furnishingSetDetails' => ({required Object furnishingSet}) => '${furnishingSet} - 調度品セット',
			'pages.furnishings' => '調度品',
			'pages.furnishingDetails' => ({required Object furnishing}) => '${furnishing} - 調度品',
			'pages.settings' => '設定',
			'pages.farmCountSettings' => '周回数目安の表示設定',
			'pages.account' => 'アカウント',
			'pages.releaseNotes' => '更新履歴',
			'pages.bookmarks' => 'ブックマーク',
			'pages.database' => 'データベース',
			'pages.daily' => '日替わり素材',
			'pages.tools' => 'ツール',
			'pages.resinCalc' => '樹脂回復時刻計算機',
			'pages.wishes' => '祈願天井カウンター',
			'pages.more' => 'その他',
			'pages.hoyolabIntegrationSettings' => 'HoYoLAB連携設定',
			'bookmarksPage.noBookmarks' => 'ブックマークがありません。「データベース」タブから探してみましょう！',
			'bookmarksPage.character' => 'キャラクター',
			'bookmarksPage.weapon' => '武器',
			'bookmarksPage.artifactSet' => '聖遺物セット',
			'bookmarksPage.artifactPiece' => '聖遺物',
			'bookmarksPage.main' => 'メイン',
			'bookmarksPage.sub' => 'サブ',
			'bookmarksPage.unBookmark' => 'ブックマークを解除',
			'bookmarksPage.unBookmarkConfirm' => 'このブックマークを解除しますか？',
			'bookmarksPage.byPurpose' => '使用先',
			'bookmarksPage.byMaterial' => '素材',
			'bookmarksPage.furnishings' => '調度品',
			'bookmarksPage.allFurnishingsAreCrafted' => 'すべての調度品が作成済みです',
			'characterDetailsPage.equippedWeapon' => '装備中の武器',
			'characterDetailsPage.favoriteFurnishingSets' => '好きな調度品セット',
			'weaponDetailsPage.characterToEquip' => '武器を装備させるキャラクター',
			'weaponDetailsPage.skillEffect' => 'スキル効果',
			'materialDetailsPage.charactersUsing' => 'この素材を使用するキャラクター',
			'materialDetailsPage.weaponsUsing' => 'この素材を使用する武器',
			'materialDetailsPage.availableToday' => '本日入手可能',
			'materialDetailsPage.source' => '入手方法',
			'materialDetailsPage.toTeyvatMap' => 'テイワットマップへ',
			'materialCard.reBookmark' => '現在の範囲で再ブックマーク',
			'materialCard.reBookmarkDesc' => '一旦この素材のブックマークを解除し、現在のスライダーの範囲で再度ブックマークします',
			'materialCard.unBookmark' => 'ブックマークを解除',
			'materialCard.unBookmarkDesc' => 'この素材のブックマークを解除します',
			'materialCard.unBookmarked' => 'ブックマークを解除しました',
			'artifactsPage.bonusTypes.1-pc' => '1セット効果',
			'artifactsPage.bonusTypes.2-pc' => '2セット効果',
			'artifactsPage.bonusTypes.4-pc' => '4セット効果',
			'artifactsPage.effectList' => 'セット効果リスト',
			'artifactsPage.kindOfEffect' => '効果の種類',
			'artifactsPage.effectFilteringNote' => '※本フィルタリング機能は☆5聖遺物に対してのみ機能します。また、選択したものをすべて満たす聖遺物を表示します。',
			'artifactDetailsPage.maxRarity' => '最高レアリティ',
			'artifactDetailsPage.bookmarkSet' => 'セットをブックマーク',
			'artifactDetailsPage.bookmarkPiece' => '部位ごとにブックマーク',
			'artifactDetailsPage.bookmarkTwoAndTwoPcSet' => '2 + 2 セットをブックマーク',
			'artifactDetailsPage.bookmarkFourPcSet' => '4 セットをブックマーク',
			'artifactDetailsPage.bookmarkArtifacts' => '聖遺物をブックマーク',
			'artifactDetailsPage.characterToEquip' => '聖遺物を装備させるキャラクター',
			'artifactDetailsPage.chooseSecondSet' => '2個目のセットを選択',
			'artifactDetailsPage.chooseSecondSetDesc' => '2個目の聖遺物セットを選択してください',
			'artifactDetailsPage.mainStat' => 'メインステータス',
			'artifactDetailsPage.mainStatWithPieceType' => ({required Object pieceType}) => '${_root.artifactDetailsPage.mainStat} (${pieceType})',
			'artifactDetailsPage.subStats' => 'サブステータス',
			'artifactDetailsPage.unspecified' => '指定しない',
			'artifactDetailsPage.nSet' => ({required Object n}) => '${n}セット',
			'furnishingSetsPage.furnishingList' => '調度品一覧',
			'furnishingSetsPage.type' => '種類',
			'furnishingSetsPage.image' => '画像',
			'furnishingSetsPage.name' => '名前',
			'furnishingSetsPage.requiredQuantity' => '必要数 (長押しで一括変更)',
			'furnishingSetsPage.source' => '入手方法',
			'furnishingSetsPage.canBeScrolledHorizontally' => '左右にスクロールできます',
			'furnishingSetsPage.resetCraftCount' => '作成数をリセット',
			'furnishingSetsPage.resetCraftCountConfirm' => 'セット内の調度品の作成数をすべてリセットしますか？',
			'furnishingSetsPage.favoredBy' => 'この調度品セットが好きなキャラクター',
			'furnishingSetsPage.addedToBookmarks' => 'ブックマークしました',
			'furnishingSetsPage.removedFromBookmarks' => 'ブックマークを解除しました',
			'furnishingSetsPage.furnishingSetsUsingThisFurnishing' => 'この調度品を使用する調度品セット',
			'dailyPage.mondayAndThursday' => '月/木',
			'dailyPage.tuesdayAndFriday' => '火/金',
			'dailyPage.wednesdayAndSaturday' => '水/土',
			'dailyPage.talentMaterials' => '天賦素材',
			'dailyPage.weaponMaterials' => '武器素材',
			'resinCalcPage.currentResin' => '現在の樹脂数',
			'resinCalcPage.resin' => '樹脂数',
			'resinCalcPage.recoveryTime' => '回復時刻',
			'resinCalcPage.untilRecovery' => '回復まであと',
			'resinCalcPage.fullyReplenishedAt' => ({required InlineSpan time, required InlineSpanBuilder text}) => TextSpan(children: [ time, text('に全回復'), ]), 
			'resinCalcPage.recoversIn' => ({required InlineSpanBuilder text, required InlineSpan time}) => TextSpan(children: [ text('あと'), time, ]), 
			'resinCalcPage.asOf' => ({required InlineSpan time, required InlineSpanBuilder text}) => TextSpan(children: [ const TextSpan(text: '('), time, const TextSpan(text: ' '), text('現在'), const TextSpan(text: ')'), ]), 
			'resinCalcPage.recoveredTime' => '全回復した時刻',
			'resinCalcPage.wastedResin' => '無駄にした樹脂',
			'resinCalcPage.tomorrow' => '明日',
			'resinCalcPage.alreadyFull' => 'すでに全回復しました',
			'resinCalcPage.howToUse' => '使い方',
			'resinCalcPage.howToUseContent' => '現在の樹脂数を入力すると、入力した地点での時間を基準に、樹脂が全回復する時刻と、全回復するまでの時間を計算します。\n${_root.pages.hoyolabIntegrationSettings}で連携すると、現在の樹脂数を同期できるようになります。この機能を利用する場合「${_root.resinCalcPage.recoveredTime}」「${_root.resinCalcPage.wastedResin}」は、最後に樹脂を使用もしくはアイテム等で回復してから一度も同期していなかった場合には、正確に算出されませんのでご了承ください。\n',
			'morePage.accountDesc' => 'ブックマーク等をデバイス間で同期できます。',
			'morePage.hoyolabIntegrationSettingsDesc' => 'HoYoLABと連携し、ゲーム内のデータと同期できます。',
			'morePage.github' => 'GitHub',
			'morePage.githubDesc' => '本アプリのソースコードを閲覧できます。',
			'morePage.buyMeACoffee' => 'コーヒーをおごる',
			'morePage.buyMeACoffeeDesc' => 'だいぶ喜びます。',
			'morePage.x' => 'X（告知用）',
			'morePage.xDesc' => '本アプリに関するお知らせを掲載しています。',
			'releaseNotesPage.featureUpdates' => '機能更新',
			'releaseNotesPage.assetUpdates' => 'データ更新',
			'settingsPage.display' => '表示',
			'settingsPage.showItemNameOnCard' => '素材のアイテム名を表示',
			'settingsPage.showItemNameOnCardDesc' => '使用数を表示するカードにアイテム名を表示します。',
			'settingsPage.dailyResetServer' => '日替わり素材のサーバー時間',
			'settingsPage.dailyResetServerDesc' => '日替わり素材が更新される時間の基準とするゲームサーバーを選択します。',
			'settingsPage.farmCountSettingsDesc' => '表示に使用する冒険ランクなどを設定できます。',
			'settingsPage.assetData' => 'アセットデータ',
			'settingsPage.checkAssetUpdate' => 'アセットデータの更新を確認',
			'settingsPage.checkAssetUpdateDesc' => 'アプリ内データのアップデートをチェックします。',
			'settingsPage.reDownloadAssets' => 'アセットデータを再ダウンロード',
			'settingsPage.reDownloadAssetsDesc' => 'アプリの画像やキャラクター等が正常に読み込まれない場合にお試しください。',
			'settingsPage.openSourceLicenses' => 'オープンソースライセンス',
			'farmCountSettingsPage.showFarmCount' => '周回目安回数を表示する',
			'farmCountSettingsPage.adventureRank' => '冒険ランク',
			'farmCountSettingsPage.skipRate' => '濃縮樹脂等使用時の獲得数の倍率',
			'farmCountSettingsPage.dropRateList' => 'ドロップ率一覧',
			'farmCountSettingsPage.kind' => '種類',
			'farmCountSettingsPage.rate' => 'ドロップ率（個/回）',
			'farmCountSettingsPage.note' => '備考',
			'farmCountSettingsPage.multiplier' => ({required Object n}) => '${n}倍',
			'farmCountSettingsPage.noUseCondensed' => '（濃縮樹脂を使用しない）',
			'hoyolab.signIn' => 'HoYoLABにサインイン',
			'hoyolab.aboutHeading' => 'HoYoLAB連携について',
			'hoyolab.about' => '本アプリ内でHoYoLABアカウントにログインすることで、もっと便利にアプリを利用できるようになります。例えば、バッグ内にあるアイテムの数、キャラクター・武器のレベルなどを本アプリに反映させ、バッグ内の不足数を直接確認することができます。\n\nHoYoLABの認証情報、UIDは端末内に安全に保存され、HoYoLABのAPIと直接やり取りをする仕組みとなっています。私も含め、それ以外の外部にこれらのデータを送信することはありません。詳しいデータの流れや保存方法については、本アプリのソース公開をもって透明性を担保しています。\n\n※本機能はグローバル版（HoYoLAB）でのみ利用可能です。中国本土版（米游社）には対応していません。\n※万が一本機能の利用によってアカウントに何らかの問題が生じた場合、本アプリの開発者は一切の責任を負いかねますので、ご了承ください。\n',
			'hoyolab.signOut' => 'HoYoLABとの連携を解除',
			'hoyolab.signInNote' => '※ソーシャルログインは利用できません。ユーザー名/メールアドレスとパスワードでログインしてください。',
			'hoyolab.failedToSignIn' => 'HoYoLABへのサインインに失敗しました。',
			'hoyolab.signOutConfirm' => 'HoYoLABとの連携を解除しますか？',
			'hoyolab.credentialVerificationFailed' => 'ログイン情報の検証に失敗しました。再度ログインしてください。',
			'hoyolab.changeServer' => 'サーバーの変更',
			'hoyolab.serverSelect' => 'サーバー選択',
			'hoyolab.current' => ({required Object server}) => '現在の設定: ${server}',
			'hoyolab.noServerSelected' => 'サーバーが選択されていません',
			'hoyolab.plsSelectServer' => 'サーバーを選択してください',
			'hoyolab.userInfo' => 'ユーザー情報',
			'hoyolab.failedToLoadServerList' => 'サーバーリストの読み込みに失敗しました。',
			'hoyolab.failedToLoadGameRole' => 'ゲームデータの読み込みに失敗しました。',
			'hoyolab.noGameRoleFound' => 'ゲームデータが見つかりません',
			'hoyolab.failedToSyncGameData' => 'ゲームデータの同期に失敗しました。',
			'hoyolab.failedToLoadPermissionState' => 'アクセス許可状態の取得に失敗しました。',
			'hoyolab.characterDataAccessNotAllowed' => 'キャラクターデータへのアクセスが許可されていません。HoYoLAB連携設定より許可してください。',
			'hoyolab.characterDoesNotExist' => 'キャラクターを所持していません。',
			'hoyolab.realtimeNotesNotEnabled' => 'リアルタイムノートが有効化されていません。HoYoLAB連携設定より有効化してください。',
			'hoyolab.loginExpired' => '一度連携を解除し、再度ログインしてください。',
			'hoyolab.accessPermission' => 'アクセス許可',
			'hoyolab.doYouWantToEnableRealtimeNotes' => 'リアルタイムノートを有効化しますか？',
			'hoyolab.enableRealtimeNotes' => 'リアルタイムノートの有効化',
			'hoyolab.enableRealtimeNotesDesc' => '現在の天然樹脂の数を同期できるようになります。',
			'hoyolab.syncSettings' => '同期設定',
			'hoyolab.syncResin' => 'ゲーム内の樹脂数を同期する',
			'hoyolab.syncCharaState' => 'ゲーム内のキャラレベルを同期する',
			'hoyolab.syncWeaponState' => 'ゲーム内の武器レベルを同期する',
			'hoyolab.syncBagLackNums' => 'ゲーム内のバッグ不足数を同期する',
			'hoyolab.autoRemoveBookmarks' => '育成完了のブックマークを自動解除する',
			'hoyolab.autoRemoveBookmarksDesc' => 'キャラクターページもしくは武器ページを開いた際、素材ブックマークを自動的に解除します。',
			'hoyolab.mustBeResonatedWithStatue' => '旅人のレベルを同期するには、七天神像で該当する元素と共鳴する必要があります。',
			'hoyolab.weaponNotEquipped' => 'このキャラクターはこの武器を装備していません。',
			'hoyolab.unknownError' => '不明なエラーが発生しました。',
			'hoyolab.charaSyncSuccess' => 'ゲームデータと同期しました',
			'whereToGet.chests' => '宝箱、任務報酬など',
			_ => null,
		};
	}
}
