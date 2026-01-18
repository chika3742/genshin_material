import "package:collection/collection.dart";

import "../../../core/asset_cache.dart";
import "../../../models/bookmark.dart";

/// Sorts material bookmarks based on material priority and hyvId.
/// 
/// Materials are sorted by:
/// 1. Material sort priority (from AssetData)
/// 2. Material hyvId (for same priority items)
List<BookmarkWithMaterialDetails> sortBookmarks(
  Iterable<BookmarkWithMaterialDetails> bookmarks,
  AssetData assetData,
) {
  return bookmarks.sorted((a, b) {
    final aMaterial = assetData.materials[a.materialDetails.materialId];
    final bMaterial = assetData.materials[b.materialDetails.materialId];

    if (aMaterial == null && bMaterial == null) return 0;
    if (aMaterial == null) return -1;
    if (bMaterial == null) return 1;

    final aPriority = aMaterial.getSortPriority(assetData);
    final bPriority = bMaterial.getSortPriority(assetData);

    if (aPriority == bPriority) {
      return aMaterial.hyvId.compareTo(bMaterial.hyvId);
    }

    return aPriority.compareTo(bPriority);
  });
}
