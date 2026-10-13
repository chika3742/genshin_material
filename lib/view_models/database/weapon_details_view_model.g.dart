// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// null = weapon not found

@ProviderFor(WeaponDetailsViewModel)
final weaponDetailsViewModelProvider = WeaponDetailsViewModelFamily._();

/// null = weapon not found
final class WeaponDetailsViewModelProvider
    extends
        $AsyncNotifierProvider<WeaponDetailsViewModel, WeaponDetailsState?> {
  /// null = weapon not found
  WeaponDetailsViewModelProvider._({
    required WeaponDetailsViewModelFamily super.from,
    required (UniqueKey, WeaponId, VariantId?) super.argument,
  }) : super(
         retry: null,
         name: r'weaponDetailsViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$weaponDetailsViewModelHash();

  @override
  String toString() {
    return r'weaponDetailsViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  WeaponDetailsViewModel create() => WeaponDetailsViewModel();

  @override
  bool operator ==(Object other) {
    return other is WeaponDetailsViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$weaponDetailsViewModelHash() =>
    r'005c3c5d26f27837e313ff5959597fac99c7d7ca';

/// null = weapon not found

final class WeaponDetailsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          WeaponDetailsViewModel,
          AsyncValue<WeaponDetailsState?>,
          WeaponDetailsState?,
          FutureOr<WeaponDetailsState?>,
          (UniqueKey, WeaponId, VariantId?)
        > {
  WeaponDetailsViewModelFamily._()
    : super(
        retry: null,
        name: r'weaponDetailsViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// null = weapon not found

  WeaponDetailsViewModelProvider call(
    UniqueKey key,
    WeaponId id,
    VariantId? initialSelectedCharacterId,
  ) => WeaponDetailsViewModelProvider._(
    argument: (key, id, initialSelectedCharacterId),
    from: this,
  );

  @override
  String toString() => r'weaponDetailsViewModelProvider';
}

/// null = weapon not found

abstract class _$WeaponDetailsViewModel
    extends $AsyncNotifier<WeaponDetailsState?> {
  late final _$args = ref.$arg as (UniqueKey, WeaponId, VariantId?);
  UniqueKey get key => _$args.$1;
  WeaponId get id => _$args.$2;
  VariantId? get initialSelectedCharacterId => _$args.$3;

  FutureOr<WeaponDetailsState?> build(
    UniqueKey key,
    WeaponId id,
    VariantId? initialSelectedCharacterId,
  );
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<WeaponDetailsState?>, WeaponDetailsState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WeaponDetailsState?>, WeaponDetailsState?>,
              AsyncValue<WeaponDetailsState?>,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(_$args.$1, _$args.$2, _$args.$3),
    );
  }
}

@ProviderFor(_WeaponCharacterSelection)
final _weaponCharacterSelectionProvider = _WeaponCharacterSelectionFamily._();

final class _WeaponCharacterSelectionProvider
    extends
        $NotifierProvider<
          _WeaponCharacterSelection,
          _CharacterSelectionState?
        > {
  _WeaponCharacterSelectionProvider._({
    required _WeaponCharacterSelectionFamily super.from,
    required (UniqueKey, WeaponId, VariantId?) super.argument,
  }) : super(
         retry: null,
         name: r'_weaponCharacterSelectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$_weaponCharacterSelectionHash();

  @override
  String toString() {
    return r'_weaponCharacterSelectionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  _WeaponCharacterSelection create() => _WeaponCharacterSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(_CharacterSelectionState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<_CharacterSelectionState?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _WeaponCharacterSelectionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_weaponCharacterSelectionHash() =>
    r'd7e4a4d82325a3fe5388a37e7da34ec5ad382843';

final class _WeaponCharacterSelectionFamily extends $Family
    with
        $ClassFamilyOverride<
          _WeaponCharacterSelection,
          _CharacterSelectionState?,
          _CharacterSelectionState?,
          _CharacterSelectionState?,
          (UniqueKey, WeaponId, VariantId?)
        > {
  _WeaponCharacterSelectionFamily._()
    : super(
        retry: null,
        name: r'_weaponCharacterSelectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _WeaponCharacterSelectionProvider call(
    UniqueKey key,
    WeaponId id,
    VariantId? initialSelectedCharacterId,
  ) => _WeaponCharacterSelectionProvider._(
    argument: (key, id, initialSelectedCharacterId),
    from: this,
  );

  @override
  String toString() => r'_weaponCharacterSelectionProvider';
}

abstract class _$WeaponCharacterSelection
    extends $Notifier<_CharacterSelectionState?> {
  late final _$args = ref.$arg as (UniqueKey, WeaponId, VariantId?);
  UniqueKey get key => _$args.$1;
  WeaponId get id => _$args.$2;
  VariantId? get initialSelectedCharacterId => _$args.$3;

  _CharacterSelectionState? build(
    UniqueKey key,
    WeaponId id,
    VariantId? initialSelectedCharacterId,
  );
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<_CharacterSelectionState?, _CharacterSelectionState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<_CharacterSelectionState?, _CharacterSelectionState?>,
              _CharacterSelectionState?,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(_$args.$1, _$args.$2, _$args.$3),
    );
  }
}
