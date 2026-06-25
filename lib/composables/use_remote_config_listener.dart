import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../data/repositories/remote_config_repository.dart";

void useRemoteConfigListener(WidgetRef ref) {
  useEffect(() {
    final remoteConfig = ref.read(remoteConfigProvider);
    final subscription = remoteConfig.listenConfigUpdate();

    return subscription.cancel;
  }, []);
}
