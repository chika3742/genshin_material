import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/kv_preferences.dart";
import "../main.dart";
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
    final offset = (maxResin - resin) * resinRecoveryRateInMinutes * 60 - recoveryTime;
    final baseTime = DateTime.now().subtract(Duration(seconds: offset));

    await state.pref.setResin(resin);
    await state.pref.setResinBaseTime(baseTime);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setHoyolabCookie(String cookie) async {
    state.pref.setHyvCookie(cookie);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setHoyolabServer(HyvServer server, String username) async {
    state.pref.setHyvServer(server.region);
    state.pref.setHyvServerName(server.name);
    state.pref.setHyvUserName(username);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> setUid(String uid) async {
    state.pref.setHyvUid(uid);

    state = PreferencesState.fromSharedPreferences(state.pref);
  }

  Future<void> clearHoyolabCredential() async {
    state.pref.setHyvCookie(null);
    state.pref.setHyvServer(null);
    state.pref.setHyvServerName(null);
    state.pref.setHyvUserName(null);
    state.pref.setHyvUid(null);

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
    );
  }

  bool get isLinkedWithHoyolab =>
      hyvCookie != null
          && hyvServer != null
          && hyvServerName != null
          && hyvUserName != null
          && hyvUid != null;
}
