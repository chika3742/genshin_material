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

### 重要な設計原則: Single Source of Truth

**データベースを唯一の信頼できる情報源とする**

❌ **避けるべきパターン（派生データをstateに保持）:**
```dart
class MyState {
  final List<Item> items;           // DBから取得
  final List<ItemGroup> groups;     // itemsから派生 ← 問題！
}
```

✅ **推奨パターン（DBを直接watch、派生データはキャッシュのみ）:**
```dart
@riverpod
Stream<List<ItemGroup>> itemGroups(Ref ref) async* {
  final items = await ref.watch(itemsProvider.future);
  yield _transformToGroups(items);  // 変換結果をキャッシュ
}

// ViewModelは操作のみ提供、状態は持たない
@riverpod
class ItemOperations extends _$ItemOperations {
  @override
  void build() {}  // 状態なし
  
  Future<void> updateItem(Item item) async {
    await db.update(item);  // DBに書き込むのみ
    // UIの更新は自動的に発生（Providerがwatchしているため）
  }
}
```

**利点:**
- データの整合性が保証される
- 同期エラーが発生しない
- テストが容易（DBをモック化すればOK）
- Riverpodの自動再計算機能を最大限活用

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

**重要な設計原則: Single Source of Truth**

ViewModelはデータベースを直接watchし、変換結果をキャッシュします。stateに派生データ（groups）を保持せず、データベースを唯一の信頼できる情報源とします。

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

/// ブックマークグループ（変換・キャッシュ済み）を提供するProvider
/// 
/// データベースを直接watchし、変換結果をキャッシュ
/// stateには派生データを保持せず、DBが唯一の情報源（Single Source of Truth）
@riverpod
Stream<List<BookmarkGroup>> bookmarkGroups(Ref ref) async* {
  final assetDataAsync = ref.watch(assetDataProvider);
  final bookmarksAsync = ref.watch(bookmarksProvider());
  final bookmarkOrderAsync = ref.watch(bookmarkOrderProvider);

  // 全てのデータが揃うまで待機
  if (assetDataAsync.value == null) {
    yield [];
    return;
  }

  await for (final _ in bookmarksAsync.when(
    data: (bookmarks) async* {
      final assetData = assetDataAsync.value!;
      
      // データベースから取得したデータを変換
      final groups = BookmarkUtils.groupBookmarks(bookmarks, assetData);

      // 順序でソート（順序データが利用可能な場合）
      bookmarkOrderAsync.whenData((order) {
        if (order.isNotEmpty) {
          BookmarkUtils.sortBookmarkGroups(groups, order);
        }
      });

      yield groups;
    },
    loading: () async* {
      yield [];
    },
    error: (_, __) async* {
      yield [];
    },
  )) {
    // Stream処理
  }
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
```

**設計のポイント:**

1. **Single Source of Truth**: データベースが唯一の真実の情報源
2. **派生データはキャッシュのみ**: `bookmarkGroupsProvider`は変換結果をキャッシュするが、stateには保持しない
3. **自動更新**: データベース変更時、Riverpodが自動的にUIを更新
4. **操作と状態の分離**: `BookmarkOperations`は操作のみ、状態はProviderが管理
5. **テスタビリティ**: データベースをモック化すれば全てテスト可能

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
  Future<void Function()> removeBookmark(FurnishingSetBookmark bookmark) async {
    return await _db.removeFurnishingSetBookmark(bookmark);
  }

  /// 製作カウントを更新
  /// 
  /// データベースに永続化。UIの更新は自動的に発生
  Future<void> updateCraftCount({
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
```

**データの取得:**

家具データはUIコンポーネント内で直接データベースをwatchします：

```dart
// PresentationコンポーネントでのStreamの使用例
final bookmarksStream = _db.watchFurnishingSetBookmarks();
final countsStream = _db.watchFurnishingCraftCounts(setId);
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
import "../../../providers/versions.dart";
import "../../../providers/database_provider.dart";
import "../viewmodels/bookmarks_viewmodel.dart";
import "bookmark_group_card.dart";

/// 目的別にグループ化されたブックマークリスト
/// 
/// データベースを直接watchし、ViewModelは操作のみを提供
class PurposeGroupedList extends ConsumerWidget {
  const PurposeGroupedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // データベースから直接取得（Single Source of Truth）
    final groupsAsync = ref.watch(bookmarkGroupsProvider);
    final orderAsync = ref.watch(bookmarkOrderProvider);

    return groupsAsync.when(
      data: (groups) {
        if (groups.isEmpty) {
          return Center(
            child: Text(tr.bookmarksPage.noBookmarks),
          );
        }

        return orderAsync.when(
          data: (order) => _buildList(context, ref, groups, order),
          loading: () => _buildList(context, ref, groups, []),
          error: (_, __) => _buildList(context, ref, groups, []),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Text("Error: $error"),
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    WidgetRef ref,
    List<BookmarkGroup> groups,
    List<String> order,
  ) {
    return ReorderableListView.builder(
      itemCount: groups.length,
      padding: const EdgeInsets.only(top: 8),
      onReorder: (oldIndex, newIndex) {
        // ViewModelに操作を委譲（状態更新はDBのwatchにより自動）
        ref.read(bookmarkOperationsProvider.notifier).updateBookmarkOrder(
          oldIndex: oldIndex,
          newIndex: newIndex,
          currentOrder: order,
        );
      },
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final group = groups[index];
        final assetData = ref.watch(assetDataProvider).value;

        if (assetData == null) {
          return const SizedBox.shrink(key: ValueKey("loading"));
        }

        return BookmarkGroupCard(
          key: Key(group.hash),
          group: group,
          index: index,
          assetData: assetData,
          showDivider: index < groups.length - 1,
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
                    // ViewModelの操作メソッドを呼び出すのみ
                    ref.read(bookmarkOperationsProvider.notifier)
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
import "bookmarks/widgets/purpose_grouped_list.dart";
import "bookmarks/widgets/material_grouped_list.dart";
import "bookmarks/widgets/furnishing_list.dart";

/// ブックマークページ（新実装）
/// 
/// ViewModelは状態を持たず、データベースを直接watch
class BookmarksPageNew extends HookConsumerWidget {
  const BookmarksPageNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);

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
      body: TabBarView(
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

**設計のポイント:**
- ページはシンプルなルーティングのみ
- 各タブのウィジェットが独立してデータベースをwatch
- エラーハンドリングは各ウィジェット内で実施
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
