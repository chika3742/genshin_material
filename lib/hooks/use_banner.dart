import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../models/banner_data.dart";
import "../providers/pref_notifier.dart";
import "../providers/remote_config.dart";

/// The banner to show, if any, together with the callback that dismisses it.
typedef BannerHandle = ({
  BannerData? banner,
  Future<void> Function() markAsRead,
});

/// Derives the announcement banner from Remote Config and the keys the user has
/// already dismissed.
///
/// [BannerHandle.markAsRead] is bound to the key [BannerHandle.banner] was
/// built from rather than to whatever the key happens to be when it runs: a
/// config push can replace the key while the banner is on screen, and
/// dismissing it has to record what the user actually saw.
BannerHandle useBanner(WidgetRef ref) {
  final readKeys = ref.watch(prefProvider(PrefKeys.bannerReadKeys));
  final key = ref.watch(remoteConfigProvider(RemoteConfigKeys.bannerKey));
  final shown = ref.watch(remoteConfigProvider(RemoteConfigKeys.showBanner));

  final markAsRead = useCallback(() async {
    final current = ref.read(prefProvider(PrefKeys.bannerReadKeys));
    await ref.read(prefProvider(PrefKeys.bannerReadKeys).notifier)
        .set([...current, key]);
  }, [key]);

  if (!shown || readKeys.contains(key)) {
    return (banner: null, markAsRead: markAsRead);
  }

  return (
    banner: BannerData(
      text: ref.watch(remoteConfigProvider(RemoteConfigKeys.bannerText)),
      actionText: ref.watch(remoteConfigProvider(RemoteConfigKeys.bannerActionText)),
      actionUrl: ref.watch(remoteConfigProvider(RemoteConfigKeys.bannerActionUrl)),
    ),
    markAsRead: markAsRead,
  );
}
