import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../data/repositories/remote_config_repository.dart";
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
    final bannerReadKeys = ref.watch(prefProvider(PrefKeys.bannerReadKeys));
    final bannerKey = ref.watch(remoteConfigProvider(RemoteConfigKeys.bannerKey));
    if (!ref.watch(remoteConfigProvider(RemoteConfigKeys.showBanner))
        || bannerReadKeys.contains(bannerKey)) {
      return null;
    }
    return BannerData(
      text: ref.watch(remoteConfigProvider(RemoteConfigKeys.bannerText)),
      actionText: ref.watch(remoteConfigProvider(RemoteConfigKeys.bannerActionText)),
      actionUrl: ref.watch(remoteConfigProvider(RemoteConfigKeys.bannerActionUrl)),
    );
  }

  Future<void> markAsRead() async {
    final bannerReadKeys = ref.read(prefProvider(PrefKeys.bannerReadKeys));
    final bannerKey = ref.read(remoteConfigProvider(RemoteConfigKeys.bannerKey));
    await ref.read(prefProvider(PrefKeys.bannerReadKeys).notifier)
        .set([...bannerReadKeys, bannerKey]);
  }
}
