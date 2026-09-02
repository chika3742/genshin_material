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
    final bannerKey = ref.watch(remoteConfigRepositoryProvider(RemoteConfigKeys.bannerKey));
    if (!ref.watch(remoteConfigRepositoryProvider(RemoteConfigKeys.showBanner))
        || bannerReadKeys.contains(bannerKey)) {
      return null;
    }
    return BannerData(
      text: ref.watch(remoteConfigRepositoryProvider(RemoteConfigKeys.bannerText)),
      actionText: ref.watch(remoteConfigRepositoryProvider(RemoteConfigKeys.bannerActionText)),
      actionUrl: ref.watch(remoteConfigRepositoryProvider(RemoteConfigKeys.bannerActionUrl)),
    );
  }

  Future<void> markAsRead() async {
    final bannerReadKeys = ref.read(prefProvider(PrefKeys.bannerReadKeys));
    final bannerKey = ref.read(remoteConfigRepositoryProvider(RemoteConfigKeys.bannerKey));
    await ref.read(prefProvider(PrefKeys.bannerReadKeys).notifier)
        .set([...bannerReadKeys, bannerKey]);
  }
}
