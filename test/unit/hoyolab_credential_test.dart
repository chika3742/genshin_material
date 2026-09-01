import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/core/secure_storage.dart";
import "package:genshin_material/data/services/remote_config_service.dart";
import "package:genshin_material/models/hoyolab_api.dart";
import "package:genshin_material/providers/hoyolab_credential.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:mockito/mockito.dart";

import "../utils/hoyolab_credential.dart";
import "../utils/http_client.dart";
import "../utils/http_client.mocks.dart";
import "../utils/remote_config.dart";

const _secureStorageChannel =
    MethodChannel("plugins.it_nomads.com/flutter_secure_storage");

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Map<String, String> storage;
  late bool hoyolabLinkEnabled;

  setUp(() {
    storage = {"hoyolab_cookie": "ltoken_v2=token; ltuid_v2=123456;"};
    hoyolabLinkEnabled = false;

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

  /// `clear()` still hands a `RemoteConfigService` to `HoyolabApi`, so the flag
  /// has to be answered on the service as well as on the value provider.
  List<Override> linkEnabled(bool enabled) {
    final service = createRemoteConfigServiceMock();
    when(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
        .thenReturn(enabled);
    return [
      overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, enabled),
      remoteConfigServiceProvider.overrideWithValue(service),
    ];
  }

  ProviderContainer createContainer({
    String? server = "os_asia",
    String? serverName = "Asia",
    String? userName = "tester",
    String? uid = "800000000",
  }) {
    return ProviderContainer.test(overrides: [
      ...linkEnabled(hoyolabLinkEnabled),
      overrideHttpClient(MockClient()),
      ...overrideHoyolabCredentialPrefs(
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

      final credential = createContainer().read(hoyolabCredentialProvider);

      expect(
        credential,
        const HoyolabCredentialState.linked(
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
          createContainer(uid: null).read(hoyolabCredentialProvider);

      expect(credential, isA<UnlinkedHoyolabCredential>());
    });

    test("exposes the uid through uidOrNull only when linked", () {
      hoyolabLinkEnabled = true;

      expect(
        createContainer().read(hoyolabCredentialProvider).uidOrNull,
        "800000000",
      );
      expect(
        createContainer(uid: null).read(hoyolabCredentialProvider).uidOrNull,
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
          .read(hoyolabCredentialProvider.notifier)
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
          .read(hoyolabCredentialProvider.notifier)
          .link(server: server, role: role);

      expect(
        container.read(hoyolabCredentialProvider),
        const HoyolabCredentialState.linked(
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
      final states = <HoyolabCredentialState>[];
      container.listen(
        hoyolabCredentialProvider,
        (_, next) => states.add(next),
        fireImmediately: false,
      );

      await container
          .read(hoyolabCredentialProvider.notifier)
          .link(server: server, role: role);

      expect(states, hasLength(1));
      expect(states.single, isA<LinkedHoyolabCredential>());
    });
  });

  group("clear", () {
    // Pins the behaviour reported in the review of PR #485. `clear()` builds a
    // `HoyolabApi` to call `logout()`, and that constructor throws when the
    // remote flag is off. The throw happens before any local cleanup, so a user
    // whose flag is turned off server-side while linked keeps their cookie and
    // prefs forever, with no way to unlink from the UI.
    test("leaves the cookie behind when the link is disabled by remote config",
        () async {
      hoyolabLinkEnabled = false;
      final container = createContainer();

      await expectLater(
        container.read(hoyolabCredentialProvider.notifier).clear(),
        throwsStateError,
      );

      expect(
        await getHoyolabCookie(),
        isNotNull,
        reason: "the cookie is never deleted because the constructor threw",
      );
      expect(await hasHoyolabCookie(), isTrue);
    });

    test("cannot be undone through the UI, which reads it as unlinked",
        () async {
      hoyolabLinkEnabled = false;
      final container = createContainer();

      await expectLater(
        container.read(hoyolabCredentialProvider.notifier).clear(),
        throwsStateError,
      );

      // The credentials are still stored, yet the app reports "not linked", so
      // the unlink button the user would need is not shown.
      expect(container.read(isLinkedWithHoyolabProvider), isFalse);
      expect(container.read(hoyolabCredentialProvider),
          isA<LinkedHoyolabCredential>());
    });
  });
}
