import "package:flutter/material.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../database.dart";
import "../../../i18n/strings.g.dart";
import "../../../providers/database_provider.dart";
import "../../../ui_core/snack_bar.dart";

part "furnishing_bookmark_viewmodel.g.dart";

@riverpod
class FurnishingBookmarkViewModel extends _$FurnishingBookmarkViewModel {
  @override
  void build() {
    // No state to manage
  }

  /// Updates the craft count for a furnishing
  void updateFurnishingCraftCount({
    required String setId,
    required String furnishingId,
    required int count,
  }) {
    final db = ref.read(appDatabaseProvider);
    db.updateFurnishingCraftCount(setId, furnishingId, count);
  }

  /// Removes a furnishing set bookmark with undo functionality
  Future<void> removeFurnishingSetBookmark({
    required BuildContext context,
    required FurnishingSetBookmark bookmark,
  }) async {
    final db = ref.read(appDatabaseProvider);
    final restore = await db.removeFurnishingSetBookmark(bookmark);

    if (context.mounted) {
      showSnackBar(
        context: context,
        message: tr.furnishingSetsPage.removedFromBookmarks,
        action: SnackBarAction(
          label: tr.common.undo,
          onPressed: restore,
        ),
      );
    }
  }
}
