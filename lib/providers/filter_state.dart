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

  void setRarity(int? rarity) {
    state = state.copyWith(rarity: rarity);
  }

  void setElement(TeyvatElement? element) {
    state = state.copyWith(element: element);
  }

  void setWeaponType(WeaponType? weaponType) {
    state = state.copyWith(weaponType: weaponType);
  }

  void clear() {
    state = const CharacterFilterState();
  }
}

@Freezed(copyWith: true)
class CharacterFilterState with _$CharacterFilterState {
  const CharacterFilterState._();

  const factory CharacterFilterState({
    int? rarity,
    TeyvatElement? element,
    WeaponType? weaponType,
  }) = _CharacterFilterState;

  bool get isFiltering => rarity != null || element != null || weaponType != null;
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
class ArtifactFilterState with _$ArtifactFilterState {
  const factory ArtifactFilterState({
    @Default([])
    List<String> tags,
  }) = _ArtifactFilterState;
}
