// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remoteConfig)
final remoteConfigProvider = RemoteConfigProvider._();

final class RemoteConfigProvider
    extends $FunctionalProvider<RemoteConfig, RemoteConfig, RemoteConfig>
    with $Provider<RemoteConfig> {
  RemoteConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteConfigHash();

  @$internal
  @override
  $ProviderElement<RemoteConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RemoteConfig create(Ref ref) {
    return remoteConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteConfig>(value),
    );
  }
}

String _$remoteConfigHash() => r'41947b5b784f73d8a71119786700c59533b9c316';
