import "dart:io";

import "package:riverpod_annotation/riverpod_annotation.dart";

import "../data/repositories/hoyolab_cookie_repository.dart";
import "../models/hoyolab_api.dart";
import "hoyolab_api.dart";

part "miscellaneous.g.dart";

@riverpod
class RealtimeNotesActivationState extends _$RealtimeNotesActivationState {
  @override
  Future<bool> build() async {
    if (await ref.watch(hoyolabCookieRepositoryProvider.future) == null) {
      return false;
    }

    final api = await ref.watch(hoyolabAccountApiProvider.future);
    final result = await api.getGameRecordCards();
    return result.list
        .firstWhere((e) => e.gameType == GameType.genshin)
        .dataSwitches
        .firstWhere((e) => e.switchId == DataSwitchType.enableRealtimeNotes)
        .isPublic;
  }

  Future<void> updateValue(bool value) async {
    final api = await ref.read(hoyolabAccountApiProvider.future);

    state = const AsyncLoading();
    await api.changeDataSwitch(DataSwitchType.enableRealtimeNotes, value);

    state = AsyncData(value);
  }
}

@riverpod
bool shouldHideImages(Ref ref) {
  if (!Platform.isIOS && !Platform.isMacOS) {
    return false;
  }

  // The cookie is still loading on the first frame; hiding is the safe answer
  // until it resolves.
  return ref.watch(hoyolabCookieRepositoryProvider).value == null;
}
