import "dart:developer";

import "package:collection/collection.dart";
import "package:drift/drift.dart";
import "package:drift/remote.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../components/game_data_sync_indicator.dart";
import "../core/hoyolab_api.dart";
import "../core/secure_storage.dart";
import "../database.dart";
import "../db/in_game_character_state_db_extension.dart";
import "../db/in_game_weapon_state_db_extension.dart";
import "../db/material_bag_count_db_extension.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/hoyolab_api.dart";
import "database_provider.dart";
import "preferences.dart";
import "versions.dart";

part "game_data_sync.g.dart";

@riverpod
class LevelBagSyncStateNotifier extends _$LevelBagSyncStateNotifier {
  @override
  GameDataSyncStatus build({String? variantId, String? weaponId}) {
    return const GameDataSyncStatus.synced();
  }

  Future<Map<Purpose, int>> syncInGameCharacter() async {
    final assetData = ref.read(assetDataProvider).value!;
    final db = ref.read(appDatabaseProvider);
    final prefs = ref.read(preferencesStateNotifierProvider);

    assert(prefs.hyvServer != null && prefs.hyvUid != null);
    assert(variantId != null || weaponId != null);

    final hoyolabCookie = await getHoyolabCookie();
    if (hoyolabCookie == null) {
      state = const GameDataSyncStatus.error(error: "No hoyolab cookie");
      return {}; // error
    }
    final api = HoyolabApi(cookie: hoyolabCookie, uid: prefs.hyvUid!, region: prefs.hyvServer!);

    final variant = variantId != null ? assetData.characters[variantId] as CharacterOrVariant : null;
    final character = switch (variant) {
      ListedCharacter() => variant,
      CharacterVariant(:final parentId) => assetData.characters[parentId] as CharacterGroup,
      null => null,
      _ => throw StateError("Invalid variant type: $variant"),
    };

    state = const GameDataSyncStatus.syncing();

    if (prefs.syncBagCounts) {
      // fetch bag counts
      try {
        CalcComputeItem computeReq = const CalcComputeItem();

        if (variantId != null) {
          final int avatarId;
          if (character!.hyvIds.length > 2) {
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
          // append character info to the compute request
          computeReq = computeReq.copyWith(
            avatarId: avatarId,
            currentAvatarLevel: 1,
            elementAttrId: assetData.elements[variant!.element]!.hyvId,
            targetAvatarLevel: assetData.characterIngredients.purposes[Purpose.ascension]!.levels.keys.last,
            skills: variant.talents.values.map((e) => CalcComputeSkill(
              id: e.idList.first,
              currentLevel: 1,
              targetLevel: assetData.characterIngredients.purposes[Purpose.normalAttack]!.levels.keys.last,
            ),).toList(),
          );
        }
        if (weaponId != null) {
          final weapon = assetData.weapons[weaponId]!;
          // append weapon info to the compute request
          computeReq = computeReq.copyWith(
            weapon: CalcComputeWeapon(
              id: weapon.hyvId,
              currentLevel: 1,
              targetLevel: assetData.weaponIngredients.rarities[weapon.rarity]!.levels.keys.last,
              rarity: weapon.rarity,
              name: weapon.name.localized,
            ),
          );
        }

        final calcResult = await api.batchCompute([computeReq]);

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

    if (variantId != null && (prefs.syncCharaState || prefs.syncWeaponState)) {
      // fetch character levels
      final AvatarListResultItem? charaInfo;
      try {
        charaInfo = await HoyolabApiUtils.loopUntilCharacter(
          character!.hyvIds,
          (page) {
            return api.avatarList(
              page,
              elementIds: [assetData.elements[variant!.element]!.hyvId],
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
        final characterLevels = <Purpose, int>{};
        final weaponLevels = <Purpose, int>{};

        if (prefs.syncCharaState) {
          // map character levels
          characterLevels[Purpose.ascension] = int.parse(charaInfo.currentLevel);

          final skills = charaInfo.skills.where((element) => element.maxLevel != 1);
          skills.forEachIndexed((index, element) {
            final purpose = switch (index) {
              0 => Purpose.normalAttack,
              1 => Purpose.elementalSkill,
              2 => Purpose.elementalBurst,
              _ => throw "Invalid talent index",
            };
            characterLevels[purpose] = element.currentLevel;
          });

          try {
            await db.setCharacterState(InGameCharacterStateCompanion.insert(
              uid: prefs.hyvUid!,
              characterId: variant!.id,
              purposes: characterLevels,
              equippedWeaponId: Value.absentIfNull(
                assetData.weapons.values.firstWhereOrNull((e) => e.hyvId == charaInfo!.weapon?.id)?.id,
              ),
            ),);
          } on DriftRemoteException catch (e, st) {
            state = GameDataSyncStatus.error(error: e);
            log("Error saving character levels", error: e, stackTrace: st);
            return {}; // error
          }
        }

        if (prefs.syncWeaponState && weaponId != null) {
          if (charaInfo.weapon != null && charaInfo.weapon!.id == assetData.weapons[weaponId]!.hyvId) {
            weaponLevels[Purpose.ascension] = charaInfo.weapon!.currentLevel;

            try {
              await db.setWeaponLevels(
                prefs.hyvUid!,
                variant!.id,
                weaponId!,
                charaInfo.weapon!.currentLevel,
              );
            } on DriftRemoteException catch (e, st) {
              state = GameDataSyncStatus.error(error: e);
              log("Error saving character levels", error: e, stackTrace: st);
              return {}; // error
            }
          } else {
            state = const GameDataSyncStatus.weaponNotEquipped();
            return {}; // error
          }
        }

        state = const GameDataSyncStatus.synced();
        if (weaponId == null) {
          return characterLevels;
        } else {
          return weaponLevels;
        }
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
