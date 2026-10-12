// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_counts_single_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bagCountsSingle)
final bagCountsSingleProvider = BagCountsSingleFamily._();

final class BagCountsSingleProvider
    extends
        $FunctionalProvider<
          AsyncValue<BagCounts?>,
          BagCounts?,
          FutureOr<BagCounts?>
        >
    with $FutureModifier<BagCounts?>, $FutureProvider<BagCounts?> {
  BagCountsSingleProvider._({
    required BagCountsSingleFamily super.from,
    required ({VariantId? variantId, WeaponId? weaponId}) super.argument,
  }) : super(
         retry: null,
         name: r'bagCountsSingleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bagCountsSingleHash();

  @override
  String toString() {
    return r'bagCountsSingleProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<BagCounts?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<BagCounts?> create(Ref ref) {
    final argument =
        this.argument as ({VariantId? variantId, WeaponId? weaponId});
    return bagCountsSingle(
      ref,
      variantId: argument.variantId,
      weaponId: argument.weaponId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BagCountsSingleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bagCountsSingleHash() => r'0add0021d42e1159b803ee98e79a0381698fda2c';

final class BagCountsSingleFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<BagCounts?>,
          ({VariantId? variantId, WeaponId? weaponId})
        > {
  BagCountsSingleFamily._()
    : super(
        retry: null,
        name: r'bagCountsSingleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BagCountsSingleProvider call({VariantId? variantId, WeaponId? weaponId}) =>
      BagCountsSingleProvider._(
        argument: (variantId: variantId, weaponId: weaponId),
        from: this,
      );

  @override
  String toString() => r'bagCountsSingleProvider';
}
