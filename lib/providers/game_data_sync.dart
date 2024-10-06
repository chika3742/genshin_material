import "dart:developer";

import "package:collection/collection.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sqlite3/sqlite3.dart";

import "../components/game_data_sync_indicator.dart";
import "../core/hoyolab_api.dart";
import "../core/secure_storage.dart";
import "../db/character_level_info_db_extension.dart";
import "../db/material_bag_count_db_extension.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "database_provider.dart";
import "preferences.dart";
import "versions.dart";

part "game_data_sync.g.dart";

@riverpod
class CharacterSyncStateNotifier extends _$CharacterSyncStateNotifier {
  @override
  GameDataSyncStatus build(String variantId) {
    return const GameDataSyncStatus.synced();
  }

  Future<Map<Purpose, int>> syncInGameCharacter() async {
    final assetData = ref.read(assetDataProvider).value;
    final db = ref.read(appDatabaseProvider);
    final prefs = ref.read(preferencesStateNotifierProvider);

    assert(assetData != null && prefs.hyvServer != null && prefs.hyvUid != null);

    final hoyolabCookie = await getHoyolabCookie();
    if (hoyolabCookie == null) {
      state = const GameDataSyncStatus.error(error: "No hoyolab cookie");
      return {}; // error
    }
    final api = HoyolabApi(cookie: hoyolabCookie, uid: prefs.hyvUid!, region: prefs.hyvServer!);

    final variant = assetData!.characters[variantId] as CharacterOrVariant;
    final character = switch (variant) {
      ListedCharacter() => variant,
      CharacterVariant(:final parentId) => assetData.characters[parentId] as CharacterGroup,
      _ => throw StateError("Invalid variant type: $variant"),
    };

    state = const GameDataSyncStatus.syncing();

    if (prefs.syncBagCounts) {
      try {
        final int avatarId;
        if (character.hyvIds.length > 2) {
          final result = await HoyolabApiUtils.loopUntilCharacter(
            character.hyvIds,
            (page) {
              return api.avatarList(
                page,
                elementIds: [],
                weaponCatIds: [assetData.weaponTypes[character.weaponType]!.hyvId],
              );
            },
          );
          avatarId = result?.id ?? character.hyvIds.first;
        } else {
          avatarId = character.hyvIds.first;
        }
        // get bag counts
        final calcResult = await api.batchCompute([
          CalcComputeItem(
            avatarId: avatarId,
            currentAvatarLevel: 1,
            elementAttrId: assetData.elements[variant.element]!.hyvId,
            targetAvatarLevel: assetData.characterIngredients.purposes[Purpose.ascension]!.levels.keys.last,
            skills: variant.talents.values.map((e) => CalcComputeSkill(
              id: e.idList.first,
              currentLevel: 1,
              targetLevel: assetData.characterIngredients.purposes[Purpose.normalAttack]!.levels.keys.last,
            ),).toList(),
          ),
        ]);

        final bagCounts = <int, int>{}; // item id (hyvId) -> count
        for (final item in calcResult.overallConsume) {
          bagCounts[item.id] = item.num - item.lackNum;
        }
        await db.updateMaterialBagCounts(prefs.hyvUid!, bagCounts);
      } on Exception catch (e, st) {
        state = GameDataSyncStatus.error(error: e);
        log("Error syncing bag counts", error: e, stackTrace: st);
        return {}; // error
      }
    }

    if (prefs.syncCharaState) {
      // get character info
      final AvatarListResultItem? charaInfo;
      try {
        charaInfo = await HoyolabApiUtils.loopUntilCharacter(
          character.hyvIds,
          (page) {
            return api.avatarList(
              page,
              elementIds: [assetData.elements[variant.element]!.hyvId],
              weaponCatIds: [assetData.weaponTypes[character.weaponType]!.hyvId],
            );
          },
        );
      } on Exception catch (e, st) {
        state = GameDataSyncStatus.error(error: e);
        log("Error syncing character levels", error: e, stackTrace: st);
        return {}; // error
      }
      if (charaInfo != null) {
        final result = <Purpose, int>{};

        result[Purpose.ascension] = int.parse(charaInfo.currentLevel);

        final skills = charaInfo.skills.where((element) => element.maxLevel != 1);
        skills.forEachIndexed((index, element) {
          final purpose = switch (index) {
            0 => Purpose.normalAttack,
            1 => Purpose.elementalSkill,
            2 => Purpose.elementalBurst,
            _ => throw "Invalid talent index",
          };
          result[purpose] = element.currentLevel;
        });

        try {
          await db.setCharacterLevels(
            prefs.hyvUid!,
            variant.id,
            result,
          );
        } on SqliteException catch (e, st) {
          state = GameDataSyncStatus.error(error: e);
          log("Error saving character levels", error: e, stackTrace: st);
          return {}; // error
        }

        state = const GameDataSyncStatus.synced();
        return result;
      } else {
        state = character is CharacterGroup
            ? const GameDataSyncStatus.mustBeResonatedWithStatue() // traveler
            : const GameDataSyncStatus.characterNotExists();
        return {}; // error
      }
    } else {
      return {}; // Syncing character levels not enabled
    }
  }
}

@riverpod
class ResinSyncStateNotifier extends _$ResinSyncStateNotifier {
  @override
  GameDataSyncStatus build() {
    return const GameDataSyncStatus.synced();
  }

  Future<void> syncResin() async {
    final prefs = ref.read(preferencesStateNotifierProvider);

    if (!prefs.syncResin) {
      return;
    }

    assert(prefs.hyvServer != null && prefs.hyvUid != null);

    final hoyolabCookie = await getHoyolabCookie();
    if (hoyolabCookie == null) {
      state = const GameDataSyncStatus.error(error: "No hoyolab cookie");
      return; // error
    }
    final api = HoyolabApi(cookie: hoyolabCookie, uid: prefs.hyvUid!, region: prefs.hyvServer!);

    state = const GameDataSyncStatus.syncing();

    try {
      final dailyNote = await api.getDailyNote();
      await ref.read(preferencesStateNotifierProvider.notifier)
          .setResinWithRecoveryTime(dailyNote.currentResin, int.parse(dailyNote.resinRecoveryTime));
    } on Exception catch (e, st) {
      state = GameDataSyncStatus.error(error: e);
      log("Error syncing resin", error: e, stackTrace: st);
      return; // error
    }

    state = const GameDataSyncStatus.synced();
  }
}
