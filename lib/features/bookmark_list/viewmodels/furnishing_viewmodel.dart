import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../../database.dart";
import "../../../providers/database_provider.dart";

part "furnishing_viewmodel.g.dart";

/// 家具ブックマーク操作を提供するViewModel
///
/// データベースを直接watchするため、状態は保持しない
@riverpod
class FurnishingOperations extends _$FurnishingOperations {
  AppDatabase get _db => ref.read(appDatabaseProvider);

  @override
  void build() {
    // 状態は保持しない
  }

  /// 家具ブックマークを削除（Undo機能付き）
  ///
  /// データベースから削除。UIの更新は自動的に発生
  Future<void Function()> removeFurnishingSetBookmark(FurnishingSetBookmark bookmark) async {
    return await _db.removeFurnishingSetBookmark(bookmark);
  }

  /// 製作カウントを更新
  ///
  /// データベースに永続化。UIの更新は自動的に発生
  Future<void> updateFurnishingCraftCount({
    required String setId,
    required String furnishingId,
    required int count,
  }) async {
    if (count < 0) {
      throw ArgumentError("Count cannot be negative: $count");
    }

    await _db.updateFurnishingCraftCount(setId, furnishingId, count);
  }
}
