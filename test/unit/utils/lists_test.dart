import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/level_range_values.dart";
import "package:genshin_material/models/weapon.dart";
import "package:genshin_material/utils/lists.dart";

import "../../utils/asset_data.dart";

void main() {
  group("sortedDescendingByRarity", () {
    test("レアリティの降順に並ぶ", () {
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

    test("同じレアリティ内では元の順序が保持される", () {
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

    test("空のリストは空のまま", () {
      expect(<Weapon>[].sortedDescendingByRarity(), isEmpty);
    });
  });

  group("groupByType", () {
    test("weaponTypes に与えた順序に従って並ぶ", () {
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

    test("リストに存在しない種別はキーに現れない", () {
      final weapons = [buildTestWeapon(id: "sword_1", type: "sword")];

      expect(
        weapons.groupByType(const ["sword", "bow"]).keys,
        ["sword"],
      );
    });
  });

  group("mapInLevelRange", () {
    final map = {20: "a", 30: "b", 40: "c", 50: "d"};

    test("start は含まず end は含む", () {
      expect(
        map.mapInLevelRange(
          const LevelRangeValues(20, 40),
          (key, value) => "$key:$value",
        ),
        ["30:b", "40:c"],
      );
    });

    test("範囲に何も入らなければ空になる", () {
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

    test("完全に一致する要素の index を返す", () {
      expect(list.indexOfCeilToNearest(40), 1);
    });

    test("一致しなければ直後の要素の index を返す", () {
      expect(list.indexOfCeilToNearest(35), 1);
      expect(list.indexOfCeilToNearest(1), 0);
    });

    test("すべての要素より大きければ -1 を返す", () {
      expect(list.indexOfCeilToNearest(60), -1);
    });

    test("空のリストなら -1 を返す", () {
      expect(<int>[].indexOfCeilToNearest(1), -1);
    });
  });

  group("EqualityList", () {
    test("内容が同じなら == が true になり hashCode も一致する", () {
      final a = EqualityList([1, 2, 3]);
      final b = EqualityList([1, 2, 3]);

      expect(a == b, isTrue);
      expect(a.hashCode, b.hashCode);
    });

    test("内容が違えば == が false になる", () {
      expect(EqualityList([1, 2, 3]) == EqualityList([1, 2]), isFalse);
    });

    test("型引数が違えば == が false になる", () {
      expect(EqualityList<int>([]) == EqualityList<String>([]), isFalse);
    });

    test("素の List と比較しても == は false になる", () {
      // ignore: unrelated_type_equality_checks
      expect(EqualityList([1, 2, 3]) == [1, 2, 3], isFalse);
    });

    test("List として読み書きできる", () {
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
