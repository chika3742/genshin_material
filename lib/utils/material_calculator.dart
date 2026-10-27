import "dart:math";

import "package:collection/collection.dart";

import "../core/asset_cache.dart";
import "../data/models/bag_counts.dart";
import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/level_range_values.dart";
import "../models/material_bookmark_frame.dart";
import "ingredients_converter.dart";
import "lists.dart";

List<MaterialCardMaterial> generateMaterialCardsFromRange(
  AssetData assetData,
  IngredientConfigurations ingredientConf,
  CharacterOrWeapon target,
  Map<Purpose, LevelRangeValues> ranges,
) {
  final mbFrames = <MaterialBookmarkFrame>[];
  for (final MapEntry(key: purpose, value: range) in ranges.entries) {
    mbFrames.addAll(
      ingredientConf
          .getLevels(rarity: target.rarity, purpose: purpose)
          .levels
          .mapInLevelRange(range, (key, value) {
            return toMaterialBookmarkFrames(
              level: key,
              ingredients: value,
              purposeType: purpose,
              characterOrWeapon: target,
              assetData: assetData,
            );
          },
      ).flattened,
    );
  }
  final items = mergeMaterialBookmarkFrames(mbFrames);

  return sortMaterials(items, assetData);
}

({BagCounts effective, BagCounts remaining}) applyCrafting(BagCounts bagCounts, Map<MaterialId, int> needs, AssetData assetData) {
  const craftRatio = 3;

  final effective = {...bagCounts};
  final remaining = {
    for (final MapEntry(key: id, :value) in bagCounts.entries)
      id: value - (needs[id] ?? 0),
  };

  final groups = assetData.materials.values
      .where((e) => e.groupId != null && e.craftLevel != null)
      .groupListsBy((e) => e.groupId);

  for (final ranks in groups.values) {
    if (!ranks.any((e) => bagCounts.containsKey(e.id))) {
      continue;
    }

    final ids = ranks.sortedBy<num>((e) => e.craftLevel!)
        .map((e) => e.id)
        .toList();
    int bag(int i) => bagCounts[ids[i]] ?? 0;
    int need(int i) => needs[ids[i]] ?? 0;

    // how many of each rank the surplus below can craft.
    final craftable = List.filled(ids.length, 0);
    for (var i = 0; i < ids.length; i++) {
      effective[ids[i]] = bag(i) + craftable[i];
      if (i + 1 < ids.length) {
        craftable[i + 1] = max(effective[ids[i]]! - need(i), 0) ~/ craftRatio;
      }
    }

    // craft only what the deficits require, spending the tiers below.
    var crafted = 0;
    for (var i = ids.length - 1; i >= 0; i--) {
      final required = need(i) + crafted * craftRatio;
      crafted = min(max(required - bag(i), 0), craftable[i]);
      remaining[ids[i]] = bag(i) + crafted - required;
    }
  }

  return (effective: effective, remaining: remaining);
}
