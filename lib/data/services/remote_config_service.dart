import "dart:async";

import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/remote_config_keys.dart";
import "../../models/remote_config_key.dart";

part "remote_config_service.g.dart";

/// The only place that talks to the Firebase Remote Config SDK.
///
/// Values are not read from here directly: `remoteConfigProvider`
/// (`lib/data/repositories/remote_config_repository.dart`) wraps every key in a
/// provider so that a value participates in the dependency graph.
class RemoteConfigService {
  final FirebaseRemoteConfig _rc;

  const RemoteConfigService(this._rc);

  T get<T extends Object>(RemoteConfigKey<T> key) {
    return switch (key) {
      BoolRemoteConfigKey(:final key) => _rc.getBool(key) as T,
      StringRemoteConfigKey(:final key) => _rc.getString(key) as T,
      IntRemoteConfigKey(:final key) => _rc.getInt(key) as T,
    };
  }

  /// Subscribes to real-time updates pushed server-side by Firebase Remote Config.
  /// [FirebaseRemoteConfig.onConfigUpdated] operates independently of the polling
  /// interval ([minimumFetchInterval]) and delivers notifications immediately when
  /// values are updated in the Firebase console.
  /// Calling [FirebaseRemoteConfig.activate] applies the updated values to the local cache.
  ///
  /// [onActivated] runs once the new values are in the local cache, so a caller
  /// can refresh whatever it derived from them.
  StreamSubscription<RemoteConfigUpdate> listenConfigUpdate(
    void Function() onActivated,
  ) {
    return _rc.onConfigUpdated.listen((event) async {
      await _rc.activate();
      onActivated();
    });
  }

  Future<void> initialize() async {
    await _rc.ensureInitialized();
    await _rc.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      // minimumFetchInterval controls the background polling interval.
      // Since real-time updates are delivered via server-side push in listenConfigUpdate(),
      // a short interval is not necessary even in debug mode.
      minimumFetchInterval: const Duration(hours: 12),
    ));
    await _rc.setDefaults(RemoteConfigKeys.defaults);
    await _rc.fetchAndActivate();
  }
}

@Riverpod(keepAlive: true)
RemoteConfigService remoteConfigService(Ref ref) {
  throw StateError("Provider must be initialized with `remoteConfigServiceProvider.overrideWithValue`.");
}
