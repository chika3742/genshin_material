import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/providers/filter_state.dart";
import "package:genshin_material/providers/pref_notifier.dart";

import "../../utils/in_memory_pref_notifier.dart";

void main() {
  /// Builds a container whose sort-type prefs are backed by memory instead of
  /// `SharedPreferences`, which is not available in a unit test.
  ProviderContainer createContainer({
    CharacterSortType characterSortType = CharacterSortType.defaultSort,
    WeaponSortType weaponSortType = WeaponSortType.defaultSort,
  }) {
    return ProviderContainer.test(overrides: [
      overridePref(PrefKeys.characterSortType, characterSortType),
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

      expect(state.possessionStatus, isNull);
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

    test("setPossessionStatus updates only the possession status", () {
      notifier.setPossessionStatus(PossessionStatus.owned);

      final state = readState();
      expect(state.possessionStatus, PossessionStatus.owned);
      expect(state.rarity, isNull);
      expect(state.element, isNull);
      expect(state.weaponType, isNull);
    });

    test("setPossessionStatus clears the possession status with null", () {
      notifier.setPossessionStatus(PossessionStatus.notOwned);

      notifier.setPossessionStatus(null);

      expect(readState().possessionStatus, isNull);
    });

    test("setRarity updates only the rarity", () {
      notifier.setRarity(5);

      final state = readState();
      expect(state.rarity, 5);
      expect(state.possessionStatus, isNull);
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

    test("isFiltering becomes true for the possession status alone", () {
      notifier.setPossessionStatus(PossessionStatus.owned);

      expect(readState().isFiltering, isTrue);
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

    test("isFiltering stays false when only the sort type is set", () {
      notifier.setSortType(CharacterSortType.element);

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

    test("clear resets every filter", () {
      notifier.setPossessionStatus(PossessionStatus.owned);
      notifier.setRarity(5);
      notifier.setElement("anemo");
      notifier.setWeaponType("catalyst");

      notifier.clear();

      final state = readState();
      expect(state.possessionStatus, isNull);
      expect(state.rarity, isNull);
      expect(state.element, isNull);
      expect(state.weaponType, isNull);
      expect(state.isFiltering, isFalse);
    });

    test("setSortType discards the filters that were already set", () {
      notifier.setRarity(5);
      notifier.setElement("pyro");

      notifier.setSortType(CharacterSortType.name);

      // `build` watches the very pref that `setSortType` writes, so the
      // notifier is rebuilt from scratch and the filters are lost.
      final state = readState();
      expect(state.sortType, CharacterSortType.name);
      expect(state.rarity, isNull);
      expect(state.element, isNull);
    });

    test("clear resets the sort type in the state but leaves the pref alone",
        () {
      notifier.setSortType(CharacterSortType.name);
      // Read once so the rebuild caused by the pref write happens before
      // `clear` assigns its state; otherwise it would overwrite it.
      expect(readState().sortType, CharacterSortType.name);

      notifier.clear();

      expect(readState().sortType, CharacterSortType.defaultSort);
      // The persisted value survives, so the previous sort type comes back the
      // next time the notifier is built.
      expect(
        container.read(prefProvider(PrefKeys.characterSortType)),
        CharacterSortType.name,
      );
    });
  });

  group("ArtifactFilterStateNotifier", () {
    late ProviderContainer container;
    late ArtifactFilterStateNotifier notifier;

    setUp(() {
      container = createContainer();
      notifier = container.read(artifactFilterStateProvider.notifier);
    });

    List<String> readTags() =>
        container.read(artifactFilterStateProvider).tags;

    test("starts with no tag", () {
      expect(readTags(), isEmpty);
    });

    test("addTag appends the tag", () {
      notifier.addTag("tag_a");
      notifier.addTag("tag_b");

      expect(readTags(), ["tag_a", "tag_b"]);
    });

    test("addTag allows the same tag twice", () {
      notifier.addTag("tag_a");
      notifier.addTag("tag_a");

      expect(readTags(), ["tag_a", "tag_a"]);
    });

    test("removeTag removes every occurrence of the tag", () {
      notifier.addTag("tag_a");
      notifier.addTag("tag_b");
      notifier.addTag("tag_a");

      notifier.removeTag("tag_a");

      expect(readTags(), ["tag_b"]);
    });

    test("removeTag leaves the tags untouched for an unknown tag", () {
      notifier.addTag("tag_a");

      notifier.removeTag("tag_b");

      expect(readTags(), ["tag_a"]);
    });

    test("clear removes every tag", () {
      notifier.addTag("tag_a");
      notifier.addTag("tag_b");

      notifier.clear();

      expect(readTags(), isEmpty);
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

    test("clear resets the sort type in the state but leaves the pref alone",
        () {
      notifier.setSortType(WeaponSortType.rarity);
      // Read once so the rebuild caused by the pref write happens before
      // `clear` assigns its state; otherwise it would overwrite it.
      expect(
        container.read(weaponFilterStateProvider).sortType,
        WeaponSortType.rarity,
      );

      notifier.clear();

      expect(
        container.read(weaponFilterStateProvider).sortType,
        WeaponSortType.defaultSort,
      );
      expect(
        container.read(prefProvider(PrefKeys.weaponSortType)),
        WeaponSortType.rarity,
      );
    });
  });
}
