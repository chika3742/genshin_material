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
    r'1e0713c05fa9afb08b8c1eb8e95b45507b729bca';

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
