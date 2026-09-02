import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../data/services/remote_config_service.dart";
import "../providers/remote_config.dart";

/// Keeps every Remote Config value in sync with what the server pushes.
void useRemoteConfigListener(WidgetRef ref) {
  useEffect(() {
    final subscription =
        ref.read(remoteConfigServiceProvider).listenConfigUpdate(() {
      // `listenConfigUpdate` awaits `activate()` before calling back, and
      // cancelling a subscription cannot stop an event that is already in
      // flight. Reading through an unmounted ref throws, so check first.
      if (!ref.context.mounted) {
        return;
      }
      ref.invalidate(remoteConfigProvider);
    });

    return subscription.cancel;
  }, []);
}
