import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/providers/hoyolab_api.dart";

import "../../utils/hoyolab_api.dart";
import "../../utils/hoyolab_game_server.dart";
import "../../utils/http_client.dart";
import "../../utils/http_client.mocks.dart";
import "../../utils/remote_config.dart";
import "../../utils/secure_storage.dart";

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockClient client;

  final storage = setUpSecureStorageMock();

  setUp(() {
    client = MockClient();
    stubGet(client, successResponse);
  });

  ProviderContainer createContainer({
    bool linkEnabled = true,
    String? server = "os_asia",
    String? uid = "800000000",
  }) {
    return ProviderContainer.test(overrides: [
      overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, linkEnabled),
      overrideHttpClient(client),
      ...overrideHoyolabGameServerPrefs(server: server, uid: uid),
    ]);
  }

  group("hoyolabPublicApi", () {
    test("is available without any credential", () async {
      storage.clear();

      await expectLater(
        createContainer(server: null, uid: null).read(hoyolabPublicApiProvider.future),
        isNotNull,
      );
    });

    // Synchronous provider, so `read` wraps the cause. See `getErrorMessage`,
    // which unwraps it again on the way to the UI.
    test("throws when the link is disabled", () async {
      final container = createContainer(linkEnabled: false);

      await expectLater(
        container.read(hoyolabPublicApiProvider.future),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
    });
  });

  group("hoyolabAccountApi", () {
    test("carries the stored cookie", () async {
      final api =
          await createContainer().read(hoyolabAccountApiProvider.future);

      expect(api.cookie, fakeCookie);
    });

    test("throws when the user is not signed in", () async {
      storage.clear();

      await expectLater(
        createContainer().read(hoyolabAccountApiProvider.future),
        throwsA(isA<HoyolabNotSignedInException>()),
      );
    });

    // Unlinking still works: `clear()` wraps the `ref.read` in its own `try`.
    // See the regression test in `hoyolab_game_server_test.dart`.
    test("throws when the link is disabled", () async {
      await expectLater(
        createContainer(linkEnabled: false)
            .read(hoyolabAccountApiProvider.future),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
    });
  });

  group("hoyolabGameApi", () {
    test("carries the cookie, the server and the uid", () async {
      final api = await createContainer().read(hoyolabGameApiProvider.future);

      expect(api.cookie, fakeCookie);
      expect(api.region, "os_asia");
      expect(api.uid, "800000000");
    });

    test("throws when the user is not signed in", () async {
      storage.clear();

      await expectLater(
        createContainer().read(hoyolabGameApiProvider.future),
        throwsA(isA<HoyolabNotSignedInException>()),
      );
    });

    test("throws when any of the identity keys is missing", () async {
      await expectLater(
        createContainer(uid: null).read(hoyolabGameApiProvider.future),
        throwsA(isA<HoyolabServerNotSelectedException>()),
      );
    });

    test("throws when the link is disabled", () async {
      await expectLater(
        createContainer(linkEnabled: false).read(hoyolabGameApiProvider.future),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
    });
  });
}
