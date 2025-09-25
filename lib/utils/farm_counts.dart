import "package:collection/collection.dart";

import "../models/drop_rates.dart";
import "../models/material.dart";

DropRateEntry? getDropRateEntryForMaterial(List<DropRateEntry> entries, Material material) {
  return entries.firstWhereOrNull((entry) {
    if (entry.target.ids != null) {
      return entry.target.ids!.contains(material.id);
    }
    if (entry.target.category != null) {
      return entry.target.category == material.category
          && (entry.target.rarity == null || entry.target.rarity == material.rarity);
    }
    return false;
  });
}

int? calculateFarmCount(Material material, List<DropRateEntry> entries, int quantity, int ar, double condensedMultiplier) {
  final entry = getDropRateEntryForMaterial(entries, material);
  if (entry == null) return null;

  double? rate = entry.getDropRateForAR(ar);
  if (rate == null) return null;

  if (entry.condensedAvailable) {
    rate *= condensedMultiplier;
  }
  return (quantity / rate).ceil();
}
