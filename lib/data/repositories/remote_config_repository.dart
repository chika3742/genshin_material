import "dart:async";

import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../models/remote_config_key.dart";
import "../services/remote_config_service.dart";

part "remote_config_repository.g.dart";

/// The single read path for a Remote Config value.
///
/// One provider per key, so a value is an ordinary node of the dependency
/// graph: consumers `watch` it and rebuild when it is invalidated, and a test
/// replaces one value with `overrideWithValue` instead of stubbing the whole
/// service. The type follows from the key, so no type argument is needed at the
/// call site:
///
/// ```dart
/// final enabled = ref.watch(
///   remoteConfigRepositoryProvider(RemoteConfigKeys.hoyolabLinkEnabled),
/// );
/// ```
@Riverpod(keepAlive: true)
T remoteConfigRepository<T extends Object>(Ref ref, RemoteConfigKey<T> key) {
  return ref.watch(remoteConfigServiceProvider).get(key);
}

/// Keeps every Remote Config value in sync with what the server pushes.
///
/// The whole family is invalidated, so a consumer that wants a value to stay
/// put for the session has to say so itself — `use_startup_banner.dart` does
/// that with an empty dependency array.
@Riverpod(keepAlive: true)
StreamSubscription<RemoteConfigUpdate> remoteConfigUpdateListener(Ref ref) {
  final subscription = ref.watch(remoteConfigServiceProvider)
      .listenConfigUpdate(() => ref.invalidate(remoteConfigRepositoryProvider));
  ref.onDispose(subscription.cancel);
  return subscription;
}
