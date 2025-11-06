import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../constants/remote_config_key.dart";
import "../core/kv_preferences.dart";
import "../core/secure_storage.dart";
import "../main.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "../utils/resin_calculator.dart";
import "filter_state.dart";

part "preferences.freezed.dart";
part "preferences.g.dart";

@riverpod
class PreferencesStateNotifier extends _$PreferencesStateNotifier {
  @override
  PreferencesState build() {
    final pref = KvPreferences(spInstance);
    return PreferencesState.fromSharedPreferences(pref);
  }

  Future<void> setResin(int? resin) async {
    final baseTime = DateTime.now();
    await state.pref.resin.setValue(resin);
    await state.pref.resinBaseTime.setValueWithConversion(baseTime);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setResinWithRecoveryTime(int resin, int recoveryTime) async {
    await state.pref.resin.setValue(resin);
    final resinBaseTimeValue = state.pref.resinBaseTime.convertedValue;
    if (resinBaseTimeValue == null || resin < maxResin) {
      final offset = (maxResin - resin) * minutesPerResinRecovery * 60 - recoveryTime;
      final baseTime = DateTime.now().subtract(Duration(seconds: offset));
      await state.pref.resinBaseTime.setValueWithConversion(baseTime);
    }
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setHoyolabServer(HyvServer server, String username) async {
    await state.pref.hyvServer.setValue(server.region);
    await state.pref.hyvServerName.setValue(server.name);
    await state.pref.hyvUserName.setValue(username);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setUid(String uid) async {
    await state.pref.hyvUid.setValue(uid);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> clearHoyolabCredential() async {
    await deleteHoyolabCookie();
    await state.pref.hyvServer.setValue(null);
    await state.pref.hyvServerName.setValue(null);
    await state.pref.hyvUserName.setValue(null);
    await state.pref.hyvUid.setValue(null);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setSyncResin(bool value) async {
    await state.pref.syncResin.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setSyncCharaState(bool value) async {
    await state.pref.syncCharaState.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setSyncWeaponState(bool value) async {
    await state.pref.syncWeaponState.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setAutoRemoveBookmarks(bool value) async {
    await state.pref.autoRemoveBookmarks.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setSyncBagLackNums(bool value) async {
    await state.pref.syncBagLackNums.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setShowItemNameOnCard(bool value) async {
    await state.pref.showItemNameOnCard.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setDailyResetServer(GameServer server) async {
    await state.pref.dailyResetServer.setValueWithConversion(server);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setIndexSheetTutorialShown() async {
    await state.pref.indexSheetTutorialShown.setValue(true);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> addBannerReadKey(String key) async {
    final keys = List<String>.from(state.pref.bannerReadKeys.value);
    keys.add(key);
    await state.pref.bannerReadKeys.setValue(keys);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setAdventureRank(int value) async {
    await state.pref.adventureRank.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setCondensedMultiplier(double value) async {
    await state.pref.condensedMultiplier.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setShowFarmCount(bool value) async {
    await state.pref.showFarmCount.setValue(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setCharacterSortType(CharacterSortType type) async {
    await state.pref.characterSortType.setValueWithConversion(type);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setWeaponSortType(WeaponSortType type) async {
    await state.pref.weaponSortType.setValueWithConversion(type);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }
}

@freezed
sealed class PreferencesState with _$PreferencesState {
  const PreferencesState._();

  const factory PreferencesState({
    required KvPreferences pref,
    required int? resin,
    required DateTime? resinBaseTime,
    required String? hyvServer,
    required String? hyvServerName,
    required String? hyvUserName,
    required String? hyvUid,
    required bool syncResin,
    required bool syncCharaState,
    required bool syncWeaponState,
    required bool autoRemoveBookmarks,
    required bool syncBagLackNums,
    required bool showItemNameOnCard,
    required GameServer dailyResetServer,
    required bool indexSheetTutorialShown,
    required List<String> bannerReadKeys,
    required int adventureRank,
    required double condensedMultiplier,
    required bool showFarmCount,
    required CharacterSortType characterSortType,
    required WeaponSortType weaponSortType,
  }) = _PreferencesState;

  factory PreferencesState.fromSharedPreferences(KvPreferences pref) {
    return PreferencesState(
      pref: pref,
      resin: pref.resin.value,
      resinBaseTime: pref.resinBaseTime.convertedValue,
      hyvServer: pref.hyvServer.value,
      hyvServerName: pref.hyvServerName.value,
      hyvUserName: pref.hyvUserName.value,
      hyvUid: pref.hyvUid.value,
      syncResin: pref.syncResin.value,
      syncCharaState: pref.syncCharaState.value,
      syncWeaponState: pref.syncWeaponState.value,
      autoRemoveBookmarks: pref.autoRemoveBookmarks.value,
      syncBagLackNums: pref.syncBagLackNums.value,
      showItemNameOnCard: pref.showItemNameOnCard.value,
      dailyResetServer: pref.dailyResetServer.convertedValue,
      indexSheetTutorialShown: pref.indexSheetTutorialShown.value,
      bannerReadKeys: pref.bannerReadKeys.value,
      adventureRank: pref.adventureRank.value,
      condensedMultiplier: pref.condensedMultiplier.value,
      showFarmCount: pref.showFarmCount.value,
      characterSortType: pref.characterSortType.convertedValue,
      weaponSortType: pref.weaponSortType.convertedValue,
    );
  }

  bool get isLinkedWithHoyolab =>
      hyvServer != null &&
      hyvServerName != null &&
      hyvUserName != null &&
      hyvUid != null &&
      FirebaseRemoteConfig.instance.getBool(RemoteConfigKey.hoyolabLinkEnabled);
}
