// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'miscellaneous.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RealtimeNotesActivationState)
const realtimeNotesActivationStateProvider =
    RealtimeNotesActivationStateProvider._();

final class RealtimeNotesActivationStateProvider
    extends $AsyncNotifierProvider<RealtimeNotesActivationState, bool> {
  const RealtimeNotesActivationStateProvider._()
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
    r'fe12c5df9dc88c1d710f025dc1a52f71e5e1d5af';

abstract class _$RealtimeNotesActivationState extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<bool>, bool>,
        AsyncValue<bool>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ownedCharacters)
const ownedCharactersProvider = OwnedCharactersProvider._();

final class OwnedCharactersProvider extends $FunctionalProvider<
        AsyncValue<List<CharacterId>?>,
        List<CharacterId>?,
        FutureOr<List<CharacterId>?>>
    with
        $FutureModifier<List<CharacterId>?>,
        $FutureProvider<List<CharacterId>?> {
  const OwnedCharactersProvider._()
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
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<CharacterId>?> create(Ref ref) {
    return ownedCharacters(ref);
  }
}

String _$ownedCharactersHash() => r'ebfb0d0e176b393a9c9ba61ca8956854c3e37e41';
