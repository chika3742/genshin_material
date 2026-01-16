# ViewModelレイヤー分離計画：bookmarks.dartのリファクタリング

## 概要
この計画書は、既存の `lib/pages/bookmarks.dart` を維持したまま、新しいPresentation層とViewModel層を作成する手順を示します。段階的な移行により、既存機能を壊さずにアーキテクチャを改善します。

## アプローチ

### 戦略: 並行開発とコンポーネント抽出

現在の `bookmarks.dart` (948行) を直接変更せず、以下のステップで段階的に移行します：

1. **ViewModel層の作成** - ビジネスロジックを新しいProviderに抽出
2. **Presentation Components層の作成** - 再利用可能なUIコンポーネントを抽出
3. **新しいページの作成** - ViewModelとComponentsを使用した新しい実装
4. **段階的な切り替え** - テスト後、古いページから新しいページへ切り替え

---

## 現状分析

### bookmarks.dartの構造

```dart
// 948行のファイル構成
BookmarksPage (メインウィジェット)
├── _PurposeGroupedBookmarkList (目的別リスト)
├── _MaterialGroupedBookmarkList (素材別リスト)
├── _FurnishingBookmarkList (家具リスト)
└── 8つのサブウィジェット (_GroupTypeText, _ItemLinkButton等)

現在の問題:
- データ取得・変換ロジックがウィジェット内に混在
- データベース直接操作 (ref.read(appDatabaseProvider))
- ビジネスロジック（ソート・グループ化）がUI層に存在
- 状態管理が分散
```

---

## 新しいアーキテクチャ

### ディレクトリ構造

```
lib/
├── pages/
│   ├── bookmarks.dart                      # 既存（維持）
│   └── bookmarks_new.dart                  # 新規（移行後のメイン）
├── pages/bookmarks/                        # 新規ディレクトリ
│   ├── bookmarks_page_view.dart           # Presentation層（UIのみ）
│   ├── widgets/                            # 再利用可能なコンポーネント
│   │   ├── purpose_grouped_list.dart
│   │   ├── material_grouped_list.dart
│   │   ├── furnishing_list.dart
│   │   ├── bookmark_group_card.dart
│   │   └── group_type_header.dart
│   └── viewmodels/                         # ViewModel層
│       ├── bookmarks_viewmodel.dart        # メインViewModel
│       ├── bookmark_group_viewmodel.dart   # グループ管理ViewModel
│       └── furnishing_viewmodel.dart       # 家具用ViewModel
├── providers/
│   └── database_provider.dart              # 既存
└── utils/
    └── bookmark_utils.dart                 # ユーティリティ（新規）
```

---

## 実装手順

### Phase 1: ViewModel層の作成

#### Step 1.1: ユーティリティの作成

**ファイル: `lib/utils/bookmark_utils.dart`**

```dart
import "package:collection/collection.dart";
import "../core/asset_cache.dart";
import "../models/bookmark.dart";

/// ブックマーク関連のユーティリティ関数
class BookmarkUtils {
  /// ブックマークをグループ化
  static List<BookmarkGroup> groupBookmarks(
    List<BookmarkWithDetails> bookmarks,
    AssetData assetData,
  ) {
    return bookmarks
        .groupFoldBy<String, List<BookmarkWithDetails>>(
          (e) => e.metadata.groupHash,
          (prev, element) {
            if (prev == null) {
              return <BookmarkWithDetails>[element];
            } else {
              prev.add(element);
              return prev;
            }
          },
        )
        .values
        .map((e) => BookmarkGroup.fromBookmarks(e, assetData))
        .toList();
  }

  /// ブックマークグループをソート
  static void sortBookmarkGroups(
    List<BookmarkGroup> groups,
    List<String> order,
  ) {
    groups.sort(
      (a, b) => order.indexOf(a.hash).compareTo(order.indexOf(b.hash)),
    );
  }

  /// マテリアルブックマークをソート
  static List<BookmarkWithMaterialDetails> sortMaterialBookmarks(
    Iterable<BookmarkWithMaterialDetails> bookmarks,
    AssetData assetData,
  ) {
    return bookmarks.sorted((a, b) {
      final aMaterial = assetData.materials[a.materialDetails.materialId];
      final bMaterial = assetData.materials[b.materialDetails.materialId];

      if (aMaterial == null && bMaterial == null) return 0;
      if (aMaterial == null) return -1;
      if (bMaterial == null) return 1;

      final aPriority = aMaterial.getSortPriority(assetData);
      final bPriority = bMaterial.getSortPriority(assetData);

      if (aPriority == bPriority) {
        return aMaterial.hyvId.compareTo(bMaterial.hyvId);
      }

      return aPriority.compareTo(bPriority);
    });
  }
}
```

#### Step 1.2: BookmarksViewModelの作成

**ファイル: `lib/pages/bookmarks/viewmodels/bookmarks_viewmodel.dart`**

```dart
import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../../core/asset_cache.dart";
import "../../../database.dart";
import "../../../models/bookmark.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/versions.dart";
import "../../../utils/bookmark_utils.dart";

part "bookmarks_viewmodel.g.dart";

/// ブックマークページのViewModel状態
class BookmarksViewState {
  final List<BookmarkGroup> bookmarkGroups;
  final List<String> bookmarkOrder;
  final AssetData? assetData;
  final bool isLoading;
  final String? errorMessage;

  const BookmarksViewState({
    this.bookmarkGroups = const [],
    this.bookmarkOrder = const [],
    this.assetData,
    this.isLoading = false,
    this.errorMessage,
  });

  BookmarksViewState copyWith({
    List<BookmarkGroup>? bookmarkGroups,
    List<String>? bookmarkOrder,
    AssetData? assetData,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BookmarksViewState(
      bookmarkGroups: bookmarkGroups ?? this.bookmarkGroups,
      bookmarkOrder: bookmarkOrder ?? this.bookmarkOrder,
      assetData: assetData ?? this.assetData,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// ブックマークページのViewModel
@riverpod
class BookmarksViewModel extends _$BookmarksViewModel {
  AppDatabase get _db => ref.read(appDatabaseProvider);

  @override
  BookmarksViewState build() {
    _initialize();
    return const BookmarksViewState(isLoading: true);
  }

  /// 初期化
  void _initialize() {
    // アセットデータの監視
    ref.listen(assetDataProvider, (_, next) {
      if (next.value != null) {
        state = state.copyWith(assetData: next.value);
        _loadBookmarks();
      }
    });

    // ブックマークの監視
    ref.listen(bookmarksProvider(), (_, next) {
      next.when(
        data: (_) => _loadBookmarks(),
        loading: () => state = state.copyWith(isLoading: true),
        error: (error, _) => state = state.copyWith(
          isLoading: false,
          errorMessage: error.toString(),
        ),
      );
    });

    // ブックマーク順序の監視
    ref.listen(bookmarkOrderProvider, (_, next) {
      next.when(
        data: (order) {
          state = state.copyWith(bookmarkOrder: order);
          _sortGroups(order);
        },
        loading: () {},
        error: (_, __) {},
      );
    });
  }

  /// ブックマークを読み込む
  void _loadBookmarks() {
    final bookmarksAsync = ref.read(bookmarksProvider());
    final assetData = state.assetData;

    if (bookmarksAsync.value == null || assetData == null) return;

    final bookmarks = bookmarksAsync.value!;
    final groups = BookmarkUtils.groupBookmarks(bookmarks, assetData);

    state = state.copyWith(
      bookmarkGroups: groups,
      isLoading: false,
    );

    // 順序でソート
    if (state.bookmarkOrder.isNotEmpty) {
      _sortGroups(state.bookmarkOrder);
    }
  }

  /// グループをソート
  void _sortGroups(List<String> order) {
    final groups = List<BookmarkGroup>.from(state.bookmarkGroups);
    BookmarkUtils.sortBookmarkGroups(groups, order);
    state = state.copyWith(bookmarkGroups: groups);
  }

  /// ブックマークの並び順を更新
  Future<void> updateBookmarkOrder({
    required int oldIndex,
    required int newIndex,
  }) async {
    final currentOrder = List<String>.from(state.bookmarkOrder);

    // インデックス調整
    int adjustedNewIndex = newIndex;
    if (oldIndex < newIndex) {
      adjustedNewIndex -= 1;
    }

    // 範囲チェック
    if (oldIndex < 0 || oldIndex >= currentOrder.length ||
        adjustedNewIndex < 0 || adjustedNewIndex >= currentOrder.length) {
      return;
    }

    // 並び順を変更
    currentOrder.insert(adjustedNewIndex, currentOrder.removeAt(oldIndex));

    // 楽観的UI更新
    state = state.copyWith(bookmarkOrder: currentOrder);
    _sortGroups(currentOrder);

    // データベースに永続化
    try {
      await _db.updateBookmarkOrder(currentOrder);
    } catch (e) {
      // エラー時は元に戻す
      state = state.copyWith(
        bookmarkOrder: state.bookmarkOrder,
        errorMessage: "Failed to update order: $e",
      );
    }
  }

  /// ブックマークを削除
  Future<void> removeBookmark(int bookmarkId) async {
    try {
      await _db.removeBookmarks([bookmarkId]);
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Failed to remove bookmark: $e",
      );
    }
  }

  /// ブックマークを削除（ハッシュ指定）
  Future<void> removeBookmarksByHashes(List<String> hashes) async {
    try {
      await _db.removeBookmarksByHashes(hashes);
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Failed to remove bookmarks: $e",
      );
    }
  }
}
```

#### Step 1.3: FurnishingViewModelの作成

**ファイル: `lib/pages/bookmarks/viewmodels/furnishing_viewmodel.dart`**

```dart
import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../../database.dart";
import "../../../core/asset_cache.dart";
import "../../../models/furnishing_set.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/versions.dart";

part "furnishing_viewmodel.g.dart";

/// 家具ブックマークのViewModel状態
class FurnishingViewState {
  final List<FurnishingSetBookmark> bookmarks;
  final Map<String, List<FurnishingCraftCount>> counts;
  final AssetData? assetData;
  final bool isLoading;
  final String? errorMessage;

  const FurnishingViewState({
    this.bookmarks = const [],
    this.counts = const {},
    this.assetData,
    this.isLoading = false,
    this.errorMessage,
  });

  FurnishingViewState copyWith({
    List<FurnishingSetBookmark>? bookmarks,
    Map<String, List<FurnishingCraftCount>>? counts,
    AssetData? assetData,
    bool? isLoading,
    String? errorMessage,
  }) {
    return FurnishingViewState(
      bookmarks: bookmarks ?? this.bookmarks,
      counts: counts ?? this.counts,
      assetData: assetData ?? this.assetData,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// 家具ブックマークのViewModel
@riverpod
class FurnishingViewModel extends _$FurnishingViewModel {
  AppDatabase get _db => ref.read(appDatabaseProvider);

  @override
  FurnishingViewState build() {
    _initialize();
    return const FurnishingViewState(isLoading: true);
  }

  void _initialize() {
    ref.listen(assetDataProvider, (_, next) {
      if (next.value != null) {
        state = state.copyWith(assetData: next.value);
      }
    });
  }

  /// 家具セットブックマークを読み込む
  Stream<List<FurnishingSetBookmark>> watchBookmarks() {
    return _db.watchFurnishingSetBookmarks();
  }

  /// 製作カウントを読み込む
  Stream<List<FurnishingCraftCount>> watchCraftCounts(String setId) {
    return _db.watchFurnishingCraftCounts(setId);
  }

  /// 家具ブックマークを削除（Undo機能付き）
  Future<void Function()> removeBookmark(FurnishingSetBookmark bookmark) async {
    try {
      return await _db.removeFurnishingSetBookmark(bookmark);
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Failed to remove bookmark: $e",
      );
      rethrow;
    }
  }

  /// 製作カウントを更新
  Future<void> updateCraftCount({
    required String setId,
    required String furnishingId,
    required int count,
  }) async {
    if (count < 0) return;

    try {
      await _db.updateFurnishingCraftCount(setId, furnishingId, count);
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Failed to update count: $e",
      );
    }
  }
}
```

---

### Phase 2: Presentation Components層の作成

#### Step 2.1: PurposeGroupedListの作成

**ファイル: `lib/pages/bookmarks/widgets/purpose_grouped_list.dart`**

```dart
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/material_item.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/bookmark.dart";
import "../viewmodels/bookmarks_viewmodel.dart";
import "bookmark_group_card.dart";

/// 目的別にグループ化されたブックマークリスト
class PurposeGroupedList extends ConsumerWidget {
  const PurposeGroupedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(bookmarksViewModelProvider);

    if (viewState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewState.bookmarkGroups.isEmpty) {
      return Center(
        child: Text(tr.bookmarksPage.noBookmarks),
      );
    }

    return ReorderableListView.builder(
      itemCount: viewState.bookmarkGroups.length,
      padding: const EdgeInsets.only(top: 8),
      onReorder: (oldIndex, newIndex) {
        ref.read(bookmarksViewModelProvider.notifier).updateBookmarkOrder(
          oldIndex: oldIndex,
          newIndex: newIndex,
        );
      },
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final group = viewState.bookmarkGroups[index];

        return BookmarkGroupCard(
          key: Key(group.hash),
          group: group,
          index: index,
          assetData: viewState.assetData!,
          showDivider: index < viewState.bookmarkGroups.length - 1,
        );
      },
    );
  }
}
```

#### Step 2.2: BookmarkGroupCardの作成

**ファイル: `lib/pages/bookmarks/widgets/bookmark_group_card.dart`**

```dart
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/material_item.dart";
import "../../../core/asset_cache.dart";
import "../../../models/bookmark.dart";
import "../viewmodels/bookmarks_viewmodel.dart";
import "group_type_header.dart";

/// ブックマークグループカード
class BookmarkGroupCard extends ConsumerWidget {
  final BookmarkGroup group;
  final int index;
  final AssetData assetData;
  final bool showDivider;

  const BookmarkGroupCard({
    super.key,
    required this.group,
    required this.index,
    required this.assetData,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ヘッダー（ドラッグハンドル + タイトル）
          Row(
            children: [
              ReorderableDragStartListener(
                index: index,
                child: const Icon(Symbols.drag_handle, size: 32),
              ),
              Expanded(
                child: GroupTypeHeader(
                  group: group,
                  assetData: assetData,
                  onRemove: () {
                    ref.read(bookmarksViewModelProvider.notifier)
                        .removeBookmark(group.bookmarks.first.metadata.id);
                  },
                ),
              ),
            ],
          ),

          // コンテンツ（マテリアル/アーティファクト）
          if (group.type == BookmarkType.material)
            _buildMaterialContent(context, ref),
          if (group.type == BookmarkType.artifactSet)
            _buildArtifactSetContent(context),
          if (group.type == BookmarkType.artifactPiece)
            _buildArtifactPieceContent(context),

          // 区切り線
          if (showDivider)
            const Divider()
          else
            const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMaterialContent(BuildContext context, WidgetRef ref) {
    // マテリアルアイテムの表示
    // 実装は既存コードから移植
    return const Placeholder(); // TODO: 実装
  }

  Widget _buildArtifactSetContent(BuildContext context) {
    // アーティファクトセットの表示
    return const Placeholder(); // TODO: 実装
  }

  Widget _buildArtifactPieceContent(BuildContext context) {
    // アーティファクトピースの表示
    return const Placeholder(); // TODO: 実装
  }
}
```

---

### Phase 3: 新しいページの作成

**ファイル: `lib/pages/bookmarks_new.dart`**

```dart
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../i18n/strings.g.dart";
import "../ui_core/error_messages.dart";
import "bookmarks/widgets/purpose_grouped_list.dart";
import "bookmarks/widgets/material_grouped_list.dart";
import "bookmarks/widgets/furnishing_list.dart";
import "bookmarks/viewmodels/bookmarks_viewmodel.dart";

/// ブックマークページ（新実装）
class BookmarksPageNew extends HookConsumerWidget {
  const BookmarksPageNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);
    final viewState = ref.watch(bookmarksViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.bookmarks),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: tr.bookmarksPage.byPurpose),
            Tab(text: tr.bookmarksPage.byMaterial),
            Tab(text: tr.bookmarksPage.furnishings),
          ],
        ),
      ),
      body: viewState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewState.errorMessage != null
              ? Center(child: Text(getErrorMessage(viewState.errorMessage!)))
              : TabBarView(
                  controller: tabController,
                  children: const [
                    PurposeGroupedList(),
                    MaterialGroupedList(),
                    FurnishingList(),
                  ],
                ),
    );
  }
}
```

---

## マイグレーション手順

### Step 1: 基盤の構築（既存コードに影響なし）
1. ✅ `lib/utils/bookmark_utils.dart` を作成
2. ✅ `lib/pages/bookmarks/viewmodels/` 配下にViewModelを作成
3. ✅ コード生成を実行 (`flutter pub run build_runner build`)
4. ✅ テストを作成・実行

### Step 2: Presentation Components の作成
1. ✅ `lib/pages/bookmarks/widgets/` 配下にコンポーネントを作成
2. ✅ 既存の `bookmarks.dart` からUIロジックを移植
3. ✅ テストを作成・実行

### Step 3: 新しいページの作成と検証
1. ✅ `lib/pages/bookmarks_new.dart` を作成
2. ✅ 動作確認（デバッグビルド）
3. ✅ E2Eテストの実施

### Step 4: 切り替えと旧コードの削除
1. ✅ `routes.dart` で `BookmarksPageNew` を使用するよう変更
2. ✅ 本番環境で動作確認
3. ✅ `lib/pages/bookmarks.dart` を削除（または `_old.dart` にリネーム）

---

## テスト戦略

### Unit Tests

**ViewModelのテスト:**
```dart
// test/pages/bookmarks/viewmodels/bookmarks_viewmodel_test.dart
void main() {
  group('BookmarksViewModel', () {
    test('初期状態はローディング', () {
      // テスト実装
    });

    test('ブックマークの並び替えが正しく動作する', () {
      // テスト実装
    });

    test('ブックマーク削除が正しく動作する', () {
      // テスト実装
    });
  });
}
```

**Utilityのテスト:**
```dart
// test/utils/bookmark_utils_test.dart
void main() {
  group('BookmarkUtils', () {
    test('グループ化が正しく動作する', () {
      // テスト実装
    });
  });
}
```

### Widget Tests

```dart
// test/pages/bookmarks/widgets/purpose_grouped_list_test.dart
void main() {
  testWidgets('空のリストで正しく表示される', (tester) async {
    // テスト実装
  });
}
```

---

## 成功指標

### 定量的指標
- [ ] 新しい `bookmarks_new.dart` のコード行数: **300行以下**
- [ ] ViewModelの単体テストカバレッジ: **80%以上**
- [ ] 既存機能の動作: **100%互換**
- [ ] ビルド時間: **変更前と同等**

### 定性的指標
- [ ] ビジネスロジックがViewModel層に集約されている
- [ ] UIコンポーネントが再利用可能
- [ ] データベース直接呼び出しが0件
- [ ] 状態管理が明確で理解しやすい

---

## リスク管理

### リスク1: 既存機能の破壊
**対策:**
- 既存の `bookmarks.dart` を維持したまま並行開発
- 新しいページは別ルートで動作確認可能
- E2Eテストで完全な動作確認後に切り替え

### リスク2: コード生成の問題
**対策:**
- `build_runner` の実行を頻繁に行う
- 生成ファイルを `.gitignore` に追加しない（競合検知のため）

### リスク3: 学習コスト
**対策:**
- 詳細なコメントとドキュメント
- ViewModelパターンの参考資料を共有

---

## 次のステップ

Phase 1完了後、以下の順で他のページにも適用：

1. **character_details.dart** (423行)
2. **hoyolab_integration_settings.dart** (404行)
3. その他の大きなページファイル

各ページで同様のViewModel層分離を実施し、最終的にアプリ全体のアーキテクチャを統一します。

---

## 参考資料

- [Riverpod State Management](https://riverpod.dev/docs/concepts/reading)
- [MVVM Pattern in Flutter](https://www.raywenderlich.com/34-design-patterns-by-tutorials-mvvm)
- [Flutter Architecture Samples](https://github.com/brianegan/flutter_architecture_samples)
