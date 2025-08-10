import "dart:convert";
import "dart:io";

import "package:path/path.dart" as path;

import "../models/asset_release_version.dart";
import "data_parsing_exception.dart";

class AssetLoader {
  const AssetLoader({
    required this.assetDir,
  });

  final String assetDir;

  /// Returns the current asset version from the version file. Returns null if
  /// no version installed.
  Future<AssetReleaseVersion?> getCurrentVersion() async {
    final versionFile = File(path.join(assetDir, "version.json"));
    if (!await versionFile.exists()) {
      return null;
    }

    return AssetReleaseVersion.fromJson(jsonDecode(await versionFile.readAsString()));
  }

  /// Reads data asset file and parses JSON.
  Future<RootT> loadJson<RootT>(String filename) async {
    final filePath = path.join(assetDir, "data/$filename");
    final jsonString = await File(filePath).readAsString();
    final parsed = jsonDecode(jsonString);
    // assert root type
    if (parsed is! RootT) {
      throw DataParsingException(
        assetName: filename,
        message: "Root type is not $RootT.",
      );
    }
    return parsed;
  }
}
