import "package:flutter/material.dart" hide Material;

import "../core/asset_cache.dart";
import "../models/bookmarkable_material.dart";
import "../models/common.dart";
import "../models/material.dart";
import "material_card.dart";

/// Material item implementation.
class MaterialItem extends StatefulWidget {
  final Material? material;
  final BookmarkableMaterial bookmarkableMaterial;

  const MaterialItem({
    super.key,
    this.material,
    required this.bookmarkableMaterial,
  });

  @override
  State<MaterialItem> createState() => _MaterialItemState();
}

class _MaterialItemState extends State<MaterialItem> {
  int _currentExpItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    final assetData = AssetDataCache.instance;
    final expItem = assetData.characterIngredients!.expItems[_currentExpItemIndex];
    final material = widget.material ?? assetData.materials!
        .firstWhere((e) => e.id == expItem.itemId);
    final quantity = widget.material != null ? widget.bookmarkableMaterial.sum : (widget.bookmarkableMaterial.sum / expItem.expPerItem).ceil();

    return MaterialCard(
      image: material.getImageFile(assetData.assetDir!),
      name: material.name.localized,
      rarity: material.rarity,
      quantity: quantity,
      id: material.id,
      bookmarkState: BookmarkState.none,
      onBookmark: () {},
      onSwap: widget.material == null ? () {
        setState(() {
          _currentExpItemIndex = (_currentExpItemIndex + 1) %
              assetData.characterIngredients!.expItems.length;
        });
      } : null,
    );
  }
}
