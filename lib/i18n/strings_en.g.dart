///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'Genshin Material Notebook';
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
	@override late final _TranslationsSearchEn search = _TranslationsSearchEn._(_root);
	@override late final _TranslationsTutorialEn tutorial = _TranslationsTutorialEn._(_root);
	@override Map<String, String> get purposes => {
		'ascension': 'Level Up/Ascension',
		'normalAttack': 'Normal Attack',
		'elementalSkill': 'Elemental Skill',
		'elementalBurst': 'Elemental Burst',
	};
	@override Map<String, String> get talentTypes => {
		'normalAttack': 'Normal Attack',
		'elementalSkill': 'Elemental Skill',
		'elementalBurst': 'Elemental Burst',
	};
	@override late final _TranslationsUpdatesEn updates = _TranslationsUpdatesEn._(_root);
	@override late final _TranslationsErrorsEn errors = _TranslationsErrorsEn._(_root);
	@override late final _TranslationsPagesEn pages = _TranslationsPagesEn._(_root);
	@override late final _TranslationsBookmarksPageEn bookmarksPage = _TranslationsBookmarksPageEn._(_root);
	@override late final _TranslationsCharacterDetailsPageEn characterDetailsPage = _TranslationsCharacterDetailsPageEn._(_root);
	@override late final _TranslationsWeaponDetailsPageEn weaponDetailsPage = _TranslationsWeaponDetailsPageEn._(_root);
	@override late final _TranslationsMaterialDetailsPageEn materialDetailsPage = _TranslationsMaterialDetailsPageEn._(_root);
	@override late final _TranslationsMaterialCardEn materialCard = _TranslationsMaterialCardEn._(_root);
	@override late final _TranslationsArtifactsPageEn artifactsPage = _TranslationsArtifactsPageEn._(_root);
	@override late final _TranslationsArtifactDetailsPageEn artifactDetailsPage = _TranslationsArtifactDetailsPageEn._(_root);
	@override late final _TranslationsFurnishingSetsPageEn furnishingSetsPage = _TranslationsFurnishingSetsPageEn._(_root);
	@override late final _TranslationsDailyPageEn dailyPage = _TranslationsDailyPageEn._(_root);
	@override late final _TranslationsResinCalcPageEn resinCalcPage = _TranslationsResinCalcPageEn._(_root);
	@override late final _TranslationsMorePageEn morePage = _TranslationsMorePageEn._(_root);
	@override late final _TranslationsReleaseNotesPageEn releaseNotesPage = _TranslationsReleaseNotesPageEn._(_root);
	@override late final _TranslationsSettingsPageEn settingsPage = _TranslationsSettingsPageEn._(_root);
	@override late final _TranslationsFarmCountSettingsPageEn farmCountSettingsPage = _TranslationsFarmCountSettingsPageEn._(_root);
	@override late final _TranslationsHoyolabEn hoyolab = _TranslationsHoyolabEn._(_root);
	@override Map<String, String> get whereToGet => {
		'chests': 'Chests, Quests',
	};
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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
	@override String get sort => 'Sort';
	@override String get sortType => 'Sort Type';
	@override Map<String, String> get sortTypes => {
		'defaultSort': 'Default',
		'name': 'Name',
		'element': 'Element',
		'rarity': 'Rarity',
	};
	@override String get undo => 'Undo';
	@override String get bookmarkSaved => 'Bookmark saved';
	@override String get removedObsoleteBookmarks => 'Removed bookmarks for completed ascensions.';
	@override String get none => 'None';
	@override String get sliderTips => 'If the slider is unresponsive, try long-pressing the handle and sliding, or sliding outside the selection range for smoother operation.';
	@override String selected({required Object character}) => 'Selected: ${character}';
	@override String get possession => 'Possession';
	@override Map<String, String> get possessionStatus => {
		'owned': 'Owned',
		'notOwned': 'Not owned',
	};
	@override String get possessionNoteNotSignedIn => 'By linking with HoYoLAB, you can synchronize your possession status.';
	@override String get possessionNote => 'Only characters that have been synchronized by opening the character page at least once are displayed as "Possession".';
	@override String get dismiss => 'Dismiss';
}

// Path: search
class _TranslationsSearchEn extends TranslationsSearchJa {
	_TranslationsSearchEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String hint({required Object target}) => 'Search for ${target}...';
	@override String get noResults => 'No search results found';
	@override late final _TranslationsSearchTargetsEn targets = _TranslationsSearchTargetsEn._(_root);
}

// Path: tutorial
class _TranslationsTutorialEn extends TranslationsTutorialJa {
	_TranslationsTutorialEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get indexSheet => 'Table of contents';
	@override String get indexSheetDesc => 'Tap this button to quickly navigate to the section you\'re looking for.';
}

// Path: updates
class _TranslationsUpdatesEn extends TranslationsUpdatesJa {
	_TranslationsUpdatesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get downloading => 'Downloading data updates...';
	@override String get failedToLoad => 'Failed to load data. Try re-downloading from \'Settings\' -> \'Re-download Assets\'.';
	@override String get failedToDownload => 'Failed to download data update.';
	@override String get failedToInstall => 'Failed to install data update.';
	@override String get failedToCheck => 'Failed to check for data update.';
	@override String get schemaVersionMismatch => 'Please update the app to the latest version.';
	@override String get noCompatibleAsset => 'Please update the app to the latest version.';
	@override String get noInternet => 'Please check your internet connection.';
	@override String get noUpdateAvailable => 'No update available.';
	@override String get completed => 'Data update completed.';
	@override String get installing => 'Installing...';
	@override String get pleaseWaitUntilComplete => 'Please wait until data update is complete.';
}

// Path: errors
class _TranslationsErrorsEn extends TranslationsErrorsJa {
	_TranslationsErrorsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get characterNotFound => 'Character not found';
	@override String get weaponNotFound => 'Weapon not found';
	@override String get materialNotFound => 'Material not found';
	@override String get artifactNotFound => 'Artifact not found';
	@override String get tryAgainLater => 'Please try again later.';
	@override String get dbError => 'A database error occurred.';
}

// Path: pages
class _TranslationsPagesEn extends TranslationsPagesJa {
	_TranslationsPagesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get characters => 'Characters';
	@override String characterDetails({required Object character}) => '${character} - Character';
	@override String get weapons => 'Weapons';
	@override String weaponDetails({required Object weapon}) => '${weapon} - Weapon';
	@override String get materials => 'Materials';
	@override String materialDetails({required Object material}) => '${material} - Material';
	@override String get artifacts => 'Artifacts';
	@override String artifactDetails({required Object artifact}) => '${artifact} - Artifact';
	@override String get furnishingSets => 'Furnishing Sets';
	@override String furnishingSetDetails({required Object furnishingSet}) => '${furnishingSet} - Furnishing Set';
	@override String get furnishings => 'Furnishings';
	@override String furnishingDetails({required Object furnishing}) => '${furnishing} - Furnishing';
	@override String get settings => 'Settings';
	@override String get farmCountSettings => 'Farming Count Display';
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
class _TranslationsBookmarksPageEn extends TranslationsBookmarksPageJa {
	_TranslationsBookmarksPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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
	@override String get byPurpose => 'Purpose';
	@override String get byMaterial => 'Material';
	@override String get furnishings => 'Furnishings';
	@override String get allFurnishingsAreCrafted => 'All furnishings in this set have been crafted.';
}

// Path: characterDetailsPage
class _TranslationsCharacterDetailsPageEn extends TranslationsCharacterDetailsPageJa {
	_TranslationsCharacterDetailsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get equippedWeapon => 'Equipped Weapon';
	@override String get favoriteFurnishingSets => 'Favorite Furnishing Sets';
}

// Path: weaponDetailsPage
class _TranslationsWeaponDetailsPageEn extends TranslationsWeaponDetailsPageJa {
	_TranslationsWeaponDetailsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get characterToEquip => 'Character to Equip this Weapon';
	@override String get skillEffect => 'Skill Effect';
}

// Path: materialDetailsPage
class _TranslationsMaterialDetailsPageEn extends TranslationsMaterialDetailsPageJa {
	_TranslationsMaterialDetailsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get charactersUsing => 'Characters Using This Material';
	@override String get weaponsUsing => 'Weapons Using This Material';
	@override String get availableToday => 'Available Today';
	@override String get source => 'How to Obtain';
	@override String get toTeyvatMap => 'To Teyvat Map';
}

// Path: materialCard
class _TranslationsMaterialCardEn extends TranslationsMaterialCardJa {
	_TranslationsMaterialCardEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get reBookmark => 'Re-bookmark in current range';
	@override String get reBookmarkDesc => 'Remove the bookmark of this material once, then bookmark it again in the current slider range';
	@override String get unBookmark => 'Remove bookmark';
	@override String get unBookmarkDesc => 'Remove the bookmark of this material';
	@override String get unBookmarked => 'Removed from bookmarks';
}

// Path: artifactsPage
class _TranslationsArtifactsPageEn extends TranslationsArtifactsPageJa {
	_TranslationsArtifactsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override Map<String, String> get bonusTypes => {
		'1-pc': '1-Pc Set Bonus',
		'2-pc': '2-Pc Set Bonus',
		'4-pc': '4-Pc Set Bonus',
	};
	@override String get effectList => 'Effect List';
	@override String get kindOfEffect => 'Kind of Effect';
	@override String get effectFilteringNote => '* This filtering only applies to 5-star artifacts only. Selecting multiple options will show artifacts that have all selected tags.';
}

// Path: artifactDetailsPage
class _TranslationsArtifactDetailsPageEn extends TranslationsArtifactDetailsPageJa {
	_TranslationsArtifactDetailsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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

// Path: furnishingSetsPage
class _TranslationsFurnishingSetsPageEn extends TranslationsFurnishingSetsPageJa {
	_TranslationsFurnishingSetsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get furnishingList => 'Furnishing List';
	@override String get type => 'Type';
	@override String get image => 'Image';
	@override String get name => 'Name';
	@override String get requiredQuantity => 'Required Qty (bulk update by long-press)';
	@override String get source => 'Source';
	@override String get canBeScrolledHorizontally => 'Can be scrolled horizontally';
	@override String get resetCraftCount => 'Reset Craft Count';
	@override String get resetCraftCountConfirm => 'Are you sure you want to reset the craft count for this furnishing set?';
	@override String get favoredBy => 'Favored By';
	@override String get addedToBookmarks => 'Added to Bookmarks';
	@override String get removedFromBookmarks => 'Removed from Bookmarks';
	@override String get furnishingSetsUsingThisFurnishing => 'Furnishing Sets Using This Furnishing';
}

// Path: dailyPage
class _TranslationsDailyPageEn extends TranslationsDailyPageJa {
	_TranslationsDailyPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get mondayAndThursday => 'Mon/Thu';
	@override String get tuesdayAndFriday => 'Tue/Fri';
	@override String get wednesdayAndSaturday => 'Wed/Sat';
	@override String get talentMaterials => 'Talent Materials';
	@override String get weaponMaterials => 'Weapon Materials';
}

// Path: resinCalcPage
class _TranslationsResinCalcPageEn extends TranslationsResinCalcPageJa {
	_TranslationsResinCalcPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get currentResin => 'Current Resin';
	@override String get resin => 'Resin';
	@override String get recoveryTime => 'Recovered At';
	@override String get untilRecovery => 'Recover In';
	@override TextSpan fullyReplenishedAt({required InlineSpanBuilder text, required InlineSpan time}) => TextSpan(children: [
		text('fully replenished at'),
		const TextSpan(text: ' '),
		time,
	]);
	@override TextSpan recoversIn({required InlineSpan time, required InlineSpanBuilder text}) => TextSpan(children: [
		time,
		const TextSpan(text: ' '),
		text('left'),
	]);
	@override TextSpan asOf({required InlineSpanBuilder text, required InlineSpan time}) => TextSpan(children: [
		const TextSpan(text: '('),
		text('as of'),
		const TextSpan(text: ' '),
		time,
		const TextSpan(text: ')'),
	]);
	@override String get recoveredTime => 'Recovered Time';
	@override String get wastedResin => 'Wasted Resin';
	@override String get tomorrow => 'Tomorrow';
	@override String get alreadyFull => 'Already fully recovered';
	@override String get howToUse => 'How to Use';
	@override String get howToUseContent => 'Enter your current resin count to calculate the time when your resin will be fully recovered and the time remaining until full recovery based on the time you entered.\nBy linking with ${_root.pages.hoyolabIntegrationSettings}, you can synchronize your current resin count. If you use this feature, please note that "${_root.resinCalcPage.recoveredTime}" and "${_root.resinCalcPage.wastedResin}" will not be accurately calculated if you have not synchronized after using resin for the last time or recovering it with items, etc.\n';
}

// Path: morePage
class _TranslationsMorePageEn extends TranslationsMorePageJa {
	_TranslationsMorePageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get accountDesc => 'You can sync bookmarks etc. between devices.';
	@override String get hoyolabIntegrationSettingsDesc => 'Link with HoYoLAB to sync in-game data';
	@override String get github => 'GitHub';
	@override String get githubDesc => 'View the source code, report issues, and contribute.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get buyMeACoffeeDesc => 'Support the developer by buying a coffee.';
	@override String get x => 'X (for announcements)';
	@override String get xDesc => 'Notices related to this app are posted here.';
}

// Path: releaseNotesPage
class _TranslationsReleaseNotesPageEn extends TranslationsReleaseNotesPageJa {
	_TranslationsReleaseNotesPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get featureUpdates => 'Feature Updates';
	@override String get assetUpdates => 'Asset Updates';
}

// Path: settingsPage
class _TranslationsSettingsPageEn extends TranslationsSettingsPageJa {
	_TranslationsSettingsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get display => 'Display';
	@override String get showItemNameOnCard => 'Show Item Name on Card';
	@override String get showItemNameOnCardDesc => 'Show the item name on the card that displays the number of uses.';
	@override String get dailyResetServer => 'Daily Material Server Time';
	@override String get dailyResetServerDesc => 'Select the game server to use as the reference time for daily materials reset.';
	@override String get farmCountSettingsDesc => 'Set the configs like AR for calculating the farming count.';
	@override String get assetData => 'Assets';
	@override String get checkAssetUpdate => 'Check Asset Update';
	@override String get checkAssetUpdateDesc => 'Check for updates to the app\'s assets.';
	@override String get reDownloadAssets => 'Re-download Assets';
	@override String get reDownloadAssetsDesc => 'Please try this if the assets of the app are not loading properly.';
	@override String get openSourceLicenses => 'Open Source Licenses';
}

// Path: farmCountSettingsPage
class _TranslationsFarmCountSettingsPageEn extends TranslationsFarmCountSettingsPageJa {
	_TranslationsFarmCountSettingsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get showFarmCount => 'Show Farming Count';
	@override String get adventureRank => 'Adventure Rank';
	@override String get skipRate => 'Multiplier for using Condensed Resin etc.';
	@override String get dropRateList => 'Drop Rate List';
	@override String get kind => 'Type';
	@override String get rate => 'Drop Rate (items/run)';
	@override String get note => 'Note';
	@override String multiplier({required Object n}) => '${n} x';
	@override String get noUseCondensed => '(Not using Condensed Resin)';
}

// Path: hoyolab
class _TranslationsHoyolabEn extends TranslationsHoyolabJa {
	_TranslationsHoyolabEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Sign in to HoYoLAB';
	@override String get aboutHeading => 'About HoYoLAB Link';
	@override String get about => 'By logging in to your HoYoLAB account within this app, you can use the app more conveniently. For example, you can reflect the number of items in your bag, the level of characters and weapons, etc.\nHoYoLAB authentication information and UID are securely stored on the device and are designed to interact directly with the HoYoLAB API. This data will not sent to me or any other external source. The transparency of the data flow and storage methods is guaranteed by the open source of this app.\n* This feature is only available in the global version (HoYoLAB). It is not available in the mainland China version (Miyoushe).\n* If any problems occur with your account due to the use of this feature, the developer of this app cannot be held responsible, so please be aware of this.\n';
	@override String get signOut => 'Sign out from HoYoLAB';
	@override String get signInNote => '* Social login is not supported. You need to sign in with your email/username and password.';
	@override String get failedToSignIn => 'Failed to sign in to HoYoLAB';
	@override String get signOutConfirm => 'Unlink HoYoLAB?';
	@override String get credentialVerificationFailed => 'Failed to verify login information. Please sign in again.';
	@override String get changeServer => 'Change server';
	@override String get serverSelect => 'Server select';
	@override String current({required Object server}) => 'Current: ${server}';
	@override String get noServerSelected => 'No server selected';
	@override String get plsSelectServer => 'Please select a server';
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
	@override String get enableRealtimeNotes => 'Enable Real-Time Notes';
	@override String get enableRealtimeNotesDesc => 'You will be able to sync your current Original Resin count.';
	@override String get syncSettings => 'Sync Settings';
	@override String get syncResin => 'Sync resin count';
	@override String get syncCharaState => 'Sync character levels';
	@override String get syncWeaponState => 'Sync weapon levels';
	@override String get syncBagLackNums => 'Sync bag shortage numbers';
	@override String get autoRemoveBookmarks => 'Auto remove bookmarks';
	@override String get autoRemoveBookmarksDesc => 'Automatically remove bookmarks for completed ascensions when opening a character or weapon page.';
	@override String get mustBeResonatedWithStatue => 'This character must be resonated with the Statue of The Seven to be able to sync game data.';
	@override String get weaponNotEquipped => 'This character does not equip this weapon.';
	@override String get unknownError => 'An unknown error occurred.';
	@override String get charaSyncSuccess => 'Successfully synced game data';
}

// Path: search.targets
class _TranslationsSearchTargetsEn extends TranslationsSearchTargetsJa {
	_TranslationsSearchTargetsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get characters => 'characters';
	@override String get weapons => 'weapons';
	@override String get materials => 'materials';
	@override String get artifactSets => 'artifact sets';
	@override String get artifactPieces => 'artifact pieces';
	@override String get furnishingSets => 'furnishing sets';
	@override String get furnishings => 'furnishings';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'Genshin Material Notebook',
			'common.ok' => 'OK',
			'common.cancel' => 'Cancel',
			'common.signOut' => 'Sign Out',
			'common.tos' => 'Terms of Use',
			'common.privacyPolicy' => 'Privacy Policy',
			'common.error' => 'An error occurred.',
			'common.goalLevel' => 'Goal Level',
			'common.currentLevel' => 'Current Level',
			'common.index' => 'Index',
			'common.seconds' => ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge( n: n, resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'), other: () => TextSpan(children: [ nBuilder(n), const TextSpan(text: ' '), unit('seconds'), ]), one: () => TextSpan(children: [ nBuilder(n), const TextSpan(text: ' '), unit('second'), ]), ), 
			'common.minutes' => ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge( n: n, resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'), other: () => TextSpan(children: [ nBuilder(n), const TextSpan(text: ' '), unit('minutes'), ]), one: () => TextSpan(children: [ nBuilder(n), const TextSpan(text: ' '), unit('minute'), ]), ), 
			'common.hours' => ({required num n, required InlineSpan Function(num) nBuilder, required InlineSpanBuilder unit}) => RichPluralResolvers.bridge( n: n, resolver: _root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'), other: () => TextSpan(children: [ nBuilder(n), const TextSpan(text: ' '), unit('hours'), ]), one: () => TextSpan(children: [ nBuilder(n), const TextSpan(text: ' '), unit('hour'), ]), ), 
			'common.element' => 'Element',
			'common.rarity' => 'Rarity',
			'common.weaponType' => 'Weapon Type',
			'common.clear' => 'Clear',
			'common.save' => 'Save',
			'common.next' => 'Next',
			'common.change' => 'Change',
			'common.pleaseSelect' => 'Please select',
			'common.sort' => 'Sort',
			'common.sortType' => 'Sort Type',
			'common.sortTypes.defaultSort' => 'Default',
			'common.sortTypes.name' => 'Name',
			'common.sortTypes.element' => 'Element',
			'common.sortTypes.rarity' => 'Rarity',
			'common.undo' => 'Undo',
			'common.bookmarkSaved' => 'Bookmark saved',
			'common.removedObsoleteBookmarks' => 'Removed bookmarks for completed ascensions.',
			'common.none' => 'None',
			'common.sliderTips' => 'If the slider is unresponsive, try long-pressing the handle and sliding, or sliding outside the selection range for smoother operation.',
			'common.selected' => ({required Object character}) => 'Selected: ${character}',
			'common.possession' => 'Possession',
			'common.possessionStatus.owned' => 'Owned',
			'common.possessionStatus.notOwned' => 'Not owned',
			'common.possessionNoteNotSignedIn' => 'By linking with HoYoLAB, you can synchronize your possession status.',
			'common.possessionNote' => 'Only characters that have been synchronized by opening the character page at least once are displayed as "Possession".',
			'common.dismiss' => 'Dismiss',
			'search.hint' => ({required Object target}) => 'Search for ${target}...',
			'search.noResults' => 'No search results found',
			'search.targets.characters' => 'characters',
			'search.targets.weapons' => 'weapons',
			'search.targets.materials' => 'materials',
			'search.targets.artifactSets' => 'artifact sets',
			'search.targets.artifactPieces' => 'artifact pieces',
			'search.targets.furnishingSets' => 'furnishing sets',
			'search.targets.furnishings' => 'furnishings',
			'tutorial.indexSheet' => 'Table of contents',
			'tutorial.indexSheetDesc' => 'Tap this button to quickly navigate to the section you\'re looking for.',
			'purposes.ascension' => 'Level Up/Ascension',
			'purposes.normalAttack' => 'Normal Attack',
			'purposes.elementalSkill' => 'Elemental Skill',
			'purposes.elementalBurst' => 'Elemental Burst',
			'talentTypes.normalAttack' => 'Normal Attack',
			'talentTypes.elementalSkill' => 'Elemental Skill',
			'talentTypes.elementalBurst' => 'Elemental Burst',
			'updates.downloading' => 'Downloading data updates...',
			'updates.failedToLoad' => 'Failed to load data. Try re-downloading from \'Settings\' -> \'Re-download Assets\'.',
			'updates.failedToDownload' => 'Failed to download data update.',
			'updates.failedToInstall' => 'Failed to install data update.',
			'updates.failedToCheck' => 'Failed to check for data update.',
			'updates.schemaVersionMismatch' => 'Please update the app to the latest version.',
			'updates.noCompatibleAsset' => 'Please update the app to the latest version.',
			'updates.noInternet' => 'Please check your internet connection.',
			'updates.noUpdateAvailable' => 'No update available.',
			'updates.completed' => 'Data update completed.',
			'updates.installing' => 'Installing...',
			'updates.pleaseWaitUntilComplete' => 'Please wait until data update is complete.',
			'errors.characterNotFound' => 'Character not found',
			'errors.weaponNotFound' => 'Weapon not found',
			'errors.materialNotFound' => 'Material not found',
			'errors.artifactNotFound' => 'Artifact not found',
			'errors.tryAgainLater' => 'Please try again later.',
			'errors.dbError' => 'A database error occurred.',
			'pages.characters' => 'Characters',
			'pages.characterDetails' => ({required Object character}) => '${character} - Character',
			'pages.weapons' => 'Weapons',
			'pages.weaponDetails' => ({required Object weapon}) => '${weapon} - Weapon',
			'pages.materials' => 'Materials',
			'pages.materialDetails' => ({required Object material}) => '${material} - Material',
			'pages.artifacts' => 'Artifacts',
			'pages.artifactDetails' => ({required Object artifact}) => '${artifact} - Artifact',
			'pages.furnishingSets' => 'Furnishing Sets',
			'pages.furnishingSetDetails' => ({required Object furnishingSet}) => '${furnishingSet} - Furnishing Set',
			'pages.furnishings' => 'Furnishings',
			'pages.furnishingDetails' => ({required Object furnishing}) => '${furnishing} - Furnishing',
			'pages.settings' => 'Settings',
			'pages.farmCountSettings' => 'Farming Count Display',
			'pages.account' => 'Account',
			'pages.releaseNotes' => 'Release Notes',
			'pages.bookmarks' => 'Bookmarks',
			'pages.database' => 'Database',
			'pages.daily' => 'Daily',
			'pages.tools' => 'Tools',
			'pages.resinCalc' => 'Resin Replenish Calculator',
			'pages.wishes' => 'Wish Pity Counter',
			'pages.more' => 'More',
			'pages.hoyolabIntegrationSettings' => 'HoYoLAB Integration Settings',
			'bookmarksPage.noBookmarks' => 'No bookmarks yet. Try finding something in the Database tab!',
			'bookmarksPage.character' => 'Character',
			'bookmarksPage.weapon' => 'Weapon',
			'bookmarksPage.artifactSet' => 'Artifact Set',
			'bookmarksPage.artifactPiece' => 'Artifact',
			'bookmarksPage.main' => 'Main',
			'bookmarksPage.sub' => 'Sub',
			'bookmarksPage.unBookmark' => 'Remove bookmark',
			'bookmarksPage.unBookmarkConfirm' => 'Remove this bookmark?',
			'bookmarksPage.byPurpose' => 'Purpose',
			'bookmarksPage.byMaterial' => 'Material',
			'bookmarksPage.furnishings' => 'Furnishings',
			'bookmarksPage.allFurnishingsAreCrafted' => 'All furnishings in this set have been crafted.',
			'characterDetailsPage.equippedWeapon' => 'Equipped Weapon',
			'characterDetailsPage.favoriteFurnishingSets' => 'Favorite Furnishing Sets',
			'weaponDetailsPage.characterToEquip' => 'Character to Equip this Weapon',
			'weaponDetailsPage.skillEffect' => 'Skill Effect',
			'materialDetailsPage.charactersUsing' => 'Characters Using This Material',
			'materialDetailsPage.weaponsUsing' => 'Weapons Using This Material',
			'materialDetailsPage.availableToday' => 'Available Today',
			'materialDetailsPage.source' => 'How to Obtain',
			'materialDetailsPage.toTeyvatMap' => 'To Teyvat Map',
			'materialCard.reBookmark' => 'Re-bookmark in current range',
			'materialCard.reBookmarkDesc' => 'Remove the bookmark of this material once, then bookmark it again in the current slider range',
			'materialCard.unBookmark' => 'Remove bookmark',
			'materialCard.unBookmarkDesc' => 'Remove the bookmark of this material',
			'materialCard.unBookmarked' => 'Removed from bookmarks',
			'artifactsPage.bonusTypes.1-pc' => '1-Pc Set Bonus',
			'artifactsPage.bonusTypes.2-pc' => '2-Pc Set Bonus',
			'artifactsPage.bonusTypes.4-pc' => '4-Pc Set Bonus',
			'artifactsPage.effectList' => 'Effect List',
			'artifactsPage.kindOfEffect' => 'Kind of Effect',
			'artifactsPage.effectFilteringNote' => '* This filtering only applies to 5-star artifacts only. Selecting multiple options will show artifacts that have all selected tags.',
			'artifactDetailsPage.maxRarity' => 'Max Rarity',
			'artifactDetailsPage.bookmarkSet' => 'Bookmark Set(s)',
			'artifactDetailsPage.bookmarkPiece' => 'Bookmark by Piece',
			'artifactDetailsPage.bookmarkTwoAndTwoPcSet' => 'Bookmark 2+2 Pc Set',
			'artifactDetailsPage.bookmarkFourPcSet' => 'Bookmark 4 Pc Set',
			'artifactDetailsPage.bookmarkArtifacts' => 'Bookmark Artifacts',
			'artifactDetailsPage.characterToEquip' => 'Character to Equip',
			'artifactDetailsPage.chooseSecondSet' => 'Select the Second One',
			'artifactDetailsPage.chooseSecondSetDesc' => 'Choose the second artifact set.',
			'artifactDetailsPage.mainStat' => 'Main Stat',
			'artifactDetailsPage.mainStatWithPieceType' => ({required Object pieceType}) => '${_root.artifactDetailsPage.mainStat} (${pieceType})',
			'artifactDetailsPage.subStats' => 'Sub Stats',
			'artifactDetailsPage.unspecified' => 'Unspecified',
			'artifactDetailsPage.nSet' => ({required Object n}) => '${n}-Pieces',
			'furnishingSetsPage.furnishingList' => 'Furnishing List',
			'furnishingSetsPage.type' => 'Type',
			'furnishingSetsPage.image' => 'Image',
			'furnishingSetsPage.name' => 'Name',
			'furnishingSetsPage.requiredQuantity' => 'Required Qty (bulk update by long-press)',
			'furnishingSetsPage.source' => 'Source',
			'furnishingSetsPage.canBeScrolledHorizontally' => 'Can be scrolled horizontally',
			'furnishingSetsPage.resetCraftCount' => 'Reset Craft Count',
			'furnishingSetsPage.resetCraftCountConfirm' => 'Are you sure you want to reset the craft count for this furnishing set?',
			'furnishingSetsPage.favoredBy' => 'Favored By',
			'furnishingSetsPage.addedToBookmarks' => 'Added to Bookmarks',
			'furnishingSetsPage.removedFromBookmarks' => 'Removed from Bookmarks',
			'furnishingSetsPage.furnishingSetsUsingThisFurnishing' => 'Furnishing Sets Using This Furnishing',
			'dailyPage.mondayAndThursday' => 'Mon/Thu',
			'dailyPage.tuesdayAndFriday' => 'Tue/Fri',
			'dailyPage.wednesdayAndSaturday' => 'Wed/Sat',
			'dailyPage.talentMaterials' => 'Talent Materials',
			'dailyPage.weaponMaterials' => 'Weapon Materials',
			'resinCalcPage.currentResin' => 'Current Resin',
			'resinCalcPage.resin' => 'Resin',
			'resinCalcPage.recoveryTime' => 'Recovered At',
			'resinCalcPage.untilRecovery' => 'Recover In',
			'resinCalcPage.fullyReplenishedAt' => ({required InlineSpanBuilder text, required InlineSpan time}) => TextSpan(children: [ text('fully replenished at'), const TextSpan(text: ' '), time, ]), 
			'resinCalcPage.recoversIn' => ({required InlineSpan time, required InlineSpanBuilder text}) => TextSpan(children: [ time, const TextSpan(text: ' '), text('left'), ]), 
			'resinCalcPage.asOf' => ({required InlineSpanBuilder text, required InlineSpan time}) => TextSpan(children: [ const TextSpan(text: '('), text('as of'), const TextSpan(text: ' '), time, const TextSpan(text: ')'), ]), 
			'resinCalcPage.recoveredTime' => 'Recovered Time',
			'resinCalcPage.wastedResin' => 'Wasted Resin',
			'resinCalcPage.tomorrow' => 'Tomorrow',
			'resinCalcPage.alreadyFull' => 'Already fully recovered',
			'resinCalcPage.howToUse' => 'How to Use',
			'resinCalcPage.howToUseContent' => 'Enter your current resin count to calculate the time when your resin will be fully recovered and the time remaining until full recovery based on the time you entered.\nBy linking with ${_root.pages.hoyolabIntegrationSettings}, you can synchronize your current resin count. If you use this feature, please note that "${_root.resinCalcPage.recoveredTime}" and "${_root.resinCalcPage.wastedResin}" will not be accurately calculated if you have not synchronized after using resin for the last time or recovering it with items, etc.\n',
			'morePage.accountDesc' => 'You can sync bookmarks etc. between devices.',
			'morePage.hoyolabIntegrationSettingsDesc' => 'Link with HoYoLAB to sync in-game data',
			'morePage.github' => 'GitHub',
			'morePage.githubDesc' => 'View the source code, report issues, and contribute.',
			'morePage.buyMeACoffee' => 'Buy Me a Coffee',
			'morePage.buyMeACoffeeDesc' => 'Support the developer by buying a coffee.',
			'morePage.x' => 'X (for announcements)',
			'morePage.xDesc' => 'Notices related to this app are posted here.',
			'releaseNotesPage.featureUpdates' => 'Feature Updates',
			'releaseNotesPage.assetUpdates' => 'Asset Updates',
			'settingsPage.display' => 'Display',
			'settingsPage.showItemNameOnCard' => 'Show Item Name on Card',
			'settingsPage.showItemNameOnCardDesc' => 'Show the item name on the card that displays the number of uses.',
			'settingsPage.dailyResetServer' => 'Daily Material Server Time',
			'settingsPage.dailyResetServerDesc' => 'Select the game server to use as the reference time for daily materials reset.',
			'settingsPage.farmCountSettingsDesc' => 'Set the configs like AR for calculating the farming count.',
			'settingsPage.assetData' => 'Assets',
			'settingsPage.checkAssetUpdate' => 'Check Asset Update',
			'settingsPage.checkAssetUpdateDesc' => 'Check for updates to the app\'s assets.',
			'settingsPage.reDownloadAssets' => 'Re-download Assets',
			'settingsPage.reDownloadAssetsDesc' => 'Please try this if the assets of the app are not loading properly.',
			'settingsPage.openSourceLicenses' => 'Open Source Licenses',
			'farmCountSettingsPage.showFarmCount' => 'Show Farming Count',
			'farmCountSettingsPage.adventureRank' => 'Adventure Rank',
			'farmCountSettingsPage.skipRate' => 'Multiplier for using Condensed Resin etc.',
			'farmCountSettingsPage.dropRateList' => 'Drop Rate List',
			'farmCountSettingsPage.kind' => 'Type',
			'farmCountSettingsPage.rate' => 'Drop Rate (items/run)',
			'farmCountSettingsPage.note' => 'Note',
			'farmCountSettingsPage.multiplier' => ({required Object n}) => '${n} x',
			'farmCountSettingsPage.noUseCondensed' => '(Not using Condensed Resin)',
			'hoyolab.signIn' => 'Sign in to HoYoLAB',
			'hoyolab.aboutHeading' => 'About HoYoLAB Link',
			'hoyolab.about' => 'By logging in to your HoYoLAB account within this app, you can use the app more conveniently. For example, you can reflect the number of items in your bag, the level of characters and weapons, etc.\nHoYoLAB authentication information and UID are securely stored on the device and are designed to interact directly with the HoYoLAB API. This data will not sent to me or any other external source. The transparency of the data flow and storage methods is guaranteed by the open source of this app.\n* This feature is only available in the global version (HoYoLAB). It is not available in the mainland China version (Miyoushe).\n* If any problems occur with your account due to the use of this feature, the developer of this app cannot be held responsible, so please be aware of this.\n',
			'hoyolab.signOut' => 'Sign out from HoYoLAB',
			'hoyolab.signInNote' => '* Social login is not supported. You need to sign in with your email/username and password.',
			'hoyolab.failedToSignIn' => 'Failed to sign in to HoYoLAB',
			'hoyolab.signOutConfirm' => 'Unlink HoYoLAB?',
			'hoyolab.credentialVerificationFailed' => 'Failed to verify login information. Please sign in again.',
			'hoyolab.changeServer' => 'Change server',
			'hoyolab.serverSelect' => 'Server select',
			'hoyolab.current' => ({required Object server}) => 'Current: ${server}',
			'hoyolab.noServerSelected' => 'No server selected',
			'hoyolab.plsSelectServer' => 'Please select a server',
			'hoyolab.userInfo' => 'User Info',
			'hoyolab.failedToLoadServerList' => 'Failed to load server list.',
			'hoyolab.failedToLoadGameRole' => 'Failed to load game user info.',
			'hoyolab.noGameRoleFound' => 'No game user found.',
			'hoyolab.failedToSyncGameData' => 'Failed to sync game data.',
			'hoyolab.failedToLoadPermissionState' => 'Failed to load permission state.',
			'hoyolab.characterDataAccessNotAllowed' => 'Character data access is not allowed. Please allow access from HoYoLAB integration settings.',
			'hoyolab.characterDoesNotExist' => 'You do not own this character.',
			'hoyolab.realtimeNotesNotEnabled' => 'Real-time notes are not enabled. Please enable it in the HoYoLAB integration settings.',
			'hoyolab.loginExpired' => 'Please sign out and sign in again.',
			'hoyolab.accessPermission' => 'Access Permission',
			'hoyolab.doYouWantToEnableRealtimeNotes' => 'Enable Real-Time Notes?',
			'hoyolab.enableRealtimeNotes' => 'Enable Real-Time Notes',
			'hoyolab.enableRealtimeNotesDesc' => 'You will be able to sync your current Original Resin count.',
			'hoyolab.syncSettings' => 'Sync Settings',
			'hoyolab.syncResin' => 'Sync resin count',
			'hoyolab.syncCharaState' => 'Sync character levels',
			'hoyolab.syncWeaponState' => 'Sync weapon levels',
			'hoyolab.syncBagLackNums' => 'Sync bag shortage numbers',
			'hoyolab.autoRemoveBookmarks' => 'Auto remove bookmarks',
			'hoyolab.autoRemoveBookmarksDesc' => 'Automatically remove bookmarks for completed ascensions when opening a character or weapon page.',
			'hoyolab.mustBeResonatedWithStatue' => 'This character must be resonated with the Statue of The Seven to be able to sync game data.',
			'hoyolab.weaponNotEquipped' => 'This character does not equip this weapon.',
			'hoyolab.unknownError' => 'An unknown error occurred.',
			'hoyolab.charaSyncSuccess' => 'Successfully synced game data',
			'whereToGet.chests' => 'Chests, Quests',
			_ => null,
		};
	}
}
