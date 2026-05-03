import "dart:developer";

import "package:collection/collection.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../db/bookmark_order_registry_db_extension.dart";
import "../../models/bookmark.dart";
import "../../models/common.dart";
import "../../providers/database_provider.dart";
import "../../providers/versions.dart";
import "bookmark_sorter.dart";

part "purpose_grouped_bookmark_list_view_model.g.dart";
part "purpose_grouped_bookmark_list_view_model.freezed.dart";

@Freezed(copyWith: true)
sealed class PurposeGroupedBookmarkListState with _$PurposeGroupedBookmarkListState {
  const factory PurposeGroupedBookmarkListState({
    required List<BookmarkGroup> groups,
    /// Map of group hashes.
    required Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>> sortedBookmarks,
  }) = _PurposeGroupedBookmarkListState;
}

@riverpod
class PurposeGroupedBookmarkListViewModel extends _$PurposeGroupedBookmarkListViewModel {
  @override
  PurposeGroupedBookmarkListState build() {
    final assetData = ref.watch(assetDataProvider).requireValue;

    final bookmarks = (ref.watch(bookmarksProvider()).value ?? [])
        .whereType<BookmarkWithMaterialDetails>();

    final bookmarkGroups = bookmarks.groupListsBy((e) => e.metadata.groupHash)
        .map((k, v) => MapEntry(k, BookmarkGroup.fromBookmarks(v, assetData)));

    final bookmarkOrder = ref.watch(bookmarkOrderProvider).value;
    final bookmarkGroupList = bookmarkOrder != null
        ? sortBookmarkGroups(bookmarkGroups.values.toList(), bookmarkOrder)
        : <BookmarkGroup>[];

    return PurposeGroupedBookmarkListState(
      groups: bookmarkGroupList,
      sortedBookmarks: bookmarkGroups.map((k, v) => MapEntry(
        k,
        sortBookmarks(v.bookmarks.cast<BookmarkWithMaterialDetails>(), assetData)
            .groupListsBy((e) => e.materialDetails.materialId),
      )),
    );
  }

  void reorder(int oldIndex, int newIndex) {
    final bookmarkOrder = ref.read(bookmarkOrderProvider).value;
    if (bookmarkOrder == null) {
      return;
    }

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    try {
      bookmarkOrder.insert(newIndex, bookmarkOrder.removeAt(oldIndex));
      // sort with new order to avoid flickering when reordering
      state = state.copyWith(
        groups: sortBookmarkGroups(state.groups, bookmarkOrder),
      );

      final db = ref.read(appDatabaseProvider);
      db.updateBookmarkOrder(bookmarkOrder);
    } on RangeError catch (e, st) {
      log("Reorder failed: $oldIndex -> $newIndex, length: ${bookmarkOrder.length}", error: e, stackTrace: st);
    }
  }
}
