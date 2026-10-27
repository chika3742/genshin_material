import "package:collection/collection.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../data/models/bag_counts.dart";
import "../../data/repositories/bag_counts_repository.dart";
import "../../data/services/hoyolab/hoyolab_game_api.dart";
import "../../models/bookmark.dart";
import "../../models/character.dart";
import "../../models/common.dart";
import "../../providers/database_provider.dart";
import "../../providers/versions.dart";

part "bookmark_bag_counts.g.dart";

typedef BookmarkBagCountsResult = ({bool isOverflowed, BagCounts bagCounts, Set<String> targetGroupHashes});

@riverpod
Future<BookmarkBagCountsResult?> bookmarkBagCounts(Ref ref) async {
  final bookmarks = ref.watch(bookmarksProvider()).value;
  final assetData = ref.watch(assetDataProvider).value;
  if (bookmarks == null || assetData == null) {
    return null;
  }

  final characterIds = <CharacterOrVariantId>{};
  final weaponVariantIdPairs = <(WeaponId, VariantId)>{};
  for (final b in bookmarks.sortedBy((b) => b.group.orderIndex)) {
    if (b.group.weaponId != null) {
      weaponVariantIdPairs.add((b.group.weaponId!, VariantId(b.group.characterId)));
    } else {
      characterIds.add(b.group.characterId);
    }
  }

  // A group bookmark merges into a bookmarked variant of the group, or falls
  // back to the group's first variant.
  CharacterVariant? resolveVariant(CharacterOrVariantId id) {
    if (assetData.variants[id] case final variant?) {
      return variant;
    }
    final groupVariants = assetData.characters[id]?.variants;
    return groupVariants?.firstWhereOrNull((v) => characterIds.contains(v.id))
        ?? groupVariants?.first;
  }

  final resolvedVariants = characterIds.map(resolveVariant).toSet();
  final filteredVariantIds = resolvedVariants
      .nonNulls
      .where((v) => !v.disableSync)
      .map((v) => v.id)
      .toList();
  final filteredWeaponPairs = weaponVariantIdPairs
      .where((e) => assetData.weapons[e.$1]?.disableSync == false)
      .toList();

  final truncatedVariantIds = filteredVariantIds.take(maxBatchComputeItems)
      .toList();
  final truncatedWeaponPairs = filteredWeaponPairs.take(maxBatchComputeItems)
      .toList();

  final isOverflowed = filteredVariantIds.length != truncatedVariantIds.length
      || filteredWeaponPairs.length != truncatedWeaponPairs.length;

  if (truncatedVariantIds.isEmpty && truncatedWeaponPairs.isEmpty) {
    return null;
  }

  final bagCounts = await ref.watch(bagCountsProvider(BagCountRequests(
    variantIds: truncatedVariantIds.toSet(),
    weaponIds: truncatedWeaponPairs.map((e) => e.$1).toList(),
  )).future);
  if (bagCounts == null) {
    return null;
  }

  bool isTarget(MaterialBookmark b) => switch (b.group.weaponId) {
    final weaponId? => truncatedWeaponPairs.contains((weaponId, b.group.characterId)),
    null => truncatedVariantIds.contains(resolveVariant(b.group.characterId)?.id),
  };

  return (
    isOverflowed: isOverflowed,
    bagCounts: bagCounts,
    targetGroupHashes: bookmarks.where(isTarget).map((e) => e.group.groupHash).toSet(),
  );
}
