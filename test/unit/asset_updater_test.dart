import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/constants/urls.dart";
import "package:genshin_material/core/asset_updater.dart";
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
      Directory.current.path,
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
}
