import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../core/kv_preferences.dart";

part "preferences.freezed.dart";
part "preferences.g.dart";

@riverpod
class PreferencesStateNotifier extends _$PreferencesStateNotifier {
  @override
  Future<PreferencesState> build() async {
    final pref = await SharedPreferences.getInstance();

    return PreferencesState(
      resin: KvPreferences(pref).resin,
      resinBaseTime: KvPreferences(pref).resinBaseTime,
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
}

@freezed
class PreferencesState with _$PreferencesState {
  const factory PreferencesState({
    required int resin,
    required DateTime resinBaseTime,
  }) = _PreferencesState;
}
