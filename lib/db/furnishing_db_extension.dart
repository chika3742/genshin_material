import "package:drift/drift.dart";

import "../database.dart";

extension FurnishingDbExtension on AppDatabase {
  Stream<int> watchFurnishingCraftCount(String setId, String furnishingId) {
    return managers.furnishingCraftCountTable
        .filter((f) => f.setId.equals(setId) & f.furnishingId.equals(furnishingId))
        .watchSingleOrNull().map((e) => e?.count ?? 0);
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
}
