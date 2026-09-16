// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remoteConfigService)
final remoteConfigServiceProvider = RemoteConfigServiceProvider._();

final class RemoteConfigServiceProvider
    extends
        $FunctionalProvider<
          RemoteConfigService,
          RemoteConfigService,
          RemoteConfigService
        >
    with $Provider<RemoteConfigService> {
  RemoteConfigServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteConfigServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteConfigServiceHash();

  @$internal
  @override
  $ProviderElement<RemoteConfigService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemoteConfigService create(Ref ref) {
    return remoteConfigService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteConfigService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteConfigService>(value),
    );
  }
}

String _$remoteConfigServiceHash() =>
    r'3e0e7abfaba69fa709d8cc588aa2787f4e822735';
