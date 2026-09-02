import "dart:convert";

import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/core/secure_storage.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/models/hoyolab_api.dart";
import "package:genshin_material/providers/hoyolab_game_server.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import "../utils/hoyolab_game_server.dart";
import "../utils/http_client.dart";
import "../utils/http_client.mocks.dart";
import "../utils/remote_config.dart";

const _secureStorageChannel =
    MethodChannel("plugins.it_nomads.com/flutter_secure_storage");

const _cookie = "ltoken_v2=token; ltuid_v2=123456;";

String _okBody(Object? data) =>
    jsonEncode({"retcode": 0, "message": "OK", "data": data});

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Map<String, String> storage;
  late bool hoyolabLinkEnabled;
  late MockClient client;

  setUp(() {
    storage = {"hoyolab_cookie": _cookie};
    hoyolabLinkEnabled = false;
    client = MockClient();

    // flutter_secure_storage has no plugin implementation in a unit test, so
    // its method channel is answered from an in-memory map.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_secureStorageChannel, (call) async {
      final key = call.arguments["key"] as String?;
      switch (call.method) {
        case "read":
          return storage[key];
        case "containsKey":
          return storage.containsKey(key);
        case "delete":
          storage.remove(key);
        case "write":
          storage[key!] = call.arguments["value"] as String;
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
    String? serverName = "Asia",
    String? userName = "tester",
    String? uid = "800000000",
  }) {
    return ProviderContainer.test(overrides: [
      overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, hoyolabLinkEnabled),
      // The APIs build on the mocked client, so nothing reaches the network.
      overrideHttpClient(client),
      ...overrideHoyolabGameServerPrefs(
        server: server,
        serverName: serverName,
        userName: userName,
        uid: uid,
      ),
      isHoyolabSignedInInitialProvider.overrideWithValue(true),
    ]);
  }

  group("build", () {
    test("reports a linked state when every credential is stored", () {
      hoyolabLinkEnabled = true;

      final credential = createContainer().read(hoyolabGameServerProvider);

      expect(
        credential,
        const HoyolabGameServerState.linked(
          server: "os_asia",
          serverName: "Asia",
          userName: "tester",
          uid: "800000000",
        ),
      );
    });

    test("reports an unlinked state when one of the credentials is missing",
        () {
      hoyolabLinkEnabled = true;

      final credential =
          createContainer(uid: null).read(hoyolabGameServerProvider);

      expect(credential, isA<UnlinkedHoyolabGameServer>());
    });

    test("exposes the uid through uidOrNull only when linked", () {
      hoyolabLinkEnabled = true;

      expect(
        createContainer().read(hoyolabGameServerProvider).uidOrNull,
        "800000000",
      );
      expect(
        createContainer(uid: null).read(hoyolabGameServerProvider).uidOrNull,
        isNull,
      );
    });
  });

  group("isLinkedWithHoyolab", () {
    test("is true when every credential is stored and the link is enabled", () {
      hoyolabLinkEnabled = true;

      expect(createContainer().read(isLinkedWithHoyolabProvider), isTrue);
    });

    test("is false when the link is disabled by remote config", () {
      hoyolabLinkEnabled = false;

      expect(createContainer().read(isLinkedWithHoyolabProvider), isFalse);
    });

    test("is false when one of the credentials is missing", () {
      hoyolabLinkEnabled = true;

      expect(
        createContainer(uid: null).read(isLinkedWithHoyolabProvider),
        isFalse,
      );
    });
  });

  group("link", () {
    const server = HyvServer(region: "os_euro", name: "Europe");
    const role = HyvUserGameRole(uid: "900000000", nickname: "traveler", level: 60);

    test("writes every credential key", () async {
      hoyolabLinkEnabled = true;
      final container = createContainer(
        server: null,
        serverName: null,
        userName: null,
        uid: null,
      );

      await container
          .read(hoyolabGameServerProvider.notifier)
          .link(server: server, role: role);

      expect(container.read(prefProvider(PrefKeys.hyvServer)), "os_euro");
      expect(container.read(prefProvider(PrefKeys.hyvServerName)), "Europe");
      expect(container.read(prefProvider(PrefKeys.hyvUserName)), "traveler");
      expect(container.read(prefProvider(PrefKeys.hyvUid)), "900000000");
    });

    test("moves the state to linked", () async {
      hoyolabLinkEnabled = true;
      final container = createContainer(
        server: null,
        serverName: null,
        userName: null,
        uid: null,
      );

      await container
          .read(hoyolabGameServerProvider.notifier)
          .link(server: server, role: role);

      expect(
        container.read(hoyolabGameServerProvider),
        const HoyolabGameServerState.linked(
          server: "os_euro",
          serverName: "Europe",
          userName: "traveler",
          uid: "900000000",
        ),
      );
    });

    // The whole point of routing the four keys through this notifier: writing
    // them one by one used to rebuild the listeners once per key, and exposed
    // an identity whose uid and server disagreed in between.
    test("notifies the listeners exactly once", () async {
      hoyolabLinkEnabled = true;
      final container = createContainer();
      final states = <HoyolabGameServerState>[];
      container.listen(
        hoyolabGameServerProvider,
        (_, next) => states.add(next),
        fireImmediately: false,
      );

      await container
          .read(hoyolabGameServerProvider.notifier)
          .link(server: server, role: role);

      expect(states, hasLength(1));
      expect(states.single, isA<LinkedHoyolabGameServer>());
    });
  });

  group("signIn", () {
    void stubVerifyLToken(String body) {
      when(client.post(any, headers: anyNamed("headers")))
          .thenAnswer((_) async => http.Response(body, 200));
    }

    test("stores the cookie once HoYoLAB accepted it", () async {
      hoyolabLinkEnabled = true;
      stubVerifyLToken(_okBody({"user_info": {"account_name": "tester"}}));
      storage.clear();
      final container = createContainer();

      await container.read(hoyolabGameServerProvider.notifier).signIn(_cookie);

      expect(await getHoyolabCookie(), _cookie);
    });

    test("rejects a cookie HoYoLAB refused, without storing it", () async {
      hoyolabLinkEnabled = true;
      stubVerifyLToken(jsonEncode({"retcode": -100, "message": "Not logged in"}));
      storage.clear();
      final container = createContainer();

      await expectLater(
        container.read(hoyolabGameServerProvider.notifier).signIn(_cookie),
        throwsA(isA<CredentialVerificationException>()),
      );
      expect(await hasHoyolabCookie(), isFalse);
    });

    test("refuses to sign in while the link is disabled", () async {
      hoyolabLinkEnabled = false;
      storage.clear();
      final container = createContainer();

      await expectLater(
        container.read(hoyolabGameServerProvider.notifier).signIn(_cookie),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
      expect(await hasHoyolabCookie(), isFalse);
      verifyZeroInteractions(client);
    });
  });

  group("clear", () {
    void stubLogout() {
      when(client.post(any, headers: anyNamed("headers"), body: anyNamed("body")))
          .thenAnswer((_) async => http.Response(_okBody(null), 200));
    }

    test("deletes the cookie", () async {
      hoyolabLinkEnabled = true;
      stubLogout();
      final container = createContainer();

      await container.read(hoyolabGameServerProvider.notifier).clear();

      expect(await getHoyolabCookie(), isNull);
      expect(await hasHoyolabCookie(), isFalse);
    });

    test("clears every stored credential", () async {
      hoyolabLinkEnabled = true;
      stubLogout();
      final container = createContainer();

      await container.read(hoyolabGameServerProvider.notifier).clear();

      expect(container.read(hoyolabGameServerProvider),
          isA<UnlinkedHoyolabGameServer>());
      expect(container.read(prefProvider(PrefKeys.hyvServer)), isNull);
      expect(container.read(prefProvider(PrefKeys.hyvServerName)), isNull);
      expect(container.read(prefProvider(PrefKeys.hyvUserName)), isNull);
      expect(container.read(prefProvider(PrefKeys.hyvUid)), isNull);
    });

    // Regression for the defect reported in the review of PR #485: unlinking
    // used to throw before any local cleanup when the remote flag was off, so a
    // user whose flag was turned off server-side kept their cookie and prefs
    // forever, with no way to unlink from the UI.
    test("unlinks even when the link is disabled by remote config", () async {
      hoyolabLinkEnabled = false;
      final container = createContainer();

      await container.read(hoyolabGameServerProvider.notifier).clear();

      expect(await hasHoyolabCookie(), isFalse);
      expect(container.read(hoyolabGameServerProvider),
          isA<UnlinkedHoyolabGameServer>());
      expect(container.read(isLinkedWithHoyolabProvider), isFalse);
    });

    test("skips the logout call when no cookie is stored", () async {
      hoyolabLinkEnabled = true;
      storage.clear();
      final container = createContainer();

      await container.read(hoyolabGameServerProvider.notifier).clear();

      verifyZeroInteractions(client);
      expect(container.read(hoyolabGameServerProvider),
          isA<UnlinkedHoyolabGameServer>());
    });
  });
}
