// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_image_resolver.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(assetImageResolver)
final assetImageResolverProvider = AssetImageResolverProvider._();

final class AssetImageResolverProvider
    extends
        $FunctionalProvider<
          AssetImageResolver,
          AssetImageResolver,
          AssetImageResolver
        >
    with $Provider<AssetImageResolver> {
  AssetImageResolverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assetImageResolverProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assetImageResolverHash();

  @$internal
  @override
  $ProviderElement<AssetImageResolver> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AssetImageResolver create(Ref ref) {
    return assetImageResolver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AssetImageResolver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AssetImageResolver>(value),
    );
  }
}

String _$assetImageResolverHash() =>
    r'4122bf67732422641c334fe77ef3baaf377a47f4';
