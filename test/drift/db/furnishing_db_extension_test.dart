import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/furnishing_db_extension.dart";

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

  Future<List<FurnishingCraftCount>> readCraftCounts() =>
      db.select(db.furnishingCraftCountTable).get();

  Future<List<FurnishingSetBookmark>> readSetBookmarks() =>
      db.select(db.furnishingSetBookmarkTable).get();

  group("watchFurnishingCraftCounts", () {
    test("Emits only the counts belonging to the given set", () async {
      await db.updateFurnishingCraftCount("set_1", "chair", 1);
      await db.updateFurnishingCraftCount("set_2", "table", 2);

      final counts = await db.watchFurnishingCraftCounts("set_1").first;

      expect(counts, hasLength(1));
      expect(counts.single.setId, "set_1");
      expect(counts.single.furnishingId, "chair");
      expect(counts.single.count, 1);
    });

    test("Emits again when a count of the set changes", () async {
      final queue = createStreamQueue(db.watchFurnishingCraftCounts("set_1"));
      expect(await queue.next, isEmpty);

      await db.updateFurnishingCraftCount("set_1", "chair", 1);
      expect((await queue.next).single.count, 1);

      await db.updateFurnishingCraftCount("set_1", "chair", 2);
      expect((await queue.next).single.count, 2);
    });

    // `distinct()` is applied to a `Stream<List<FurnishingCraftCount>>`, and a
    // Dart `List` compares by identity, so an equal-but-new list is never
    // suppressed. These two tests pin the behaviour the app actually gets
    // today: the query result stays the same, yet the stream fires again —
    // awaiting the next emission is what proves it is not suppressed.
    test("Re-emits an equal list when the same count is written again", () async {
      await db.updateFurnishingCraftCount("set_1", "chair", 1);

      final queue = createStreamQueue(db.watchFurnishingCraftCounts("set_1"));
      final first = await queue.next;

      await db.updateFurnishingCraftCount("set_1", "chair", 1);
      final second = await queue.next;

      expect(second, first);
      expect(identical(second, first), isFalse);
    });

    test("Re-emits an equal list when only another set changes", () async {
      final queue = createStreamQueue(db.watchFurnishingCraftCounts("set_1"));
      expect(await queue.next, isEmpty);

      await db.updateFurnishingCraftCount("set_2", "chair", 1);

      expect(await queue.next, isEmpty);
    });
  });

  group("updateFurnishingCraftCount", () {
    test("Creates a row for a new set and furnishing pair", () async {
      await db.updateFurnishingCraftCount("set_1", "chair", 3);

      final rows = await readCraftCounts();
      expect(rows, hasLength(1));
      expect(rows.single.setId, "set_1");
      expect(rows.single.furnishingId, "chair");
      expect(rows.single.count, 3);
    });

    test("Replaces the count of an existing set and furnishing pair", () async {
      await db.updateFurnishingCraftCount("set_1", "chair", 3);
      await db.updateFurnishingCraftCount("set_1", "chair", 7);

      final rows = await readCraftCounts();
      expect(rows, hasLength(1));
      expect(rows.single.count, 7);
    });

    test("Keeps the same furnishing of another set as a separate row", () async {
      await db.updateFurnishingCraftCount("set_1", "chair", 3);
      await db.updateFurnishingCraftCount("set_2", "chair", 5);

      final rows = await readCraftCounts();
      expect(rows, hasLength(2));
      expect(
        rows.map((e) => (e.setId, e.count)),
        containsAll([("set_1", 3), ("set_2", 5)]),
      );
    });

    test("Keeps another furnishing of the same set as a separate row", () async {
      await db.updateFurnishingCraftCount("set_1", "chair", 3);
      await db.updateFurnishingCraftCount("set_1", "table", 5);

      final rows = await readCraftCounts();
      expect(rows, hasLength(2));
      expect(
        rows.map((e) => (e.furnishingId, e.count)),
        containsAll([("chair", 3), ("table", 5)]),
      );
    });
  });

  group("resetFurnishingCraftCounts", () {
    test("Deletes every count of the given set only", () async {
      await db.updateFurnishingCraftCount("set_1", "chair", 3);
      await db.updateFurnishingCraftCount("set_1", "table", 5);
      await db.updateFurnishingCraftCount("set_2", "chair", 7);

      await db.resetFurnishingCraftCounts("set_1");

      final rows = await readCraftCounts();
      expect(rows, hasLength(1));
      expect(rows.single.setId, "set_2");
    });

    test("Does nothing when the set has no counts", () async {
      await db.updateFurnishingCraftCount("set_2", "chair", 7);

      await db.resetFurnishingCraftCounts("set_1");

      expect(await readCraftCounts(), hasLength(1));
    });
  });

  group("watchFurnishingSetBookmark", () {
    test("Maps the presence of a row to a bool", () async {
      final queue = createStreamQueue(db.watchFurnishingSetBookmark("set_1"));
      expect(await queue.next, isFalse);

      await db.setFurnishingSetBookmark("set_1", true);
      expect(await queue.next, isTrue);

      await db.setFurnishingSetBookmark("set_1", false);
      expect(await queue.next, isFalse);
    });

    test("Suppresses an unchanged bool caused by another set", () async {
      final queue = createStreamQueue(db.watchFurnishingSetBookmark("set_1"));
      expect(await queue.next, isFalse);

      // Re-runs the query, but the result stays false and `distinct()` drops
      // it, so the next emission is the one caused by set_1 itself.
      await db.setFurnishingSetBookmark("set_2", true);
      await db.setFurnishingSetBookmark("set_1", true);

      expect(await queue.next, isTrue);
    });
  });

  group("setFurnishingSetBookmark", () {
    test("Adds a row when bookmarked", () async {
      await db.setFurnishingSetBookmark("set_1", true);

      final rows = await readSetBookmarks();
      expect(rows, hasLength(1));
      expect(rows.single.setId, "set_1");
    });

    test("Removes the row when un-bookmarked", () async {
      await db.setFurnishingSetBookmark("set_1", true);
      await db.setFurnishingSetBookmark("set_1", false);

      expect(await readSetBookmarks(), isEmpty);
    });

    test("Removes nothing but the given set when un-bookmarked", () async {
      await db.setFurnishingSetBookmark("set_1", true);
      await db.setFurnishingSetBookmark("set_2", true);

      await db.setFurnishingSetBookmark("set_1", false);

      final rows = await readSetBookmarks();
      expect(rows, hasLength(1));
      expect(rows.single.setId, "set_2");
    });
  });

  group("watchFurnishingSetBookmarks", () {
    test("Emits every bookmarked set", () async {
      await db.setFurnishingSetBookmark("set_1", true);
      await db.setFurnishingSetBookmark("set_2", true);

      final bookmarks = await db.watchFurnishingSetBookmarks().first;

      expect(bookmarks.map((e) => e.setId), containsAll(["set_1", "set_2"]));
    });
  });

  group("removeFurnishingSetBookmark", () {
    test("Deletes the bookmark of the given set only", () async {
      await db.setFurnishingSetBookmark("set_1", true);
      await db.setFurnishingSetBookmark("set_2", true);

      await db.removeFurnishingSetBookmark("set_1");

      final rows = await readSetBookmarks();
      expect(rows, hasLength(1));
      expect(rows.single.setId, "set_2");
    });

    test("Restores the row including its createdAt when undone", () async {
      await db.setFurnishingSetBookmark("set_1", true);
      final original = (await readSetBookmarks()).single;

      final undo = await db.removeFurnishingSetBookmark("set_1");
      expect(await readSetBookmarks(), isEmpty);

      await undo();

      final restored = (await readSetBookmarks()).single;
      expect(restored, original);
      expect(restored.createdAt, original.createdAt);
    });

    // `getSingle()` throws when the query matches no row, so removing a set
    // that is not bookmarked fails instead of being a no-op.
    test("Throws when the set is not bookmarked", () async {
      expect(db.removeFurnishingSetBookmark("set_1"), throwsStateError);
    });
  });
}
