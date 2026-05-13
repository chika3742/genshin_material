import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../models/common.dart";
import "../providers/preferences.dart";
import "../providers/versions.dart";
import "material_card.dart";

class AssetInflatedMaterialCard extends ConsumerWidget {
  /// Target type to determine the EXP configuration data. If [materialId] is
  /// not null, this will be ignored.
  final MaterialTargetType targetType;

  final String? materialId;
  final int quantity;
  final int? lackNumForMainItem;
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
    this.lackNumForMainItem,
    this.bookmarkState,
    this.dailyMaterialAvailable = false,
    this.farmCount,
    this.onBookmark,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final showItemNameOnCard = ref.watch(preferencesStateProvider.select((s) => s.showItemNameOnCard));

    final List<MaterialCardEntry> entries = switch (materialId) {
      null => targetType.getExpItemConf(assetData).mapIndexed((i, expItem) {
        final material = assetData.materials[expItem.itemId]!;
        return MaterialCardEntry(
          id: expItem.itemId,
          image: material.getImageFile(assetData.assetDir),
          name: showItemNameOnCard ? material.name.localized : null,
          rarity: material.rarity,
          quantity: (quantity / expItem.expPerItem).ceil(),
          // Only show lackNum for the first exp item
          lackNum: i == 0 ? lackNumForMainItem : null,
        );
      }).toList(),
      _ => () {
        final material = assetData.materials[materialId]!;
        return [MaterialCardEntry(
          id: material.id,
          image: material.getImageFile(assetData.assetDir),
          name: showItemNameOnCard ? material.name.localized : null,
          rarity: material.rarity,
          quantity: quantity,
          lackNum: lackNumForMainItem,
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
