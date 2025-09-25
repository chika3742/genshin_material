import "package:riverpod_annotation/riverpod_annotation.dart";

import "../database.dart";
import "../db/bookmark_db_extension.dart";
import "../db/bookmark_order_registry_db_extension.dart";
import "../models/bookmark.dart";

part "database_provider.g.dart";

@riverpod
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();

  ref.onDispose(database.close);

  return database;
}

@riverpod
Stream<List<BookmarkWithDetails>> bookmarks(Ref ref, {String? groupHash, List<String>? hashes, ({String? materialId, bool hasWeapon})? materialFilter}) {
  assert(groupHash == null || hashes == null);

  final db = ref.watch(appDatabaseProvider);
  if (groupHash != null) {
    return db.watchMaterialBookmarksByGroupHash(groupHash);
  }
  if (hashes != null) {
    return db.watchMaterialBookmarksByHashes(hashes);
  }
  if (materialFilter != null) {
    return db.watchMaterialBookmarksByMaterial(materialFilter.materialId, materialFilter.hasWeapon);
  }
  return db.watchBookmarks();
}

@riverpod
Stream<List<String>> bookmarkOrder(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchBookmarkOrder();
}
