// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_url.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(launchUrl)
final launchUrlProvider = LaunchUrlProvider._();

final class LaunchUrlProvider
    extends $FunctionalProvider<LaunchUrl, LaunchUrl, LaunchUrl>
    with $Provider<LaunchUrl> {
  LaunchUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'launchUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$launchUrlHash();

  @$internal
  @override
  $ProviderElement<LaunchUrl> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LaunchUrl create(Ref ref) {
    return launchUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LaunchUrl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LaunchUrl>(value),
    );
  }
}

String _$launchUrlHash() => r'b0bf1387404fbefa26111703a040a06274a4354b';

@ProviderFor(launchUrlString)
final launchUrlStringProvider = LaunchUrlStringProvider._();

final class LaunchUrlStringProvider
    extends
        $FunctionalProvider<LaunchUrlString, LaunchUrlString, LaunchUrlString>
    with $Provider<LaunchUrlString> {
  LaunchUrlStringProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'launchUrlStringProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$launchUrlStringHash();

  @$internal
  @override
  $ProviderElement<LaunchUrlString> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LaunchUrlString create(Ref ref) {
    return launchUrlString(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LaunchUrlString value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LaunchUrlString>(value),
    );
  }
}

String _$launchUrlStringHash() => r'1d71756fec26aebb7077e3cd2fe1764e8e5e2d53';
