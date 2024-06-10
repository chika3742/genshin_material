import "package:flutter/material.dart" hide Material;
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../database.dart";
import "../i18n/strings.g.dart";
import "../models/common.dart";
import "../models/material.dart";
import "../models/material_bookmark_frame.dart";
import "../providers/database_provider.dart";
import "../providers/versions.dart";
import "layout.dart";
import "material_card.dart";

/// Material item implementation.
class MaterialItem extends StatefulHookConsumerWidget {
  final MaterialCardMaterial item;
  final MaterialUsage usage;
  final List<Purpose> possiblePurposeTypes;

  const MaterialItem({
    super.key,
    required this.item,
    required this.usage,
    required this.possiblePurposeTypes,
  });

  @override
  ConsumerState<MaterialItem> createState() => _MaterialItemState();
}

class _MaterialItemState extends ConsumerState<MaterialItem> {
  int _currentExpItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bookmarkedMaterials = useStream(
      useMemoized(
        () => ref.watch(appDatabaseProvider).watchMaterialBookmarkByPartial(
              characterId: widget.usage.characterId,
              materialId: widget.item.id,
              purposeTypes: widget.possiblePurposeTypes,
              bookmarkType: widget.usage.type,
            ),
      ),
    );

    final assetCache = ref.watch(assetDataProvider).value;
    if (assetCache == null) {
      return const SizedBox();
    }

    final assetData = assetCache.data!;
    final assetDir = assetCache.assetDir;


    Material material;
    int quantity;
    if (widget.item.isExp) {
      final expItem = assetData.characterIngredients.expItems[_currentExpItemIndex];
      material = assetData.materials[expItem.itemId]!;
      quantity = (widget.item.sum / expItem.expPerItem).ceil();
    } else {
      material = widget.item.getMaterial(assetData);
      quantity = widget.item.sum;
    }

    final bookmarkState = () {
      if (bookmarkedMaterials.data == null || bookmarkedMaterials.data!.isEmpty) {
        return BookmarkState.none;
      }
      if (bookmarkedMaterials.data!.length != widget.item.levels.length) {
        return BookmarkState.partial;
      }
      return BookmarkState.bookmarked;
    }();

    return MaterialCard(
      image: material.getImageFile(assetDir),
      name: material.name.localized,
      rarity: material.rarity,
      quantity: quantity,
      id: material.id,
      bookmarkState: bookmarkState,
      onBookmark: () async {
        final db = ref.read(appDatabaseProvider);

        switch (bookmarkState) {
          case BookmarkState.none:
            await db.addMaterialBookmarks(widget.item.toCompanions(widget.usage));
            break;
          case BookmarkState.partial:
            final result = await showPartialBookmarkBottomSheet(bookmarkedMaterials.data!);
            if (result == PartialBookmarkBottomSheetResult.reBookmark) {
              await db.removeMaterialBookmarks(bookmarkedMaterials.data!.map((e) => e.id).toList());
              await db.addMaterialBookmarks(widget.item.toCompanions(widget.usage));
            } else if (result == PartialBookmarkBottomSheetResult.remove) {
              await db.removeMaterialBookmarks(bookmarkedMaterials.data!.map((e) => e.id).toList());
            }
            break;
          case BookmarkState.bookmarked:
            await db.removeMaterialBookmarks(bookmarkedMaterials.data!.map((e) => e.id).toList());
            break;
        }
      },
      onSwapExpItem: widget.item.isExp ? () {
        setState(() {
          _currentExpItemIndex = (_currentExpItemIndex + 1) %
              assetData.characterIngredients.expItems.length;
        });
      } : null,
    );
  }

  Future<PartialBookmarkBottomSheetResult?> showPartialBookmarkBottomSheet(List<MaterialBookmarkData> bookmarkedMaterials) async {
    final assetData = ref.read(assetDataProvider).value?.data;
    if (assetData == null) {
      return null;
    }

    return await showModalBottomSheet<PartialBookmarkBottomSheetResult>(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (_) {
        return _PartialBookmarkBottomSheet(
          materialId: widget.item.id,
          bookmarkedMaterials: bookmarkedMaterials,
          currentQuantity: widget.item.sum,
          expItemIndex: _currentExpItemIndex,
        );
      },
    );
  }
}

class _PartialBookmarkBottomSheet extends ConsumerWidget {
  final String? materialId;
  final int expItemIndex;
  final List<MaterialBookmarkData> bookmarkedMaterials;
  final int currentQuantity;

  const _PartialBookmarkBottomSheet({
    required this.materialId,
    required this.bookmarkedMaterials,
    required this.currentQuantity,
    this.expItemIndex = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetCache = ref.watch(assetDataProvider).value;
    final assetData = assetCache?.data;
    if (assetData == null) {
      return const SizedBox();
    }

    final expItem = assetData.characterIngredients.expItems[expItemIndex];
    final itemId = materialId ?? expItem.itemId;
    int processQuantity(int quantity) {
      if (materialId == null) {
        return (quantity / expItem.expPerItem).ceil();
      }
      return quantity;
    }

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GappedRow(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              gap: 4,
              children: [
                const Icon(Icons.bookmark_added),
                Image.file(
                  assetData.materials[itemId]!.getImageFile(assetCache!.assetDir),
                  width: 28,
                  height: 28,
                ),
                Text(
                  "x${processQuantity(bookmarkedMaterials.fold(0, (prev, e) => prev + e.quantity))}",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                const SizedBox(width: 16),

                const Icon(Symbols.sliders),
                Image.file(
                  assetData.materials[itemId]!.getImageFile(assetCache.assetDir),
                  width: 28,
                  height: 28,
                ),
                Text(
                  "x${processQuantity(currentQuantity)}",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.bookmark_add),
            title: Text(tr.materialCard.reBookmark),
            subtitle: Text(tr.materialCard.reBookmarkDesc),
            onTap: () => Navigator.of(context).pop(PartialBookmarkBottomSheetResult.reBookmark),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_remove_outlined),
            title: Text(tr.materialCard.unBookmark),
            subtitle: Text(tr.materialCard.unBookmarkDesc),
            onTap: () => Navigator.of(context).pop(PartialBookmarkBottomSheetResult.remove),
          ),
        ],
      ),
    );
  }
}

enum PartialBookmarkBottomSheetResult {
  reBookmark,
  remove,
}
