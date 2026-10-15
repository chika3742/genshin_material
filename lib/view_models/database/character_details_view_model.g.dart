// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// null = character not found

@ProviderFor(CharacterDetailsViewModel)
final characterDetailsViewModelProvider = CharacterDetailsViewModelFamily._();

/// null = character not found
final class CharacterDetailsViewModelProvider
    extends
        $AsyncNotifierProvider<
          CharacterDetailsViewModel,
          CharacterDetailsState?
        > {
  /// null = character not found
  CharacterDetailsViewModelProvider._({
    required CharacterDetailsViewModelFamily super.from,
    required (UniqueKey, CharacterOrVariantId) super.argument,
  }) : super(
         retry: null,
         name: r'characterDetailsViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$characterDetailsViewModelHash();

  @override
  String toString() {
    return r'characterDetailsViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  CharacterDetailsViewModel create() => CharacterDetailsViewModel();

  @override
  bool operator ==(Object other) {
    return other is CharacterDetailsViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$characterDetailsViewModelHash() =>
    r'39564c507b91f27d3dff2ae6df2d5ee12fd9ab42';

/// null = character not found

final class CharacterDetailsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          CharacterDetailsViewModel,
          AsyncValue<CharacterDetailsState?>,
          CharacterDetailsState?,
          FutureOr<CharacterDetailsState?>,
          (UniqueKey, CharacterOrVariantId)
        > {
  CharacterDetailsViewModelFamily._()
    : super(
        retry: null,
        name: r'characterDetailsViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// null = character not found

  CharacterDetailsViewModelProvider call(
    UniqueKey key,
    CharacterOrVariantId initialId,
  ) => CharacterDetailsViewModelProvider._(
    argument: (key, initialId),
    from: this,
  );

  @override
  String toString() => r'characterDetailsViewModelProvider';
}

/// null = character not found

abstract class _$CharacterDetailsViewModel
    extends $AsyncNotifier<CharacterDetailsState?> {
  late final _$args = ref.$arg as (UniqueKey, CharacterOrVariantId);
  UniqueKey get key => _$args.$1;
  CharacterOrVariantId get initialId => _$args.$2;

  FutureOr<CharacterDetailsState?> build(
    UniqueKey key,
    CharacterOrVariantId initialId,
  );
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<CharacterDetailsState?>, CharacterDetailsState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CharacterDetailsState?>,
                CharacterDetailsState?
              >,
              AsyncValue<CharacterDetailsState?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}

/// null = character not found

@ProviderFor(_CharacterVariantSelection)
final _characterVariantSelectionProvider = _CharacterVariantSelectionFamily._();

/// null = character not found
final class _CharacterVariantSelectionProvider
    extends $NotifierProvider<_CharacterVariantSelection, VariantId?> {
  /// null = character not found
  _CharacterVariantSelectionProvider._({
    required _CharacterVariantSelectionFamily super.from,
    required (UniqueKey, CharacterOrVariantId) super.argument,
  }) : super(
         retry: null,
         name: r'_characterVariantSelectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$_characterVariantSelectionHash();

  @override
  String toString() {
    return r'_characterVariantSelectionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  _CharacterVariantSelection create() => _CharacterVariantSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VariantId? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VariantId?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _CharacterVariantSelectionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_characterVariantSelectionHash() =>
    r'9f6bc720b6875ba958f1f3a9717195122f9651df';

/// null = character not found

final class _CharacterVariantSelectionFamily extends $Family
    with
        $ClassFamilyOverride<
          _CharacterVariantSelection,
          VariantId?,
          VariantId?,
          VariantId?,
          (UniqueKey, CharacterOrVariantId)
        > {
  _CharacterVariantSelectionFamily._()
    : super(
        retry: null,
        name: r'_characterVariantSelectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// null = character not found

  _CharacterVariantSelectionProvider call(
    UniqueKey key,
    CharacterOrVariantId initialId,
  ) => _CharacterVariantSelectionProvider._(
    argument: (key, initialId),
    from: this,
  );

  @override
  String toString() => r'_characterVariantSelectionProvider';
}

/// null = character not found

abstract class _$CharacterVariantSelection extends $Notifier<VariantId?> {
  late final _$args = ref.$arg as (UniqueKey, CharacterOrVariantId);
  UniqueKey get key => _$args.$1;
  CharacterOrVariantId get initialId => _$args.$2;

  VariantId? build(UniqueKey key, CharacterOrVariantId initialId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<VariantId?, VariantId?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VariantId?, VariantId?>,
              VariantId?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
