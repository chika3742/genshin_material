import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/pref_keys.dart";
import "../models/common.dart";
import "pref_notifier.dart";

part "filter_state.freezed.dart";
part "filter_state.g.dart";

@riverpod
class CharacterFilterStateNotifier extends _$CharacterFilterStateNotifier {
  @override
  CharacterFilterState build() {
    final sortType = ref.read(prefProvider(PrefKeys.characterSortType));
    final sortMode = ref.read(prefProvider(PrefKeys.characterSortMode));
    return CharacterFilterState(sortType: sortType, sortMode: sortMode);
  }

  void setRarity(int? rarity) {
    state = state.copyWith(rarity: rarity);
  }

  void setElement(TeyvatElement? element) {
    state = state.copyWith(element: element);
  }

  void setWeaponType(WeaponType? weaponType) {
    state = state.copyWith(weaponType: weaponType);
  }

  void setSortType(CharacterSortType sortType) {
    state = state.copyWith(sortType: sortType);
    ref.read(prefProvider(PrefKeys.characterSortType).notifier).set(sortType);
  }

  void setSortMode(SortMode mode) {
    state = state.copyWith(sortMode: mode);
    ref.read(prefProvider(PrefKeys.characterSortMode).notifier).set(mode);
  }

  void clearFilters() {
    state = CharacterFilterState(sortType: state.sortType, sortMode: state.sortMode);
  }
}

@Freezed(copyWith: true)
sealed class CharacterFilterState with _$CharacterFilterState {
  const CharacterFilterState._();

  const factory CharacterFilterState({
    int? rarity,
    TeyvatElement? element,
    WeaponType? weaponType,
    required CharacterSortType sortType,
    required SortMode sortMode,
  }) = _CharacterFilterState;

  bool get isFiltering => rarity != null || element != null || weaponType != null;
}

enum CharacterSortType {
  defaultSort,
  name,
  element,
}

enum SortMode {
  ascending,
  descending,
}

@riverpod
class WeaponFilterStateNotifier extends _$WeaponFilterStateNotifier {
  @override
  WeaponFilterState build() {
    final sortType = ref.read(prefProvider(PrefKeys.weaponSortType));
    return WeaponFilterState(sortType: sortType);
  }

  void setSortType(WeaponSortType sortType) {
    state = state.copyWith(sortType: sortType);
    ref.read(prefProvider(PrefKeys.weaponSortType).notifier).set(sortType);
  }
}

@Freezed(copyWith: true)
sealed class WeaponFilterState with _$WeaponFilterState {
  const factory WeaponFilterState({
    @Default(WeaponSortType.defaultSort) WeaponSortType sortType,
  }) = _WeaponFilterState;
}

enum WeaponSortType {
  defaultSort,
  name,
  rarity,
}
