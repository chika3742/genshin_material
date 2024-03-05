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

@Riverpod(keepAlive: true)
Future<AssetDataCache> assetData(AssetDataRef ref) async {
  final dataCache = AssetDataCache.instance;
  await dataCache.init();
  await dataCache.fetchIntoCache();
  return dataCache;
}

@Riverpod(keepAlive: true)
Future<List<ReleaseNote>> featuresReleaseNotesData(FeaturesReleaseNotesDataRef ref) async {
  final yaml = await rootBundle.loadString("assets/release_notes.yaml");
  final items = loadYamlWithUnwrap<List>(yaml);
  return items.map((e) => ReleaseNote.fromJson(e)).toList();
}

@Riverpod(keepAlive: true)
Future<List<ReleaseNote>> assetsReleaseNotesData(AssetsReleaseNotesDataRef ref) async {
  final assetVersion = await ref.watch(assetDataProvider.future);
  if (assetVersion.version == null) {
    throw "Must be used wrapped in DataAssetScope.";
  }

  final assetPath = path.join((await getLocalAssetDirectory()).path, "asset-release-notes.yaml");
  final yaml = await File(assetPath).readAsString();
  final items = loadYamlWithUnwrap<List>(yaml);
  return items.map((e) => ReleaseNote.fromJson(e)).toList();
}
