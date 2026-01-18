import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../core/asset_cache.dart";
import "../../../database.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/bookmark.dart";
import "../../../providers/database_provider.dart";
import "../../../ui_core/snack_bar.dart";
import "../utils/bookmark_sort_util.dart";

part "material_grouped_bookmark_viewmodel.g.dart";

@riverpod
class MaterialGroupedBookmarkViewModel extends _$MaterialGroupedBookmarkViewModel {
  @override
  void build() {
    // No state to manage
  }

  /// Groups bookmarks by material ID (or weapon flag)
  Map<String?, List<BookmarkWithMaterialDetails>> groupBookmarksByMaterial(
    List<BookmarkWithDetails> bookmarks,
    AssetData assetData,
  ) {
    return sortBookmarks(
      bookmarks.whereType<BookmarkWithMaterialDetails>(),
      assetData,
    ).groupFoldBy<String?, List<BookmarkWithMaterialDetails>>(
      (e) => e.materialDetails.materialId ?? (e.materialDetails.weaponId != null).toString(),
      (prev, element) {
        if (prev == null) {
          return <BookmarkWithMaterialDetails>[element];
        } else {
          prev.add(element);
          return prev;
        }
      },
    );
  }

  /// Removes bookmarks and shows undo snackbar
  Future<void> removeBookmarksWithUndo({
    required BuildContext context,
    required List<BookmarkWithMaterialDetails> bookmarks,
  }) async {
    final db = ref.read(appDatabaseProvider);
    await db.removeBookmarks(bookmarks.map((e) => e.metadata.id).toList());

    if (context.mounted) {
      showSnackBar(
        context: context,
        message: tr.materialCard.unBookmarked,
        action: SnackBarAction(
          label: tr.common.undo,
          onPressed: () {
            db.addMaterialBookmarks(
              bookmarks
                  .map((e) => MaterialBookmarkInsertable(
                        metadataId: e.metadata.id,
                        characterId: e.metadata.characterId,
                        weaponId: e.materialDetails.weaponId,
                        materialId: e.materialDetails.materialId,
                        upperLevel: e.materialDetails.upperLevel,
                        purposeType: e.materialDetails.purposeType,
                        quantity: e.materialDetails.quantity,
                      ))
                  .toList(),
            );
          },
        ),
      );
    }
  }
}
