import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../../core/asset_cache.dart";
import "../../../models/bookmark.dart";
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
