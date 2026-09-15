// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// One queue for every HoYoLAB call, so the throttle holds across the three
/// API classes instead of per instance.

@ProviderFor(hoyolabRequestQueue)
final hoyolabRequestQueueProvider = HoyolabRequestQueueProvider._();

/// One queue for every HoYoLAB call, so the throttle holds across the three
/// API classes instead of per instance.

final class HoyolabRequestQueueProvider
    extends
        $FunctionalProvider<ApiRequestQueue, ApiRequestQueue, ApiRequestQueue>
    with $Provider<ApiRequestQueue> {
  /// One queue for every HoYoLAB call, so the throttle holds across the three
  /// API classes instead of per instance.
  HoyolabRequestQueueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hoyolabRequestQueueProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabRequestQueueHash();

  @$internal
  @override
  $ProviderElement<ApiRequestQueue> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiRequestQueue create(Ref ref) {
    return hoyolabRequestQueue(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiRequestQueue value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiRequestQueue>(value),
    );
  }
}

String _$hoyolabRequestQueueHash() =>
    r'918cbdf14a8c5abedbfccbe7750f8793766e96e6';

@ProviderFor(hoyolabPublicApi)
final hoyolabPublicApiProvider = HoyolabPublicApiProvider._();

final class HoyolabPublicApiProvider
    extends
        $FunctionalProvider<
          HoyolabPublicApi,
          HoyolabPublicApi,
          HoyolabPublicApi
        >
    with $Provider<HoyolabPublicApi> {
  HoyolabPublicApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hoyolabPublicApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabPublicApiHash();

  @$internal
  @override
  $ProviderElement<HoyolabPublicApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HoyolabPublicApi create(Ref ref) {
    return hoyolabPublicApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HoyolabPublicApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HoyolabPublicApi>(value),
    );
  }
}

String _$hoyolabPublicApiHash() => r'87a395953ee6acc0e9db08f5bbaedb845e7d9cd5';

@ProviderFor(hoyolabAccountApi)
final hoyolabAccountApiProvider = HoyolabAccountApiProvider._();

final class HoyolabAccountApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<HoyolabAccountApi>,
          HoyolabAccountApi,
          FutureOr<HoyolabAccountApi>
        >
    with
        $FutureModifier<HoyolabAccountApi>,
        $FutureProvider<HoyolabAccountApi> {
  HoyolabAccountApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: _retryUnlessLinkIsIncomplete,
        name: r'hoyolabAccountApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabAccountApiHash();

  @$internal
  @override
  $FutureProviderElement<HoyolabAccountApi> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HoyolabAccountApi> create(Ref ref) {
    return hoyolabAccountApi(ref);
  }
}

String _$hoyolabAccountApiHash() => r'5a1af535531ff0fe4a4fed61f90577ebf719d67a';

@ProviderFor(hoyolabGameApi)
final hoyolabGameApiProvider = HoyolabGameApiProvider._();

final class HoyolabGameApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<HoyolabGameApi>,
          HoyolabGameApi,
          FutureOr<HoyolabGameApi>
        >
    with $FutureModifier<HoyolabGameApi>, $FutureProvider<HoyolabGameApi> {
  HoyolabGameApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: _retryUnlessLinkIsIncomplete,
        name: r'hoyolabGameApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabGameApiHash();

  @$internal
  @override
  $FutureProviderElement<HoyolabGameApi> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HoyolabGameApi> create(Ref ref) {
    return hoyolabGameApi(ref);
  }
}

String _$hoyolabGameApiHash() => r'3923f90b7fdf8b3bd41ddb21fb832520c7161dc3';
