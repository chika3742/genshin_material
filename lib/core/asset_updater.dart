import "dart:async";
import "dart:convert";
import "dart:developer";
import "dart:io";

import "package:archive/archive_io.dart";
import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;
import "package:path/path.dart" as path;
import "package:path_provider/path_provider.dart";
import "package:uuid/uuid.dart";

import "../constants/urls.dart";
import "../models/asset_release_version.dart";
import "../models/common.dart";
import "asset_cache.dart";

class AssetUpdater {
  AssetUpdater(this.assetDir, {this.tempDir, http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();

  final String assetDir;
  final String? tempDir;
  final http.Client httpClient;

  void Function()? onProgress;
  int receivedBytes = 0;
  int totalBytes = 0;
  AssetUpdateProgressState? state;
  bool isUpdateChecked = false;
  AssetReleaseVersion? foundUpdate;

  bool get isUpdateAvailable => isUpdateChecked && foundUpdate != null;

  /// Checks for updates and sets [foundUpdate] if an update is available.
  /// When [force] is true, it will always sets [foundUpdate] to the latest release.
  Future<void> checkForUpdate({bool force = false}) async {
    final releases = await _fetchAssetRelease(kReleaseMode ? "prod" : "dev");
    final latestRelease = releases.reduce((value, element) => value.createdAt.isAfter(element.createdAt) ? value : element);

    if (force) {
      foundUpdate = latestRelease;
      isUpdateChecked = true;
      return;
    }

    AssetReleaseVersion? currentVersion;
    try {
      currentVersion = await getCurrentVersion();
    } catch (e) {
      log("Failed to get current version", error: e);
    }

    if (currentVersion == null || latestRelease.createdAt.isAfter(currentVersion.createdAt)) {
      // No local assets exist or a new version found
      foundUpdate = latestRelease;
    } else {
      // No update available
      foundUpdate = null;
    }

    isUpdateChecked = true;
  }

  Future<AssetReleaseVersion?> getCurrentVersion() async {
    final versionFile = File(path.join(assetDir, "version.json"));
    if (!await versionFile.exists()) {
      return null;
    }
    
    return AssetReleaseVersion.fromJson(const JsonDecoder().convert(await versionFile.readAsString()));
  }

  Future<void> installUpdate() async {
    assert(isUpdateChecked, "checkForUpdate() must be called successfully.");
    assert(foundUpdate != null, "No update found.");

    if (foundUpdate!.schemaVersion > dataSchemaVersion) {
      throw SchemaVersionMismatchException();
    }

    state = AssetUpdateProgressState.downloading;
    final file = await _downloadRelease(Uri.parse(foundUpdate!.distUrl));

    state = AssetUpdateProgressState.installing;
    onProgress?.call();

    final extractDir = path.join(FileSystemEntity.parentOf(assetDir), const Uuid().v4());
    await _unzipRelease(file.path, extractDir);

    await file.delete(); // delete temporary file

    // Check if installation is valid
    if (!await _checkInstallation(extractDir)) {
      // Installation failed, clean up
      await Directory(extractDir).delete(recursive: true);

      throw AssetUpdateCheckException();
    }

    // Installation successful, update symlink and clean up previous asset
    final prevAssetPath = await Link(assetDir).exists() ? await Link(assetDir).target() : null;
    await _updateSymlink(assetDir, extractDir);
    if (prevAssetPath != null && await Directory(prevAssetPath).exists()) {
      await Directory(prevAssetPath).delete(recursive: true);
    }

    log("Installation completed!");
  }

  Future<bool> _checkInstallation(String assetDir) async {
    try {
      await AssetDataCacheProvider(assetDir).load();

      return true;
    } catch (e, st) {
      log("Asset installation check failed", error: e, stackTrace: st);
      return false;
    }
  }

  Future<Link> _updateSymlink(String path_, String target) async {
    target = path.relative(target, from: path.dirname(path_));
    final link = Link(path_);
    if (await link.exists()) {
      return await link.update(target);
    } else {
      return await link.create(target, recursive: true);
    }
  }

  Future<List<AssetReleaseVersion>> _fetchAssetRelease(String channel) async {
    final uri = Uri.parse(assetReleasesUrl).replace(
      queryParameters: {
        "channel": channel,
      },
    );
    final response = await httpClient.get(uri);
    final json = const JsonDecoder().convert(response.body);
    if (json is! List) {
      throw "Invalid type of response";
    }

    return json.map((e) => AssetReleaseVersion.fromJson(e)).toList();
  }

  Future<File> _downloadRelease(Uri uri) async {
    if (tempDir == null) {
      throw "tempDir must be specified.";
    }

    debugPrint("Downloading update: ${uri.toString()}");

    receivedBytes = 0;

    final file = File(path.join(tempDir!, path.basename(uri.path)));
    await file.create(recursive: true);
    final fileSink = file.openWrite();

    final resp = await httpClient.send(http.Request("GET", uri));

    if (resp.statusCode.toString()[0] != "2") {
      throw "Error: Resource server responded with non-OK status code.";
    }

    totalBytes = resp.contentLength ?? 0;
    final completer = Completer<File>();
    resp.stream.listen((bytes) {
      fileSink.add(bytes);
      receivedBytes += bytes.length;
      onProgress?.call();
    }).onDone(() async {
      await fileSink.flush();
      await fileSink.close();
      completer.complete(file);
    });

    return completer.future;
  }

  Future<void> _unzipRelease(String zipPath, String destDir) async {
    final inputStream = InputFileStream(zipPath);
    final archive = ZipDecoder().decodeBuffer(inputStream);

    await extractArchiveToDiskAsync(archive, destDir, asyncWrite: true);
  }
}

Future<Directory> getLocalAssetDirectory() async {
  final applicationSupportDir = await getApplicationSupportDirectory();
  return Directory(
    path.join(
      applicationSupportDir.path, "assets", "current",
    ),
  );
}

enum AssetUpdateProgressState {
  downloading,
  installing,
}

class SchemaVersionMismatchException implements Exception {}
class AssetUpdateCheckException implements Exception {
  @override
  String toString() {
    return "Downloaded asset is not valid.";
  }
}
