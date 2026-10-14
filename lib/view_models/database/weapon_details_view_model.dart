import "package:collection/collection.dart";
import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/pref_keys.dart";
import "../../data/repositories/single_character_state_repository.dart";
import "../../data/services/crashlytics_service.dart";
import "../../db/extensions/bookmark_db_extension.dart";
import "../../models/character.dart";
import "../../models/common.dart";
import "../../models/level_range_values.dart";
import "../../providers/database_provider.dart";
import "../../providers/is_sync_enabled.dart";
import "../../providers/pref_notifier.dart";
import "../../providers/versions.dart";
import "../../ui_models/level_slider_state.dart";

part "weapon_details_view_model.g.dart";
part "weapon_details_view_model.freezed.dart";

/// null = weapon not found
@riverpod
class WeaponDetailsViewModel extends _$WeaponDetailsViewModel {
  /// null = not selected by the user yet
  VariantId? _selectedId;

  @override
  Future<WeaponDetailsState?> build(UniqueKey key, WeaponId id, VariantId? initialSelectedCharacterId) async {
    final db = ref.watch(appDatabaseProvider);
    final assetData = ref.watch(assetDataProvider).requireValue;

    final weapon = assetData.weapons[id];
    if (weapon == null) {
      return null;
    }

    final selectableCharacters = assetData.variants.values
        .where((e) => e.weaponType == weapon.type)
        .toList();
    final selectedId = _selectedId ?? initialSelectedCharacterId;
    final selectedCharacter = selectableCharacters.firstWhereOrNull((e) => e.id == selectedId)
        ?? selectableCharacters.first;

    // Retain the previous state
    if (state.value case final prev? when prev.selectedCharacter.id == selectedCharacter.id) {
      return prev.copyWith(
        selectableCharacters: selectableCharacters,
      );
    }

    final characterState = ref.watch(isCharacterSyncEnabledProvider(variantId: selectedCharacter.id, weaponId: id))
        ? await ref.watch(singleCharacterStateRepositoryProvider(selectedCharacter.id).future)
            .catchError((e, st) {
              ref.read(crashlyticsServiceProvider).logAndReport(e, st);
              return null;
            })
        : null;
    final bookmarkRanges = await db.getWeaponMaterialBookmarkLevelRanges(id, selectedCharacter.id);

    return WeaponDetailsState(
      selectableCharacters: selectableCharacters,
      selectedCharacter: selectedCharacter,
      sliders: LevelSliderState.initial(
        ingredients: assetData.weaponIngredients,
        rarity: weapon.rarity,
        levels: characterState?.equippedWeaponId == id ? characterState!.weaponLevels : null,
        bookmarkRanges: bookmarkRanges,
        previousState: state.value?.sliders,
      ),
    );
  }

  void selectCharacter(VariantId variantId) {
    _selectedId = variantId;
    ref.invalidateSelf();
  }

  /// Applies the levels and deletes obsolete bookmarks. Returns `true` if any
  /// were deleted.
  Future<bool> applySyncedLevels(Map<Purpose, int> levels) async {
    final current = state.value;
    if (current == null) {
      return false;
    }

    final assetData = ref.read(assetDataProvider).requireValue;

    state = AsyncData(current.copyWith(
      sliders: current.sliders.withLevels(
        levels,
        ingredients: assetData.weaponIngredients,
        rarity: assetData.weapons[id]!.rarity,
      ),
    ));

    final autoRemoveBookmarks = ref.read(prefProvider(PrefKeys.autoRemoveBookmarks));
    if (!autoRemoveBookmarks) {
      return false;
    }

    return ref.read(appDatabaseProvider).deleteObsoleteBookmarks(
      characterId: current.selectedCharacter.id,
      weaponId: id,
      levels: levels,
    );
  }

  void setRange(Purpose purpose, LevelRangeValues range) {
    if (state.value case final current?) {
      state = AsyncData(current.copyWith.sliders(
        ranges: {
          ...current.sliders.ranges,
          purpose: range,
        },
      ));
    }
  }
}

@Freezed(copyWith: true)
sealed class WeaponDetailsState with _$WeaponDetailsState {
  const factory WeaponDetailsState({
    required List<CharacterVariant> selectableCharacters,
    required CharacterVariant selectedCharacter,
    required LevelSliderState sliders,
  }) = _WeaponDetailsState;
}
