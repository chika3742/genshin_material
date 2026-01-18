import "dart:developer";

import "package:collection/collection.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../core/asset_cache.dart";
import "../../../db/bookmark_order_registry_db_extension.dart";
import "../../../models/bookmark.dart";
import "../../../providers/database_provider.dart";

part "purpose_grouped_bookmark_viewmodel.g.dart";

@riverpod
class PurposeGroupedBookmarkViewModel extends _$PurposeGroupedBookmarkViewModel {
  @override
  void build() {
    // No state to manage
  }

  /// Groups bookmarks by their groupHash and creates BookmarkGroup objects
  List<BookmarkGroup> getBookmarkGroups(
    List<BookmarkWithDetails> bookmarks,
    AssetData assetData,
  ) {
    return bookmarks
        .groupFoldBy<String, List<BookmarkWithDetails>>(
          (e) => e.metadata.groupHash,
          (prev, element) {
            if (prev == null) {
              return <BookmarkWithDetails>[element];
            } else {
              prev.add(element);
              return prev;
            }
          },
        )
        .values
        .map((e) => BookmarkGroup.fromBookmarks(e, assetData))
        .toList();
  }

  /// Sorts bookmark groups based on the provided order
  void sortBookmarkGroups(List<BookmarkGroup> groups, List<String> order) {
    groups.sort((a, b) => order.indexOf(a.hash).compareTo(order.indexOf(b.hash)));
  }

  /// Handles reordering of bookmark groups
  void reorderBookmarkGroups({
    required int oldIndex,
    required int newIndex,
    required List<String>? bookmarkOrder,
    required List<BookmarkGroup> bookmarkGroups,
  }) {
    if (bookmarkOrder == null) {
      return;
    }

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    try {
      bookmarkOrder.insert(newIndex, bookmarkOrder.removeAt(oldIndex));
      // Sort with new order to avoid flickering when reordering
      sortBookmarkGroups(bookmarkGroups, bookmarkOrder);

      final db = ref.read(appDatabaseProvider);
      db.updateBookmarkOrder(bookmarkOrder);
    } on RangeError catch (e, st) {
      log(
        "Reorder failed: $oldIndex -> $newIndex, length: ${bookmarkOrder.length}",
        error: e,
        stackTrace: st,
      );
    }
  }
}
