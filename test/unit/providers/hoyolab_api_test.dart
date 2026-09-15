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

  late bool hoyolabLinkEnabled;
  late MockClient client;

  final storage = setUpSecureStorageMock();

  setUp(() {
    hoyolabLinkEnabled = true;
    client = MockClient();
    stubGet(client, successResponse);
  });

  ProviderContainer createContainer({
    String? server = "os_asia",
    String? uid = "800000000",
  }) {
    return ProviderContainer.test(overrides: [
      overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, hoyolabLinkEnabled),
      overrideHttpClient(client),
      ...overrideHoyolabGameServerPrefs(server: server, uid: uid),
    ]);
  }

  group("hoyolabPublicApi", () {
    test("is available without any credential", () {
      storage.clear();

      expect(
        createContainer(server: null, uid: null).read(hoyolabPublicApiProvider),
        isNotNull,
      );
    });

    test("carries the remote flag", () async {
      await expectLater(
        createContainer().read(hoyolabPublicApiProvider).lookupServers(),
        completes,
      );

      hoyolabLinkEnabled = false;
      await expectLater(
        createContainer().read(hoyolabPublicApiProvider).lookupServers(),
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

    // The flag belongs on the instance, not on its availability: the API is
    // still handed out so that the call site decides what a disabled link
    // means (unlinking, for one, has to keep working).
    test("is still built when the link is disabled", () async {
      hoyolabLinkEnabled = false;

      // Reading the provider must not throw; the flag surfaces only once a
      // method is called.
      final api =
          await createContainer().read(hoyolabAccountApiProvider.future);

      await expectLater(
        api.logout(),
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
  });
}
