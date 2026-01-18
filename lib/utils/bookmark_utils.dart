import "package:collection/collection.dart";
import "../core/asset_cache.dart";
import "../models/bookmark.dart";

/// Bookmark-related utility functions
class BookmarkUtils {
  /// Groups bookmarks by their group hash
  static List<BookmarkGroup> groupBookmarks(
    List<BookmarkWithDetails> bookmarks,
    AssetData assetData,
  ) {
    return bookmarks
        .groupFoldBy<String, List<BookmarkWithDetails>>(
          (e) => e.metadata.groupHash,
          (prev, element) {
            if (prev == null) {
              return <BookmarkWithDetails>[element];
            } else {
              prev.add(element);
              return prev;
            }
          },
        )
        .values
        .map((e) => BookmarkGroup.fromBookmarks(e, assetData))
        .toList();
  }

  /// Sorts bookmark groups by the specified order
  static void sortBookmarkGroups(
    List<BookmarkGroup> groups,
    List<String> order,
  ) {
    groups.sort(
      (a, b) => order.indexOf(a.hash).compareTo(order.indexOf(b.hash)),
    );
  }

  /// Sorts material bookmarks by priority
  static List<BookmarkWithMaterialDetails> sortMaterialBookmarks(
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
}
