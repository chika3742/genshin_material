// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CharacterFilterStateNotifier)
const characterFilterStateProvider = CharacterFilterStateNotifierProvider._();

final class CharacterFilterStateNotifierProvider extends $NotifierProvider<
    CharacterFilterStateNotifier, CharacterFilterState> {
  const CharacterFilterStateNotifierProvider._()
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
    r'ec550518a0196353ab93b87a00022bc19a9fe6ea';

abstract class _$CharacterFilterStateNotifier
    extends $Notifier<CharacterFilterState> {
  CharacterFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CharacterFilterState, CharacterFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<CharacterFilterState, CharacterFilterState>,
        CharacterFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ArtifactFilterStateNotifier)
const artifactFilterStateProvider = ArtifactFilterStateNotifierProvider._();

final class ArtifactFilterStateNotifierProvider extends $NotifierProvider<
    ArtifactFilterStateNotifier, ArtifactFilterState> {
  const ArtifactFilterStateNotifierProvider._()
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
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ArtifactFilterState, ArtifactFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ArtifactFilterState, ArtifactFilterState>,
        ArtifactFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
