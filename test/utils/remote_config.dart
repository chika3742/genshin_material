import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter_riverpod/misc.dart";
import "package:genshin_material/data/repositories/remote_config_repository.dart";
import "package:genshin_material/data/services/remote_config_service.dart";
import "package:genshin_material/models/remote_config_key.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "remote_config.mocks.dart";

/// Overrides the provider of a single Remote Config [key] with [value].
///
/// The value type is inferred from the key, so the call site needs no type
/// argument. Override only the keys the test actually reads.
Override overrideRemoteConfig<T extends Object>(RemoteConfigKey<T> key, T value) {
  return remoteConfigProvider(key).overrideWithValue(value);
}

/// A [RemoteConfigService] mock whose update stream never fires.
///
/// Only the tests that reach the service itself need one: those that mount the
/// app (`remoteConfigUpdateListenerProvider` subscribes on startup) and those
/// covering a class that still takes a [RemoteConfigService] directly. Reading
/// a value goes through [overrideRemoteConfig] instead.
///
/// `get` is left unstubbed on purpose — stub the keys the subject reads, so
/// that an unexpected read fails loudly.
@GenerateMocks([RemoteConfigService])
MockRemoteConfigService createRemoteConfigServiceMock() {
  final service = MockRemoteConfigService();
  when(service.listenConfigUpdate(any))
      .thenReturn(const Stream<RemoteConfigUpdate>.empty().listen(null));
  return service;
}
