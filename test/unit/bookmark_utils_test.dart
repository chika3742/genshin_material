import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/utils/bookmark_utils.dart";

void main() {
  group("BookmarkUtils", () {
    group("sortBookmarkGroups", () {
      test("sorts groups according to order list", () {
        final groups = [
          BookmarkGroup(
            hash: "hash3",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
          BookmarkGroup(
            hash: "hash1",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
          BookmarkGroup(
            hash: "hash2",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
        ];

        final order = ["hash1", "hash2", "hash3"];
        BookmarkUtils.sortBookmarkGroups(groups, order);

        expect(groups[0].hash, "hash1");
        expect(groups[1].hash, "hash2");
        expect(groups[2].hash, "hash3");
      });

      test("handles empty groups list", () {
        final groups = <BookmarkGroup>[];
        final order = ["hash1", "hash2"];

        // Should not throw
        expect(() => BookmarkUtils.sortBookmarkGroups(groups, order), returnsNormally);
        expect(groups, isEmpty);
      });

      test("handles empty order list", () {
        final groups = [
          BookmarkGroup(
            hash: "hash1",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
        ];

        // With empty order, indexOf returns -1 for all, so order is preserved
        BookmarkUtils.sortBookmarkGroups(groups, []);
        expect(groups.length, 1);
      });

      test("handles groups not in order list", () {
        final groups = [
          BookmarkGroup(
            hash: "hash3",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
          BookmarkGroup(
            hash: "hash1",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
        ];

        // hash2 is in order but not in groups
        final order = ["hash1", "hash2"];
        BookmarkUtils.sortBookmarkGroups(groups, order);

        // hash1 should come first (index 0)
        // hash3 has indexOf -1 which sorts before all positive indices
        expect(groups[0].hash, "hash3");
        expect(groups[1].hash, "hash1");
      });

      test("handles single group", () {
        final groups = [
          BookmarkGroup(
            hash: "hash1",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
        ];

        final order = ["hash1"];
        BookmarkUtils.sortBookmarkGroups(groups, order);

        expect(groups.length, 1);
        expect(groups[0].hash, "hash1");
      });

      test("sorts with reverse order", () {
        final groups = [
          BookmarkGroup(
            hash: "hash1",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
          BookmarkGroup(
            hash: "hash2",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
          BookmarkGroup(
            hash: "hash3",
            type: BookmarkType.material,
            characterId: "char1",
            levelRange: null,
            bookmarks: const [],
          ),
        ];

        // Reverse order
        final order = ["hash3", "hash2", "hash1"];
        BookmarkUtils.sortBookmarkGroups(groups, order);

        expect(groups[0].hash, "hash3");
        expect(groups[1].hash, "hash2");
        expect(groups[2].hash, "hash1");
      });
    });
  });
}
