import "package:drift/drift.dart";

import "../database.dart";

extension FurnishingDbExtension on AppDatabase {
  Stream<List<FurnishingCraftCount>> watchFurnishingCraftCounts(String setId) {
    return managers.furnishingCraftCountTable
        .filter((f) => f.setId.equals(setId))
        .watch()
        .distinct();
  }

  Future<void> updateFurnishingCraftCount(String setId, String furnishingId, int count) {
    return managers.furnishingCraftCountTable.create((o) => o(
          setId: setId,
          furnishingId: furnishingId,
          count: count,
        ), mode: InsertMode.insertOrReplace);
  }

  Future<void> resetFurnishingCraftCounts(String setId) {
    return managers.furnishingCraftCountTable
        .filter((f) => f.setId.equals(setId))
        .delete();
  }

  Stream<bool> watchFurnishingSetBookmark(String setId) {
    return managers.furnishingSetBookmarkTable
        .filter((f) => f.setId.equals(setId))
        .watchSingleOrNull().map((e) => e != null)
        .distinct();
  }

  Future<void> setFurnishingSetBookmark(String setId, bool isBookmarked) {
    if (isBookmarked) {
      return managers.furnishingSetBookmarkTable.create((o) => o(setId: setId));
    } else {
      return managers.furnishingSetBookmarkTable
          .filter((f) => f.setId.equals(setId))
          .delete();
    }
  }
}
