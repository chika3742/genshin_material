import "dart:async";
import "dart:developer";

import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/remote_config_keys.dart";
import "../../models/remote_config_key.dart";

part "remote_config_service.g.dart";

/// The only place that talks to the Firebase Remote Config SDK.
///
/// Values are not read from here directly: `remoteConfigProvider`
/// (`lib/providers/remote_config.dart`) wraps every key in a
/// provider so that a value participates in the dependency graph.
///
/// When [_rc] is null (Firebase is unavailable), every key returns its value in
/// [RemoteConfigKeys.defaults], or the SDK's own default for its type.
class RemoteConfigService {
  final FirebaseRemoteConfig? _rc;

  const RemoteConfigService(this._rc);

  T get<T extends Object>(RemoteConfigKey<T> key) {
    final rc = _rc;
    if (rc == null) {
      return (RemoteConfigKeys.defaults[key.key] ??
          switch (key) {
            BoolRemoteConfigKey() => false,
            StringRemoteConfigKey() => "",
            IntRemoteConfigKey() => 0,
          }) as T;
    }
    return switch (key) {
      BoolRemoteConfigKey(:final key) => rc.getBool(key) as T,
      StringRemoteConfigKey(:final key) => rc.getString(key) as T,
      IntRemoteConfigKey(:final key) => rc.getInt(key) as T,
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
    final rc = _rc;
    if (rc == null) {
      return const Stream<RemoteConfigUpdate>.empty().listen(null);
    }
    return rc.onConfigUpdated.listen((event) async {
      await rc.activate();
      onActivated();
    });
  }

  Future<void> initialize() async {
    final rc = _rc;
    if (rc == null) {
      return;
    }
    await rc.ensureInitialized();
    await rc.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 5),
      // minimumFetchInterval controls the background polling interval.
      // Since real-time updates are delivered via server-side push in listenConfigUpdate(),
      // a short interval is not necessary even in debug mode.
      minimumFetchInterval: const Duration(hours: 12),
    ));
    await rc.setDefaults(RemoteConfigKeys.defaults);
    try {
      await rc.fetchAndActivate();
    } catch (e, st) {
      log("Remote Config fetch failed", error: e, stackTrace: st);
    }
  }
}

@Riverpod(keepAlive: true)
RemoteConfigService remoteConfigService(Ref ref) {
  throw StateError("Provider must be initialized with `remoteConfigServiceProvider.overrideWithValue`.");
}
