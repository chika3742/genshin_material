// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_state_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_cachedCharacterStates)
final _cachedCharacterStatesProvider = _CachedCharacterStatesProvider._();

final class _CachedCharacterStatesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InGameCharacterState>?>,
          List<InGameCharacterState>?,
          Stream<List<InGameCharacterState>?>
        >
    with
        $FutureModifier<List<InGameCharacterState>?>,
        $StreamProvider<List<InGameCharacterState>?> {
  _CachedCharacterStatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_cachedCharacterStatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_cachedCharacterStatesHash();

  @$internal
  @override
  $StreamProviderElement<List<InGameCharacterState>?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InGameCharacterState>?> create(Ref ref) {
    return _cachedCharacterStates(ref);
  }
}

String _$_cachedCharacterStatesHash() =>
    r'0738733cf8a0586de39ec554bb12ccbb9937e7e0';

@ProviderFor(CharacterStateRepository)
final characterStateRepositoryProvider = CharacterStateRepositoryProvider._();

final class CharacterStateRepositoryProvider
    extends
        $AsyncNotifierProvider<
          CharacterStateRepository,
          Map<String, CharacterState>?
        > {
  CharacterStateRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'characterStateRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$characterStateRepositoryHash();

  @$internal
  @override
  CharacterStateRepository create() => CharacterStateRepository();
}

String _$characterStateRepositoryHash() =>
    r'c2b8801fe2040c2bc88f69628defc5ca9fa04325';

abstract class _$CharacterStateRepository
    extends $AsyncNotifier<Map<String, CharacterState>?> {
  FutureOr<Map<String, CharacterState>?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, CharacterState>?>,
              Map<String, CharacterState>?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, CharacterState>?>,
                Map<String, CharacterState>?
              >,
              AsyncValue<Map<String, CharacterState>?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
