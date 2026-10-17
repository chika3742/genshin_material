import "package:freezed_annotation/freezed_annotation.dart";

import "../../models/character.dart";
import "../../models/common.dart";

part "bag_counts.freezed.dart";

/// Bag counts per material. Values can be negative because other bookmark
/// groups can consume the material with no ceiling.
typedef BagCounts = Map<MaterialId, int>;

@freezed
sealed class BagCountRequests with _$BagCountRequests {
  const factory BagCountRequests({
    @Default({}) Set<VariantId> variantIds,
    @Default({}) Set<WeaponId> weaponIds,
  }) = _BagCountRequests;
}
