import "dart:io";

import "package:flutter/services.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:path/path.dart" as path;
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/asset_cache.dart";
import "../core/asset_updater.dart";
import "../models/release_note.dart";
import "../utils/unwrap_yaml_value.dart";

part "versions.g.dart";

@Riverpod(keepAlive: true)
Future<PackageInfo> packageInfo(PackageInfoRef ref) async {
  return await PackageInfo.fromPlatform();
}

@riverpod
Future<AssetData> assetData(AssetDataRef ref) async {
  final dataCache = AssetDataCacheProvider((await getLocalAssetDirectory()).path);
  await dataCache.load();
  return dataCache.data!;
}

@riverpod
Future<List<ReleaseNote>> featuresReleaseNotesData(FeaturesReleaseNotesDataRef ref) async {
  final yaml = await rootBundle.loadString("assets/release_notes.yaml");
  final items = loadYamlUnwrapped<List>(yaml);
  return items.map((e) => ReleaseNote.fromJson(e)).toList();
}

@riverpod
Future<List<ReleaseNote>> assetsReleaseNotesData(AssetsReleaseNotesDataRef ref) async {
  final assetData = await ref.watch(assetDataProvider.future);

  final assetPath = path.join(assetData.assetDir, "asset-release-notes.json");
  final yaml = await File(assetPath).readAsString();
  final items = loadYamlUnwrapped<List>(yaml);
  return items.map((e) => ReleaseNote.fromJson(e)).toList();
}
