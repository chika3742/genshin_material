import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/repositories/remote_config_repository.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "banner_mocks.mocks.dart";

@GenerateMocks([RemoteConfigRepository])
void stubBannerRemoteConfig(MockRemoteConfigRepository mock, {
  bool bannerShown = false,
  String bannerKey = "",
  String bannerText = "",
  String bannerActionText = "",
  String bannerActionUrl = "",
}) {
  when(mock.get<bool>(RemoteConfigKeys.showBanner)).thenReturn(bannerShown);
  when(mock.get<String>(RemoteConfigKeys.bannerKey)).thenReturn(bannerKey);
  when(mock.get<String>(RemoteConfigKeys.bannerText)).thenReturn(bannerText);
  when(mock.get<String>(RemoteConfigKeys.bannerActionText)).thenReturn(bannerActionText);
  when(mock.get<String>(RemoteConfigKeys.bannerActionUrl)).thenReturn(bannerActionUrl);
}
