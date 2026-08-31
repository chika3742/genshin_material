import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/repositories/remote_config_repository.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "stub_remote_config.mocks.dart";

@GenerateMocks([RemoteConfigRepository])
void stubRemoteConfig(MockRemoteConfigRepository mock, {
  bool bannerShown = false,
  String bannerKey = "",
  String bannerText = "",
  String bannerActionText = "",
  String bannerActionUrl = "",
  bool hoyolabLinkEnabled = false,
}) {
  when(mock.get<bool>(RemoteConfigKeys.showBanner)).thenReturn(bannerShown);
  when(mock.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
      .thenReturn(hoyolabLinkEnabled);
  when(mock.get<String>(RemoteConfigKeys.bannerKey)).thenReturn(bannerKey);
  when(mock.get<String>(RemoteConfigKeys.bannerText)).thenReturn(bannerText);
  when(mock.get<String>(RemoteConfigKeys.bannerActionText)).thenReturn(bannerActionText);
  when(mock.get<String>(RemoteConfigKeys.bannerActionUrl)).thenReturn(bannerActionUrl);
  when(mock.listenConfigUpdate()).thenReturn(Stream<RemoteConfigUpdate>.empty().listen(null));
}
