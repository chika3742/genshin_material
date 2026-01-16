# リファクタリング実装計画：プレゼンテーション層とビジネスロジックの分離

## 概要
この計画書は、アーキテクチャ分析で特定された「プレゼンテーション層とビジネスロジックの分離不足」の問題を解決するための具体的な実装手順を示します。

## 対象範囲
フェーズ1として、最も問題が顕著な `lib/pages/bookmarks.dart` (948行) をリファクタリングします。

---

## 現状分析

### 問題箇所の整理

#### 1. データベース直接操作（現状）
```dart
// lib/pages/bookmarks.dart:124-125
final db = ref.read(appDatabaseProvider);
db.updateBookmarkOrder(bookmarkOrder);

// lib/pages/bookmarks.dart:287-288
final db = ref.read(appDatabaseProvider);
db.removeBookmarks([group.bookmarks.first.metadata.id]);

// lib/pages/bookmarks.dart:350
final db = ref.read(appDatabaseProvider);
db.removeBookmarksByHashes(hashes);

// lib/pages/bookmarks.dart:858-871
db.removeFurnishingSetBookmark(bookmark).then((restore) => ...)

// lib/pages/bookmarks.dart:909-910
db.updateFurnishingCraftCount(set.id, e.furnishingId, value);
```

**問題点:**
- UIコンポーネントがデータベース層を直接操作
- トランザクション管理が不明確
- エラーハンドリングが不統一
- テストが困難（モック化が難しい）

#### 2. ビジネスロジック（データ変換・ソート）
```dart
// lib/pages/bookmarks.dart:87-97
final bookmarkGroups = bookmarks.groupFoldBy<String, List<BookmarkWithDetails>>(
  (e) => e.metadata.groupHash,
  (prev, element) { ... }
).values.map((e) => BookmarkGroup.fromBookmarks(e, assetData)).toList();

// lib/pages/bookmarks.dart:211-213
void _sortBookmarkGroups(List<BookmarkGroup> groups, List<String> order) {
  groups.sort((a, b) => order.indexOf(a.hash).compareTo(order.indexOf(b.hash)));
}

// lib/pages/bookmarks.dart:930-948
List<BookmarkWithMaterialDetails> _sortBookmarks(...) {
  return bookmarks.sorted((a, b) => ...);
}
```

**問題点:**
- UIレイヤーでビジネスロジックを実行
- 同じロジックが他の場所でも必要になる可能性
- 単体テストができない

#### 3. 状態管理ロジック
```dart
// lib/pages/bookmarks.dart:111-128
onReorder: (oldIndex, newIndex) {
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }
  try {
    bookmarkOrder.insert(newIndex, bookmarkOrder.removeAt(oldIndex));
    _sortBookmarkGroups(bookmarkGroups, bookmarkOrder);
    final db = ref.read(appDatabaseProvider);
    db.updateBookmarkOrder(bookmarkOrder);
  } on RangeError catch (e, st) {
    log("Reorder failed...");
  }
}
```

**問題点:**
- UIイベントハンドラーにビジネスロジックが混在
- エラーハンドリングが UI層に存在
- 並行実行時の整合性保証がない

---

## リファクタリング戦略

### アーキテクチャパターン

**選択：Riverpod NotifierProvider + Use Case パターン**

理由：
- ✅ 既存のRiverpodエコシステムと親和性が高い
- ✅ コード生成を活用できる
- ✅ 段階的な移行が可能
- ✅ テスタビリティの向上

### 新しいディレクトリ構造

```
lib/
├── pages/
│   └── bookmarks.dart          # UIのみ（軽量化）
├── providers/
│   ├── bookmarks/
│   │   ├── bookmark_list_provider.dart      # ブックマーク一覧の状態管理
│   │   ├── bookmark_operations_provider.dart # ブックマーク操作（追加・削除・並び替え）
│   │   └── furnishing_bookmark_provider.dart # 家具ブックマーク専用
│   └── database_provider.dart   # 既存
├── use_cases/                   # 新規作成
│   └── bookmarks/
│       ├── update_bookmark_order_use_case.dart
│       ├── remove_bookmark_use_case.dart
│       └── update_furnishing_count_use_case.dart
└── utils/
    └── bookmark_utils.dart      # ソート・グループ化ロジック
```

---

## 実装手順（段階的移行）

### Step 1: ユーティリティ層の作成

**ファイル: `lib/utils/bookmark_utils.dart`**

```dart
import "package:collection/collection.dart";
import "../core/asset_cache.dart";
import "../models/bookmark.dart";

/// ブックマークのソート・グループ化ロジック
class BookmarkUtils {
  /// ブックマークをグループハッシュでグループ化
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

  /// ブックマークグループを指定された順序でソート
  static void sortBookmarkGroups(
    List<BookmarkGroup> groups,
    List<String> order,
  ) {
    groups.sort(
      (a, b) => order.indexOf(a.hash).compareTo(order.indexOf(b.hash)),
    );
  }

  /// マテリアルブックマークをソート（優先度順）
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

**テスト: `test/unit/bookmark_utils_test.dart`**

```dart
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/bookmark_utils.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/core/asset_cache.dart";

void main() {
  group("BookmarkUtils", () {
    test("groupBookmarks should group by hash", () {
      // テストケースを実装
    });

    test("sortBookmarkGroups should sort by order", () {
      // テストケースを実装
    });

    test("sortMaterialBookmarks should sort by priority", () {
      // テストケースを実装
    });
  });
}
```

---

### Step 2: Use Case層の作成

**ファイル: `lib/use_cases/bookmarks/update_bookmark_order_use_case.dart`**

```dart
import "../../database.dart";

/// ブックマークの並び順を更新するユースケース
class UpdateBookmarkOrderUseCase {
  final AppDatabase _database;

  UpdateBookmarkOrderUseCase(this._database);

  /// 並び順を更新
  /// 
  /// [oldIndex] 移動元のインデックス
  /// [newIndex] 移動先のインデックス
  /// [currentOrder] 現在の順序リスト
  /// 
  /// Returns: 更新後の順序リスト
  /// Throws: [BookmarkOrderUpdateException] 更新に失敗した場合
  Future<List<String>> execute({
    required int oldIndex,
    required int newIndex,
    required List<String> currentOrder,
  }) async {
    try {
      // 並び順の計算（リストの変更）
      final newOrder = List<String>.from(currentOrder);
      
      // newIndexの調整（ReorderableListViewの仕様に合わせる）
      int adjustedNewIndex = newIndex;
      if (oldIndex < newIndex) {
        adjustedNewIndex -= 1;
      }

      // 範囲チェック
      if (oldIndex < 0 || oldIndex >= newOrder.length) {
        throw BookmarkOrderUpdateException(
          "Invalid oldIndex: $oldIndex (list size: ${newOrder.length})",
        );
      }
      if (adjustedNewIndex < 0 || adjustedNewIndex >= newOrder.length) {
        throw BookmarkOrderUpdateException(
          "Invalid newIndex: $adjustedNewIndex (list size: ${newOrder.length})",
        );
      }

      // 並び順の変更
      newOrder.insert(adjustedNewIndex, newOrder.removeAt(oldIndex));

      // データベースへの永続化
      await _database.updateBookmarkOrder(newOrder);

      return newOrder;
    } on RangeError catch (e, stackTrace) {
      throw BookmarkOrderUpdateException(
        "Reorder failed: $oldIndex -> $newIndex",
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }
}

/// ブックマーク順序更新時の例外
class BookmarkOrderUpdateException implements Exception {
  final String message;
  final Object? originalError;
  final StackTrace? stackTrace;

  BookmarkOrderUpdateException(
    this.message, {
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => "BookmarkOrderUpdateException: $message";
}
```

**ファイル: `lib/use_cases/bookmarks/remove_bookmark_use_case.dart`**

```dart
import "../../database.dart";

/// ブックマークを削除するユースケース
class RemoveBookmarkUseCase {
  final AppDatabase _database;

  RemoveBookmarkUseCase(this._database);

  /// ブックマークIDで削除
  Future<void> executeByIds(List<int> bookmarkIds) async {
    if (bookmarkIds.isEmpty) return;
    
    try {
      await _database.removeBookmarks(bookmarkIds);
    } catch (e, stackTrace) {
      throw BookmarkRemovalException(
        "Failed to remove bookmarks: $bookmarkIds",
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// ブックマークハッシュで削除
  Future<void> executeByHashes(List<String> hashes) async {
    if (hashes.isEmpty) return;
    
    try {
      await _database.removeBookmarksByHashes(hashes);
    } catch (e, stackTrace) {
      throw BookmarkRemovalException(
        "Failed to remove bookmarks by hashes: $hashes",
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }
}

/// ブックマーク削除時の例外
class BookmarkRemovalException implements Exception {
  final String message;
  final Object? originalError;
  final StackTrace? stackTrace;

  BookmarkRemovalException(
    this.message, {
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => "BookmarkRemovalException: $message";
}
```

**ファイル: `lib/use_cases/bookmarks/update_furnishing_count_use_case.dart`**

```dart
import "../../database.dart";

/// 家具の製作数を更新するユースケース
class UpdateFurnishingCountUseCase {
  final AppDatabase _database;

  UpdateFurnishingCountUseCase(this._database);

  /// 家具の製作数を更新
  Future<void> execute({
    required String setId,
    required String furnishingId,
    required int count,
  }) async {
    if (count < 0) {
      throw FurnishingCountUpdateException(
        "Count cannot be negative: $count",
      );
    }

    try {
      await _database.updateFurnishingCraftCount(setId, furnishingId, count);
    } catch (e, stackTrace) {
      throw FurnishingCountUpdateException(
        "Failed to update furnishing count: setId=$setId, "
        "furnishingId=$furnishingId, count=$count",
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }
}

/// 家具カウント更新時の例外
class FurnishingCountUpdateException implements Exception {
  final String message;
  final Object? originalError;
  final StackTrace? stackTrace;

  FurnishingCountUpdateException(
    this.message, {
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => "FurnishingCountUpdateException: $message";
}
```

---

### Step 3: Providerの作成（ビジネスロジック層）

**ファイル: `lib/providers/bookmarks/bookmark_operations_provider.dart`**

```dart
import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../database.dart";
import "../../use_cases/bookmarks/update_bookmark_order_use_case.dart";
import "../../use_cases/bookmarks/remove_bookmark_use_case.dart";
import "../../use_cases/bookmarks/update_furnishing_count_use_case.dart";
import "../database_provider.dart";

part "bookmark_operations_provider.g.dart";

/// ブックマーク操作用のNotifier
@riverpod
class BookmarkOperations extends _$BookmarkOperations {
  late final UpdateBookmarkOrderUseCase _updateOrderUseCase;
  late final RemoveBookmarkUseCase _removeBookmarkUseCase;

  @override
  void build() {
    final database = ref.watch(appDatabaseProvider);
    _updateOrderUseCase = UpdateBookmarkOrderUseCase(database);
    _removeBookmarkUseCase = RemoveBookmarkUseCase(database);
  }

  /// ブックマークの並び順を更新
  Future<List<String>> updateBookmarkOrder({
    required int oldIndex,
    required int newIndex,
    required List<String> currentOrder,
  }) async {
    return await _updateOrderUseCase.execute(
      oldIndex: oldIndex,
      newIndex: newIndex,
      currentOrder: currentOrder,
    );
  }

  /// ブックマークを削除（ID指定）
  Future<void> removeBookmarksByIds(List<int> bookmarkIds) async {
    await _removeBookmarkUseCase.executeByIds(bookmarkIds);
  }

  /// ブックマークを削除（ハッシュ指定）
  Future<void> removeBookmarksByHashes(List<String> hashes) async {
    await _removeBookmarkUseCase.executeByHashes(hashes);
  }
}

/// 家具ブックマーク操作用のNotifier
@riverpod
class FurnishingBookmarkOperations extends _$FurnishingBookmarkOperations {
  late final AppDatabase _database;
  late final UpdateFurnishingCountUseCase _updateCountUseCase;

  @override
  void build() {
    _database = ref.watch(appDatabaseProvider);
    _updateCountUseCase = UpdateFurnishingCountUseCase(_database);
  }

  /// 家具ブックマークを削除（Undo機能付き）
  Future<void Function()> removeFurnishingSetBookmark(
    FurnishingSetBookmark bookmark,
  ) async {
    return await _database.removeFurnishingSetBookmark(bookmark);
  }

  /// 家具の製作数を更新
  Future<void> updateFurnishingCraftCount({
    required String setId,
    required String furnishingId,
    required int count,
  }) async {
    await _updateCountUseCase.execute(
      setId: setId,
      furnishingId: furnishingId,
      count: count,
    );
  }
}
```

---

### Step 4: ページのリファクタリング

**変更箇所の例:**

**Before (lib/pages/bookmarks.dart:111-128):**
```dart
onReorder: (oldIndex, newIndex) {
  if (bookmarkOrder == null) {
    return;
  }

  if (oldIndex < newIndex) {
    newIndex -= 1;
  }
  try {
    bookmarkOrder.insert(newIndex, bookmarkOrder.removeAt(oldIndex));
    _sortBookmarkGroups(bookmarkGroups, bookmarkOrder);

    final db = ref.read(appDatabaseProvider);
    db.updateBookmarkOrder(bookmarkOrder);
  } on RangeError catch (e, st) {
    log("Reorder failed: $oldIndex -> $newIndex, length: ${bookmarkOrder.length}", error: e, stackTrace: st);
  }
},
```

**After:**
```dart
onReorder: (oldIndex, newIndex) async {
  if (bookmarkOrder == null) {
    return;
  }

  try {
    final operations = ref.read(bookmarkOperationsProvider.notifier);
    final newOrder = await operations.updateBookmarkOrder(
      oldIndex: oldIndex,
      newIndex: newIndex,
      currentOrder: bookmarkOrder,
    );
    
    // 楽観的UI更新（ローカル状態の更新）
    bookmarkOrder.clear();
    bookmarkOrder.addAll(newOrder);
    BookmarkUtils.sortBookmarkGroups(bookmarkGroups, bookmarkOrder);
  } on BookmarkOrderUpdateException catch (e) {
    if (context.mounted) {
      showSnackBar(
        context: context,
        message: tr.errors.failedToUpdateBookmarkOrder,
      );
    }
  }
},
```

**Before (lib/pages/bookmarks.dart:287-288):**
```dart
final db = ref.read(appDatabaseProvider);
db.removeBookmarks([group.bookmarks.first.metadata.id]);
```

**After:**
```dart
final operations = ref.read(bookmarkOperationsProvider.notifier);
await operations.removeBookmarksByIds([group.bookmarks.first.metadata.id]);
```

**Before (lib/pages/bookmarks.dart:87-97):**
```dart
final bookmarkGroups = bookmarks.groupFoldBy<String, List<BookmarkWithDetails>>(
  (e) => e.metadata.groupHash,
  (prev, element) {
    if (prev == null) {
      return <BookmarkWithDetails>[element];
    } else {
      prev.add(element);
      return prev;
    }
  },
).values.map((e) => BookmarkGroup.fromBookmarks(e, assetData)).toList();
```

**After:**
```dart
final bookmarkGroups = BookmarkUtils.groupBookmarks(bookmarks, assetData);
```

---

## テスト戦略

### Unit Tests
1. **ユーティリティのテスト** (`test/unit/bookmark_utils_test.dart`)
   - グループ化ロジック
   - ソートロジック

2. **Use Caseのテスト** (`test/unit/use_cases/`)
   - 正常系
   - 異常系（境界値、エラー）
   - モックデータベースを使用

3. **Providerのテスト** (`test/unit/providers/`)
   - Use Caseとの連携
   - エラーハンドリング

### Widget Tests
- UIコンポーネントの独立性を確認
- Providerをモック化して動作確認

---

## マイグレーション手順

### Phase 1: 基盤整備（破壊的変更なし）
1. ✅ ユーティリティクラスの作成
2. ✅ Use Case層の作成
3. ✅ 新しいProviderの作成
4. ✅ テストの作成

### Phase 2: 段階的移行
1. ブックマーク並び替え機能の移行
2. ブックマーク削除機能の移行
3. 家具ブックマーク機能の移行
4. 既存コードの削除

### Phase 3: 検証と最適化
1. E2Eテストの実施
2. パフォーマンスの測定
3. コードレビュー

---

## 成功指標

### 定量的指標
- [ ] `lib/pages/bookmarks.dart`の行数を **60%削減**（948行 → 約380行）
- [ ] 単体テストのカバレッジ **80%以上**（ビジネスロジック部分）
- [ ] `ref.read(appDatabaseProvider)`の直接呼び出しを **0件**に削減

### 定性的指標
- [ ] ビジネスロジックが独立してテスト可能
- [ ] UIコンポーネントが純粋な表示ロジックのみ
- [ ] エラーハンドリングが統一的

---

## リスクと対策

### リスク1: 既存機能の破壊
**対策:**
- 段階的移行（機能ごとに移行）
- 既存コードを残したまま新コードを並行稼働
- 十分なテストカバレッジ

### リスク2: パフォーマンスの劣化
**対策:**
- ベンチマークテストの実施
- Provider再構築の最小化
- メモ化の活用

### リスク3: 開発期間の超過
**対策:**
- MVP（最小機能製品）の定義
- 優先順位の明確化
- 週次レビューの実施

---

## 次のステップ

このリファクタリングが完了したら、次の問題に取り組みます：

1. **Provider分割** (`lib/providers/game_data_sync.dart`)
2. **グローバル状態の排除** (`lib/main.dart`)
3. **Repository パターンの導入**

各ステップで同様の詳細な実装計画を作成します。

---

## 参考資料

- [Riverpod Best Practices](https://riverpod.dev/docs/concepts/reading)
- [Clean Architecture in Flutter](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)
- [Use Case Pattern](https://martinfowler.com/bliki/UseCase.html)
