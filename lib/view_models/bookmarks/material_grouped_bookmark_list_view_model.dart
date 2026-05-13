import "package:collection/collection.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../db/bookmark_db_extension.dart";
import "../../models/bookmark.dart";
import "../../providers/database_provider.dart";
import "../../providers/versions.dart";
import "bookmark_sorter.dart";

part "material_grouped_bookmark_list_view_model.g.dart";
part "material_grouped_bookmark_list_view_model.freezed.dart";

@freezed
sealed class MaterialGroupedBookmarkListState with _$MaterialGroupedBookmarkListState {
  const factory MaterialGroupedBookmarkListState({
    required Map<String, List<BookmarkWithMaterialDetails>> materials,
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

    return MaterialGroupedBookmarkListState(
      materials: bookmarkMaterials,
    );
  }

  /// Removes bookmarks. Returns a function that can undo the deletion.
  Future<void Function()> unbookmark(List<BookmarkWithMaterialDetails> bookmarks) async {
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
