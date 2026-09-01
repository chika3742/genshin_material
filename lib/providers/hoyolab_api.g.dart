// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: true,
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

String _$hoyolabPublicApiHash() => r'0109c2b7e19f934c301084d4fae9259e94ee0b6b';

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
        retry: _retryUnlessCredentialIsMissing,
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

String _$hoyolabAccountApiHash() => r'53a02d1f517836cae246ed07a06d0735c1b18d3a';

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
        retry: _retryUnlessCredentialIsMissing,
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

String _$hoyolabGameApiHash() => r'c2c132ae47a1951e9032e5e5fb47596c31a5d334';
