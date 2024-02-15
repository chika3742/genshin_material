import "package:package_info_plus/package_info_plus.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/asset_updater.dart";
import "../models/asset_release_version.dart";

part "versions.g.dart";

@Riverpod(keepAlive: true)
Future<PackageInfo> packageInfo(PackageInfoRef ref) async {
  return await PackageInfo.fromPlatform();
}

@Riverpod(keepAlive: true)
Future<AssetReleaseVersion?> assetVersionData(AssetVersionDataRef ref) async {
  return await AssetUpdater(await getLocalAssetDirectory()).getCurrentVersion();
}
