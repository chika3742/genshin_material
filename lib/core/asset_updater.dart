import "dart:async";
import "dart:convert";
import "dart:io";

import "package:archive/archive_io.dart";
import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;
import "package:path/path.dart" as path;
import "package:path_provider/path_provider.dart";

import "../constants/urls.dart";
import "../models/asset_release_version.dart";

class AssetUpdater {
  AssetUpdater(this.assetDir, {this.tempDir, http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();

  final Directory assetDir;
  final Directory? tempDir;
  final http.Client httpClient;
  void Function()? onProgress;
  int receivedBytes = 0;
  int totalBytes = 0;
  AssetUpdateProgressState? state;

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
    state = AssetUpdateProgressState.downloading;
    final file = await _downloadRelease(Uri.parse(release.distUrl));

    state = AssetUpdateProgressState.installing;
    onProgress?.call();
    await _unzipRelease(file.path);
    await file.delete(); // delete temporary file
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

    debugPrint("Downloading update: ${uri.toString()}");

    receivedBytes = 0;

    final file = File(path.join(tempDir!.path, path.basename(uri.path)));
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

  Future<void> _unzipRelease(String zipPath) async {
    final inputStream = InputFileStream(zipPath);
    final archive = ZipDecoder().decodeBuffer(inputStream);

    await extractArchiveToDiskAsync(archive, assetDir.path, asyncWrite: true);
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
