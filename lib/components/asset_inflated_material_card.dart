import "package:collection/collection.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_ui/material_ui.dart";

import "../core/pref_keys.dart";
import "../models/common.dart";
import "../providers/asset_image_resolver.dart";
import "../providers/pref_notifier.dart";
import "../providers/versions.dart";
import "material_card.dart";

class AssetInflatedMaterialCard extends ConsumerWidget {
  /// Target type to determine the EXP configuration data. If [materialId] is
  /// not null, this will be ignored.
  final MaterialTargetType targetType;

  final String? materialId;
  final int quantity;
  final int? bagCountForMainItem;
  final int? farmCount;
  final BookmarkState? bookmarkState;
  final bool dailyMaterialAvailable;

  /// Callback for clicking the bookmark button.
  final void Function(int entryIndex)? onBookmark;

  const AssetInflatedMaterialCard({
    super.key,
    required this.targetType,
    required this.materialId,
    required this.quantity,
    this.bagCountForMainItem,
    this.bookmarkState,
    this.dailyMaterialAvailable = false,
    this.farmCount,
    this.onBookmark,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final images = ref.watch(assetImageResolverProvider);
    final showItemNameOnCard = ref.watch(prefProvider(PrefKeys.showItemNameOnCard));

    final List<MaterialCardEntry> entries = switch (materialId) {
      null => targetType.getExpItemConf(assetData).mapIndexed((i, expItem) {
        final material = assetData.materials[expItem.itemId]!;
        return MaterialCardEntry(
          id: expItem.itemId,
          image: images.getFile(material),
          name: showItemNameOnCard ? material.name.localized : null,
          rarity: material.rarity,
          quantity: (quantity / expItem.expPerItem).ceil(),
          // Only show bagCount for the first exp item
          bagCount: i == 0 ? bagCountForMainItem : null,
        );
      }).toList(),
      _ => () {
        final material = assetData.materials[materialId]!;
        return [MaterialCardEntry(
          id: material.id,
          image: images.getFile(material),
          name: showItemNameOnCard ? material.name.localized : null,
          rarity: material.rarity,
          quantity: quantity,
          bagCount: bagCountForMainItem,
        )];
      }(),
    };

    return MaterialCard(
      entries: entries,
      farmCount: farmCount,
      bookmarkState: bookmarkState,
      dailyMaterialAvailable: dailyMaterialAvailable,
      onBookmark: onBookmark,
    );
  }
}
