# テストカバレッジ改善ワークストリーム

このディレクトリは、`genshin_material` のテストカバレッジを段階的に引き上げるための作業分割指示書です。
各 `W*.md` は**単独で読めば作業が完了できる**ように書かれています。別セッション・別エージェントにそのまま渡せます。

## 現状（起点）

| 項目 | 値 |
|---|---|
| 手書きの `lib` コード | 約 17,900 行（生成コード除く） |
| テストコード | 約 3,600 行 / テストファイル 20 個 |
| CI | `fvm flutter analyze` + `fvm flutter test` のみ。カバレッジ計測なし |

既存テストは `material_calculator` / `resin_calculator` / `asset_updater` / `bookmark_db_extension` / DB マイグレーションなど一部の重要箇所には行き届いています。一方で以下が空白です。

- `lib/utils/` の純粋関数の過半（`ingredients_converter`, `filtering`, `material_usage`, `farm_counts`, `hash`, `lists`, `unwrap_yaml_value`）にテストが 1 本もない
- `lib/view_models/bookmarks/` 4 ファイル・`lib/db/` の 5 拡張中 3 つ・`lib/providers/` の大半が未テスト
- `lib/components/` の再利用コンポーネントで widget テストがあるのは `furnishing_table` / `style_parsed_text` / `release_note*` のみ
- `lib/core/hoyolab_api.dart` はコンストラクタで `FirebaseRemoteConfig.instance` を直接読むため、インスタンス化すらテストできない

## 方針（決定済み）

| 項目 | 決定 |
|---|---|
| 対象範囲 | ①純粋ロジック（utils/models）②ViewModel / Provider / DB 拡張 ③共通コンポーネントの widget テスト |
| 対象外 | ページ全体テスト・`integration_test`（費用対効果が低いため今回は扱わない） |
| カバレッジ計測 | 計測スクリプト + CI でのレポートのみ。**しきい値ゲートは設けない** |
| リファクタ | テスト容易化のためのプロダクションコード変更を積極的に許容 |
| ブランチ | 全ワークストリームの成果を `claude/test-coverage-improvement-plan-x14ldp` に集約し、最後に PR を 1 本出す |

## 依存関係

```
W0 基盤整備（先行必須・単独）
   ├─→ W1 utils 純粋ロジック
   ├─→ W2 models ロジック
   ├─→ W3 DB 拡張
   ├─→ W4 ViewModel / Provider
   ├─→ W5 共通コンポーネント widget
   └─→ W6 テスト容易化リファクタ + core
```

**W0 は必ず最初に単独で完了させてください。** W1〜W6 が W0 で追加するテストヘルパに依存します。
W1〜W6 は担当ファイルが互いに素になるよう分割してあるため、同時進行できます。

## ワークストリーム一覧

| | 内容 | 主な成果物 |
|---|---|---|
| [W0](./W0.md) | 計測基盤とテストヘルパの整備（先行必須） | `scripts/coverage.sh`, CI 変更, `test/utils/*` |
| [W1](./W1.md) | `lib/utils/` 純粋ロジック | `test/unit/utils/` 8 ファイル |
| [W2](./W2.md) | `lib/models/` のロジック | `test/unit/models/` 6 ファイル |
| [W3](./W3.md) | `lib/db/` 拡張と DB 周辺 | `test/drift/db/` 3 + `test/unit/db/` 1 ファイル |
| [W4](./W4.md) | ViewModel と Provider | `test/unit/view_models/` 5 + `test/unit/providers/` 3 ファイル |
| [W5](./W5.md) | 共通コンポーネントの widget テスト | `test/widget/components/` 8 ファイル |
| [W6](./W6.md) | テスト容易化リファクタ + `lib/core/` のテスト | `lib/` のリファクタ + `test/unit/core/` 4 ファイル |

## ファイル所有権（コンフリクト回避）

各ワークストリームは**自分の行に書かれたパスのみ**を作成・変更してください。

| WS | 排他的に作成・変更するパス |
|---|---|
| W0 | `scripts/coverage.sh`, `.github/workflows/test.yaml`, `.gitignore`, `test/utils/*` |
| W1 | `test/unit/utils/`, `test/unit/ui_core/`, `test/unit/utils_test.dart` |
| W2 | `test/unit/models/`, `test/unit/drop_rate_entry_test.dart` |
| W3 | `test/drift/db/furnishing_*`, `test/drift/db/in_game_*`, `test/drift/db/material_bag_*`, `test/drift/db/bookmark_db_extension_test.dart`, `test/unit/db/` |
| W4 | `test/unit/view_models/`, `test/unit/providers/` |
| W5 | `test/widget/components/` |
| W6 | `lib/core/`, `lib/data/repositories/`, `lib/providers/hoyolab_credential.dart`, `lib/constants/remote_config_key.dart`, `lib/pages/database/characters/character_list.dart`, `lib/pages/tools/resin_calc.dart`, `lib/main.dart`, `test/unit/core/`, `test/unit/asset_updater_test.dart`, `test/unit/api_request_queue_test.dart` |

`test/utils/asset_data.dart` だけは W0 完了後も W1〜W5 が追記したくなる可能性があります。
**追記が必要な場合は既存関数のシグネチャを壊さず、任意引数の追加のみ**にしてください。

## ブランチ運用と PR

**ワークストリームごとに個別の PR を出してレビューします。** 統合ブランチに直接コミットしないでください。

- 統合ブランチ: `claude/test-coverage-improvement-plan-x14ldp`
- 各ワークストリームは**統合ブランチから作業ブランチを切り**、作業完了後に**統合ブランチを base とした PR** を 1 本出します。

| WS | 作業ブランチ | PR の base |
|---|---|---|
| W0 | `claude/test-coverage-w0` | `claude/test-coverage-improvement-plan-x14ldp` |
| W1 | `claude/test-coverage-w1` | 同上 |
| W2 | `claude/test-coverage-w2` | 同上 |
| W3 | `claude/test-coverage-w3` | 同上 |
| W4 | `claude/test-coverage-w4` | 同上 |
| W5 | `claude/test-coverage-w5` | 同上 |
| W6 | `claude/test-coverage-w6` | 同上 |

```bash
git fetch origin
git checkout -b claude/test-coverage-w{N} origin/claude/test-coverage-improvement-plan-x14ldp
# ... 作業 ...
git push -u origin claude/test-coverage-w{N}
# base を claude/test-coverage-improvement-plan-x14ldp にして PR を作成
```

### 進め方

1. **W0 の PR を最初にマージします。** W1〜W6 はマージ後の統合ブランチから枝を切ってください（W0 が追加するテストヘルパに依存するため）。
2. W1〜W6 は並行して進め、それぞれ独立した PR としてレビューします。
3. 他ワークストリームの PR が先に統合ブランチへマージされたら、自分のブランチに取り込んでからテストを再実行してください。

   ```bash
   git fetch origin && git merge origin/claude/test-coverage-improvement-plan-x14ldp
   ```

   自分が作成したブランチなので rebase でも構いませんが、レビュー中の PR では merge を推奨します。
4. **W6 は唯一 `lib/` 本体を広く変更します。** 早めにマージするか、他ワークストリームのマージ後に必ず統合ブランチを取り込んでください。
5. 全ワークストリームがマージされたら、統合ブランチから `main` 向けの PR を 1 本出します。

### PR について

- **PR は draft にしないでください。** `.github/workflows/claude-code-review.yml` の自動レビューが draft PR では動きません。
- リポジトリに PR テンプレートはないため、本文は通常どおり記述してください。
- PR タイトルは `test: W{N} ...` のように、どのワークストリームかがわかる形にしてください。
- 他ワークストリームの PR にはコメント・変更を行わないでください。

## 共通ルール

すべてのワークストリームが従うこと。

### コマンド

- **すべての Flutter/Dart コマンドに `fvm` を前置する**（`.fvmrc` で Flutter バージョンを固定しているため）。
- コード生成が必要になったら `./scripts/build_runner.sh` を実行し、**生成ファイルもコミットする**。

### コード規約（`CLAUDE.md` 準拠。テストコードにも適用）

- 文字列は**ダブルクォート**
- 複数行の引数リストには**末尾カンマ**必須（`better_require_trailing_commas` lint）
- フィールド・ローカル変数は可能な限り `final`
- `test/` 内の相互参照は**相対 import**
- `void` を async 関数の戻り値型にしない（`Future<void>` を使う）

### テストの書き方

- テスト名・`group` 名は日本語・英語どちらでも可。ただし**1 ファイル内では統一**する。
- 参照すべき既存実装:

  | 種類 | 参照先 |
  |---|---|
  | 純粋関数 | `test/unit/material_calculator_test.dart` |
  | Provider / Notifier | `test/unit/resin_provider_test.dart` |
  | Drift DB | `test/drift/db/bookmark_db_extension_test.dart` |
  | Widget | `test/widget/bookmark_furnishing_sets_tab_test.dart` |
  | http モック | `test/unit/asset_updater_test.dart` |

- DB を使うテストは `AppDatabase(NativeDatabase.memory())` を `setUp` で作り、`tearDown` で `close()` する。
- Provider のテストは `ProviderContainer.test(overrides: [...])` を使う。
- mockito のモックが要る場合は `@GenerateMocks` / `@GenerateNiceMocks` を書いて `./scripts/build_runner.sh` を実行し、生成された `*.mocks.dart` もコミットする。
- **ロケール依存の文字列リテラルをテストに直書きしない**（`LocaleSettings` の既定は `ja`）。

### 既存ヘルパ（必ず再利用し、重複を作らない）

| ファイル | 提供するもの |
|---|---|
| `test/utils.dart` | `createScreenWithApp()`, `closeToDateTime()` |
| `test/utils/asset_data.dart` | `buildTestAssetData()`, `buildTestMaterial()`, `buildTestCharacter()` |
| `test/utils/in_memory_pref_notifier.dart` | `InMemoryPrefNotifier` |
| `test/utils/stub_remote_config.dart` | `stubRemoteConfig()` |
| `test/utils/local_notification_mocks.dart` | `LocalNotification` の nice mock |
| `test/utils/db.dart` | **W0 で追加** `createTestDatabase()` ほか |
| `test/utils/provider_container.dart` | **W0 で追加** `createTestContainer()` |

### 完了条件（全ワークストリーム共通）

```bash
fvm flutter pub get
./scripts/build_runner.sh   # mockito / freezed の生成物を追加した場合のみ
fvm flutter analyze         # 警告ゼロ
fvm flutter test            # 全テスト green
./scripts/coverage.sh       # W0 完了後。担当領域のカバレッジが上がっていること
```

すべて通ったら作業ブランチを push し、統合ブランチを base とした PR を 1 本作成します（draft にしないこと）。
PR 作成後は CI（`Test & Lint`）が緑になることと、自動レビューの指摘に対応することまでが 1 ワークストリームの完了です。

### 報告事項（全ワークストリーム共通）

最終報告に必ず含めること。

1. 作成した PR の URL
2. 追加したテストファイルと、追加したテストケース数
3. `./scripts/coverage.sh` の値（W0 のベースラインとの差分）
4. **テスト不能と判断して飛ばした対象と、その理由**
5. 作業中に見つかったプロダクションコードの不具合・疑わしい挙動（あれば）

## 進捗チェックリスト

- [ ] W0: 計測基盤とテストヘルパの整備
- [ ] W1: `lib/utils/` 純粋ロジック
- [ ] W2: `lib/models/` のロジック
- [ ] W3: `lib/db/` 拡張と DB 周辺
- [ ] W4: ViewModel と Provider
- [ ] W5: 共通コンポーネントの widget テスト
- [ ] W6: テスト容易化リファクタ + `lib/core/` のテスト
- [ ] 統合ブランチから `main` 向けの PR を 1 本作成

## 後続タスク（今回は着手しない）

- `lib/providers/game_data_sync.dart`（470 行）— 最大の未テスト領域。W6 の Remote Config 注入リファクタが入って初めてテスト可能になる。
- `lib/pages/` のページ単位テストと `integration_test`。
- `lib/utils/teyvat_map.dart` の URL 組み立て部分の純粋関数化とテスト。
