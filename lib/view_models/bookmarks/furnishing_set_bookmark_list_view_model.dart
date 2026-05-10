import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../db/furnishing_db_extension.dart";
import "../../models/common.dart";
import "../../models/furnishing_set.dart";
import "../../providers/database_provider.dart";
import "../../providers/versions.dart";

part "furnishing_set_bookmark_list_view_model.g.dart";

@riverpod
class FurnishingSetBookmarkListViewModel extends _$FurnishingSetBookmarkListViewModel {
  @override
  Stream<List<FurnishingSet>> build() {
    final db = ref.watch(appDatabaseProvider);
    final assetData = ref.watch(assetDataProvider).requireValue;
    final furnishingSets = assetData.furnishingSets;
    return db.watchFurnishingSetBookmarks().map((data) =>
        data.map((e) => furnishingSets[e.setId]!).toList());
  }

  Future<Future<void> Function()> removeBookmark(FurnishingSetId id) {
    return ref.read(appDatabaseProvider).removeFurnishingSetBookmark(id);
  }
}
