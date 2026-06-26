import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/repositories/remote_config_repository.dart";
import "package:genshin_material/models/pref_key.dart";
import "package:genshin_material/providers/pref_notifier.dart";
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
  when(mock.get<bool>(RemoteConfigKeys.bannerShown)).thenReturn(bannerShown);
  when(mock.get<String>(RemoteConfigKeys.bannerKey)).thenReturn(bannerKey);
  when(mock.get<String>(RemoteConfigKeys.bannerText)).thenReturn(bannerText);
  when(mock.get<String>(RemoteConfigKeys.bannerActionText)).thenReturn(bannerActionText);
  when(mock.get<String>(RemoteConfigKeys.bannerActionUrl)).thenReturn(bannerActionUrl);
}

/// In-memory replacement for [PrefNotifier]. Avoids touching SharedPreferences
/// in tests by holding the value purely in memory.
class InMemoryPrefNotifier<PrefT, ConvT> extends PrefNotifier<PrefT, ConvT> {
  ConvT _value;

  InMemoryPrefNotifier(ConvT initialValue) : _value = initialValue;

  @override
  ConvT build(PrefKey<PrefT, ConvT> key) => _value;

  @override
  Future<void> set(ConvT value) async {
    _value = value;
    state = value;
  }
}
