import "dart:convert";
import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/constants/urls.dart";
import "package:genshin_material/core/asset_updater.dart";
import "package:genshin_material/core/errors.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "asset_updater_test.mocks.dart";

@GenerateMocks([http.Client])
void main() {
  tearDown(() async {
    // clear temporary file
    try {
      await File("${Directory.current.path}/version.json").delete();
    } on PathNotFoundException {
      // File does not exist
    }
  });

  test("Check for updates", () async {
    final client = MockClient();

    // current version is null
    when(client.get(Uri.parse("$assetReleasesUrl?channel=dev"))).thenAnswer((_) async {
      return http.Response('[{"createdAt": "2024-01-01T00:00:00Z", "dataVersion": "test", "channel": "dev", "distUrl": "", "schemaVersion": 0}]', 200);
    });
    final updater = AssetUpdater(
      assetDir: Directory.current.path,
      tempDir: Directory.systemTemp.path,
      httpClient: client,
    );
    await updater.checkForUpdate();
    expect(updater.isUpdateAvailable, true);

    WidgetsFlutterBinding.ensureInitialized();

    // current version is same as latest
    await File("${Directory.current.path}/version.json")
        .writeAsString('{"createdAt": "2024-01-01T00:00:00Z", "dataVersion": "test", "channel": "dev", "distUrl": "", "schemaVersion": 0}');
    await updater.checkForUpdate();
    expect(updater.isUpdateAvailable, false);

    // latest version is newer than current
    when(client.get(Uri.parse("$assetReleasesUrl?channel=dev"))).thenAnswer((_) async {
      return http.Response('[{"createdAt": "2024-06-01T00:00:00Z", "dataVersion": "test", "channel": "dev", "distUrl": "", "schemaVersion": 0}]', 200);
    });
    await updater.checkForUpdate();
    expect(updater.isUpdateAvailable, true);
  });

  test("Forced update timing adjustment", () async {
    final client = MockClient();

    when(client.get(Uri.parse("$assetReleasesUrl?channel=dev"))).thenAnswer((_) async {
      final data = [
        AssetReleaseVersion(
          createdAt: DateTime.parse("2024-01-01T00:00:00Z"),
          dataVersion: "test1",
          channel: AssetChannel.dev,
          distUrl: "",
          schemaVersion: 0,
        ),
        AssetReleaseVersion(
          createdAt: DateTime.parse("2024-01-02T00:00:00Z"),
          dataVersion: "test2",
          channel: AssetChannel.dev,
          distUrl: "",
          schemaVersion: 1,
        ),
      ];
      return http.Response(JsonCodec().encode(data), 200);
    });

    AssetUpdater updater = AssetUpdater(
      assetDir: Directory.current.path,
      tempDir: Directory.systemTemp.path,
      httpClient: client,
      dataSchemaVersion: 0,
    );

    await updater.checkForUpdate(minimumSchemaVersion: 0);
    // app schema version is 0 and min schema version is 0, so it should update
    // to "test1" version which has schema version 0
    expect(updater.foundUpdate?.dataVersion, "test1");

    updater = AssetUpdater(
      assetDir: Directory.current.path,
      tempDir: Directory.systemTemp.path,
      httpClient: client,
      dataSchemaVersion: 1,
    );

    await updater.checkForUpdate(minimumSchemaVersion: 0);
    // app schema version is 1 and min schema version is 0, so it should update
    // to "test2" version which has schema version 1
    expect(updater.foundUpdate?.dataVersion, "test2");

    Object? error;
    try {
      await updater.checkForUpdate(minimumSchemaVersion: 2);
    } catch (e) {
      error = e;
    }
    // app schema version is 1 and min schema version is 2, so it should throw
    // NoCompatibleAssetException
    expect(error is NoCompatibleAssetException, true);
  });
}
