// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_bag_counts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(singleBagCounts)
final singleBagCountsProvider = SingleBagCountsFamily._();

final class SingleBagCountsProvider
    extends
        $FunctionalProvider<
          AsyncValue<BagCounts?>,
          BagCounts?,
          FutureOr<BagCounts?>
        >
    with $FutureModifier<BagCounts?>, $FutureProvider<BagCounts?> {
  SingleBagCountsProvider._({
    required SingleBagCountsFamily super.from,
    required ({VariantId? variantId, WeaponId? weaponId}) super.argument,
  }) : super(
         retry: null,
         name: r'singleBagCountsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$singleBagCountsHash();

  @override
  String toString() {
    return r'singleBagCountsProvider'
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
    return singleBagCounts(
      ref,
      variantId: argument.variantId,
      weaponId: argument.weaponId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SingleBagCountsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$singleBagCountsHash() => r'7e4f3ba6c9943119604c8028a2670d0c88a3586b';

final class SingleBagCountsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<BagCounts?>,
          ({VariantId? variantId, WeaponId? weaponId})
        > {
  SingleBagCountsFamily._()
    : super(
        retry: null,
        name: r'singleBagCountsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SingleBagCountsProvider call({VariantId? variantId, WeaponId? weaponId}) =>
      SingleBagCountsProvider._(
        argument: (variantId: variantId, weaponId: weaponId),
        from: this,
      );

  @override
  String toString() => r'singleBagCountsProvider';
}
