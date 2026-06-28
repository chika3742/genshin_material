// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BannerNotifier)
final bannerProvider = BannerNotifierProvider._();

final class BannerNotifierProvider
    extends $NotifierProvider<BannerNotifier, BannerData?> {
  BannerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bannerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bannerNotifierHash();

  @$internal
  @override
  BannerNotifier create() => BannerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BannerData? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BannerData?>(value),
    );
  }
}

String _$bannerNotifierHash() => r'b99cc794ee92fecb525772c9e7e556fd32cd4702';

abstract class _$BannerNotifier extends $Notifier<BannerData?> {
  BannerData? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<BannerData?, BannerData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BannerData?, BannerData?>,
              BannerData?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
