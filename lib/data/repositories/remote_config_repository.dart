import "dart:async";

import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/remote_config_keys.dart";
import "../../models/remote_config_key.dart";

part "remote_config_repository.g.dart";

class RemoteConfigRepository {
  final FirebaseRemoteConfig _rc;

  const RemoteConfigRepository(this._rc);

  T get<T extends Object>(RemoteConfigKey<T> key) {
    return switch (key) {
      BoolRemoteConfigKey(:final key) => _rc.getBool(key) as T,
      StringRemoteConfigKey(:final key) => _rc.getString(key) as T,
      IntRemoteConfigKey(:final key) => _rc.getInt(key) as T,
    };
  }

  /// Firebase Remote Config のサーバーサイドプッシュによるリアルタイム更新を購読する。
  /// [FirebaseRemoteConfig.onConfigUpdated] はポーリング間隔（[minimumFetchInterval]）とは
  /// 独立した仕組みであり、Firebase コンソールで値が更新されると即座に通知が届く。
  /// [FirebaseRemoteConfig.activate] を呼ぶことで、更新された値をローカルキャッシュに反映する。
  StreamSubscription<RemoteConfigUpdate> listenConfigUpdate() {
    return _rc.onConfigUpdated.listen((event) async {
      await _rc.activate();
    });
  }

  Future<void> initialize() async {
    await _rc.ensureInitialized();
    await _rc.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      // minimumFetchInterval はバックグラウンドポーリングの最小間隔。
      // リアルタイム更新は listenConfigUpdate() のサーバーサイドプッシュで行うため、
      // デバッグ時も短い間隔を設定する必要はない。
      minimumFetchInterval: const Duration(hours: 12),
    ));
    await _rc.setDefaults(RemoteConfigKeys.defaults);
    await _rc.fetchAndActivate();
  }
}

@riverpod
RemoteConfigRepository remoteConfig(Ref ref) {
  throw StateError("Provider must be initialized with `remoteConfigProvider.overrideWithValue`.");
}
