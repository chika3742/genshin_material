import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/providers/filter_state.dart";
import "package:genshin_material/providers/pref_notifier.dart";

import "../../utils/in_memory_pref.dart";

void main() {
  /// Builds a container whose sort prefs are backed by memory instead of
  /// `SharedPreferences`, which is not available in a unit test.
  ProviderContainer createContainer({
    CharacterSortType characterSortType = CharacterSortType.defaultSort,
    SortMode characterSortMode = SortMode.ascending,
    WeaponSortType weaponSortType = WeaponSortType.defaultSort,
  }) {
    return ProviderContainer.test(overrides: [
      overridePref(PrefKeys.characterSortType, characterSortType),
      overridePref(PrefKeys.characterSortMode, characterSortMode),
      overridePref(PrefKeys.weaponSortType, weaponSortType),
    ]);
  }

  group("CharacterFilterStateNotifier", () {
    late ProviderContainer container;
    late CharacterFilterStateNotifier notifier;

    setUp(() {
      container = createContainer();
      notifier = container.read(characterFilterStateProvider.notifier);
    });

    CharacterFilterState readState() =>
        container.read(characterFilterStateProvider);

    test("starts with every filter unset", () {
      final state = readState();

      expect(state.rarity, isNull);
      expect(state.element, isNull);
      expect(state.weaponType, isNull);
      expect(state.isFiltering, isFalse);
    });

    test("takes the initial sort type from the pref", () {
      final other = createContainer(characterSortType: CharacterSortType.name);

      expect(
        other.read(characterFilterStateProvider).sortType,
        CharacterSortType.name,
      );
    });

    test("takes the initial sort mode from the pref", () {
      final other = createContainer(characterSortMode: SortMode.descending);

      expect(
        other.read(characterFilterStateProvider).sortMode,
        SortMode.descending,
      );
    });

    test("setRarity updates only the rarity", () {
      notifier.setRarity(5);

      final state = readState();
      expect(state.rarity, 5);
      expect(state.element, isNull);
      expect(state.weaponType, isNull);
    });

    test("setElement updates only the element", () {
      notifier.setElement("pyro");

      final state = readState();
      expect(state.element, "pyro");
      expect(state.weaponType, isNull);
    });

    test("setWeaponType updates only the weapon type", () {
      notifier.setWeaponType("sword");

      final state = readState();
      expect(state.weaponType, "sword");
      expect(state.element, isNull);
    });

    test("keeps the other filters when a second one is set", () {
      notifier.setRarity(4);
      notifier.setElement("hydro");

      final state = readState();
      expect(state.rarity, 4);
      expect(state.element, "hydro");
    });

    test("isFiltering becomes true for the rarity alone", () {
      notifier.setRarity(4);

      expect(readState().isFiltering, isTrue);
    });

    test("isFiltering becomes true for the element alone", () {
      notifier.setElement("geo");

      expect(readState().isFiltering, isTrue);
    });

    test("isFiltering becomes true for the weapon type alone", () {
      notifier.setWeaponType("bow");

      expect(readState().isFiltering, isTrue);
    });

    test("isFiltering stays false when only the sort type and mode are set", () {
      notifier.setSortType(CharacterSortType.element);
      notifier.setSortMode(SortMode.descending);

      expect(readState().isFiltering, isFalse);
    });

    test("setSortType persists the value to the pref", () {
      notifier.setSortType(CharacterSortType.name);

      expect(readState().sortType, CharacterSortType.name);
      expect(
        container.read(prefProvider(PrefKeys.characterSortType)),
        CharacterSortType.name,
      );
    });

    test("setSortMode persists the value to the pref", () {
      notifier.setSortMode(SortMode.descending);

      expect(readState().sortMode, SortMode.descending);
      expect(
        container.read(prefProvider(PrefKeys.characterSortMode)),
        SortMode.descending,
      );
    });

    test("clearFilter resets every filter", () {
      notifier.setRarity(5);
      notifier.setElement("anemo");
      notifier.setWeaponType("catalyst");

      notifier.clearFilters();

      final state = readState();
      expect(state.rarity, isNull);
      expect(state.element, isNull);
      expect(state.weaponType, isNull);
      expect(state.isFiltering, isFalse);
    });

    // Regression: `build` used to watch the sort pref that `setSortType`
    // writes, so the notifier was rebuilt and the filters were lost.
    test("setSortType keeps the filters that were already set", () {
      notifier.setRarity(5);
      notifier.setElement("pyro");

      notifier.setSortType(CharacterSortType.name);

      final state = readState();
      expect(state.sortType, CharacterSortType.name);
      expect(state.rarity, 5);
      expect(state.element, "pyro");
    });

    test("setSortMode keeps the filters that were already set", () {
      notifier.setRarity(5);
      notifier.setElement("pyro");

      notifier.setSortMode(SortMode.descending);

      final state = readState();
      expect(state.sortMode, SortMode.descending);
      expect(state.rarity, 5);
      expect(state.element, "pyro");
    });

    // Regression: clearing the filters used to reset the sort to the default.
    test("clearFilter keeps the sort type and mode", () {
      notifier.setSortType(CharacterSortType.name);
      notifier.setSortMode(SortMode.descending);
      notifier.setRarity(5);

      notifier.clearFilters();

      final state = readState();
      expect(state.sortType, CharacterSortType.name);
      expect(state.sortMode, SortMode.descending);
    });
  });

  group("WeaponFilterStateNotifier", () {
    late ProviderContainer container;
    late WeaponFilterStateNotifier notifier;

    setUp(() {
      container = createContainer();
      notifier = container.read(weaponFilterStateProvider.notifier);
    });

    test("takes the initial sort type from the pref", () {
      final other = createContainer(weaponSortType: WeaponSortType.rarity);

      expect(
        other.read(weaponFilterStateProvider).sortType,
        WeaponSortType.rarity,
      );
    });

    test("starts with the default sort type when the pref holds it", () {
      expect(
        container.read(weaponFilterStateProvider).sortType,
        WeaponSortType.defaultSort,
      );
    });

    test("setSortType persists the value to the pref", () {
      notifier.setSortType(WeaponSortType.name);

      expect(
        container.read(weaponFilterStateProvider).sortType,
        WeaponSortType.name,
      );
      expect(
        container.read(prefProvider(PrefKeys.weaponSortType)),
        WeaponSortType.name,
      );
    });
  });
}
