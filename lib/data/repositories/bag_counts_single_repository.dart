import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../models/character.dart";
import "../../models/common.dart";
import "../../providers/versions.dart";
import "../models/bag_counts.dart";
import "bag_counts_repository.dart";

part "bag_counts_single_repository.g.dart";

@riverpod
Future<BagCounts?> bagCountsSingle(
  Ref ref, {
  VariantId? variantId,
  WeaponId? weaponId,
}) async {
  final assetData = ref.watch(assetDataProvider).requireValue;
  if (assetData.variants[variantId]?.disableSync == true
      || assetData.weapons[weaponId]?.disableSync == true) {
    return null;
  }

  final provider = bagCountsProvider(BagCountRequests(requests: {(
    variantId: variantId,
    weaponId: weaponId,
  )}));

  ref.onAddListener(() => Future.microtask(() {
    if (ref.mounted) {
      ref.read(provider.notifier).refreshIfExpired();
    }
  }));
  return ref.watch(provider.future);
}
