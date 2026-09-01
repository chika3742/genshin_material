import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/providers/hoyolab_api.dart";

import "../../utils/hoyolab_game_server.dart";
import "../../utils/http_client.dart";
import "../../utils/http_client.mocks.dart";
import "../../utils/remote_config.dart";

const _secureStorageChannel =
    MethodChannel("plugins.it_nomads.com/flutter_secure_storage");

const _cookie = "ltoken_v2=token; ltuid_v2=123456;";

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Map<String, String> storage;
  late bool hoyolabLinkEnabled;

  setUp(() {
    storage = {"hoyolab_cookie": _cookie};
    hoyolabLinkEnabled = true;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_secureStorageChannel, (call) async {
      final key = call.arguments["key"] as String?;
      switch (call.method) {
        case "read":
          return storage[key];
        case "containsKey":
          return storage.containsKey(key);
      }
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_secureStorageChannel, null);
  });

  ProviderContainer createContainer({
    String? server = "os_asia",
    String? uid = "800000000",
  }) {
    return ProviderContainer.test(overrides: [
      overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, hoyolabLinkEnabled),
      overrideHttpClient(MockClient()),
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

    test("carries the remote flag", () {
      expect(createContainer().read(hoyolabPublicApiProvider).enabled, isTrue);

      hoyolabLinkEnabled = false;
      expect(createContainer().read(hoyolabPublicApiProvider).enabled, isFalse);
    });
  });

  group("hoyolabAccountApi", () {
    test("carries the stored cookie", () async {
      final api =
          await createContainer().read(hoyolabAccountApiProvider.future);

      expect(api.cookie, _cookie);
      expect(api.enabled, isTrue);
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

      final api =
          await createContainer().read(hoyolabAccountApiProvider.future);

      expect(api.enabled, isFalse);
    });
  });

  group("hoyolabGameApi", () {
    test("carries the cookie, the server and the uid", () async {
      final api = await createContainer().read(hoyolabGameApiProvider.future);

      expect(api.cookie, _cookie);
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

    test("throws when no server has been selected", () async {
      await expectLater(
        createContainer(server: null).read(hoyolabGameApiProvider.future),
        throwsA(isA<HoyolabServerNotSelectedException>()),
      );
    });

    test("throws when the uid is missing", () async {
      await expectLater(
        createContainer(uid: null).read(hoyolabGameApiProvider.future),
        throwsA(isA<HoyolabServerNotSelectedException>()),
      );
    });
  });
}
