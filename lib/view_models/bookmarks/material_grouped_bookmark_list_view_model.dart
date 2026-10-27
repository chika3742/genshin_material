import "package:collection/collection.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

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

part "material_grouped_bookmark_list_view_model.g.dart";
part "material_grouped_bookmark_list_view_model.freezed.dart";

@freezed
sealed class MaterialGroupedBookmarkListState with _$MaterialGroupedBookmarkListState {
  const factory MaterialGroupedBookmarkListState({
    required Map<String, List<MaterialBookmark>> materials,
    required BagCounts bagCounts,
    required bool cannotShowBagCounts,
  }) = _MaterialGroupedBookmarkListState;
}

@riverpod
class MaterialGroupedBookmarkListViewModel extends _$MaterialGroupedBookmarkListViewModel {
  @override
  MaterialGroupedBookmarkListState build() {
    final assetData = ref.watch(assetDataProvider).value!;
    final bookmarks = ref.watch(bookmarksProvider()).value ?? [];

    final bookmarkMaterials = sortBookmarks(bookmarks, assetData)
        .groupListsBy(
      (e) => e.item.materialId ?? (e.group.weaponId != null).toString(),
    );
    Map<MaterialId, int> needs() {
      return bookmarkMaterials.map((id, v) => MapEntry(id, v.fold(0, (p, e) => p + e.item.quantity)));
    }

    final bagCountsInfo = ref.watch(bookmarkBagCountsProvider).value;
    final bagCounts = ref.watch(prefProvider(PrefKeys.showCraftConvertedLackNum)) && bagCountsInfo != null
        ? applyCrafting(bagCountsInfo.bagCounts, needs(), assetData).effective
        : bagCountsInfo?.bagCounts;

    return MaterialGroupedBookmarkListState(
      materials: bookmarkMaterials,
      bagCounts: bagCountsInfo?.isOverflowed == false && bagCounts != null ? bagCounts : {},
      cannotShowBagCounts: bagCountsInfo?.isOverflowed == true,
    );
  }

  /// Removes bookmarks. Returns a function that can undo the deletion.
  Future<void Function()> unbookmark(List<MaterialBookmark> bookmarks) async {
    final db = ref.read(appDatabaseProvider);
    await db.removeMaterialBookmarksByHashes(bookmarks.map((e) => e.item.hash).toList());

    return () {
      db.addMaterialBookmarks(bookmarks.map((e) => MaterialBookmarkInsertable(
        characterId: e.group.characterId,
        weaponId: e.group.weaponId,
        materialId: e.item.materialId,
        upperLevel: e.item.upperLevel,
        purposeType: e.group.purposeType,
        quantity: e.item.quantity,
      )).toList());
    };
  }
}
