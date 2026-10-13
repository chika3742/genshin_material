import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/asset_cache.dart";
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

part "character_details_view_model.g.dart";
part "character_details_view_model.freezed.dart";

/// null = character not found
@riverpod
class CharacterDetailsViewModel extends _$CharacterDetailsViewModel {
  @override
  Future<CharacterDetailsState?> build(UniqueKey key, CharacterOrVariantId initialId) async {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final db = ref.watch(appDatabaseProvider);

    final variantId = ref.watch(_characterVariantSelectionProvider(key, initialId));
    if (variantId == null) {
      return null;
    }
    final variant = assetData.variants[variantId]!;
    final character = assetData.characterOf(variant);

    final charaSyncEnabled = ref.watch(isCharacterSyncEnabledProvider(
      variantId: variant.id,
    ));
    final characterState = charaSyncEnabled
        ? await ref.watch(singleCharacterStateRepositoryProvider(variant.id).future)
            .catchError((e, st) {
              ref.read(crashlyticsServiceProvider).logAndReport(e, st);
              return null;
            })
        : null;

    // Retain the previous state when the variant is unchanged.
    if (state.value case final prev? when prev.variant.id == variant.id) {
      return prev.copyWith(variant: variant);
    }

    final bookmarkRanges = await db.getCharacterMaterialBookmarkLevelRanges([character.id, variant.id]);

    return CharacterDetailsState(
      variant: variant,
      sliders: LevelSliderState.initial(
        ingredients: assetData.characterIngredients,
        rarity: variant.rarity,
        levels: characterState?.levels ?? {},
        bookmarkRanges: bookmarkRanges,
      ),
    );
  }

  void selectVariant(VariantId id) {
    final current = state.value;
    if (current == null) {
      return;
    }

    ref.read(prefProvider(PrefKeys.lastSelectedCharacterVariants).notifier).set({
      ...ref.read(prefProvider(PrefKeys.lastSelectedCharacterVariants)),
      current.variant.characterId: id,
    });

    ref.read(_characterVariantSelectionProvider(key, initialId).notifier)
        .set(id);
  }

  /// Applies the levels and deletes obsolete bookmarks. Returns `true` if any
  /// were deleted.
  Future<bool> applySyncedLevels(Map<Purpose, int> levels) async {
    final current = state.value;
    if (current == null) {
      return false;
    }

    final ingredients = ref.read(assetDataProvider).requireValue.characterIngredients;

    state = AsyncData(current.copyWith(
      sliders: current.sliders.withLevels(
        levels,
        ingredients: ingredients,
        rarity: current.variant.rarity,
      ),
    ));

    final autoRemoveBookmarks = ref.read(prefProvider(PrefKeys.autoRemoveBookmarks));
    if (!autoRemoveBookmarks) {
      return false;
    }

    final db = ref.read(appDatabaseProvider);
    // Bookmarks of group-targeted purposes are saved under the group ID.
    final groupPurposes = ingredients.sliders
        .where((e) => e.preferredTargetType == .group)
        .expand((e) => e.purposes);
    final removed = await Future.wait([
      db.deleteObsoleteBookmarks(
        characterId: current.variant.characterId,
        levels: Map.fromEntries(levels.entries.where((e) => groupPurposes.contains(e.key))),
      ),
      db.deleteObsoleteBookmarks(
        characterId: current.variant.id,
        levels: levels,
      ),
    ]);
    return removed.contains(true);
  }

  void setRange(Purpose purpose, LevelRangeValues range) {
    _updateValue((current) => current.copyWith.sliders(
      ranges: {
        ...current.sliders.ranges,
        purpose: range,
      },
    ));
  }

  void setActive(Purpose purpose, bool active) {
    _updateValue((current) => current.copyWith.sliders(
      hiddenPurposes: active
          ? current.sliders.hiddenPurposes.difference({purpose})
          : current.sliders.hiddenPurposes.union({purpose}),
    ));
  }

  void _updateValue(CharacterDetailsState Function(CharacterDetailsState current) cb) {
    if (state.value case final current?) {
      state = AsyncData(cb(current));
    }
  }
}

@Freezed(copyWith: true)
sealed class CharacterDetailsState with _$CharacterDetailsState {
  const factory CharacterDetailsState({
    required CharacterVariant variant,
    required LevelSliderState sliders,
  }) = _CharacterDetailsState;
}

/// null = character not found
@riverpod
class _CharacterVariantSelection extends _$CharacterVariantSelection {
  @override
  VariantId? build(UniqueKey key, CharacterOrVariantId initialId) {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final resolved = _resolveCharacter(assetData);
    if (resolved == null) {
      return null;
    }
    final (character, variant) = resolved;

    final lastSelected = ref.watch(prefProvider(PrefKeys.lastSelectedCharacterVariants)
        .select((s) => s[character.id]));

    final prev = stateOrNull;
    if (prev != null) {
      return prev;
    }

    if (variant != null) {
      return variant.id;
    }
    if (assetData.variants[lastSelected] case final variant?) {
      return variant.id;
    }

    return character.variants.first.id;
  }

  (Character character, CharacterVariant? variant)? _resolveCharacter(AssetData assetData) {
    final character = assetData.characters[initialId];
    final variant = assetData.variants[initialId];
    return switch ((character, variant)) {
      (null, null) => null,
      (null, final variant?) => (assetData.characterOf(variant), variant),
      (final character?, null) => (character, null),
      (final character?, final variant?) => (character, variant),
    };
  }

  void set(VariantId id) {
    state = id;
  }
}
