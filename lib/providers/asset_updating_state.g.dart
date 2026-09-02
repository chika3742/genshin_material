// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_updating_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AssetUpdatingStateNotifier)
final assetUpdatingStateProvider = AssetUpdatingStateNotifierProvider._();

final class AssetUpdatingStateNotifierProvider
    extends $NotifierProvider<AssetUpdatingStateNotifier, AssetUpdatingState> {
  AssetUpdatingStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assetUpdatingStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assetUpdatingStateNotifierHash();

  @$internal
  @override
  AssetUpdatingStateNotifier create() => AssetUpdatingStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AssetUpdatingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AssetUpdatingState>(value),
    );
  }
}

String _$assetUpdatingStateNotifierHash() =>
    r'4b960fbf99d4d45f435a03ade2df4fb4d8b56c85';

abstract class _$AssetUpdatingStateNotifier
    extends $Notifier<AssetUpdatingState> {
  AssetUpdatingState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AssetUpdatingState, AssetUpdatingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AssetUpdatingState, AssetUpdatingState>,
              AssetUpdatingState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
