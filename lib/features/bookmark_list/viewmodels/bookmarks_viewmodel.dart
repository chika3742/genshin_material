import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../../models/bookmark.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/versions.dart";
import "../../../utils/bookmark_utils.dart";

part "bookmarks_viewmodel.g.dart";

/// Provider for bookmark groups (transformed and cached)
///
/// Watches the database directly and caches transformation results.
/// Does not hold derived data in state; DB is the single source of truth.
/// 
/// This provider follows the same pattern as the existing bookmarks.dart page,
/// watching the database providers and transforming the data reactively.
@riverpod
List<BookmarkGroup> bookmarkGroups(Ref ref) {
  final assetDataAsync = ref.watch(assetDataProvider);
  final assetData = assetDataAsync.value;
  
  if (assetData == null) return [];

  // Watch bookmarks from database (returns AsyncValue<Stream<List<BookmarkWithDetails>>>)
  final bookmarks = ref.watch(bookmarksProvider()).value ?? [];
  if (bookmarks.isEmpty) return [];

  // Transform data retrieved from database
  final groups = BookmarkUtils.groupBookmarks(bookmarks, assetData);

  // Get bookmark order and sort if available
  final bookmarkOrderAsync = ref.watch(bookmarkOrderProvider);
  final order = bookmarkOrderAsync.value;

  if (order != null && order.isNotEmpty) {
    BookmarkUtils.sortBookmarkGroups(groups, order);
  }

  return groups;
}
