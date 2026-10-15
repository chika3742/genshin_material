import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../data/models/bag_counts.dart";
import "../../data/repositories/bag_counts_repository.dart";
import "../../models/character.dart";
import "../../models/common.dart";
import "../../providers/versions.dart";

part "single_bag_counts.g.dart";

@riverpod
Future<BagCounts?> singleBagCounts(
  Ref ref, {
  VariantId? variantId,
  WeaponId? weaponId,
}) async {
  final assetData = ref.watch(assetDataProvider).requireValue;
  if (assetData.variants[variantId]?.disableSync == true
      || assetData.weapons[weaponId]?.disableSync == true) {
    return null;
  }

  final provider = bagCountsProvider(BagCountRequests(
    variantIds: {?variantId},
    weaponIds: {?weaponId},
  ));

  ref.onAddListener(() => Future.microtask(() {
    if (ref.mounted) {
      ref.read(provider.notifier).refreshIfExpired();
    }
  }));
  return ref.watch(provider.future);
}
