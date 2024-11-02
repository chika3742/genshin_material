import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/hoyolab_api.dart";
import "../core/secure_storage.dart";
import "../db/in_game_character_state_db_extension.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "database_provider.dart";
import "preferences.dart";

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

@riverpod
Future<List<CharacterId>?> ownedCharacters(Ref ref) async {
  final uid = ref.watch(preferencesStateNotifierProvider.select((s) => s.hyvUid));
  if (uid == null) {
    return null;
  }
  final db = ref.watch(appDatabaseProvider);
  return await db.getSyncedCharacters(uid);
}
