// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_character_state_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SingleCharacterStateRepository)
final singleCharacterStateRepositoryProvider =
    SingleCharacterStateRepositoryFamily._();

final class SingleCharacterStateRepositoryProvider
    extends
        $AsyncNotifierProvider<
          SingleCharacterStateRepository,
          CharacterState?
        > {
  SingleCharacterStateRepositoryProvider._({
    required SingleCharacterStateRepositoryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'singleCharacterStateRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$singleCharacterStateRepositoryHash();

  @override
  String toString() {
    return r'singleCharacterStateRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SingleCharacterStateRepository create() => SingleCharacterStateRepository();

  @override
  bool operator ==(Object other) {
    return other is SingleCharacterStateRepositoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$singleCharacterStateRepositoryHash() =>
    r'd57bc1c1d7af27f05371a11cf1a2de2eb3a2a7c7';

final class SingleCharacterStateRepositoryFamily extends $Family
    with
        $ClassFamilyOverride<
          SingleCharacterStateRepository,
          AsyncValue<CharacterState?>,
          CharacterState?,
          FutureOr<CharacterState?>,
          String
        > {
  SingleCharacterStateRepositoryFamily._()
    : super(
        retry: null,
        name: r'singleCharacterStateRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SingleCharacterStateRepositoryProvider call(String variantId) =>
      SingleCharacterStateRepositoryProvider._(argument: variantId, from: this);

  @override
  String toString() => r'singleCharacterStateRepositoryProvider';
}

abstract class _$SingleCharacterStateRepository
    extends $AsyncNotifier<CharacterState?> {
  late final _$args = ref.$arg as String;
  String get variantId => _$args;

  FutureOr<CharacterState?> build(String variantId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CharacterState?>, CharacterState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CharacterState?>, CharacterState?>,
              AsyncValue<CharacterState?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
