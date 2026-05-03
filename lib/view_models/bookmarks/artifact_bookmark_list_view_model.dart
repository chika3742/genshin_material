import "dart:developer";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../db/bookmark_order_registry_db_extension.dart";
import "../../models/bookmark.dart";
import "../../providers/database_provider.dart";
import "../../providers/versions.dart";
import "bookmark_sorter.dart";

part "artifact_bookmark_list_view_model.g.dart";
part "artifact_bookmark_list_view_model.freezed.dart";

@Freezed(copyWith: true)
sealed class ArtifactBookmarkListState with _$ArtifactBookmarkListState {
  const factory ArtifactBookmarkListState({
    required List<BookmarkGroup> bookmarks,
  }) = _ArtifactBookmarkListState;
}

@riverpod
class ArtifactBookmarkListViewModel extends _$ArtifactBookmarkListViewModel {
  @override
  ArtifactBookmarkListState build() {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final bookmarks = ref.watch(bookmarksProvider()).value ?? [];
    final aBookmarks = bookmarks.where((e) => e is BookmarkWithArtifactSetDetails || e is BookmarkWithArtifactPieceDetails).toList();

    final bookmarkOrder = ref.watch(bookmarkOrderProvider).value;
    if (bookmarkOrder == null) {
      return ArtifactBookmarkListState(bookmarks: []);
    }

    return ArtifactBookmarkListState(
      bookmarks: sortBookmarkGroups(
        aBookmarks.map((e) => BookmarkGroup.fromBookmarks([e], assetData)).toList(),
        bookmarkOrder,
      ),
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
        bookmarks: sortBookmarkGroups(state.bookmarks, bookmarkOrder),
      );

      final db = ref.read(appDatabaseProvider);
      db.updateBookmarkOrder(bookmarkOrder);
    } on RangeError catch (e, st) {
      log("Reorder failed: $oldIndex -> $newIndex, length: ${bookmarkOrder.length}", error: e, stackTrace: st);
    }
  }
}
