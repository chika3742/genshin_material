import "dart:async";
import "dart:convert";
import "dart:io";

import "package:archive/archive_io.dart";
import "package:flutter/foundation.dart";
import "package:genshin_material/constants/directory_name.dart";
import "package:genshin_material/constants/urls.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:http/http.dart" as http;
import "package:path/path.dart" as path;
import "package:path_provider/path_provider.dart";

class AssetUpdater {
  AssetUpdater(this.assetDir, {this.tempDir, http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();

  final Directory assetDir;
  final Directory? tempDir;
  final http.Client httpClient;
  void Function()? onProgress;
  int receivedBytes = 0;
  int totalBytes = 0;

  /// If new version found, returns the latest [AssetReleaseVersion].
  /// If not, `null` will be returned.
  Future<AssetReleaseVersion?> checkForUpdates() async {
    final latestRelease = await _fetchAssetRelease(kReleaseMode ? "prod" : "staging");
    if (latestRelease == null) {
      throw "No latest release.";
    }

    final currentVersion = await getCurrentVersion();

    if (currentVersion == null || latestRelease.releasedAt.isAfter(currentVersion.releasedAt)) {
      // No local assets exist or a new version found
      return latestRelease;
    } else {
      // No updates available
      return null;
    }
  }

  Future<AssetReleaseVersion?> getCurrentVersion() async {
    final versionFile = File(path.join(assetDir.path, "version.json"));
    if (!await versionFile.exists()) {
      return null;
    }
    
    return AssetReleaseVersion.fromJson(const JsonDecoder().convert(await versionFile.readAsString()));
  }

  Future<void> installRelease(AssetReleaseVersion release) async {
    final file = await _downloadRelease(Uri.parse(release.distUrl));
    await _unzipRelease(file.path);
  }

  Future<AssetReleaseVersion?> _fetchAssetRelease(String channel) async {
    final uri = Uri.parse(assetReleasesUrl);
    final response = await httpClient.get(uri);
    final json = const JsonDecoder().convert(response.body);
    if (json is! Map) {
      throw "Invalid type of response";
    }

    final release = json["channels"]?[channel];
    if (release == null) {
      return null;
    }
    return AssetReleaseVersion.fromJson(release);
  }

  Future<File> _downloadRelease(Uri uri) async {
    if (tempDir == null) {
      throw "tempDir must be specified.";
    }

    receivedBytes = 0;

    final file = File(path.join(tempDir!.path, appTempDirName, path.basename(uri.path)));
    final fileSink = file.openWrite();

    final resp = await httpClient.send(http.Request("GET", uri));

    totalBytes = resp.contentLength ?? 0;
    final completer = Completer<File>();
    resp.stream.listen((bytes) {
      fileSink.add(bytes);
      receivedBytes += bytes.length;
      onProgress?.call();
    }).onDone(() {
      fileSink.close();
      completer.complete(file);
    });

    return completer.future;
  }

  Future<void> _unzipRelease(String zipPath) async {
    final inputStream = InputFileStream(zipPath);
    final archive = ZipDecoder().decodeBuffer(inputStream);

    await extractArchiveToDiskAsync(archive, assetDir.path);
  }

  Future<void> deleteDownloadTemp() async {
    if (tempDir == null) {
      throw "tempDir must be specified.";
    }

    await tempDir!.delete(recursive: true);
  }
}

Future<Directory> getLocalAssetDirectory() async {
  final applicationSupportDir = await getApplicationSupportDirectory();
  return Directory(
    path.join(
      applicationSupportDir.path, "genshin_material_assets", "current",
    ),
  );
}

// LocalAssetDirectoryとcurrent-release.yamlの存在チェック
//   存在しない ->
//     最新版をダウンロード
//   存在する ->
//
