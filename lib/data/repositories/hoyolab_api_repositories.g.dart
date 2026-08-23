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

String _$hoyolabPreAuthApiHash() => r'cb4c468c382d0938d5300c5db4d17a9ba7f02831';

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
    r'27a84b197976e0714b04da4b8b410593ebeee037';

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
    r'50eaad81e78aea1c7d0c5854deaaa902d84a7e48';
