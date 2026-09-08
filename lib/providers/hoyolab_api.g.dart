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

String _$hoyolabPublicApiHash() => r'ff3b936ea55c9a5944f0891ab9d1a0edc9ff8439';

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

String _$hoyolabAccountApiHash() => r'a3f345b4324643e9627d5e7b53716b6d2892bd38';

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

String _$hoyolabGameApiHash() => r'02d2956b98238413d76a4195049c3260f7889f2a';
