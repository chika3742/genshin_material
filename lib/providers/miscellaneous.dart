import "package:collection/collection.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/hoyolab_api.dart";
import "../core/secure_storage.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "preferences.dart";
import "versions.dart";

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
  final apiInfo = ref.watch(preferencesStateNotifierProvider.select((s) => s.isLinkedWithHoyolab ? (s.hyvServer!, s.hyvUid!) : null));
  if (apiInfo == null) {
    return null;
  }
  final assetData = ref.read(assetDataProvider).value!;
  final avatarList =  await HoyolabApiUtils.fetchAllCharacters(apiInfo.$1, apiInfo.$2);
  final result = <CharacterId>[];
  for (final e in avatarList) {
    final c = assetData.characters.values.firstWhereOrNull((c) => c is CharacterWithLargeImage && c.hyvIds.contains(e.id));
    if (c != null) {
      result.add(c.id);
    }
  }
  return result;
}
