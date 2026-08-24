import "dart:async";

import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../models/remote_config_key.dart";

part "remote_config.g.dart";

class RemoteConfig {
  final FirebaseRemoteConfig _remoteConfig;

  const RemoteConfig(this._remoteConfig);

  T get<T extends Object>(RemoteConfigKey<T> key) {
    return switch (key) {
      RemoteConfigKey<bool>(:final key) => _remoteConfig.getBool(key) as T,
      RemoteConfigKey<String>(:final key) => _remoteConfig.getString(key) as T,
      RemoteConfigKey<int>(:final key) => _remoteConfig.getInt(key) as T,
    };
  }

  /// Subscribes to real-time updates pushed server-side by Firebase Remote Config.
  /// Subscribing this will also apply the updated values to the local cache.
  StreamSubscription<RemoteConfigUpdate> onConfigUpdated(FutureOr<void> Function() action) {
    return _remoteConfig.onConfigUpdated.listen((event) async {
      await _remoteConfig.activate();
      await action();
    });
  }

  Future<void> initialize(Map<String, dynamic> defaults) async {
    await _remoteConfig.ensureInitialized();
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      // minimumFetchInterval controls the background polling interval.
      // Since real-time updates are delivered via server-side push in listenConfigUpdate(),
      // a short interval is not necessary even in debug mode.
      minimumFetchInterval: const Duration(hours: 12),
    ));
    await _remoteConfig.setDefaults(defaults);
    await _remoteConfig.fetchAndActivate();
  }
}

@Riverpod(keepAlive: true)
RemoteConfig remoteConfig(Ref ref) {
  return RemoteConfig(FirebaseRemoteConfig.instance);
}
