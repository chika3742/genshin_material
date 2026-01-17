import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../../core/asset_cache.dart";
import "../../../database.dart";
import "../../../models/bookmark.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/versions.dart";
import "../../../utils/bookmark_utils.dart";

part "bookmarks_viewmodel.g.dart";

/// Provider for bookmark groups (transformed and cached)
///
/// Watches the database directly and caches transformation results.
/// Does not hold derived data in state; DB is the single source of truth.
@riverpod
Future<List<BookmarkGroup>> bookmarkGroups(Ref ref) async {
  final assetDataAsync = ref.watch(assetDataProvider);
  final bookmarksAsync = ref.watch(bookmarksProvider());
  final bookmarkOrderAsync = ref.watch(bookmarkOrderProvider);

  // Wait for all data to be available
  final assetData = await assetDataAsync.future;
  final bookmarks = await bookmarksAsync.future;
  final order = await bookmarkOrderAsync.future;

  // Transform data retrieved from database
  final groups = BookmarkUtils.groupBookmarks(bookmarks, assetData);

  // Sort by order (if order data is available)
  if (order.isNotEmpty) {
    BookmarkUtils.sortBookmarkGroups(groups, order);
  }

  return groups;
}

/// Updates bookmark order
///
/// Only persists to database. UI updates automatically (via DB watch).
Future<void> updateBookmarkOrder(
  Ref ref, {
  required int oldIndex,
  required int newIndex,
  required List<String> currentOrder,
}) async {
  final db = ref.read(appDatabaseProvider);

  // Adjust index
  int adjustedNewIndex = newIndex;
  if (oldIndex < newIndex) {
    adjustedNewIndex -= 1;
  }

  // Range check
  if (oldIndex < 0 || oldIndex >= currentOrder.length ||
      adjustedNewIndex < 0 || adjustedNewIndex >= currentOrder.length) {
    throw ArgumentError("Invalid index: old=$oldIndex, new=$newIndex");
  }

  // Calculate new order
  final newOrder = List<String>.from(currentOrder);
  newOrder.insert(adjustedNewIndex, newOrder.removeAt(oldIndex));

  // Persist to database (this will automatically update bookmarkOrderProvider)
  await db.updateBookmarkOrder(newOrder);
}

/// Removes a bookmark
///
/// Only removes from database. UI updates automatically.
Future<void> removeBookmark(Ref ref, int bookmarkId) async {
  final db = ref.read(appDatabaseProvider);
  await db.removeBookmarks([bookmarkId]);
}

/// Removes bookmarks by hashes
Future<void> removeBookmarksByHashes(Ref ref, List<String> hashes) async {
  final db = ref.read(appDatabaseProvider);
  await db.removeBookmarksByHashes(hashes);
}
