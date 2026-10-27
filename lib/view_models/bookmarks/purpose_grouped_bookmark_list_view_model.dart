import "dart:developer";

import "package:collection/collection.dart";
import "package:fractional_indexing/fractional_indexing.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/asset_cache.dart";
import "../../core/pref_keys.dart";
import "../../data/models/bag_counts.dart";
import "../../db/extensions/bookmark_db_extension.dart";
import "../../models/bookmark.dart";
import "../../models/common.dart";
import "../../providers/database_provider.dart";
import "../../providers/pref_notifier.dart";
import "../../providers/versions.dart";
import "../../utils/material_calculator.dart";
import "bookmark_bag_counts.dart";
import "bookmark_sorter.dart";

part "purpose_grouped_bookmark_list_view_model.g.dart";
part "purpose_grouped_bookmark_list_view_model.freezed.dart";

@Freezed(copyWith: true)
sealed class PurposeGroupedBookmarkListState with _$PurposeGroupedBookmarkListState {
  const factory PurposeGroupedBookmarkListState({
    required List<BookmarkGroup> groups,
    /// Map of group hashes.
    required Map<String, Map<MaterialId?, List<MaterialBookmark>>> sortedBookmarks,
    required bool bagCountsMayNotShown,
  }) = _PurposeGroupedBookmarkListState;
}

@riverpod
class PurposeGroupedBookmarkListViewModel extends _$PurposeGroupedBookmarkListViewModel {
  @override
  PurposeGroupedBookmarkListState build() {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final showCraftConvertedLackNum = ref.watch(prefProvider(PrefKeys.showCraftConvertedLackNum));

    final bookmarks = (ref.watch(bookmarksProvider()).value ?? [])
        .sortedBy((k) => k.group.orderIndex);

    final byGroupHash = bookmarks.groupListsBy((e) => e.group.groupHash);
    final bagCounts = <String /* group hash */, BagCounts>{};
    final bagCountsInfo = ref.watch(bookmarkBagCountsProvider).value;

    if (bagCountsInfo != null) {
      var remaining = bagCountsInfo.bagCounts;
      for (final MapEntry(key: groupHash, value: groupBookmarks) in byGroupHash.entries) {
        if (!bagCountsInfo.targetGroupHashes.contains(groupHash)) {
          continue;
        }

        final quantities = _quantities(groupBookmarks, assetData);
        if (showCraftConvertedLackNum) {
          final result = applyCrafting(remaining, quantities, assetData);

          bagCounts[groupHash] = result.effective;
          remaining = result.remaining;
        } else {
          bagCounts[groupHash] = remaining;
          remaining = {
            for (final MapEntry(key: id, value: count) in remaining.entries)
              id: count - (quantities[id] ?? 0),
          };
        }
      }
    }

    final bookmarkGroupMap = byGroupHash
        .map((k, v) => MapEntry(k, BookmarkGroup.fromBookmarks(v, assetData, bagCounts[k])));

    final bookmarkGroupList = bookmarkGroupMap.values.toList()
      ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

    return PurposeGroupedBookmarkListState(
      groups: bookmarkGroupList,
      sortedBookmarks: bookmarkGroupMap.map((k, v) => MapEntry(
        k,
        sortBookmarks(v.bookmarks, assetData)
            .groupListsBy((e) => e.item.materialId),
      )),
      bagCountsMayNotShown: bagCountsInfo?.isOverflowed == true,
    );
  }

  Map<MaterialId, int> _quantities(List<MaterialBookmark> bookmarks, AssetData assetData) {
    final expItem = MaterialTargetType.fromWeaponNullity(bookmarks.first.group.weaponId)
        .getExpItemConf(assetData)
        .first;
    final quantities = bookmarks.groupFoldBy<MaterialId, int>(
      (b) => b.item.materialId ?? expItem.itemId,
      (sum, b) => (sum ?? 0) + b.item.quantity,
    );
    if (quantities[expItem.itemId] case final exp?) {
      quantities[expItem.itemId] = (exp / expItem.expPerItem).ceil();
    }
    return quantities;
  }

  void reorder(int oldIndex, int newIndex) {
    log("Reorder: $oldIndex -> $newIndex");

    final newList = [...state.groups];
    newList.insert(newIndex, newList.removeAt(oldIndex));

    final newOrderIndex = FractionalIndexer.generateKeyBetween(
      newIndex != 0 ? newList[newIndex - 1].orderIndex : null,
      newList.elementAtOrNull(newIndex + 1)?.orderIndex,
    );
    ref.read(appDatabaseProvider).updateMaterialGroupOrderIndex(
      newList[newIndex].hash,
      newOrderIndex!,
    );

    state = state.copyWith(
      groups: newList,
    );
  }
}
