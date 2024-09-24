import "../database.dart";

extension BookmarkOrderRegistryDbExtension on AppDatabase {
  Stream<List<String>> watchBookmarkOrder() {
    return select(bookmarkOrderRegistryTable).watchSingle().map((e) => e.order);
  }

  Future<List<String>> getBookmarkOrder() async {
    final registry = await select(bookmarkOrderRegistryTable).getSingle();
    return registry.order;
  }

  Future<void> updateBookmarkOrder(List<String> order) {
    return update(bookmarkOrderRegistryTable).write(BookmarkOrderRegistryCompanion.insert(
      order: order,
    ),);
  }

  Future<void> registerBookmarkOrderHashes(List<String> hashes) async {
    await transaction(() async {
      final order = await getBookmarkOrder();
      await update(bookmarkOrderRegistryTable).write(BookmarkOrderRegistryCompanion.insert(
        order: (Set<String>.from(order)..addAll(hashes)).toList(),
      ),);
    });
  }

  Future<void> unregisterBookmarkOrderHashes(List<String> hashes) async {
    await transaction(() async {
      final order = await getBookmarkOrder();
      await update(bookmarkOrderRegistryTable).write(BookmarkOrderRegistryCompanion.insert(
        order: order..removeWhere((e) => hashes.contains(e)),
      ),);
    });
  }
}
