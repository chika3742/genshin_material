import "dart:convert";
import "dart:io";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_loader.dart";
import "package:genshin_material/core/data_parsing_exception.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:path/path.dart" as path;

void main() {
  late Directory assetDir;
  late AssetLoader loader;

  setUp(() {
    assetDir = Directory.systemTemp.createTempSync("asset_loader_test");
    loader = AssetLoader(assetDir: assetDir.path);
  });

  tearDown(() {
    assetDir.deleteSync(recursive: true);
  });

  void writeVersionFile(String contents) {
    File(path.join(assetDir.path, "version.json")).writeAsStringSync(contents);
  }

  void writeDataFile(String filename, String contents) {
    final file = File(path.join(assetDir.path, "data", filename));
    file.createSync(recursive: true);
    file.writeAsStringSync(contents);
  }

  group("getCurrentVersion", () {
    test("returns null when no version file is installed", () async {
      expect(await loader.getCurrentVersion(), isNull);
    });

    test("parses the installed version file", () async {
      writeVersionFile(jsonEncode({
        "createdAt": "2024-06-01T12:34:56.000Z",
        "dataVersion": "v1",
        "channel": "dev",
        "distUrl": "https://example.com/v1.zip",
        "schemaVersion": 3,
      }));

      final version = await loader.getCurrentVersion();

      expect(version, isNotNull);
      expect(version!.dataVersion, "v1");
      expect(version.channel, AssetChannel.dev);
      expect(version.distUrl, "https://example.com/v1.zip");
      expect(version.schemaVersion, 3);
      expect(version.createdAt.toUtc(), DateTime.utc(2024, 6, 1, 12, 34, 56));
    });

    test("throws when the version file holds broken JSON", () async {
      writeVersionFile("{ not json");

      expect(loader.getCurrentVersion(), throwsA(isA<FormatException>()));
    });
  });

  group("loadJson", () {
    test("reads a JSON object from the data directory", () async {
      writeDataFile("characters.json", jsonEncode({"amber": {"rarity": 4}}));

      final parsed = await loader.loadJson<Map<String, dynamic>>(
        "characters.json",
      );

      expect(parsed, {"amber": {"rarity": 4}});
    });

    test("reads a JSON array from the data directory", () async {
      writeDataFile("drop-rates.json", jsonEncode([1, 2, 3]));

      expect(await loader.loadJson<List<dynamic>>("drop-rates.json"), [1, 2, 3]);
    });

    test("throws DataParsingException when the root type does not match",
        () async {
      writeDataFile("characters.json", jsonEncode([1, 2, 3]));

      await expectLater(
        loader.loadJson<Map<String, dynamic>>("characters.json"),
        throwsA(
          isA<DataParsingException>()
              .having((e) => e.assetName, "assetName", "characters.json")
              .having(
                (e) => e.message,
                "message",
                "Root type is not Map<String, dynamic>.",
              ),
        ),
      );
    });

    test("names the offending file in the exception message", () async {
      writeDataFile("weapons.json", jsonEncode("a string"));

      await expectLater(
        loader.loadJson<Map<String, dynamic>>("weapons.json"),
        throwsA(
          isA<DataParsingException>().having(
            (e) => e.toString(),
            "toString",
            contains('Failed to parse asset "weapons.json".'),
          ),
        ),
      );
    });

    test("throws when the file does not exist", () async {
      expect(
        loader.loadJson<Map<String, dynamic>>("missing.json"),
        throwsA(isA<PathNotFoundException>()),
      );
    });

    test("reads the file from the data subdirectory, not the asset root",
        () async {
      File(path.join(assetDir.path, "characters.json"))
          .writeAsStringSync(jsonEncode({"wrong": true}));
      writeDataFile("characters.json", jsonEncode({"right": true}));

      expect(
        await loader.loadJson<Map<String, dynamic>>("characters.json"),
        {"right": true},
      );
    });
  });
}
