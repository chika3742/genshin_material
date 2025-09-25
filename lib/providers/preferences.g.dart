// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PreferencesStateNotifier)
const preferencesStateProvider = PreferencesStateNotifierProvider._();

final class PreferencesStateNotifierProvider
    extends $NotifierProvider<PreferencesStateNotifier, PreferencesState> {
  const PreferencesStateNotifierProvider._()
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
    r'fe1e4032e91aa58ee88dda41f8373e13255127e2';

abstract class _$PreferencesStateNotifier extends $Notifier<PreferencesState> {
  PreferencesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PreferencesState, PreferencesState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PreferencesState, PreferencesState>,
        PreferencesState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
