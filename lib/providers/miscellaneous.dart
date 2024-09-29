import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/hoyolab_api.dart";
import "../models/hoyolab_api.dart";
import "../utils/secure_storage.dart";

part "miscellaneous.g.dart";

@riverpod
class RealtimeNotesActivationState extends _$RealtimeNotesActivationState {
  @override
  Future<bool> build() async {
    final cookie = await getHoyolabCookie();
    if (cookie == null) {
      return false;
    }

    final api = HoyolabApi(cookie: cookie);
    final result = await api.getGameRecordCards();
    return result.list
        .firstWhere((e) => e.gameType == GameType.genshin)
        .dataSwitches
        .firstWhere((e) => e.switchId == DataSwitchType.enableRealtimeNotes)
        .isPublic;
  }

  Future<void> updateValue(bool value) async {
    final cookie = await getHoyolabCookie();
    if (cookie == null) {
      throw StateError("cookie is null");
    }

    state = const AsyncLoading();
    await HoyolabApi(cookie: cookie).changeDataSwitch(DataSwitchType.enableRealtimeNotes, value);

    state = AsyncData(value);
  }
}
