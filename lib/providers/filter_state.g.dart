// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CharacterFilterStateNotifier)
final characterFilterStateProvider = CharacterFilterStateNotifierProvider._();

final class CharacterFilterStateNotifierProvider
    extends
        $NotifierProvider<CharacterFilterStateNotifier, CharacterFilterState> {
  CharacterFilterStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'characterFilterStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$characterFilterStateNotifierHash();

  @$internal
  @override
  CharacterFilterStateNotifier create() => CharacterFilterStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CharacterFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CharacterFilterState>(value),
    );
  }
}

String _$characterFilterStateNotifierHash() =>
    r'ac27618fd013d5223f92894ae978ebb29c96d379';

abstract class _$CharacterFilterStateNotifier
    extends $Notifier<CharacterFilterState> {
  CharacterFilterState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CharacterFilterState, CharacterFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CharacterFilterState, CharacterFilterState>,
              CharacterFilterState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(ArtifactFilterStateNotifier)
final artifactFilterStateProvider = ArtifactFilterStateNotifierProvider._();

final class ArtifactFilterStateNotifierProvider
    extends
        $NotifierProvider<ArtifactFilterStateNotifier, ArtifactFilterState> {
  ArtifactFilterStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'artifactFilterStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$artifactFilterStateNotifierHash();

  @$internal
  @override
  ArtifactFilterStateNotifier create() => ArtifactFilterStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArtifactFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArtifactFilterState>(value),
    );
  }
}

String _$artifactFilterStateNotifierHash() =>
    r'2acae805761bf198edae2697ded8bb35b1923d6a';

abstract class _$ArtifactFilterStateNotifier
    extends $Notifier<ArtifactFilterState> {
  ArtifactFilterState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ArtifactFilterState, ArtifactFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ArtifactFilterState, ArtifactFilterState>,
              ArtifactFilterState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(WeaponFilterStateNotifier)
final weaponFilterStateProvider = WeaponFilterStateNotifierProvider._();

final class WeaponFilterStateNotifierProvider
    extends $NotifierProvider<WeaponFilterStateNotifier, WeaponFilterState> {
  WeaponFilterStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weaponFilterStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weaponFilterStateNotifierHash();

  @$internal
  @override
  WeaponFilterStateNotifier create() => WeaponFilterStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeaponFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeaponFilterState>(value),
    );
  }
}

String _$weaponFilterStateNotifierHash() =>
    r'9397a98c393937cd1f9386e40c2bf2f58cdb6d85';

abstract class _$WeaponFilterStateNotifier
    extends $Notifier<WeaponFilterState> {
  WeaponFilterState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<WeaponFilterState, WeaponFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WeaponFilterState, WeaponFilterState>,
              WeaponFilterState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
