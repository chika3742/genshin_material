import "dart:developer";

import "package:riverpod_annotation/riverpod_annotation.dart";

import "../components/game_data_sync_indicator.dart";
import "../core/pref_keys.dart";
import "hoyolab_api.dart";
import "hoyolab_game_server.dart";
import "pref_notifier.dart";
import "resin.dart";

part "game_data_sync.g.dart";

@riverpod
class ResinSyncStateNotifier extends _$ResinSyncStateNotifier {
  @override
  GameDataSyncStatus build() {
    return const GameDataSyncStatus.synced();
  }

  Future<void> syncResin() async {
    final syncResin = ref.read(prefProvider(PrefKeys.syncResin));
    if (!syncResin) {
      return;
    }

    if (!ref.read(isLinkedWithHoyolabProvider)) {
      state = const GameDataSyncStatus.error(
        error: "One or more of Hoyolab server, uid, cookie is not set",
      );
      return; // error
    }

    state = const GameDataSyncStatus.syncing();

    try {
      final api = await ref.read(hoyolabGameApiProvider.future);
      final dailyNote = await api.getDailyNote();
      await ref.read(resinProvider.notifier)
          .setResinWithRecoveryTime(dailyNote.currentResin, int.parse(dailyNote.resinRecoveryTime));
    } on Exception catch (e, st) {
      state = GameDataSyncStatus.error(error: e);
      log("Error syncing resin", error: e, stackTrace: st);
      return; // error
    }

    state = const GameDataSyncStatus.synced();
  }
}
