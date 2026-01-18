# アーキテクチャ分析レポート

## プロジェクト概要
このプロジェクトは原神（Genshin Impact）のマテリアル管理アプリケーションで、Flutter + Riverpod + Drift（SQLite）を使用したモバイルアプリです。

## 分析日時
2026-01-16

---

## 🔴 重大な問題点

### 1. プレゼンテーション層とビジネスロジックの分離不足

**問題の詳細:**
- `lib/pages/bookmarks.dart`（948行）のような巨大なページファイルに、UI構築とビジネスロジックが混在している
- ウィジェット内で直接データベース操作を行っている（例: `ref.read(appDatabaseProvider).removeBookmarks()`）
- ページ内に複数のプライベートウィジェットクラス（11個）が定義されており、責任が分散していない

**影響:**
- テストが困難（UIとロジックが密結合）
- コードの再利用性が低い
- 可読性・保守性の低下

**該当箇所:**
- `lib/pages/bookmarks.dart`: 948行、11個のウィジェットクラス
- `lib/pages/database/characters/character_details.dart`: 423行
- `lib/pages/hoyolab_integration/hoyolab_integration_settings.dart`: 404行

**推奨される改善策:**
- ViewModelパターンまたはBloCパターンの導入
- ビジネスロジックをProviderに移動
- 複雑なウィジェットの分割と`lib/components/`への移動

---

### 2. 過度に複雑なProviderとビジネスロジックの集中

**問題の詳細:**
- `lib/providers/game_data_sync.dart`（465行）に多くの責任が集中している
  - HoYoLAB API連携
  - キャッシュ管理
  - データ同期ロジック
  - エラーハンドリング
- 複数の関連するProviderが1つのファイルに混在（5つのProviderを定義）

**影響:**
- 単一責任の原則（SRP）違反
- テストの複雑化
- 変更時の影響範囲が大きい

**該当箇所:**
- `lib/providers/game_data_sync.dart`: 465行
  - `GameDataSyncCached`
  - `_gameDataSync`
  - `bagLackNum`
  - `gameDataSyncState`
  - `ResinSyncStateNotifier`

**推奨される改善策:**
- Providerを責任ごとに分割（API呼び出し、キャッシュ管理、状態管理）
- サービスクラス層の導入（`lib/services/`）
- リポジトリパターンの適用

---

### 3. データベースアクセス層の設計不足

**問題の詳細:**
- データベース拡張（`lib/db/`）とProviderが直接結合している
- 複雑なクエリロジックがExtension内に分散している
- トランザクション管理が不明確

**影響:**
- データアクセスパターンの一貫性欠如
- テストの困難さ（モック化が難しい）
- クエリの最適化が困難

**該当箇所:**
- `lib/db/bookmark_db_extension.dart`
- `lib/db/in_game_character_state_db_extension.dart`
- `lib/db/in_game_weapon_state_db_extension.dart`
- `lib/providers/database_provider.dart`から直接呼び出し

**推奨される改善策:**
- Repositoryパターンの導入
- DAOクラスの作成
- データベース操作のインターフェース定義

---

### 4. グローバル状態とシングルトンの乱用

**問題の詳細:**
- `lib/main.dart`にグローバル変数が定義されている
  - `late final SharedPreferencesWithCache spInstance`
  - `bool linkedWithHoyolab`
  - `bool get disableImages`
  - `final rootNavigatorKey`
  - `final _router`
  - `BuildContext? get routerContext`
- これらはアプリケーション全体から参照可能

**影響:**
- テスタビリティの低下
- 状態管理の複雑化
- 依存関係の不透明化

**該当箇所:**
```dart
// lib/main.dart
late final SharedPreferencesWithCache spInstance;
bool linkedWithHoyolab = false;
bool get disableImages => (Platform.isIOS || Platform.isMacOS) && !linkedWithHoyolab;
final rootNavigatorKey = GlobalKey<NavigatorState>();
final _router = GoRouter(...);
BuildContext? get routerContext => _router.routerDelegate.navigatorKey.currentContext;
```

**推奨される改善策:**
- グローバル変数をProviderに移行
- 依存性注入（DI）の活用
- 初期化ロジックの整理

---

## 🟡 中程度の問題点

### 5. API層の責任過多

**問題の詳細:**
- `lib/core/hoyolab_api.dart`（345行）がHTTPクライアント、認証、エラーハンドリング、データ変換を全て担当
- APIリクエストキューの実装がAPI層に混在
- ヘッダー生成、署名生成などの低レベル処理が混在

**影響:**
- 単一責任の原則違反
- テストの複雑化
- APIの変更が広範囲に影響

**該当箇所:**
- `lib/core/hoyolab_api.dart`

**推奨される改善策:**
- API層を複数の責任に分割
  - HTTPクライアント層
  - 認証層
  - データ変換層（Mapper）
- APIサービスインターフェースの定義

---

### 6. モデル層の責任不明確

**問題の詳細:**
- モデルクラス（`lib/models/`）がデータクラスとしての役割のみ
- ビジネスロジックが欠如している
- ドメインモデルとDTOの区別がない

**影響:**
- ビジネスロジックがアプリケーション層に分散
- ドメイン知識の可視化不足

**該当箇所:**
- `lib/models/bookmark.dart`: 236行
- `lib/models/hoyolab_api.dart`: 286行
- すべてのモデルがフリーズドクラスのみ

**推奨される改善策:**
- ドメインモデルとDTOの分離
- ビジネスルールのカプセル化
- Value Objectの導入検討

---

### 7. エラーハンドリングの一貫性不足

**問題の詳細:**
- エラーハンドリングの方法が場所によって異なる
  - Providerでの`AsyncValue`
  - `try-catch`での直接処理
  - カスタム例外クラス（`lib/core/errors.dart`）の使用が限定的
- エラーメッセージの管理が分散（`lib/ui_core/error_messages.dart`）

**影響:**
- エラー処理の予測不可能性
- デバッグの困難さ
- ユーザー体験の一貫性欠如

**推奨される改善策:**
- 統一的なエラーハンドリング戦略の定義
- カスタム例外階層の整備
- エラーレポーティングの標準化

---

### 8. 設定管理の複雑性

**問題の詳細:**
- 設定が複数の場所に分散
  - `SharedPreferences`（`lib/core/kv_preferences.dart`）
  - `flutter_secure_storage`（`lib/core/secure_storage.dart`）
  - Firebase Remote Config（`lib/main.dart`）
  - グローバル変数（`lib/main.dart`）
- 設定の読み書きパターンが統一されていない

**影響:**
- 設定の管理が複雑
- テストの困難さ
- 設定の一貫性が保証されない

**該当箇所:**
- `lib/core/kv_preferences.dart`: 150行
- `lib/providers/preferences.dart`: 197行
- `lib/main.dart`の初期化コード

**推奨される改善策:**
- 設定管理の抽象化
- 統一的な設定インターフェース
- 設定の型安全性向上

---

## 🟢 軽微な問題点

### 9. コンポーネントの整理不足

**問題の詳細:**
- `lib/components/`に様々な粒度のコンポーネントが混在
- 命名規則が統一されていない（例: `_ItemLinkButton`はコンポーネントではなくページ内プライベートクラス）
- 再利用可能なコンポーネントとページ固有のウィジェットの区別が不明確

**推奨される改善策:**
- コンポーネントの分類と整理
- 原子的デザインパターンの検討
- ウィジェットカタログの作成

---

### 10. ユーティリティ関数の分散

**問題の詳細:**
- `lib/utils/`に様々なユーティリティが混在
- 関連性の低い関数が同じファイルにある可能性
- 静的メソッドとトップレベル関数の使い分けが不明確

**推奨される改善策:**
- ユーティリティの責任ごとの整理
- 命名規則の統一
- ドキュメントの充実

---

### 11. テストカバレッジの不足

**問題の詳細:**
- テストファイルが限定的
  - 単体テスト: 8ファイル
  - ウィジェットテスト: 2ファイル
  - 統合テスト: 1ファイル
- 重要なビジネスロジック（Provider、データベース）のテストが不足
- テストの命名規則が統一されていない

**推奨される改善策:**
- 重要なビジネスロジックの単体テスト追加
- E2Eテストの追加検討
- テストカバレッジの測定と目標設定

---

## 📊 アーキテクチャ構造の現状

### 現在のレイヤー構成
```
Presentation Layer (UI)
├── pages/ (巨大、ビジネスロジック混在)
├── components/ (再利用可能なUI)
└── routes.dart (ルーティング定義)

State Management
├── providers/ (Riverpod、ロジック過多)
└── composables/ (Hooks)

Data Access
├── database.dart (Drift定義)
├── db/ (Extensions)
└── models/ (データクラスのみ)

Infrastructure
├── core/ (API、キャッシュ、設定など混在)
└── utils/ (ヘルパー関数)
```

### 理想的なレイヤー構成（提案）
```
Presentation Layer
├── pages/ (UIのみ、ビジネスロジックなし)
├── components/ (再利用可能なUI)
├── view_models/ or blocs/ (UIロジック)
└── routes.dart

Application Layer
├── use_cases/ or interactors/ (ユースケース)
└── app_services/ (アプリケーションサービス)

Domain Layer
├── models/ (ドメインモデル + ビジネスルール)
├── repositories/ (インターフェース)
└── services/ (ドメインサービス)

Infrastructure Layer
├── data/
│   ├── repositories/ (実装)
│   ├── data_sources/ (API、DB)
│   └── dto/ (データ転送オブジェクト)
├── core/ (共通機能)
└── utils/ (ヘルパー)

State Management
├── providers/ (軽量、依存性注入のみ)
└── state/ (状態クラス)
```

---

## 🎯 優先度付きリファクタリング推奨事項

### 高優先度（即座に対応すべき）
1. **ビジネスロジックの分離**
   - 巨大なページファイル（`bookmarks.dart`など）の分割
   - ViewModelまたはUseCase層の導入

2. **グローバル状態の排除**
   - `main.dart`のグローバル変数をProviderに移行
   - 依存性注入の整備

3. **Providerの分割**
   - `game_data_sync.dart`を複数のProviderとサービスに分割

### 中優先度（段階的に対応）
4. **Repositoryパターンの導入**
   - データベースアクセスの抽象化
   - テスタビリティの向上

5. **エラーハンドリングの統一**
   - 統一的なエラーハンドリング戦略
   - カスタム例外階層の整備

6. **API層のリファクタリング**
   - HoyolabApiクラスの分割
   - 責任の明確化

### 低優先度（継続的改善）
7. **テストの充実**
   - 単体テストのカバレッジ向上
   - 統合テストの追加

8. **コンポーネントの整理**
   - 原子的デザインパターンの適用検討

9. **ドキュメントの充実**
   - アーキテクチャドキュメント
   - コーディングガイドライン

---

## 📝 総評

このプロジェクトは機能的には完成度が高いですが、アーキテクチャ的には以下の課題があります：

**強み:**
- ✅ コード生成の活用（Freezed、Riverpod、Go Router）
- ✅ 型安全性の高い実装
- ✅ Lintルールの整備
- ✅ 国際化対応（slang）

**弱み:**
- ❌ レイヤー分離の不足（特にプレゼンテーションとビジネスロジック）
- ❌ 責任の過集中（巨大なファイル、多機能なクラス）
- ❌ テスタビリティの低さ（密結合、グローバル状態）
- ❌ 一貫性のないパターン（エラーハンドリング、設定管理）

**リファクタリングの必要性:**
中規模〜大規模のリファクタリングが推奨されます。特に以下の点：
- クリーンアーキテクチャまたはレイヤードアーキテクチャの導入
- 依存性注入（DI）の整備
- テスト駆動開発（TDD）の実践

このリファクタリングにより、保守性、拡張性、テスタビリティが大幅に向上すると期待されます。

---

## 参考資料

- Clean Architecture (Robert C. Martin)
- Flutter Architecture Blueprints
- Riverpod Best Practices
- Repository Pattern
- SOLID Principles
