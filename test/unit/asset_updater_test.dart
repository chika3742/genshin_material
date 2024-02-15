import "dart:io";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/constants/urls.dart";
import "package:genshin_material/core/asset_updater.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "asset_updater_test.mocks.dart";

@GenerateMocks([http.Client])
void main() {
  test("Check for updates", () async {
    final client = MockClient();

    when(client.get(Uri.parse(assetReleasesUrl))).thenAnswer((_) async {
      return http.Response('{"channels": {"staging": {"releasedAt": "2024-01-01T00:00:00Z", "dataVersion": "test", "channel": "staging", "distUrl": ""}}}', 200);
    });

    expect(await AssetUpdater(
      Directory.current,
      tempDir: Directory.systemTemp,
      httpClient: client,
    ).checkForUpdates() != null, true,);
  });
}