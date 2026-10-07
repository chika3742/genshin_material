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
    required VariantId super.argument,
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
    r'4df9179d1553c9ae76cd2bd8896ed5556bf05ffb';

final class SingleCharacterStateRepositoryFamily extends $Family
    with
        $ClassFamilyOverride<
          SingleCharacterStateRepository,
          AsyncValue<CharacterState?>,
          CharacterState?,
          FutureOr<CharacterState?>,
          VariantId
        > {
  SingleCharacterStateRepositoryFamily._()
    : super(
        retry: null,
        name: r'singleCharacterStateRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SingleCharacterStateRepositoryProvider call(VariantId variantId) =>
      SingleCharacterStateRepositoryProvider._(argument: variantId, from: this);

  @override
  String toString() => r'singleCharacterStateRepositoryProvider';
}

abstract class _$SingleCharacterStateRepository
    extends $AsyncNotifier<CharacterState?> {
  late final _$args = ref.$arg as VariantId;
  VariantId get variantId => _$args;

  FutureOr<CharacterState?> build(VariantId variantId);
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
