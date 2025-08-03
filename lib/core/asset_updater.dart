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
import "../main.dart";
import "../models/asset_release_version.dart";
import "../models/common.dart";
import "asset_cache.dart";

class AssetUpdater {
  AssetUpdater({required this.assetDir, this.tempDir, http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();

  static const allowedResourceOrigins = ["https://matnote-assets.chikach.net"];

  final String assetDir;
  final String? tempDir;
  final http.Client httpClient;

  void Function()? onProgress;
  int receivedBytes = 0;
  int totalBytes = 0;
  bool isUpdateChecked = false;
  AssetReleaseVersion? foundUpdate;
  File? downloadFile;

  bool get isUpdateAvailable => isUpdateChecked && foundUpdate != null;

  /// Checks for updates and sets [foundUpdate] if an update is available.
  /// When [force] is true, it will always sets [foundUpdate] to the latest release.
  Future<void> checkForUpdate({bool force = false}) async {
    final releases = await _fetchAssetRelease(assetChannel);
    final latestRelease = releases.reduce((value, element) =>
    value.createdAt.isAfter(element.createdAt) ? value : element,);

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

    if (currentVersion == null ||
        latestRelease.createdAt.isAfter(currentVersion.createdAt)) {
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

    return AssetReleaseVersion.fromJson(
        const JsonDecoder().convert(await versionFile.readAsString()),);
  }

  Future<void> downloadUpdate() async {
    if (!isUpdateChecked) {
      throw "checkForUpdate() must be called successfully.";
    }
    if (foundUpdate == null) {
      throw "No update found.";
    }
    if (foundUpdate!.schemaVersion != dataSchemaVersion) {
      throw SchemaVersionMismatchException(remote: foundUpdate!.schemaVersion, runtime: dataSchemaVersion);
    }

    final downloadUri = Uri.parse(foundUpdate!.distUrl);
    if (!allowedResourceOrigins.contains(downloadUri.origin)) {
      throw "Resource origin is not allowed.";
    }

    downloadFile = File(path.join(tempDir!, path.basename(downloadUri.path)));
    await downloadFile!.create(recursive: true);
    try {
      await _downloadRelease(downloadUri, downloadFile!);
    } catch (e, st) {
      log("Failed to download release", error: e, stackTrace: st);
      await _cleanupPaths([downloadFile!.path]);
      downloadFile = null;
      rethrow;
    }
  }

  Future<void> installUpdate() async {
    if (downloadFile == null) {
      throw "downloadUpdate() must be called successfully.";
    }

    final extractDir = path.join(
        FileSystemEntity.parentOf(assetDir), const Uuid().v4(),);
    try {
      await _unzipRelease(downloadFile!.path, extractDir);
    } catch (e) {
      log("Failed to extract release", error: e);
      await _cleanupPaths([extractDir, downloadFile!.path]);
      rethrow;
    }

    await downloadFile!.delete(); // delete temporary file
    downloadFile = null;

    // Check if installation is valid
    if (!await _checkInstallation(extractDir)) {
      // Installation failed, clean up
      await _cleanupPaths([extractDir]);
      throw AssetUpdateCheckException();
    }

    // Installation successful, update symlink and clean up previous asset
    final pathCtx = path.Context(current: FileSystemEntity.parentOf(assetDir));
    final prevAssetPath = await Link(assetDir).exists() ? pathCtx.absolute(await Link(assetDir).target()) : null;
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

  Future<File> _downloadRelease(Uri uri, File file) async {
    if (tempDir == null) {
      throw "tempDir must be specified.";
    }

    debugPrint("Downloading update: ${uri.toString()}");

    receivedBytes = 0;

    final resp = await httpClient.send(http.Request("GET", uri));

    if (resp.statusCode.toString()[0] != "2") {
      throw "Error: Resource server responded with non-OK status code.";
    }

    final fileSink = file.openWrite();

    totalBytes = resp.contentLength ?? 0;
    final completer = Completer<File>();
    resp.stream.listen((bytes) {
      fileSink.add(bytes);
      receivedBytes += bytes.length;
      onProgress?.call();
    })
      ..onDone(() async {
        await fileSink.flush();
        await fileSink.close();
        completer.complete(file);
      })
      ..onError((e, st) async {
        await fileSink.close();
        completer.completeError(e, st);
      });

    return completer.future;
  }

  Future<void> _unzipRelease(String zipPath, String destDir) async {
    final inputStream = InputFileStream(zipPath);
    final archive = ZipDecoder().decodeStream(inputStream);

    await extractArchiveToDisk(archive, destDir);
  }

  Future<void> _cleanupPaths(List<String> paths) async {
    for (final p in paths) {
      try {
        final entity = await FileSystemEntity.type(p);
        if (entity == FileSystemEntityType.notFound) {
          continue;
        }

        if (entity == FileSystemEntityType.directory) {
          await Directory(p).delete(recursive: true);
        } else {
          await File(p).delete();
        }
      } catch (e) {
        log("Failed to delete $p", error: e);
      }
    }
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
  /// No process is running.
  none,

  /// Checking for updates.
  checkingForUpdate,

  /// No update available after explicit check.
  noUpdateAvailable,

  /// Downloading update.
  downloading,

  /// Installing update.
  installing,

  /// Successfully updated.
  updated,

  /// Error occurred while checking for updates.
  errorWhileChecking,

  /// Error occurred while downloading update.
  errorWhileDownloading,

  /// Error occurred while installing update.
  errorWhileInstalling,
  ;

  bool get isUpdating =>
      this == AssetUpdateProgressState.downloading ||
      this == AssetUpdateProgressState.installing;

  bool get isChecking => this == AssetUpdateProgressState.checkingForUpdate;

  bool get hasError =>
      this == AssetUpdateProgressState.errorWhileChecking ||
      this == AssetUpdateProgressState.errorWhileDownloading ||
      this == AssetUpdateProgressState.errorWhileInstalling;

  bool get isBusy => isUpdating || isChecking;
}

class SchemaVersionMismatchException implements Exception {
  final int remote;
  final int runtime;

  SchemaVersionMismatchException({required this.remote, required this.runtime});

  @override
  String toString() {
    return "Schema version mismatch: $remote (remote) vs $runtime (runtime)";
  }
}
class AssetUpdateCheckException implements Exception {
  @override
  String toString() {
    return "Downloaded asset is not valid.";
  }
}
