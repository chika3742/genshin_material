import "dart:developer";

import "package:collection/collection.dart";
import "package:fractional_indexing/fractional_indexing.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../db/bookmark_db_extension.dart";
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

    final bookmarks = (ref.watch(bookmarksProvider()).value ?? []);

    final bookmarkGroups = bookmarks.groupListsBy((e) => e.group.groupHash)
        .map((k, v) => MapEntry(k, BookmarkGroup.fromBookmarks(v, assetData)));

    final bookmarkGroupList = bookmarkGroups.values.toList()
      ..sort((a, b) {
        final aIdx = (a.bookmarks.first as BookmarkWithMaterialDetails).group.orderIndex;
        final bIdx = (b.bookmarks.first as BookmarkWithMaterialDetails).group.orderIndex;
        return aIdx.compareTo(bIdx);
      });

    return PurposeGroupedBookmarkListState(
      groups: bookmarkGroupList,
      sortedBookmarks: bookmarkGroups.map((k, v) => MapEntry(
        k,
        // TODO: BROKEN: implement artifact refactoring
        sortBookmarks(v.bookmarks.cast<BookmarkWithMaterialDetails>(), assetData)
            .groupListsBy((e) => e.item.materialId),
      )),
    );
  }

  void reorder(int oldIndex, int newIndex) {
    log("Reorder: $oldIndex -> $newIndex");

    final newOrderIndex = FractionalIndexer.generateKeyBetween(
      newIndex != 0 ? state.groups[newIndex - 1].orderIndex : null,
      state.groups.elementAtOrNull(newIndex)?.orderIndex,
    );
    ref.read(appDatabaseProvider).updateMaterialGroupOrderIndex(
      state.groups[oldIndex].hash,
      newOrderIndex!,
    );

    final indexInNewList = newIndex > oldIndex ? newIndex - 1 : newIndex;

    // apply the new state to avoid flickering
    final newList = [...state.groups];
    newList.insert(indexInNewList, newList.removeAt(oldIndex));
    state = state.copyWith(
      groups: newList,
    );
  }
}
