// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'versions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(packageInfo)
final packageInfoProvider = PackageInfoProvider._();

final class PackageInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PackageInfo>,
          PackageInfo,
          FutureOr<PackageInfo>
        >
    with $FutureModifier<PackageInfo>, $FutureProvider<PackageInfo> {
  PackageInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageInfoHash();

  @$internal
  @override
  $FutureProviderElement<PackageInfo> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PackageInfo> create(Ref ref) {
    return packageInfo(ref);
  }
}

String _$packageInfoHash() => r'44d37547139567a5f03c1942c1d62ff1abb07248';

@ProviderFor(assetData)
final assetDataProvider = AssetDataProvider._();

final class AssetDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<AssetData>,
          AssetData,
          FutureOr<AssetData>
        >
    with $FutureModifier<AssetData>, $FutureProvider<AssetData> {
  AssetDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assetDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assetDataHash();

  @$internal
  @override
  $FutureProviderElement<AssetData> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AssetData> create(Ref ref) {
    return assetData(ref);
  }
}

String _$assetDataHash() => r'c31cae057a870579b82fad38dc01e15fb23ea653';

@ProviderFor(featuresReleaseNotesData)
final featuresReleaseNotesDataProvider = FeaturesReleaseNotesDataProvider._();

final class FeaturesReleaseNotesDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReleaseNote>>,
          List<ReleaseNote>,
          FutureOr<List<ReleaseNote>>
        >
    with
        $FutureModifier<List<ReleaseNote>>,
        $FutureProvider<List<ReleaseNote>> {
  FeaturesReleaseNotesDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featuresReleaseNotesDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featuresReleaseNotesDataHash();

  @$internal
  @override
  $FutureProviderElement<List<ReleaseNote>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ReleaseNote>> create(Ref ref) {
    return featuresReleaseNotesData(ref);
  }
}

String _$featuresReleaseNotesDataHash() =>
    r'ca5d04dc65b42cfe39f90626b86ebf6f6cbcdaa3';

@ProviderFor(assetsReleaseNotesData)
final assetsReleaseNotesDataProvider = AssetsReleaseNotesDataProvider._();

final class AssetsReleaseNotesDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReleaseNote>>,
          List<ReleaseNote>,
          FutureOr<List<ReleaseNote>>
        >
    with
        $FutureModifier<List<ReleaseNote>>,
        $FutureProvider<List<ReleaseNote>> {
  AssetsReleaseNotesDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assetsReleaseNotesDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assetsReleaseNotesDataHash();

  @$internal
  @override
  $FutureProviderElement<List<ReleaseNote>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ReleaseNote>> create(Ref ref) {
    return assetsReleaseNotesData(ref);
  }
}

String _$assetsReleaseNotesDataHash() =>
    r'3bdaa70123b85fb630ba46661fca53394c9c1eb9';
