import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/material_bag_count_db_extension.dart";

import "../../utils/async.dart";
import "../../utils/db.dart";

void main() {
  late AppDatabase db;

  setUp(() {
    db = createTestDatabase();
  });

  tearDown(() async {
    await db.close();
  });

  Future<List<MaterialBagCount>> readCounts() =>
      db.select(db.materialBagCountTable).get();

  Future<List<MaterialBagCount>> firstEmissionOf(String uid, List<int> hyvIds) =>
      db.watchMaterialBagCounts(uid, hyvIds).first;

  group("watchMaterialBagCounts", () {
    test("Emits only the counts of the given uid", () async {
      await db.updateMaterialBagCounts("uid_1", {1: 10});
      await db.updateMaterialBagCounts("uid_2", {1: 20});

      final rows = await firstEmissionOf("uid_1", [1]);

      expect(rows, hasLength(1));
      expect(rows.single.uid, "uid_1");
      expect(rows.single.count, 10);
    });

    test("Emits only the counts whose hyvId is in the given list", () async {
      await db.updateMaterialBagCounts("uid_1", {1: 10, 2: 20, 3: 30});

      final rows = await firstEmissionOf("uid_1", [1, 3]);

      expect(rows.map((e) => e.hyvId), containsAll([1, 3]));
      expect(rows, hasLength(2));
    });

    test("Emits an empty list when the hyvId list is empty", () async {
      await db.updateMaterialBagCounts("uid_1", {1: 10});

      expect(await firstEmissionOf("uid_1", []), isEmpty);
    });

    test("Emits an empty list when the uid has no counts", () async {
      await db.updateMaterialBagCounts("uid_2", {1: 10});

      expect(await firstEmissionOf("uid_1", [1]), isEmpty);
    });

    test("Emits again when a watched count changes", () async {
      final queue = createStreamQueue(db.watchMaterialBagCounts("uid_1", [1]));
      expect(await queue.next, isEmpty);

      await db.updateMaterialBagCounts("uid_1", {1: 10});
      expect((await queue.next).single.count, 10);

      await db.updateMaterialBagCounts("uid_1", {1: 15});
      expect((await queue.next).single.count, 15);
    });
  });

  group("updateMaterialBagCounts", () {
    test("Inserts every entry of the map", () async {
      await db.updateMaterialBagCounts("uid_1", {1: 10, 2: 20});

      final rows = await readCounts();
      expect(rows, hasLength(2));
      expect(
        rows.map((e) => (e.hyvId, e.count)),
        containsAll([(1, 10), (2, 20)]),
      );
    });

    test("Replaces the count of an existing uid and hyvId pair", () async {
      await db.updateMaterialBagCounts("uid_1", {1: 10});
      await db.updateMaterialBagCounts("uid_1", {1: 99});

      final rows = await readCounts();
      expect(rows, hasLength(1));
      expect(rows.single.count, 99);
    });

    test("Keeps the same hyvId of another uid as a separate row", () async {
      await db.updateMaterialBagCounts("uid_1", {1: 10});
      await db.updateMaterialBagCounts("uid_2", {1: 20});

      final rows = await readCounts();
      expect(rows, hasLength(2));
      expect(
        rows.map((e) => (e.uid, e.count)),
        containsAll([("uid_1", 10), ("uid_2", 20)]),
      );
    });

    test("Leaves the counts that are not in the map untouched", () async {
      await db.updateMaterialBagCounts("uid_1", {1: 10, 2: 20});
      await db.updateMaterialBagCounts("uid_1", {1: 99});

      final rows = await readCounts();
      expect(rows, hasLength(2));
      expect(
        rows.map((e) => (e.hyvId, e.count)),
        containsAll([(1, 99), (2, 20)]),
      );
    });

    test("Writes nothing when the map is empty", () async {
      await db.updateMaterialBagCounts("uid_1", {});

      expect(await readCounts(), isEmpty);
    });
  });
}
