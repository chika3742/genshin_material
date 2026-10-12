import "package:freezed_annotation/freezed_annotation.dart";

import "../../models/character.dart";
import "../../models/common.dart";

part "bag_counts.freezed.dart";

/// Bag counts per material, each capped at the quantity needed for the
/// requests.
typedef BagCounts = Map<MaterialId, int>;

@freezed
sealed class BagCountRequests with _$BagCountRequests {
  const factory BagCountRequests({
    required Set<({VariantId? variantId, WeaponId? weaponId})> requests,
  }) = _BagCountRequests;
}
