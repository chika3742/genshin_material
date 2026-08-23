// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_hoyolab_credential.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storeHoyolabCredential)
final storeHoyolabCredentialProvider = StoreHoyolabCredentialProvider._();

final class StoreHoyolabCredentialProvider
    extends
        $FunctionalProvider<
          StoreHoyolabCredential,
          StoreHoyolabCredential,
          StoreHoyolabCredential
        >
    with $Provider<StoreHoyolabCredential> {
  StoreHoyolabCredentialProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storeHoyolabCredentialProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storeHoyolabCredentialHash();

  @$internal
  @override
  $ProviderElement<StoreHoyolabCredential> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StoreHoyolabCredential create(Ref ref) {
    return storeHoyolabCredential(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoreHoyolabCredential value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoreHoyolabCredential>(value),
    );
  }
}

String _$storeHoyolabCredentialHash() =>
    r'7917dc54230e172a2843a898e95c779f3bc5a9ac';
