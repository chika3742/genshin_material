import "dart:convert";
import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/constants/urls.dart";
import "package:genshin_material/core/asset_updater.dart";
import "package:genshin_material/core/errors.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:path/path.dart" as path;

import "../utils/stub_remote_config.dart";
import "../utils/stub_remote_config.mocks.dart";
import "asset_updater_test.mocks.dart";

@GenerateMocks([http.Client])
void main() {
  tearDown(() async {
    // clear temporary file
    try {
      await Directory(getCurrentAssetDirectoryPath(Directory.current.path))
          .delete(recursive: true);
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
      assetsDir: Directory.current.path,
      tempDir: Directory.systemTemp.path,
      httpClient: client,
      dataSchemaVersion: 0,
    );
    await updater.checkForUpdate();
    expect(updater.isUpdateAvailable, true);

    WidgetsFlutterBinding.ensureInitialized();

    // current version is same as latest
    await Directory(updater.currentAssetDir).create(recursive: true);
    await File(path.join(updater.currentAssetDir, "version.json"))
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
      return http.Response(jsonEncode(data), 200);
    });

    AssetUpdater updater = AssetUpdater(
      assetsDir: Directory.current.path,
      tempDir: Directory.systemTemp.path,
      httpClient: client,
      dataSchemaVersion: 0,
    );

    await updater.checkForUpdate(minimumSchemaVersion: 0);
    // app schema version is 0 and min schema version is 0, so it should update
    // to "test1" version which has schema version 0
    expect(updater.foundUpdate?.dataVersion, "test1");

    updater = AssetUpdater(
      assetsDir: Directory.current.path,
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

  group("minimum schema version", () {
    late MockClient client;
    late MockRemoteConfigRepository remoteConfig;

    setUp(() {
      client = MockClient();
      remoteConfig = MockRemoteConfigRepository();
      stubRemoteConfig(remoteConfig);

      when(client.get(Uri.parse("$assetReleasesUrl?channel=dev")))
          .thenAnswer((_) async {
        final data = [
          AssetReleaseVersion(
            createdAt: DateTime.parse("2024-01-01T00:00:00Z"),
            dataVersion: "test1",
            channel: AssetChannel.dev,
            distUrl: "",
            schemaVersion: 1,
          ),
        ];
        return http.Response(jsonEncode(data), 200);
      });
    });

    AssetUpdater createUpdater({bool injectRemoteConfig = true}) {
      return AssetUpdater(
        assetsDir: Directory.current.path,
        tempDir: Directory.systemTemp.path,
        httpClient: client,
        dataSchemaVersion: 1,
        remoteConfig: injectRemoteConfig ? remoteConfig : null,
      );
    }

    test("is read from the injected remote config", () async {
      when(remoteConfig.get(RemoteConfigKeys.minimumAssetSchemaVersion))
          .thenReturn(1);
      final updater = createUpdater();

      await updater.checkForUpdate();

      expect(updater.foundUpdate?.dataVersion, "test1");
      verify(remoteConfig.get(RemoteConfigKeys.minimumAssetSchemaVersion))
          .called(1);
    });

    test("skips the releases below the configured minimum", () async {
      when(remoteConfig.get(RemoteConfigKeys.minimumAssetSchemaVersion))
          .thenReturn(2);

      await expectLater(
        createUpdater().checkForUpdate(),
        throwsA(isA<NoCompatibleAssetException>()),
      );
    });

    test("is ignored when the update is forced", () async {
      when(remoteConfig.get(RemoteConfigKeys.minimumAssetSchemaVersion))
          .thenReturn(2);
      final updater = createUpdater();

      await updater.checkForUpdate(force: true);

      expect(updater.foundUpdate?.dataVersion, "test1");
    });

    test("prefers the explicit argument over the remote config", () async {
      when(remoteConfig.get(RemoteConfigKeys.minimumAssetSchemaVersion))
          .thenReturn(2);

      await createUpdater().checkForUpdate(minimumSchemaVersion: 0);

      verifyNever(remoteConfig.get(RemoteConfigKeys.minimumAssetSchemaVersion));
    });

    test("falls back to zero when no remote config is injected", () async {
      final updater = createUpdater(injectRemoteConfig: false);

      await updater.checkForUpdate();

      expect(updater.foundUpdate?.dataVersion, "test1");
      verifyNever(remoteConfig.get(RemoteConfigKeys.minimumAssetSchemaVersion));
    });
  });
}
