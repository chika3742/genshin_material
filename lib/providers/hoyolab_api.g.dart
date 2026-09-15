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
          AsyncValue<HoyolabPublicApi>,
          HoyolabPublicApi,
          FutureOr<HoyolabPublicApi>
        >
    with $FutureModifier<HoyolabPublicApi>, $FutureProvider<HoyolabPublicApi> {
  HoyolabPublicApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: _retryUnlessLinkIsUnavailable,
        name: r'hoyolabPublicApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabPublicApiHash();

  @$internal
  @override
  $FutureProviderElement<HoyolabPublicApi> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HoyolabPublicApi> create(Ref ref) {
    return hoyolabPublicApi(ref);
  }
}

String _$hoyolabPublicApiHash() => r'607a453343de018916a7ce91d09b99b3faafcb3d';

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
        retry: _retryUnlessLinkIsUnavailable,
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

String _$hoyolabAccountApiHash() => r'8cfe374ac2fdec9dd1ffe516d88cfaf897b34740';

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
        retry: _retryUnlessLinkIsUnavailable,
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

String _$hoyolabGameApiHash() => r'46921f89b8cfcc854252d27ff535c31ec5bffac1';
