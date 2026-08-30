import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/level_range_values.dart";
import "package:genshin_material/models/weapon.dart";
import "package:genshin_material/utils/lists.dart";

import "../../utils/asset_data.dart";

void main() {
  group("sortedDescendingByRarity", () {
    test("orders by descending rarity", () {
      final weapons = [
        buildTestWeapon(id: "r3", rarity: 3),
        buildTestWeapon(id: "r5", rarity: 5),
        buildTestWeapon(id: "r4", rarity: 4),
      ];

      expect(
        weapons.sortedDescendingByRarity().map((e) => e.id),
        ["r5", "r4", "r3"],
      );
    });

    test("keeps the original order within a rarity", () {
      final weapons = [
        buildTestWeapon(id: "r4_a", rarity: 4),
        buildTestWeapon(id: "r5_a", rarity: 5),
        buildTestWeapon(id: "r4_b", rarity: 4),
        buildTestWeapon(id: "r5_b", rarity: 5),
      ];

      expect(
        weapons.sortedDescendingByRarity().map((e) => e.id),
        ["r5_a", "r5_b", "r4_a", "r4_b"],
      );
    });

    test("leaves an empty list empty", () {
      expect(<Weapon>[].sortedDescendingByRarity(), isEmpty);
    });
  });

  group("groupByType", () {
    test("orders the groups by the given weaponTypes", () {
      final weapons = [
        buildTestWeapon(id: "bow_1", type: "bow"),
        buildTestWeapon(id: "sword_1", type: "sword"),
        buildTestWeapon(id: "bow_2", type: "bow"),
      ];

      final grouped = weapons.groupByType(const ["sword", "bow"]);

      expect(grouped.keys, ["sword", "bow"]);
      expect(grouped["bow"]!.map((e) => e.id), ["bow_1", "bow_2"]);
      expect(grouped["sword"]!.map((e) => e.id), ["sword_1"]);
    });

    test("omits types that no weapon in the list has", () {
      final weapons = [buildTestWeapon(id: "sword_1", type: "sword")];

      expect(
        weapons.groupByType(const ["sword", "bow"]).keys,
        ["sword"],
      );
    });

    // The comparator is `weaponTypes.indexOf(a) - weaponTypes.indexOf(b)`, so
    // every type missing from weaponTypes maps to -1 and they all compare
    // equal. The SplayTreeMap then treats them as one key and silently drops
    // all but one group. This pins the current behaviour: the production code
    // relies on weaponTypes covering every type, and does not enforce it.
    test("collapses types missing from weaponTypes into a single group", () {
      final weapons = [
        buildTestWeapon(id: "catalyst_1", type: "catalyst"),
        buildTestWeapon(id: "polearm_1", type: "polearm"),
      ];

      final grouped = weapons.groupByType(const ["sword", "bow"]);

      expect(grouped, hasLength(1));
      // The first key inserted survives, but the value of the last one wins.
      expect(grouped.keys, ["catalyst"]);
      expect(grouped["catalyst"]!.map((e) => e.id), ["polearm_1"]);
    });
  });

  group("mapInLevelRange", () {
    final map = {20: "a", 30: "b", 40: "c", 50: "d"};

    test("excludes start and includes end", () {
      expect(
        map.mapInLevelRange(
          const LevelRangeValues(20, 40),
          (key, value) => "$key:$value",
        ),
        ["30:b", "40:c"],
      );
    });

    test("yields nothing when the range covers no key", () {
      expect(
        map.mapInLevelRange(
          const LevelRangeValues(40, 40),
          (key, value) => "$key:$value",
        ),
        isEmpty,
      );
    });
  });

  group("indexOfCeilToNearest", () {
    final list = [20, 40, 50];

    test("returns the index of an exact match", () {
      expect(list.indexOfCeilToNearest(40), 1);
    });

    test("returns the index of the next element when there is no exact match", () {
      expect(list.indexOfCeilToNearest(35), 1);
      expect(list.indexOfCeilToNearest(1), 0);
    });

    test("returns -1 when the target exceeds every element", () {
      expect(list.indexOfCeilToNearest(60), -1);
    });

    test("returns -1 for an empty list", () {
      expect(<int>[].indexOfCeilToNearest(1), -1);
    });
  });

  group("EqualityList", () {
    test("equal contents compare equal and share a hashCode", () {
      final a = EqualityList([1, 2, 3]);
      final b = EqualityList([1, 2, 3]);

      expect(a == b, isTrue);
      expect(a.hashCode, b.hashCode);
    });

    test("different contents do not compare equal", () {
      expect(EqualityList([1, 2, 3]) == EqualityList([1, 2]), isFalse);
    });

    test("a different type argument does not compare equal", () {
      final Object other = EqualityList<String>([]);

      expect(EqualityList<int>([]) == other, isFalse);
    });

    test("a plain List does not compare equal", () {
      expect(EqualityList([1, 2, 3]) == [1, 2, 3], isFalse);
    });

    test("reads and writes like a List", () {
      final list = EqualityList([1, 2, 3]);

      expect(list.length, 3);
      expect(list[0], 1);

      list[0] = 10;
      expect(list[0], 10);

      list.length = 2;
      expect(list, [10, 2]);
    });
  });
}
