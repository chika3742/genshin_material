import "package:flutter/material.dart" hide Material;
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../models/bookmarkable_material.dart";
import "../models/common.dart";
import "../models/material.dart";
import "../providers/database_provider.dart";
import "../providers/versions.dart";
import "material_card.dart";

/// Material item implementation.
class MaterialItem extends ConsumerStatefulWidget {
  final BookmarkableMaterial bookmarkableMaterial;

  const MaterialItem({
    super.key,
    required this.bookmarkableMaterial,
  });

  @override
  ConsumerState<MaterialItem> createState() => _MaterialItemState();
}

class _MaterialItemState extends ConsumerState<MaterialItem> {
  int _currentExpItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    final assetCache = ref.watch(assetDataProvider).value;
    if (assetCache == null) {
      return const SizedBox();
    }

    final assetData = assetCache.data!;
    final assetDir = assetCache.assetDir;

    Material material;
    int quantity;
    if (widget.bookmarkableMaterial.isExp) {
      final expItem = assetData.characterIngredients.expItems[_currentExpItemIndex];
      material = assetData.materials[expItem.itemId]!;
      quantity = (widget.bookmarkableMaterial.sum / expItem.expPerItem).ceil();
    } else {
      material = widget.bookmarkableMaterial.material;
      quantity = widget.bookmarkableMaterial.sum;
    }

    return MaterialCard(
      image: material.getImageFile(assetDir),
      name: material.name.localized,
      rarity: material.rarity,
      quantity: quantity,
      id: material.id,
      bookmarkState: BookmarkState.none,
      onBookmark: () {},
      onSwapExpItem: widget.bookmarkableMaterial.isExp ? () {
        setState(() {
          _currentExpItemIndex = (_currentExpItemIndex + 1) %
              assetData.characterIngredients.expItems.length;
        });
      } : null,
    );
  }
}
