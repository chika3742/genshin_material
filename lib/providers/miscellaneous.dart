import "dart:io";

import "package:riverpod_annotation/riverpod_annotation.dart";

import "../db/in_game_character_state_db_extension.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "database_provider.dart";
import "hoyolab_api.dart";
import "hoyolab_game_server.dart";

part "miscellaneous.g.dart";

@riverpod
class RealtimeNotesActivationState extends _$RealtimeNotesActivationState {
  @override
  Future<bool> build() async {
    if (!ref.watch(isHoyolabSignedInProvider)) {
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
Future<List<CharacterId>?> ownedCharacters(Ref ref) async {
  final uid = ref.watch(hoyolabGameServerProvider).uidOrNull;
  if (uid == null) {
    return null;
  }
  final db = ref.watch(appDatabaseProvider);
  return await db.getSyncedCharacters(uid);
}

@riverpod
bool shouldHideImages(Ref ref) {
  if (!Platform.isIOS && !Platform.isMacOS) {
    return false;
  }

  return !ref.watch(isHoyolabSignedInProvider);
}
