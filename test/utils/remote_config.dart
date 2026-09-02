import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter_riverpod/misc.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/repositories/remote_config_repository.dart";
import "package:genshin_material/data/services/remote_config_service.dart";
import "package:genshin_material/models/remote_config_key.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "remote_config.mocks.dart";

/// Overrides the provider of a single Remote Config [key] with [value].
///
/// The value type is inferred from the key, so the call site needs no type
/// argument.
///
/// [MockRemoteConfigService] (generated from the annotation below) is only for
/// the classes that still take a [RemoteConfigService] directly; anything
/// reading through a provider uses this instead.
@GenerateMocks([RemoteConfigService])
Override overrideRemoteConfig<T extends Object>(RemoteConfigKey<T> key, T value) {
  return remoteConfigRepositoryProvider(key).overrideWithValue(value);
}

/// Overrides every Remote Config key a test is likely to need in one go.
///
/// The defaults match `RemoteConfigKeys.defaults` (everything off, strings
/// empty), so a test only names the value it cares about.
///
/// [remoteConfigServiceProvider] is overridden with a mock answering the same
/// values, so that the classes still taking a [RemoteConfigService] directly
/// agree with what the providers report.
List<Override> overrideRemoteConfigs({
  bool hoyolabLinkEnabled = false,
  bool showBanner = false,
  String bannerKey = "",
  String bannerText = "",
  String bannerActionText = "",
  String bannerActionUrl = "",
  int minimumAssetSchemaVersion = 0,
}) {
  final service = MockRemoteConfigService();
  when(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
      .thenReturn(hoyolabLinkEnabled);
  when(service.get<bool>(RemoteConfigKeys.showBanner)).thenReturn(showBanner);
  when(service.get<String>(RemoteConfigKeys.bannerKey)).thenReturn(bannerKey);
  when(service.get<String>(RemoteConfigKeys.bannerText)).thenReturn(bannerText);
  when(service.get<String>(RemoteConfigKeys.bannerActionText))
      .thenReturn(bannerActionText);
  when(service.get<String>(RemoteConfigKeys.bannerActionUrl))
      .thenReturn(bannerActionUrl);
  when(service.get<int>(RemoteConfigKeys.minimumAssetSchemaVersion))
      .thenReturn(minimumAssetSchemaVersion);
  when(service.listenConfigUpdate(any))
      .thenReturn(const Stream<RemoteConfigUpdate>.empty().listen(null));

  return [
    remoteConfigServiceProvider.overrideWithValue(service),
    overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, hoyolabLinkEnabled),
    overrideRemoteConfig(RemoteConfigKeys.showBanner, showBanner),
    overrideRemoteConfig(RemoteConfigKeys.bannerKey, bannerKey),
    overrideRemoteConfig(RemoteConfigKeys.bannerText, bannerText),
    overrideRemoteConfig(RemoteConfigKeys.bannerActionText, bannerActionText),
    overrideRemoteConfig(RemoteConfigKeys.bannerActionUrl, bannerActionUrl),
    overrideRemoteConfig(
      RemoteConfigKeys.minimumAssetSchemaVersion,
      minimumAssetSchemaVersion,
    ),
  ];
}
