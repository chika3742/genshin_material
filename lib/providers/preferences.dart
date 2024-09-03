import "dart:math";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/kv_preferences.dart";
import "../main.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "../pages/tools/resin_calc.dart";

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

    await state.pref.setResin(resin);
    await state.pref.setResinBaseTime(resin != null ? baseTime : null);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setResinWithRecoveryTime(int resin, int recoveryTime) async {
    final offset = (maxResin - min<int>(resin, maxResin)) * resinRecoveryRateInMinutes * 60 - recoveryTime;
    final baseTime = DateTime.now().subtract(Duration(seconds: offset));

    await state.pref.setResin(resin);
    await state.pref.setResinBaseTime(baseTime);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setHoyolabCookie(String cookie) async {
    await state.pref.setHyvCookie(cookie);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setHoyolabServer(HyvServer server, String username) async {
    await state.pref.setHyvServer(server.region);
    await state.pref.setHyvServerName(server.name);
    await state.pref.setHyvUserName(username);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setUid(String uid) async {
    await state.pref.setHyvUid(uid);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> clearHoyolabCredential() async {
    await state.pref.setHyvCookie(null);
    await state.pref.setHyvServer(null);
    await state.pref.setHyvServerName(null);
    await state.pref.setHyvUserName(null);
    await state.pref.setHyvUid(null);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setSyncResin(bool value) async {
    await state.pref.setSyncResin(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setSyncCharaState(bool value) async {
    await state.pref.setSyncCharaState(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setShowItemNameOnCard(bool value) async {
    await state.pref.setShowItemNameOnCard(value);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setDailyResetServer(GameServer server) async {
    await state.pref.setDailyResetServer(server.name);
    state = PreferencesState.fromSharedPreferences(state.pref);
  }
}

@freezed
class PreferencesState with _$PreferencesState {
  const PreferencesState._();

  const factory PreferencesState({
    required KvPreferences pref,
    required int? resin,
    required DateTime? resinBaseTime,
    required String? hyvCookie,
    required String? hyvServer,
    required String? hyvServerName,
    required String? hyvUserName,
    required String? hyvUid,
    required bool syncResin,
    required bool syncCharaState,
    required bool showItemNameOnCard,
    required GameServer dailyResetServer,
  }) = _PreferencesState;

  factory PreferencesState.fromSharedPreferences(KvPreferences pref) {
    return PreferencesState(
      pref: pref,
      resin: pref.resin,
      resinBaseTime: pref.resinBaseTime,
      hyvCookie: pref.hyvCookie,
      hyvServer: pref.hyvServer,
      hyvServerName: pref.hyvServerName,
      hyvUserName: pref.hyvUserName,
      hyvUid: pref.hyvUid,
      syncResin: pref.syncResin,
      syncCharaState: pref.syncCharaState,
      showItemNameOnCard: pref.showItemNameOnCard,
      dailyResetServer: GameServer.values.firstWhere((e) => e.name == pref.dailyResetServer),
    );
  }

  bool get isLinkedWithHoyolab =>
      hyvCookie != null
          && hyvServer != null
          && hyvServerName != null
          && hyvUserName != null
          && hyvUid != null;
}
