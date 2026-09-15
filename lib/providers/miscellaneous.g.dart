// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'miscellaneous.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RealtimeNotesActivationState)
final realtimeNotesActivationStateProvider =
    RealtimeNotesActivationStateProvider._();

final class RealtimeNotesActivationStateProvider
    extends $AsyncNotifierProvider<RealtimeNotesActivationState, bool> {
  RealtimeNotesActivationStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'realtimeNotesActivationStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$realtimeNotesActivationStateHash();

  @$internal
  @override
  RealtimeNotesActivationState create() => RealtimeNotesActivationState();
}

String _$realtimeNotesActivationStateHash() =>
    r'4ea7ca902252c39734ac0f0a5fd38012c39b3b20';

abstract class _$RealtimeNotesActivationState extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(ownedCharacters)
final ownedCharactersProvider = OwnedCharactersProvider._();

final class OwnedCharactersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CharacterId>?>,
          List<CharacterId>?,
          FutureOr<List<CharacterId>?>
        >
    with
        $FutureModifier<List<CharacterId>?>,
        $FutureProvider<List<CharacterId>?> {
  OwnedCharactersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownedCharactersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownedCharactersHash();

  @$internal
  @override
  $FutureProviderElement<List<CharacterId>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CharacterId>?> create(Ref ref) {
    return ownedCharacters(ref);
  }
}

String _$ownedCharactersHash() => r'83967bef7c498549316de6d3cfdc42a5b051f0f9';

@ProviderFor(shouldHideImages)
final shouldHideImagesProvider = ShouldHideImagesProvider._();

final class ShouldHideImagesProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  ShouldHideImagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shouldHideImagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shouldHideImagesHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return shouldHideImages(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$shouldHideImagesHash() => r'8174c8d5a6d57d8818c048df08d0b71107159f64';
