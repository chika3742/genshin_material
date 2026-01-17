import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../../core/asset_cache.dart";
import "../../../database.dart";
import "../../../models/bookmark.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/versions.dart";
import "../../../utils/bookmark_utils.dart";

part "bookmarks_viewmodel.g.dart";

/// ブックマークグループ（変換・キャッシュ済み）を提供するProvider
///
/// データベースを直接watchし、変換結果をキャッシュ
/// stateには派生データを保持せず、DBが唯一の情報源（Single Source of Truth）
@riverpod
Future<List<BookmarkGroup>> bookmarkGroups(Ref ref) async {
  final assetDataAsync = ref.watch(assetDataProvider);
  final bookmarksAsync = ref.watch(bookmarksProvider());
  final bookmarkOrderAsync = ref.watch(bookmarkOrderProvider);

  // 全てのデータが揃うまで待機
  final assetData = await assetDataAsync.future;
  final bookmarks = await bookmarksAsync.future;
  final order = await bookmarkOrderAsync.future;

  // データベースから取得したデータを変換
  final groups = BookmarkUtils.groupBookmarks(bookmarks, assetData);

  // 順序でソート（順序データが利用可能な場合）
  if (order.isNotEmpty) {
    BookmarkUtils.sortBookmarkGroups(groups, order);
  }

  return groups;
}

/// ブックマーク操作を提供するViewModel
///
/// 状態は保持せず、データベース操作のみを提供
/// UIはbookmarkGroupsProviderを直接watchする
@riverpod
class BookmarkOperations extends _$BookmarkOperations {
  AppDatabase get _db => ref.read(appDatabaseProvider);

  @override
  void build() {
    // 状態は保持しない
  }

  /// ブックマークの並び順を更新
  ///
  /// データベースに永続化するのみ。UIの更新は自動的に発生（DBのwatchによる）
  Future<void> updateBookmarkOrder({
    required int oldIndex,
    required int newIndex,
    required List<String> currentOrder,
  }) async {
    // インデックス調整
    int adjustedNewIndex = newIndex;
    if (oldIndex < newIndex) {
      adjustedNewIndex -= 1;
    }

    // 範囲チェック
    if (oldIndex < 0 || oldIndex >= currentOrder.length ||
        adjustedNewIndex < 0 || adjustedNewIndex >= currentOrder.length) {
      throw ArgumentError("Invalid index: old=$oldIndex, new=$newIndex");
    }

    // 新しい順序を計算
    final newOrder = List<String>.from(currentOrder);
    newOrder.insert(adjustedNewIndex, newOrder.removeAt(oldIndex));

    // データベースに永続化（これによりbookmarkOrderProviderが自動更新される）
    await _db.updateBookmarkOrder(newOrder);
  }

  /// ブックマークを削除
  ///
  /// データベースから削除するのみ。UIの更新は自動的に発生
  Future<void> removeBookmark(int bookmarkId) async {
    await _db.removeBookmarks([bookmarkId]);
  }

  /// ブックマークを削除（ハッシュ指定）
  Future<void> removeBookmarksByHashes(List<String> hashes) async {
    await _db.removeBookmarksByHashes(hashes);
  }
}
