# 原神素材ノート

[English](./README.md) | 日本語

原神の育成素材ブックマーク＆データベースアプリです。iOS / Android で利用できます。

<!-- ストアバッジ -->

<p>
  <img src="./readme_assets/screenshots/1.png" width="200" alt="スクリーンショット 1">
  <img src="./readme_assets/screenshots/2.png" width="200" alt="スクリーンショット 2">
  <img src="./readme_assets/screenshots/3.png" width="200" alt="スクリーンショット 3">
  <img src="./readme_assets/screenshots/4.png" width="200" alt="スクリーンショット 4">
</p>

## 機能

- **ブックマーク** — キャラクター・武器の育成に必要な素材や、聖遺物、調度品をブックマークできます。用途別・素材別に一覧できます。
- **データベース** — キャラクター、武器、素材、聖遺物、調度品セットの情報を閲覧できます。
- **日替わり素材** — 今日入手できる天賦素材・武器素材を確認できます。ブックマークした素材が入手できる日に通知を受け取ることもできます。
- **ツール** — 樹脂回復時刻計算機、HoYoLAB のログインボーナス。
- **HoYoLAB 連携** — キャラクター・武器のレベル、バッグ内のアイテム数、樹脂を HoYoLAB から同期できます（グローバル版のみ）。

## 免責事項

本アプリは非公式のファンメイドアプリであり、HoYoverse とは一切関係ありません。
原神および関連する名称・画像・ゲームデータの権利は HoYoverse に帰属します。

## ライセンス

ソースコードは [MIT License](./LICENSE) で公開しています。
アプリ内で表示されるゲームデータおよび画像は、このライセンスの対象外です。

## 開発

### 必要なもの

- [FVM](https://fvm.app)（Flutter のバージョンは `.fvmrc` で固定しています）

### ビルドの前に

ビルドするには、**自分の Firebase プロジェクト**を設定する必要があります。まず [Firebase Console](https://console.firebase.google.com/) で Firebase プロジェクトを作成してください。

1. Firebase CLI をインストールします（[公式ガイド](https://firebase.google.com/docs/cli?hl=ja#setup_update_cli)を参照）。
2. `firebase login` を実行して Firebase にログインします。
3. FlutterFire CLI をインストールします。
    ```shell
    $ dart pub global activate flutterfire_cli
    ```
4. `flutterfire configure` を実行し、表示される指示に従ってこのプロジェクトに Firebase を設定します。

### ビルドと実行

FVM を使って実行します。

```shell
$ fvm flutter run
```

コマンド、アーキテクチャ、コーディング規約については [CLAUDE.md](./CLAUDE.md) を参照してください。

### 生成ファイルについて

このプロジェクトでは、Freezed や Riverpod などが生成するファイルを元のファイルと同じディレクトリに置いています。
ファイル一覧を見やすくするため、**File Nesting** を設定してください。

#### IntelliJ IDEA

`.dart` の親ファイルのサフィックスに `.freezed.dart` と `.g.dart` を追加します。

![設定画面 1](./readme_assets/file_nesting_1.png)
![設定画面 2](./readme_assets/file_nesting_2.png)
