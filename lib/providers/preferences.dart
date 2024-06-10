import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../core/kv_preferences.dart";
import "../models/hoyolab_api.dart";

part "preferences.freezed.dart";
part "preferences.g.dart";

@riverpod
class PreferencesStateNotifier extends _$PreferencesStateNotifier {
  @override
  Future<PreferencesState> build() async {
    final pref = KvPreferences(await SharedPreferences.getInstance());

    return PreferencesState(
      resin: pref.resin,
      resinBaseTime: pref.resinBaseTime,
      cookie: pref.cookie,
      hyvServer: pref.hyvServer,
      hyvServerName: pref.hyvServerName,
      hyvUserName: pref.hyvUserName,
      hyvUid: pref.hyvUid,
    );
  }

  Future<void> setResin(int resin) async {
    final baseTime = DateTime.now();

    await KvPreferences.setResin(resin);
    await KvPreferences.setResinBaseTime(baseTime);

    if (state is AsyncData) {
      state = AsyncData(
        state.value!.copyWith(
          resin: resin,
          resinBaseTime: baseTime,
        ),
      );
    }
  }

  Future<void> setHoyolabCookie(String cookie) async {
    KvPreferences.setCookie(cookie);

    if (state is AsyncData) {
      state = AsyncData(
        state.value!.copyWith(
          cookie: cookie,
        ),
      );
    }
  }

  Future<void> setHoyolabServer(HyvServer server, String username) async {
    KvPreferences.setHyvServer(server.region);
    KvPreferences.setHyvServerName(server.name);
    KvPreferences.setHyvUserName(username);

    if (state is AsyncData) {
      state = AsyncData(
        state.value!.copyWith(
          hyvServer: server.region,
          hyvServerName: server.name,
          hyvUserName: username,
        ),
      );
    }
  }

  Future<void> setUid(String uid) async {
    KvPreferences.setHyvUid(uid);

    if (state is AsyncData) {
      state = AsyncData(
        state.value!.copyWith(
          hyvUid: uid,
        ),
      );
    }
  }

  Future<void> clearHoyolabCredential() async {
    KvPreferences.setCookie("");
    KvPreferences.setHyvServer("");
    KvPreferences.setHyvServerName("");
    KvPreferences.setHyvUserName("");
    KvPreferences.setHyvUid("");

    if (state is AsyncData) {
      state = AsyncData(
        state.value!.copyWith(
          cookie: "",
          hyvServer: "",
          hyvServerName: "",
          hyvUserName: "",
          hyvUid: "",
        ),
      );
    }
  }
}

@freezed
class PreferencesState with _$PreferencesState {
  const PreferencesState._();

  const factory PreferencesState({
    required int resin,
    required DateTime resinBaseTime,
    required String cookie,
    required String hyvServer,
    required String hyvServerName,
    required String hyvUserName,
    required String hyvUid,
  }) = _PreferencesState;

  bool get isLinkedWithHoyolab =>
      cookie.isNotEmpty
          && hyvServer.isNotEmpty
          && hyvServerName.isNotEmpty
          && hyvUserName.isNotEmpty
          && hyvUid.isNotEmpty;
}
