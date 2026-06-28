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
    final rc = ref.watch(remoteConfigProvider);
    final bannerReadKeys = ref.watch(prefProvider(PrefKeys.bannerReadKeys));
    if (!rc.get(RemoteConfigKeys.showBanner)
        || bannerReadKeys.contains(rc.get(RemoteConfigKeys.bannerKey))) {
      return null;
    }
    return BannerData(
      text: rc.get(RemoteConfigKeys.bannerText),
      actionText: rc.get(RemoteConfigKeys.bannerActionText),
      actionUrl: rc.get(RemoteConfigKeys.bannerActionUrl),
    );
  }

  Future<void> markAsRead() async {
    final rc = ref.read(remoteConfigProvider);
    final bannerReadKeys = ref.read(prefProvider(PrefKeys.bannerReadKeys));
    await ref.read(prefProvider(PrefKeys.bannerReadKeys).notifier)
        .set([...bannerReadKeys, rc.get(RemoteConfigKeys.bannerKey)]);
  }
}
