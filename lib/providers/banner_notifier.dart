import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../data/repositories/remote_config_value.dart";
import "pref_notifier.dart";

part "banner_notifier.g.dart";
part "banner_notifier.freezed.dart";

@freezed
sealed class BannerData with _$BannerData {
  const factory BannerData({
    required String text,
    required String actionText,
    required String actionUrl,
  }) = _BannerData;
}

@riverpod
class BannerNotifier extends _$BannerNotifier {
  @override
  BannerData? build() {
    if (!ref.watch(remoteConfigValueProvider(RemoteConfigKeys.showBanner))) {
      return null;
    }

    final bannerReadKeys = ref.watch(prefProvider(PrefKeys.bannerReadKeys));
    // Keep the watched value in a local: inlining it into `contains(Object?)`
    // would infer the provider as RemoteConfigValueProvider<Object>.
    final bannerKey = ref.watch(remoteConfigValueProvider(RemoteConfigKeys.bannerKey));
    if (bannerReadKeys.contains(bannerKey)) {
      return null;
    }
    return BannerData(
      text: ref.watch(remoteConfigValueProvider(RemoteConfigKeys.bannerText)),
      actionText: ref.watch(remoteConfigValueProvider(RemoteConfigKeys.bannerActionText)),
      actionUrl: ref.watch(remoteConfigValueProvider(RemoteConfigKeys.bannerActionUrl)),
    );
  }

  Future<void> markAsRead() async {
    final bannerReadKeys = ref.read(prefProvider(PrefKeys.bannerReadKeys));
    final bannerKey = ref.read(remoteConfigValueProvider(RemoteConfigKeys.bannerKey));
    await ref.read(prefProvider(PrefKeys.bannerReadKeys).notifier)
        .set([...bannerReadKeys, bannerKey]);
  }
}
