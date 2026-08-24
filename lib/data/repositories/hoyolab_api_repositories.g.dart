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

String _$hoyolabPreAuthApiHash() => r'1a66710881070817310760715d16f87acb8324e4';

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
    r'9d3e4a3b9f2b2dc5c5e20e85441c04796f74f92e';

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
    r'd9cfd0152a4df66d4835738c831a27b959ce1029';
