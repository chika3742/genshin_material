import "package:collection/collection.dart";

import "../core/asset_cache.dart";
import "../models/bookmark.dart";

/// Sort bookmarks by material priority
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

/// Sort bookmark groups by the provided order
void sortBookmarkGroups(List<BookmarkGroup> groups, List<String> order) {
  groups.sort((a, b) => order.indexOf(a.hash).compareTo(order.indexOf(b.hash)));
}

/// Sort bookmarks by level (ascending)
int sortByLevels(BookmarkWithMaterialDetails a, BookmarkWithMaterialDetails b) {
  return a.materialDetails.upperLevel - b.materialDetails.upperLevel;
}

/// Group bookmarks by a common hash into lists
Map<K, List<T>> groupBookmarksByHash<K, T>(
  Iterable<T> items,
  K Function(T) keySelector,
) {
  return items.groupFoldBy<K, List<T>>(
    keySelector,
    (prev, element) {
      if (prev == null) {
        return <T>[element];
      } else {
        prev.add(element);
        return prev;
      }
    },
  );
}
