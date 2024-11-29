import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../database.dart";
import "../db/bookmark_db_extension.dart";
import "../db/bookmark_order_registry_db_extension.dart";
import "../db/material_bag_count_db_extension.dart";
import "../models/bookmark.dart";
import "preferences.dart";

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

@riverpod
Stream<int?> bagCount(Ref ref, int hyvId) async* {
  final db = ref.watch(appDatabaseProvider);
  final prefs = ref.watch(preferencesStateNotifierProvider);
  if (!prefs.isLinkedWithHoyolab) {
    yield null;
  }
  yield* db.watchMaterialBagCounts(prefs.hyvUid!, [hyvId]).map((e) => e.firstOrNull?.count);
}
