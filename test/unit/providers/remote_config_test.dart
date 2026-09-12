import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/services/remote_config_service.dart";
import "package:genshin_material/providers/remote_config.dart";
import "package:mockito/mockito.dart";

import "../../utils/remote_config.mocks.dart";

void main() {
  late MockRemoteConfigService service;

  setUp(() {
    service = MockRemoteConfigService();
  });

  ProviderContainer createContainer() {
    return ProviderContainer.test(overrides: [
      remoteConfigServiceProvider.overrideWithValue(service),
    ]);
  }

  group("remoteConfig", () {
    test("returns the value of the key with the type the key declares", () {
      when(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
          .thenReturn(true);
      when(service.get<String>(RemoteConfigKeys.bannerText)).thenReturn("Hi");
      when(service.get<int>(RemoteConfigKeys.minimumAssetSchemaVersion))
          .thenReturn(3);

      final container = createContainer();

      expect(
        container.read(
          remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled),
        ),
        isTrue,
      );
      expect(
        container.read(
          remoteConfigProvider(RemoteConfigKeys.bannerText),
        ),
        "Hi",
      );
      expect(
        container.read(
          remoteConfigProvider(
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
          remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled);

      container.read(provider);
      container.read(provider);

      verify(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled)).called(1);
    });
  });
}
