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
        isAutoDispose: false,
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
    r'ec19dbae39610064c28b6772de499673dc22015f';

abstract class _$PreferencesStateNotifier extends $Notifier<PreferencesState> {
  PreferencesState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PreferencesState, PreferencesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PreferencesState, PreferencesState>,
              PreferencesState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
