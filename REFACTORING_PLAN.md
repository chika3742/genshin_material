# lib/pages/bookmarks.dart リファクタリング計画書

## 1. 現状分析

### 1.1 ファイルの概要
- **ファイルサイズ**: 948行
- **主要な問題点**:
  - ビジネスロジックとUIロジックが混在
  - 複数のウィジェットクラスに処理が分散
  - データベース操作がウィジェット内に直接記述
  - データ変換・ソート・グルーピングロジックがUI層に存在
  - テスタビリティが低い

### 1.2 現在のコード構成

#### ウィジェット（UI層）
1. `BookmarksPage` - メインページ（タブコントロール）
2. `_PurposeGroupedBookmarkList` - 目的別ブックマークリスト
3. `_MaterialGroupedBookmarkList` - 素材別ブックマークリスト
4. `_FurnishingBookmarkList` - 家具ブックマークリスト
5. `_GroupTypeText` - グループタイプ表示
6. `_PurposeHeader` - 目的ヘッダー
7. `_ArtifactSetDetails` - 聖遺物セット詳細
8. `_ArtifactPieceDetails` - 聖遺物ピース詳細
9. `_ItemLinkButton` - アイテムリンクボタン
10. `_LevelBookmarkDetail` - レベル別ブックマーク詳細
11. `_MaterialBookmarkDetail` - 素材別ブックマーク詳細

#### ビジネスロジック（現在はウィジェット内に混在）
- ブックマークのグルーピング処理（L87-97）
- ブックマークの並び替え処理（L211-213）
- ブックマークの削除処理（複数箇所）
- 素材のソート処理（L930-948）
- 家具の集計処理

### 1.3 既存のアーキテクチャパターン
- **状態管理**: Riverpod（コード生成あり）
- **データアクセス**: Driftデータベース + 拡張メソッド（`db/bookmark_db_extension.dart`）
- **プロバイダー**: `providers/database_provider.dart`で定義
- **リポジトリ層**: 未実装

## 2. リファクタリング方針

### 2.1 基本方針
1. **最小限の変更**: 既存の動作を保持しながら段階的にリファクタリング
2. **段階的な実装**: フェーズごとに分けて実装・テスト
3. **既存パターンの踏襲**: プロジェクトの既存のコーディング規約とパターンに従う
4. **テスト優先**: リファクタリング前後でテストを実施

### 2.2 スコープ
- ✅ **実施する**: ビジネスロジック（Repository層）とUIロジック（Presentation層）の分離
- ❌ **実施しない**: Service層とRepository層の分離（今回はスコープ外）

## 3. 詳細実装計画

### Phase 1: Repository層の作成

#### 3.1.1 `lib/repositories/bookmark_repository.dart`の作成

**責務**:
- ブックマークデータの取得・加工
- ブックマークのグルーピング
- ブックマークのソート
- ブックマークの並び順管理
- ブックマークのCRUD操作の抽象化

**メソッド例**:
```dart
@riverpod
class BookmarkRepository extends _$BookmarkRepository {
  // グループ化されたブックマークを取得
  Future<List<BookmarkGroup>> getGroupedBookmarks();
  
  // 素材別にグループ化されたブックマークを取得
  Future<Map<String?, List<BookmarkWithMaterialDetails>>> getMaterialGroupedBookmarks();
  
  // ブックマークをソート
  List<BookmarkWithMaterialDetails> sortBookmarks(
    Iterable<BookmarkWithMaterialDetails> bookmarks
  );
  
  // ブックマークグループをソート
  void sortBookmarkGroups(
    List<BookmarkGroup> groups, 
    List<String> order
  );
  
  // ブックマーク削除（Undo対応）
  Future<void> removeBookmarksWithUndo(List<int> ids);
  
  // ブックマーク追加
  Future<void> addBookmarks(List<BookmarkInsertable> insertables);
}
```

**移動するロジック**:
- `_sortBookmarks` 関数（L930-948）
- `_sortBookmarkGroups` メソッド（L211-213）
- グルーピングロジック（L87-97, L310-321）
- ブックマーク削除ロジック（複数箇所に散在）

#### 3.1.2 `lib/repositories/furnishing_repository.dart`の作成

**責務**:
- 家具ブックマークの取得
- 家具のクラフト数管理
- 家具セットの不足コンポーネント計算

**メソッド例**:
```dart
@riverpod
class FurnishingRepository extends _$FurnishingRepository {
  // 家具セットブックマークを取得
  Stream<List<FurnishingSetBookmark>> watchFurnishingSetBookmarks();
  
  // 家具のクラフト数を監視
  Stream<List<FurnishingCraftCount>> watchFurnishingCraftCounts(String setId);
  
  // 不足している家具コンポーネントを取得
  List<FurnishingComponent> getInsufficientComponents(
    FurnishingSet set, 
    List<FurnishingCraftCount> counts
  );
  
  // 家具ブックマーク削除（Undo対応）
  Future<void> removeFurnishingSetBookmarkWithUndo(FurnishingSetBookmark bookmark);
  
  // 家具のクラフト数を更新
  Future<void> updateFurnishingCraftCount(String setId, String furnishingId, int count);
}
```

### Phase 2: Presentation層のState Management

#### 3.2.1 `lib/providers/bookmark_state.dart`の作成

**責務**:
- UIに必要な状態の提供
- Repository層とUI層の橋渡し
- 複雑な状態計算のキャッシュ

**プロバイダー例**:
```dart
// グループ化されたブックマークを提供
@riverpod
Future<List<BookmarkGroup>> bookmarkGroups(Ref ref) async {
  final repository = ref.watch(bookmarkRepositoryProvider.notifier);
  return repository.getGroupedBookmarks();
}

// 素材別グループ化されたブックマークを提供
@riverpod
Future<Map<String?, List<BookmarkWithMaterialDetails>>> materialGroupedBookmarks(Ref ref) async {
  final repository = ref.watch(bookmarkRepositoryProvider.notifier);
  return repository.getMaterialGroupedBookmarks();
}

// ブックマーク操作用のnotifier
@riverpod
class BookmarkOperations extends _$BookmarkOperations {
  Future<void> reorderBookmark(int oldIndex, int newIndex);
  Future<void> removeBookmark(int id);
  Future<void> removeBookmarks(List<int> ids);
}
```

### Phase 3: UIコンポーネントの抽出

#### 3.3.1 `lib/components/bookmark/`ディレクトリ構造

```
lib/components/bookmark/
├── purpose_grouped_list.dart          # 目的別リスト
├── material_grouped_list.dart         # 素材別リスト
├── furnishing_list.dart               # 家具リスト
├── bookmark_group_header.dart         # グループヘッダー
├── bookmark_group_type_text.dart      # グループタイプテキスト
├── artifact_set_details.dart          # 聖遺物セット詳細
├── artifact_piece_details.dart        # 聖遺物ピース詳細
├── item_link_button.dart              # アイテムリンクボタン
└── details/
    ├── level_bookmark_detail.dart     # レベル別詳細
    └── material_bookmark_detail.dart  # 素材別詳細
```

#### 3.3.2 コンポーネント抽出の原則
1. **単一責任**: 各コンポーネントは1つの責務のみを持つ
2. **再利用性**: 他の画面でも使える汎用性を持たせる
3. **テスタビリティ**: 独立してテスト可能にする
4. **プライベートの解除**: `_`プレフィックスを削除してpublicにする

### Phase 4: メインページのリファクタリング

#### 3.4.1 `lib/pages/bookmarks.dart`の簡素化

**変更前の責務** (現状):
- UI描画
- データ取得
- データ変換
- ビジネスロジック実行
- データベース操作

**変更後の責務** (目標):
- UI描画
- ユーザーインタラクションのハンドリング
- コンポーネントの組み立て

**期待されるファイルサイズ**: 約300行（現在の約1/3）

### Phase 5: テストとバリデーション

#### 3.5.1 単体テストの追加
- `test/repositories/bookmark_repository_test.dart`
- `test/repositories/furnishing_repository_test.dart`

#### 3.5.2 テスト項目
1. ブックマークのグルーピングが正しく動作すること
2. ソートロジックが正しく動作すること
3. CRUD操作が正しく動作すること
4. Undo機能が正しく動作すること

#### 3.5.3 統合テスト
- 既存の動作が保持されていることを確認
- UIの表示が変わらないことを確認

## 4. 実装順序

### Step 1: Repository層の実装
1. `lib/repositories/bookmark_repository.dart`を作成
2. ソート・グルーピングロジックを移動
3. 単体テストを追加

### Step 2: Furnishing Repositoryの実装
1. `lib/repositories/furnishing_repository.dart`を作成
2. 家具関連ロジックを移動
3. 単体テストを追加

### Step 3: Providerの実装
1. `lib/providers/bookmark_state.dart`を作成
2. 既存のproviderと統合

### Step 4: UIコンポーネントの分離
1. `lib/components/bookmark/`ディレクトリを作成
2. ウィジェットを1つずつ分離・移動
3. インポートを更新

### Step 5: メインページのリファクタリング
1. `bookmarks.dart`から抽出したロジックを削除
2. 新しいrepositoryとproviderを使用するように更新
3. コンポーネントのインポートを更新

### Step 6: 最終テストとクリーンアップ
1. 全テストを実行
2. リンターを実行
3. コードレビュー
4. 不要なコードの削除

## 5. 期待される効果

### 5.1 メリット
1. **保守性の向上**: ビジネスロジックとUIが分離され、変更が容易に
2. **テスタビリティの向上**: Repository層を独立してテスト可能
3. **可読性の向上**: ファイルサイズが削減され、コードが理解しやすく
4. **再利用性の向上**: 抽出したコンポーネントを他の画面でも利用可能
5. **バグの削減**: ロジックが一箇所に集約され、重複が削減

### 5.2 リスク管理
1. **段階的な実装**: 一度に全てを変更せず、フェーズごとに実装・テスト
2. **既存テストの活用**: 既存のテストが失敗しないことを確認
3. **機能の保持**: リファクタリング前後で動作が変わらないことを保証
4. **レビュープロセス**: 各フェーズごとにコードレビューを実施

## 6. 見積もり

- **Phase 1**: 2-3時間（Repository層の実装）
- **Phase 2**: 1-2時間（Provider実装）
- **Phase 3**: 3-4時間（UIコンポーネント分離）
- **Phase 4**: 1-2時間（メインページリファクタリング）
- **Phase 5**: 2-3時間（テスト・バリデーション）
- **合計**: 9-14時間

## 7. 参考資料

### 7.1 既存のコーディング規約
- `analysis_options.yaml`に従う
- Riverpodのコード生成を使用
- `@riverpod`アノテーションを使用
- 相対インポートを優先

### 7.2 既存のアーキテクチャ参考
- `lib/db/bookmark_db_extension.dart` - データベース拡張パターン
- `lib/providers/database_provider.dart` - プロバイダーパターン
- `lib/pages/daily.dart` - シンプルなページ構造の例
