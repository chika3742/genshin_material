import "package:collection/collection.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/asset_cache.dart";
import "../db/bookmark_db_extension.dart";
import "../models/bookmark.dart";
import "../models/common.dart";
import "../models/farming_efficiency.dart";
import "../models/localized_text.dart";
import "../models/material.dart";
import "database_provider.dart";
import "versions.dart";

part "farming_efficiency.g.dart";

/// Provider that analyzes farming efficiency based on active bookmarks
@riverpod
Future<FarmingEfficiencyAnalysis> farmingEfficiencyAnalysis(FarmingEfficiencyAnalysisRef ref) async {
  final assetData = await ref.watch(assetDataProvider.future);
  final bookmarks = await ref.watch(bookmarksProvider().future);

  // Filter only material bookmarks
  final materialBookmarks = bookmarks
      .whereType<BookmarkWithMaterialDetails>()
      .toList();

  // Group bookmarks by material
  final materialQuantities = <MaterialId, int>{};
  for (final bookmark in materialBookmarks) {
    final materialId = bookmark.materialDetails.materialId;
    if (materialId != null) {
      materialQuantities[materialId] = (materialQuantities[materialId] ?? 0) + bookmark.materialDetails.quantity;
    }
  }

  // Analyze talent domains
  final talentDomains = _analyzeDomains(
    assetData.dailyMaterials.talent,
    materialQuantities,
    assetData,
  );

  // Analyze weapon domains
  final weaponDomains = _analyzeDomains(
    assetData.dailyMaterials.weapon,
    materialQuantities,
    assetData,
  );

  return FarmingEfficiencyAnalysis(
    talentDomains: talentDomains,
    weaponDomains: weaponDomains,
    totalBookmarks: materialBookmarks.length,
    analyzedAt: DateTime.now(),
  );
}

/// Analyzes domains and calculates efficiency scores
List<DomainEfficiency> _analyzeDomains(
  Map<String, List<DailyMaterial>> dailyMaterials,
  Map<MaterialId, int> materialQuantities,
  AssetData assetData,
) {
  final domainEfficiencies = <DomainEfficiency>[];

  for (final entry in dailyMaterials.entries) {
    final dayKey = entry.key;
    final dailyMaterialList = entry.value;

    for (final dailyMaterial in dailyMaterialList) {
      // Calculate efficiency for this domain
      final materialEfficiencies = <MaterialEfficiency>[];
      var totalQuantity = 0;
      var efficiencyScore = 0.0;

      for (final materialId in dailyMaterial.items) {
        final quantity = materialQuantities[materialId] ?? 0;
        if (quantity > 0) {
          final material = assetData.materials[materialId];
          if (material != null) {
            final rarity = material.rarity;
            // Weight by rarity: higher rarity = higher priority
            final weightedScore = quantity * (rarity / 5.0);
            
            materialEfficiencies.add(MaterialEfficiency(
              materialId: materialId,
              materialName: material.name,
              bookmarkedQuantity: quantity,
              rarity: rarity,
              weightedScore: weightedScore,
            ));

            totalQuantity += quantity;
            efficiencyScore += weightedScore;
          }
        }
      }

      // Only include domains with bookmarked materials
      if (materialEfficiencies.isNotEmpty) {
        // Extract days from the dayKey (e.g., "monday|thursday" -> ["monday", "thursday", "sunday"])
        final days = dayKey.split("|").toList()..add("sunday");

        domainEfficiencies.add(DomainEfficiency(
          domainId: dayKey,
          domainName: dailyMaterial.description,
          availableDays: days,
          efficiencyScore: efficiencyScore,
          materials: materialEfficiencies,
          totalBookmarkedQuantity: totalQuantity,
        ));
      }
    }
  }

  // Sort by efficiency score (highest first)
  domainEfficiencies.sort((a, b) => b.efficiencyScore.compareTo(a.efficiencyScore));
  return domainEfficiencies;
}
