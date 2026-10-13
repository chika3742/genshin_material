import "dart:math";

import "package:freezed_annotation/freezed_annotation.dart";

import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/level_range_values.dart";

part "level_slider_state.freezed.dart";

@Freezed(copyWith: true)
sealed class LevelSliderState with _$LevelSliderState {
  const LevelSliderState._();

  const factory LevelSliderState({
    required Map<Purpose, LevelRangeValues> ranges,
    required Set<Purpose> hiddenPurposes,
  }) = _LevelSliderState;

  factory LevelSliderState.initial({
    required IngredientConfigurations ingredients,
    required int rarity,
    Map<Purpose, int> levels = const {},
    Map<Purpose, ({int minUpperLevel, int maxUpperLevel})> bookmarkRanges = const {},
  }) {
    final rangeValues = <Purpose, LevelRangeValues>{};
    final hiddenTalents = <Purpose>{};

    final talents = {Purpose.normalAttack, Purpose.elementalSkill, Purpose.elementalBurst};
    final hasBookmarkedTalents = talents.any((e) => bookmarkRanges.containsKey(e));

    for (final purpose in ingredients.rarities[rarity]!.purposes.keys) {
      final ingLevels = ingredients.getLevels(rarity: rarity, purpose: purpose).levels;
      final levelTicks = ingLevels.keys.toList();
      final characterCurrentLevel = levels[purpose] ?? 1;

      final LevelRangeValues range;
      if (bookmarkRanges.containsKey(purpose)) {
        final bookmark = bookmarkRanges[purpose]!;
        final minUpperLevelIndex = levelTicks.indexOf(bookmark.minUpperLevel);
        final start = minUpperLevelIndex >= 1 ? levelTicks[minUpperLevelIndex - 1] : levelTicks.first;
        range = LevelRangeValues(start, bookmark.maxUpperLevel);
      } else {
        range = LevelRangeValues(characterCurrentLevel, ingLevels.keys.last);
        // Slider should be initially closed if:
        // There are talent bookmarks and this purpose is not bookmarked
        // OR
        // Talent is fully leveled.
        if (purpose != .ascension && (hasBookmarkedTalents || range.start == range.end)) {
          hiddenTalents.add(purpose);
        }
      }

      rangeValues[purpose] = range;
    }

    return LevelSliderState(
      ranges: rangeValues,
      hiddenPurposes: hiddenTalents,
    );
  }

  LevelSliderState withLevels(
    Map<Purpose, int> levels, {
    required IngredientConfigurations ingredients,
    required int rarity,
  }) {
    var newState = this;
    for (final e in levels.entries) {
      final ingLevels = ingredients.getLevels(rarity: rarity, purpose: e.key);
      newState = newState.copyWith(
        ranges: {...newState.ranges}..[e.key] = LevelRangeValues(e.value, max(e.value, newState.ranges[e.key]!.end)),
      );
      if (e.key != .ascension && e.value == ingLevels.levels.keys.last) {
        newState = newState.copyWith(
          hiddenPurposes: {...newState.hiddenPurposes}..add(e.key),
        );
      }
    }
    return newState;
  }

  Map<Purpose, LevelRangeValues> visibleRanges(Iterable<Purpose> purposes) {
    return {
      for (final purpose in purposes)
        if (ranges[purpose] case final range? when !hiddenPurposes.contains(purpose))
          purpose: range,
    };
  }
}
