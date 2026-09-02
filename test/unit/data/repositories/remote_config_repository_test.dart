import "dart:async";

import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/repositories/remote_config_repository.dart";
import "package:genshin_material/data/services/remote_config_service.dart";
import "package:mockito/mockito.dart";

import "../../../utils/remote_config.mocks.dart";

void main() {
  late MockRemoteConfigService service;
  late StreamController<RemoteConfigUpdate> updates;

  setUp(() {
    service = MockRemoteConfigService();
    updates = StreamController<RemoteConfigUpdate>.broadcast();

    // The service is only a pass-through here; what matters is which providers
    // re-read it after an update.
    when(service.listenConfigUpdate(any)).thenAnswer((invocation) {
      final onActivated = invocation.positionalArguments.single as void Function();
      return updates.stream.listen((_) => onActivated());
    });
  });

  tearDown(() async {
    await updates.close();
  });

  ProviderContainer createContainer() {
    return ProviderContainer.test(overrides: [
      remoteConfigServiceProvider.overrideWithValue(service),
    ]);
  }

  group("remoteConfigRepository", () {
    test("returns the value of the key with the type the key declares", () {
      when(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
          .thenReturn(true);
      when(service.get<String>(RemoteConfigKeys.bannerText)).thenReturn("Hi");
      when(service.get<int>(RemoteConfigKeys.minimumAssetSchemaVersion))
          .thenReturn(3);

      final container = createContainer();

      expect(
        container.read(
          remoteConfigRepositoryProvider(RemoteConfigKeys.hoyolabLinkEnabled),
        ),
        isTrue,
      );
      expect(
        container.read(
          remoteConfigRepositoryProvider(RemoteConfigKeys.bannerText),
        ),
        "Hi",
      );
      expect(
        container.read(
          remoteConfigRepositoryProvider(
            RemoteConfigKeys.minimumAssetSchemaVersion,
          ),
        ),
        3,
      );
    });

    test("reads the service once and keeps the value alive", () {
      when(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
          .thenReturn(true);
      final container = createContainer();
      final provider =
          remoteConfigRepositoryProvider(RemoteConfigKeys.hoyolabLinkEnabled);

      container.read(provider);
      container.read(provider);

      verify(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled)).called(1);
    });
  });

  group("remoteConfigUpdateListener", () {
    test("re-reads every key when the server pushes an update", () async {
      var enabled = false;
      var bannerText = "before";
      when(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
          .thenAnswer((_) => enabled);
      when(service.get<String>(RemoteConfigKeys.bannerText))
          .thenAnswer((_) => bannerText);
      final container = createContainer();
      final enabledProvider =
          remoteConfigRepositoryProvider(RemoteConfigKeys.hoyolabLinkEnabled);
      final textProvider =
          remoteConfigRepositoryProvider(RemoteConfigKeys.bannerText);

      container.listen(enabledProvider, (_, _) {});
      container.listen(textProvider, (_, _) {});
      container.read(remoteConfigUpdateListenerProvider);
      expect(container.read(enabledProvider), isFalse);
      expect(container.read(textProvider), "before");

      enabled = true;
      bannerText = "after";
      updates.add(RemoteConfigUpdate({"hoyolab_link_enabled", "banner_text"}));
      await pumpEventQueue();

      // The whole family is invalidated; a consumer that needs a value to stay
      // put for the session says so itself, the way `useStartupBanner` does.
      expect(container.read(enabledProvider), isTrue);
      expect(container.read(textProvider), "after");
    });

    test("cancels the subscription when it is disposed", () async {
      final container = createContainer();
      container.read(remoteConfigUpdateListenerProvider);
      expect(updates.hasListener, isTrue);

      container.dispose();

      expect(updates.hasListener, isFalse);
    });
  });
}
