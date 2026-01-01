// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PreferencesStateNotifier)
final preferencesStateProvider = PreferencesStateNotifierProvider._();

final class PreferencesStateNotifierProvider
    extends $NotifierProvider<PreferencesStateNotifier, PreferencesState> {
  PreferencesStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preferencesStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preferencesStateNotifierHash();

  @$internal
  @override
  PreferencesStateNotifier create() => PreferencesStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PreferencesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PreferencesState>(value),
    );
  }
}

String _$preferencesStateNotifierHash() =>
    r'7729a1d1ca66a9f0d1f8908e4d40fbec6a81ab42';

abstract class _$PreferencesStateNotifier extends $Notifier<PreferencesState> {
  PreferencesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PreferencesState, PreferencesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PreferencesState, PreferencesState>,
              PreferencesState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
