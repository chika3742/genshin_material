import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../models/common.dart";

part "filter_state.freezed.dart";
part "filter_state.g.dart";

@riverpod
class CharacterFilterStateNotifier extends _$CharacterFilterStateNotifier {
  @override
  CharacterFilterState build() {
    return const CharacterFilterState();
  }

  void setPossessionStatus(PossessionStatus? possessionStatus) {
    state = state.copyWith(possessionStatus: possessionStatus);
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
  }

  void clear() {
    state = const CharacterFilterState();
  }
}

@Freezed(copyWith: true)
sealed class CharacterFilterState with _$CharacterFilterState {
  const CharacterFilterState._();

  const factory CharacterFilterState({
    PossessionStatus? possessionStatus,
    int? rarity,
    TeyvatElement? element,
    WeaponType? weaponType,
    @Default(CharacterSortType.defaultSort) CharacterSortType sortType,
  }) = _CharacterFilterState;

  bool get isFiltering => possessionStatus != null || rarity != null || element != null || weaponType != null;
}

enum PossessionStatus {
  owned,
  notOwned,
}

enum CharacterSortType {
  defaultSort,
  name,
  element,
}

@riverpod
class ArtifactFilterStateNotifier extends _$ArtifactFilterStateNotifier {
  @override
  ArtifactFilterState build() {
    return const ArtifactFilterState();
  }

  void addTag(String tag) {
    state = state.copyWith(tags: [...state.tags, tag]);
  }

  void removeTag(String tag) {
    state = state.copyWith(tags: state.tags.where((t) => t != tag).toList());
  }

  void clear() {
    state = const ArtifactFilterState();
  }
}

@Freezed(copyWith: true)
sealed class ArtifactFilterState with _$ArtifactFilterState {
  const factory ArtifactFilterState({
    @Default([])
    List<String> tags,
  }) = _ArtifactFilterState;
}

@riverpod
class WeaponFilterStateNotifier extends _$WeaponFilterStateNotifier {
  @override
  WeaponFilterState build() {
    return const WeaponFilterState();
  }

  void setSortType(WeaponSortType sortType) {
    state = state.copyWith(sortType: sortType);
  }

  void clear() {
    state = const WeaponFilterState();
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
