///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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

	// Translations
	@override String get appName => 'Genshin Material Notebook';
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
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
	@override late final _TranslationsDailyPageEn dailyPage = _TranslationsDailyPageEn._(_root);
	@override late final _TranslationsResinCalcPageEn resinCalcPage = _TranslationsResinCalcPageEn._(_root);
	@override late final _TranslationsMorePageEn morePage = _TranslationsMorePageEn._(_root);
	@override late final _TranslationsReleaseNotesPageEn releaseNotesPage = _TranslationsReleaseNotesPageEn._(_root);
	@override late final _TranslationsSettingsPageEn settingsPage = _TranslationsSettingsPageEn._(_root);
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
}

// Path: characterDetailsPage
class _TranslationsCharacterDetailsPageEn extends TranslationsCharacterDetailsPageJa {
	_TranslationsCharacterDetailsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get charaLevelUpAndAscensionMaterials => 'Character Lv Up & Ascension Materials';
	@override String get talentLevelUpMaterials => 'Talent Lv Up Materials';
	@override String get equippedWeapon => 'Equipped Weapon';
}

// Path: weaponDetailsPage
class _TranslationsWeaponDetailsPageEn extends TranslationsWeaponDetailsPageJa {
	_TranslationsWeaponDetailsPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get characterToEquip => 'Character to Equip this Weapon';
	@override String get skillEffect => 'Skill Effect';
	@override String get ascension => 'Weapon Lv Up & Ascension Materials';
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
	@override String get baseTime => 'Base Time';
	@override String get fullRecoveryTime => 'Full Recovery Time';
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
	@override String get untilFullRecovery => 'Until Full Recovery';
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
	@override String get assetData => 'Assets';
	@override String get checkAssetUpdate => 'Check Asset Update';
	@override String get checkAssetUpdateDesc => 'Check for updates to the app\'s assets.';
	@override String get reDownloadAssets => 'Re-download Assets';
	@override String get reDownloadAssetsDesc => 'Please try this if the assets of the app are not loading properly.';
	@override String get others => 'Others';
	@override String get openSourceLicenses => 'Open Source Licenses';
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
	@override String get displaySettings => 'Display Settings';
	@override String get lackNumDisplayMethod => 'How to Display Lack of Materials';
	@override String get lackNumDisplayMethodDesc => 'Choose how to display the lack of materials in the material cards.';
	@override Map<String, String> get lackNumDisplayMethodValues => {
		'alternate': 'All Alternately',
		'requiredNumOnly': 'Required Number Only',
		'lackNumOnly': 'Lack Number Only',
		'craftedLackNumOnly': 'Lack Number After Crafting Only',
	};
	@override String get syncSettings => 'Sync Settings';
	@override String get syncResin => 'Sync In-Game Resin Count';
	@override String get syncCharaState => 'Sync In-Game Character Levels';
	@override String get syncWeaponState => 'Synchronize Weapon State';
	@override String get autoRemoveBookmarks => 'Auto-remove bookmarks when opening a character or weapon page.';
	@override String get autoRemoveBookmarksDesc => 'Automatically remove bookmarks for completed ascensions when opening a character or weapon page.';
	@override String get syncBagCounts => 'Synchronize Bag Counts';
	@override String get mustBeResonatedWithStatue => 'This character must be resonated with the Statue of The Seven to be able to sync game data.';
	@override String get weaponNotEquipped => 'This character does not equip this weapon.';
	@override String get charaSyncSuccess => 'Successfully synced game data';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEn {
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
			case 'common.undo': return 'Undo';
			case 'common.bookmarkSaved': return 'Bookmark saved';
			case 'common.removedObsoleteBookmarks': return 'Removed bookmarks for completed ascensions.';
			case 'common.none': return 'None';
			case 'common.sliderTips': return 'If the slider is unresponsive, try long-pressing the handle and sliding, or sliding outside the selection range for smoother operation.';
			case 'common.selected': return ({required Object character}) => 'Selected: ${character}';
			case 'common.possession': return 'Possession';
			case 'common.possessionStatus.owned': return 'Owned';
			case 'common.possessionStatus.notOwned': return 'Not owned';
			case 'common.possessionNoteNotSignedIn': return 'By linking with HoYoLAB, you can synchronize your possession status.';
			case 'common.possessionNote': return 'Only characters that have been synchronized by opening the character page at least once are displayed as "Possession".';
			case 'common.dismiss': return 'Dismiss';
			case 'tutorial.indexSheet': return 'Table of contents';
			case 'tutorial.indexSheetDesc': return 'Tap this button to quickly navigate to the section you\'re looking for.';
			case 'purposes.ascension': return 'Level Up/Ascension';
			case 'purposes.normalAttack': return 'Normal Attack';
			case 'purposes.elementalSkill': return 'Elemental Skill';
			case 'purposes.elementalBurst': return 'Elemental Burst';
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
			case 'errors.characterNotFound': return 'Character not found';
			case 'errors.materialNotFound': return 'Material not found';
			case 'errors.artifactNotFound': return 'Artifact not found';
			case 'errors.tryAgainLater': return 'Please try again later.';
			case 'errors.dbError': return 'A database error occurred.';
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
			case 'bookmarksPage.byPurpose': return 'Purpose';
			case 'bookmarksPage.byMaterial': return 'Material';
			case 'characterDetailsPage.charaLevelUpAndAscensionMaterials': return 'Character Lv Up & Ascension Materials';
			case 'characterDetailsPage.talentLevelUpMaterials': return 'Talent Lv Up Materials';
			case 'characterDetailsPage.equippedWeapon': return 'Equipped Weapon';
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
			case 'materialCard.unBookmarked': return 'Removed from bookmarks';
			case 'artifactsPage.bonusTypes.1-pc': return '1-Pc Set Bonus';
			case 'artifactsPage.bonusTypes.2-pc': return '2-Pc Set Bonus';
			case 'artifactsPage.bonusTypes.4-pc': return '4-Pc Set Bonus';
			case 'artifactsPage.effectList': return 'Effect List';
			case 'artifactsPage.kindOfEffect': return 'Kind of Effect';
			case 'artifactsPage.effectFilteringNote': return '* This filtering only applies to 5-star artifacts only. Selecting multiple options will show artifacts that have all selected tags.';
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
			case 'resinCalcPage.resin': return 'Resin';
			case 'resinCalcPage.baseTime': return 'Base Time';
			case 'resinCalcPage.fullRecoveryTime': return 'Full Recovery Time';
			case 'resinCalcPage.recoveryTime': return 'Recovered At';
			case 'resinCalcPage.untilRecovery': return 'Recover In';
			case 'resinCalcPage.fullyReplenishedAt': return ({required InlineSpanBuilder text, required InlineSpan time}) => TextSpan(children: [
				text('fully replenished at'),
				const TextSpan(text: ' '),
				time,
			]);
			case 'resinCalcPage.recoversIn': return ({required InlineSpan time, required InlineSpanBuilder text}) => TextSpan(children: [
				time,
				const TextSpan(text: ' '),
				text('left'),
			]);
			case 'resinCalcPage.asOf': return ({required InlineSpanBuilder text, required InlineSpan time}) => TextSpan(children: [
				const TextSpan(text: '('),
				text('as of'),
				const TextSpan(text: ' '),
				time,
				const TextSpan(text: ')'),
			]);
			case 'resinCalcPage.recoveredTime': return 'Recovered Time';
			case 'resinCalcPage.untilFullRecovery': return 'Until Full Recovery';
			case 'resinCalcPage.wastedResin': return 'Wasted Resin';
			case 'resinCalcPage.tomorrow': return 'Tomorrow';
			case 'resinCalcPage.alreadyFull': return 'Already fully recovered';
			case 'resinCalcPage.howToUse': return 'How to Use';
			case 'resinCalcPage.howToUseContent': return 'Enter your current resin count to calculate the time when your resin will be fully recovered and the time remaining until full recovery based on the time you entered.\nBy linking with ${_root.pages.hoyolabIntegrationSettings}, you can synchronize your current resin count. If you use this feature, please note that "${_root.resinCalcPage.recoveredTime}" and "${_root.resinCalcPage.wastedResin}" will not be accurately calculated if you have not synchronized after using resin for the last time or recovering it with items, etc.\n';
			case 'morePage.accountDesc': return 'You can sync bookmarks etc. between devices.';
			case 'morePage.hoyolabIntegrationSettingsDesc': return 'Link with HoYoLAB to sync in-game data';
			case 'morePage.github': return 'GitHub';
			case 'morePage.githubDesc': return 'View the source code, report issues, and contribute.';
			case 'morePage.buyMeACoffee': return 'Buy Me a Coffee';
			case 'morePage.buyMeACoffeeDesc': return 'Support the developer by buying a coffee.';
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
			case 'hoyolab.signIn': return 'Sign in to HoYoLAB';
			case 'hoyolab.aboutHeading': return 'About HoYoLAB Link';
			case 'hoyolab.about': return 'By logging in to your HoYoLAB account within this app, you can use the app more conveniently. For example, you can reflect the number of items in your bag, the level of characters and weapons, etc.\nHoYoLAB authentication information and UID are securely stored on the device and are designed to interact directly with the HoYoLAB API. This data will not sent to me or any other external source. The transparency of the data flow and storage methods is guaranteed by the open source of this app.\n* This feature is only available in the global version (HoYoLAB). It is not available in the mainland China version (Miyoushe).\n* If any problems occur with your account due to the use of this feature, the developer of this app cannot be held responsible, so please be aware of this.\n';
			case 'hoyolab.signOut': return 'Sign out from HoYoLAB';
			case 'hoyolab.signInNote': return '* Social login is not supported. You need to sign in with your email/username and password.';
			case 'hoyolab.failedToSignIn': return 'Failed to sign in to HoYoLAB';
			case 'hoyolab.signOutConfirm': return 'Unlink HoYoLAB?';
			case 'hoyolab.credentialVerificationFailed': return 'Failed to verify login information. Please sign in again.';
			case 'hoyolab.changeServer': return 'Change server';
			case 'hoyolab.serverSelect': return 'Server select';
			case 'hoyolab.current': return ({required Object server}) => 'Current: ${server}';
			case 'hoyolab.noServerSelected': return 'No server selected';
			case 'hoyolab.plsSelectServer': return 'Please select a server';
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
			case 'hoyolab.enableRealtimeNotes': return 'Enable Real-Time Notes';
			case 'hoyolab.enableRealtimeNotesDesc': return 'You will be able to sync your current Original Resin count.';
			case 'hoyolab.displaySettings': return 'Display Settings';
			case 'hoyolab.lackNumDisplayMethod': return 'How to Display Lack of Materials';
			case 'hoyolab.lackNumDisplayMethodDesc': return 'Choose how to display the lack of materials in the material cards.';
			case 'hoyolab.lackNumDisplayMethodValues.alternate': return 'All Alternately';
			case 'hoyolab.lackNumDisplayMethodValues.requiredNumOnly': return 'Required Number Only';
			case 'hoyolab.lackNumDisplayMethodValues.lackNumOnly': return 'Lack Number Only';
			case 'hoyolab.lackNumDisplayMethodValues.craftedLackNumOnly': return 'Lack Number After Crafting Only';
			case 'hoyolab.syncSettings': return 'Sync Settings';
			case 'hoyolab.syncResin': return 'Sync In-Game Resin Count';
			case 'hoyolab.syncCharaState': return 'Sync In-Game Character Levels';
			case 'hoyolab.syncWeaponState': return 'Synchronize Weapon State';
			case 'hoyolab.autoRemoveBookmarks': return 'Auto-remove bookmarks when opening a character or weapon page.';
			case 'hoyolab.autoRemoveBookmarksDesc': return 'Automatically remove bookmarks for completed ascensions when opening a character or weapon page.';
			case 'hoyolab.syncBagCounts': return 'Synchronize Bag Counts';
			case 'hoyolab.mustBeResonatedWithStatue': return 'This character must be resonated with the Statue of The Seven to be able to sync game data.';
			case 'hoyolab.weaponNotEquipped': return 'This character does not equip this weapon.';
			case 'hoyolab.charaSyncSuccess': return 'Successfully synced game data';
			case 'whereToGet.chests': return 'Chests, Quests';
			default: return null;
		}
	}
}

