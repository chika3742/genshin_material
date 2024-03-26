import "package:flutter/material.dart" hide Material;

import "../core/asset_cache.dart";
import "../models/bookmarkable_material.dart";
import "../models/character_ingredients.dart";
import "../models/common.dart";
import "../models/material.dart";
import "material_card.dart";

/// Material item implementation.
class MaterialItem extends StatefulWidget {
  final Material? material;
  final BookmarkableMaterial bookmarkableMaterial;
  final List<ExpItem>? expItems;

  const MaterialItem({
    super.key,
    required this.bookmarkableMaterial,
    this.material,
    this.expItems,
  });

  @override
  State<MaterialItem> createState() => _MaterialItemState();
}

class _MaterialItemState extends State<MaterialItem> {
  int _currentExpItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    final assetData = AssetDataCache.instance;

    Material material;
    int quantity;
    if (widget.material != null) {
      material = widget.material!;
      quantity = widget.bookmarkableMaterial.sum;
    } else {
      final expItem = widget.expItems![_currentExpItemIndex];
      material = assetData.materials!
          .firstWhere((e) => e.id == expItem.itemId);
      quantity = (widget.bookmarkableMaterial.sum / expItem.expPerItem).ceil();
    }

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
