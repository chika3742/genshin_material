import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/secure_storage.dart";
import "package:genshin_material/data/repositories/remote_config_repository.dart";
import "package:genshin_material/providers/hoyolab_credential.dart";

import "../utils/in_memory_pref_notifier.dart";
import "../utils/stub_remote_config.dart";
import "../utils/stub_remote_config.mocks.dart";

const _secureStorageChannel =
    MethodChannel("plugins.it_nomads.com/flutter_secure_storage");

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Map<String, String> storage;
  late MockRemoteConfigRepository remoteConfig;

  setUp(() {
    storage = {"hoyolab_cookie": "ltoken_v2=token; ltuid_v2=123456;"};
    remoteConfig = MockRemoteConfigRepository();

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

  ProviderContainer createContainer() {
    return ProviderContainer.test(overrides: [
      remoteConfigProvider.overrideWithValue(remoteConfig),
      overridePref(PrefKeys.hyvServer, "os_asia"),
      overridePref(PrefKeys.hyvServerName, "Asia"),
      overridePref(PrefKeys.hyvUserName, "tester"),
      overridePref(PrefKeys.hyvUid, "800000000"),
      isHoyolabSignedInInitialProvider.overrideWithValue(true),
    ]);
  }

  group("isLinkedWithHoyolab", () {
    test("is true when every credential is stored and the link is enabled", () {
      stubRemoteConfig(remoteConfig, hoyolabLinkEnabled: true);

      expect(createContainer().read(isLinkedWithHoyolabProvider), isTrue);
    });

    test("is false when the link is disabled by remote config", () {
      stubRemoteConfig(remoteConfig);

      expect(createContainer().read(isLinkedWithHoyolabProvider), isFalse);
    });

    test("is false when one of the credentials is missing", () {
      stubRemoteConfig(remoteConfig, hoyolabLinkEnabled: true);
      final container = ProviderContainer.test(overrides: [
        remoteConfigProvider.overrideWithValue(remoteConfig),
        overridePref(PrefKeys.hyvServer, "os_asia"),
        overridePref(PrefKeys.hyvServerName, "Asia"),
        overridePref(PrefKeys.hyvUserName, "tester"),
        overridePref(PrefKeys.hyvUid, null),
      ]);

      expect(container.read(isLinkedWithHoyolabProvider), isFalse);
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
      stubRemoteConfig(remoteConfig);
      final container = createContainer();
      final notifier = container.read(hoyolabCredentialProvider.notifier);

      await expectLater(notifier.clear(), throwsStateError);

      expect(
        await getHoyolabCookie(),
        isNotNull,
        reason: "the cookie is never deleted because the constructor threw",
      );
      expect(await hasHoyolabCookie(), isTrue);
    });

    test("leaves the stored credentials behind when the link is disabled",
        () async {
      stubRemoteConfig(remoteConfig);
      final container = createContainer();
      final notifier = container.read(hoyolabCredentialProvider.notifier);

      await expectLater(notifier.clear(), throwsStateError);

      final credential = container.read(hoyolabCredentialProvider);
      expect(credential.hyvServer, "os_asia");
      expect(credential.hyvServerName, "Asia");
      expect(credential.hyvUserName, "tester");
      expect(credential.hyvUid, "800000000");
    });

    test("cannot be undone through the UI, which reads it as unlinked",
        () async {
      stubRemoteConfig(remoteConfig);
      final container = createContainer();

      await expectLater(
        container.read(hoyolabCredentialProvider.notifier).clear(),
        throwsStateError,
      );

      // The credentials are still stored, yet the app reports "not linked", so
      // the unlink button the user would need is not shown.
      expect(container.read(isLinkedWithHoyolabProvider), isFalse);
      expect(container.read(hoyolabCredentialProvider).hyvUid, isNotNull);
    });
  });
}
