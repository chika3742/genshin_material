import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../models/common.dart";

part "character_filter_state.freezed.dart";
part "character_filter_state.g.dart";

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

@freezed
class CharacterFilterState with _$CharacterFilterState {
  const CharacterFilterState._();

  const factory CharacterFilterState({
    int? rarity,
    TeyvatElement? element,
    WeaponType? weaponType,
  }) = _CharacterFilterState;

  bool get isFiltering => rarity != null || element != null || weaponType != null;
}
