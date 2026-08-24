import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/remote_config_keys.dart";
import "../../models/remote_config_key.dart";
import "../services/remote_config.dart";

part "remote_config_value.g.dart";

@Riverpod(keepAlive: true)
T remoteConfigValue<T extends Object>(Ref ref, RemoteConfigKey<T> key) {
  final remoteConfig = ref.watch(remoteConfigProvider);
  return remoteConfig.get(key);
}

/// This should be watched once in ProviderScope.
@riverpod
Future<void> initializeRemoteConfig(Ref ref) async {
  final remoteConfig = ref.watch(remoteConfigProvider);
  await remoteConfig.initialize(RemoteConfigKeys.defaults);
  final subscription = remoteConfig.onConfigUpdated(() {
    ref.invalidate(remoteConfigValueProvider);
  });
  ref.onDispose(subscription.cancel);
}
