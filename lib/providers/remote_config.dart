import "package:riverpod_annotation/riverpod_annotation.dart";

import "../data/services/remote_config_service.dart";
import "../models/remote_config_key.dart";

part "remote_config.g.dart";

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
///   remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled),
/// );
/// ```
///
/// `useRemoteConfigListener` invalidates the whole family when the server
/// pushes an update, so a consumer that wants a value to stay put for the
/// session has to say so itself — `use_startup_banner.dart` does that with an
/// empty dependency array.
@Riverpod(keepAlive: true)
T remoteConfig<T extends Object>(Ref ref, RemoteConfigKey<T> key) {
  return ref.watch(remoteConfigServiceProvider).get(key);
}
