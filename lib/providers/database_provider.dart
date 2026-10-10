import "package:riverpod_annotation/riverpod_annotation.dart";

import "../db/database.dart";
import "../db/extensions/bookmark_db_extension.dart";
import "../models/bookmark.dart";

part "database_provider.g.dart";

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();

  ref.onDispose(database.close);

  return database;
}

@riverpod
Stream<List<BookmarkWithMaterialDetails>> bookmarks(Ref ref, {String? groupHash, List<String>? hashes, ({String? materialId, bool hasWeapon})? materialFilter}) {
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
  return db.watchMaterialBookmarks();
}

@riverpod
Stream<List<BookmarkWithDetails>> artifactBookmarks(Ref ref) {
  return ref.watch(appDatabaseProvider).watchArtifactBookmarks();
}
