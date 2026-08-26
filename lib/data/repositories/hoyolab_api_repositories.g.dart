// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_api_repositories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hoyolabPreAuthApi)
final hoyolabPreAuthApiProvider = HoyolabPreAuthApiProvider._();

final class HoyolabPreAuthApiProvider
    extends
        $FunctionalProvider<
          HoyolabPreAuthApi,
          HoyolabPreAuthApi,
          HoyolabPreAuthApi
        >
    with $Provider<HoyolabPreAuthApi> {
  HoyolabPreAuthApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hoyolabPreAuthApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabPreAuthApiHash();

  @$internal
  @override
  $ProviderElement<HoyolabPreAuthApi> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HoyolabPreAuthApi create(Ref ref) {
    return hoyolabPreAuthApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HoyolabPreAuthApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HoyolabPreAuthApi>(value),
    );
  }
}

String _$hoyolabPreAuthApiHash() => r'7714f1256692aa757761f5f7ca10c4160e4c1409';

@ProviderFor(hoyolabAuthenticatedApi)
final hoyolabAuthenticatedApiProvider = HoyolabAuthenticatedApiProvider._();

final class HoyolabAuthenticatedApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<HoyolabAuthenticatedApi>,
          HoyolabAuthenticatedApi,
          FutureOr<HoyolabAuthenticatedApi>
        >
    with
        $FutureModifier<HoyolabAuthenticatedApi>,
        $FutureProvider<HoyolabAuthenticatedApi> {
  HoyolabAuthenticatedApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hoyolabAuthenticatedApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabAuthenticatedApiHash();

  @$internal
  @override
  $FutureProviderElement<HoyolabAuthenticatedApi> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HoyolabAuthenticatedApi> create(Ref ref) {
    return hoyolabAuthenticatedApi(ref);
  }
}

String _$hoyolabAuthenticatedApiHash() =>
    r'dd77ec14143023e3af8b0deeff580d9f813fc7fc';

@ProviderFor(hoyolabAuthenticatedServerApi)
final hoyolabAuthenticatedServerApiProvider =
    HoyolabAuthenticatedServerApiProvider._();

final class HoyolabAuthenticatedServerApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<HoyolabAuthenticatedServerApi>,
          HoyolabAuthenticatedServerApi,
          FutureOr<HoyolabAuthenticatedServerApi>
        >
    with
        $FutureModifier<HoyolabAuthenticatedServerApi>,
        $FutureProvider<HoyolabAuthenticatedServerApi> {
  HoyolabAuthenticatedServerApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hoyolabAuthenticatedServerApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabAuthenticatedServerApiHash();

  @$internal
  @override
  $FutureProviderElement<HoyolabAuthenticatedServerApi> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HoyolabAuthenticatedServerApi> create(Ref ref) {
    return hoyolabAuthenticatedServerApi(ref);
  }
}

String _$hoyolabAuthenticatedServerApiHash() =>
    r'fe177eab42f2a8e3d964f8c172e9d1fe83a96a06';
