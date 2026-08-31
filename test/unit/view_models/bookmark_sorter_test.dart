import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/view_models/bookmarks/bookmark_sorter.dart";

import "../../utils/asset_data.dart";

void main() {
  // The sorter only reads `item.materialId`, so every bookmark can share the
  // same surrounding group.
  final bookmarkGroup = BookmarkMaterialGroup(
    groupHash: "group",
    characterId: "char_1",
    purposeType: Purpose.ascension,
    createdAt: DateTime(2024),
    orderIndex: "a0",
  );

  BookmarkWithMaterialDetails bookmarkOf(MaterialId? materialId) {
    return BookmarkWithMaterialDetails(
      group: bookmarkGroup,
      item: BookmarkMaterialItem(
        hash: "item:$materialId",
        groupHash: bookmarkGroup.groupHash,
        materialId: materialId,
        quantity: 1,
        upperLevel: 40,
      ),
    );
  }

  List<MaterialId?> materialIdsOf(List<BookmarkWithMaterialDetails> bookmarks) {
    return bookmarks.map((e) => e.item.materialId).toList();
  }

  group("sortBookmarks", () {
    test("keeps the order when neither material is known", () {
      final assetData = buildTestAssetData();
      final bookmarks = [bookmarkOf("unknown_a"), bookmarkOf("unknown_b")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), ["unknown_a", "unknown_b"]);
    });

    test("keeps an EXP bookmark (null materialId) next to another unknown one", () {
      final assetData = buildTestAssetData();
      final bookmarks = [bookmarkOf(null), bookmarkOf("unknown")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), [null, "unknown"]);
    });

    test("puts the bookmark with an unknown material first", () {
      final assetData = buildTestAssetData(
        materials: {"mat_a": buildTestMaterial(id: "mat_a")},
      );
      final bookmarks = [bookmarkOf("mat_a"), bookmarkOf("unknown")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), ["unknown", "mat_a"]);
    });

    test("keeps the bookmark with an unknown material first when it already leads", () {
      final assetData = buildTestAssetData(
        materials: {"mat_a": buildTestMaterial(id: "mat_a")},
      );
      final bookmarks = [bookmarkOf("unknown"), bookmarkOf("mat_a")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), ["unknown", "mat_a"]);
    });

    test("sorts by the per-id sort priority", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a"),
          "mat_b": buildTestMaterial(id: "mat_b"),
          "mat_c": buildTestMaterial(id: "mat_c"),
        },
        materialSortOrder: {"id:mat_a": 3, "id:mat_b": 1, "id:mat_c": 2},
      );
      final bookmarks = [
        bookmarkOf("mat_a"),
        bookmarkOf("mat_b"),
        bookmarkOf("mat_c"),
      ];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), ["mat_b", "mat_c", "mat_a"]);
    });

    test("falls back to the per-category sort priority", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a", category: "late"),
          "mat_b": buildTestMaterial(id: "mat_b", category: "early"),
        },
        materialSortOrder: {"category:early": 1, "category:late": 2},
      );
      final bookmarks = [bookmarkOf("mat_a"), bookmarkOf("mat_b")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), ["mat_b", "mat_a"]);
    });

    test("prefers the per-id priority over the per-category one", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a", category: "cat"),
          "mat_b": buildTestMaterial(id: "mat_b", category: "cat"),
        },
        // Both share a category, so only the per-id entry can separate them.
        materialSortOrder: {"category:cat": 5, "id:mat_b": 1},
      );
      final bookmarks = [bookmarkOf("mat_a"), bookmarkOf("mat_b")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), ["mat_b", "mat_a"]);
    });

    test("treats a material missing from the sort order as priority 0", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a"),
          "mat_b": buildTestMaterial(id: "mat_b"),
        },
        materialSortOrder: {"id:mat_a": 1},
      );
      final bookmarks = [bookmarkOf("mat_a"), bookmarkOf("mat_b")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), ["mat_b", "mat_a"]);
    });

    test("breaks a priority tie with hyvId", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a", hyvId: 20),
          "mat_b": buildTestMaterial(id: "mat_b", hyvId: 10),
        },
        materialSortOrder: {"id:mat_a": 1, "id:mat_b": 1},
      );
      final bookmarks = [bookmarkOf("mat_a"), bookmarkOf("mat_b")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(sorted), ["mat_b", "mat_a"]);
    });

    test("does not modify the source iterable", () {
      final assetData = buildTestAssetData(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a", hyvId: 2),
          "mat_b": buildTestMaterial(id: "mat_b", hyvId: 1),
        },
      );
      final bookmarks = [bookmarkOf("mat_a"), bookmarkOf("mat_b")];

      final sorted = sortBookmarks(bookmarks, assetData);

      expect(materialIdsOf(bookmarks), ["mat_a", "mat_b"]);
      expect(materialIdsOf(sorted), ["mat_b", "mat_a"]);
      expect(sorted, isNot(same(bookmarks)));
    });

    test("returns an empty list for no bookmarks", () {
      expect(sortBookmarks([], buildTestAssetData()), isEmpty);
    });
  });
}
