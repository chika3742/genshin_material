import "package:collection/collection.dart";
import "package:flutter/material.dart" hide Material;
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../db/bookmark_db_extension.dart";
import "../db/material_card_to_companions.dart";
import "../i18n/strings.g.dart";
import "../models/bookmark.dart";
import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/material_bookmark_frame.dart";
import "../providers/database_provider.dart";
import "../providers/preferences.dart";
import "../providers/versions.dart";
import "../ui_core/snack_bar.dart";
import "../utils/farm_counts.dart";
import "material_card.dart";

/// Material item implementation.
class MaterialItem extends HookConsumerWidget {
  final MaterialCardMaterial item;
  final MaterialUsage? usage;
  final List<Purpose>? possiblePurposeTypes;
  final List<ExpItem>? expItems;
  final List<String>? hashes;
  final int? lackNum;

  const MaterialItem({
    super.key,
    required this.item,
    this.usage,
    this.possiblePurposeTypes,
    this.expItems,
    this.hashes,
    this.lackNum,
  })  : assert(hashes != null || (possiblePurposeTypes != null && usage != null));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(!item.isExp || expItems != null, "expItems must be provided when displaying exp items.");

    final db = ref.watch(appDatabaseProvider);
    final (
      adventureRank,
      condensedMultiplier,
      dailyResetServer,
      showFarmCount,
      showItemNameOnCard,
    ) = ref.watch(preferencesStateProvider.select((s) => (
      s.adventureRank,
      s.condensedMultiplier,
      s.dailyResetServer,
      s.showFarmCount,
      s.showItemNameOnCard,
    )));

    final bookmarkedMaterials = useStream(
      useMemoized(
        () {
          return hashes == null && usage != null
              ? db.watchMaterialBookmarksPartially(
                  characterId: usage!.characterId,
                  weaponId: usage!.weaponId,
                  materialId: item.id,
                  purposeTypes: possiblePurposeTypes!,
                )
              : db.watchMaterialBookmarksByHashes(hashes!);
        },
        [
          db,
          usage,
          item.id,
          const ListEquality().hash(possiblePurposeTypes),
          hashes,
        ],
      ),
    );

    final assetData = ref.watch(assetDataProvider).value;
    if (assetData == null) {
      return const SizedBox();
    }

    final List<MaterialCardEntry> entries = switch (item.isExp) {
      true => expItems!.mapIndexed((i, expItem) {
        final material = assetData.materials[expItem.itemId]!;
        return MaterialCardEntry(
          id: expItem.itemId,
          image: material.getImageFile(assetData.assetDir),
          name: showItemNameOnCard ? material.name.localized : null,
          rarity: material.rarity,
          quantity: (item.sum / expItem.expPerItem).ceil(),
          // Only show lackNum for the first exp item
          lackNum: i == 0 ? lackNum : null,
        );
      }).toList(),
      false => () {
        final material = item.getMaterial(assetData);
        return [MaterialCardEntry(
          id: material.id,
          image: material.getImageFile(assetData.assetDir),
          name: showItemNameOnCard ? material.name.localized : null,
          rarity: material.rarity,
          quantity: item.sum,
          lackNum: lackNum,
        )];
      }(),
    };

    final bookmarkState = () {
      if (bookmarkedMaterials.data == null || bookmarkedMaterials.data!.isEmpty) {
        return BookmarkState.none;
      }
      if (bookmarkedMaterials.data!.length != item.levels.length) {
        return BookmarkState.partial;
      }
      return BookmarkState.bookmarked;
    }();

    final referenceMaterial = item.isExp
        ? assetData.materials[expItems!.first.itemId]!
        : item.getMaterial(assetData);

    final farmCount = showFarmCount
        ? calculateFarmCount(
            referenceMaterial,
            assetData.dropRates,
            item.sum,
            adventureRank,
            condensedMultiplier,
          )
        : null;

    return MaterialCard(
      entries: entries,
      farmCount: farmCount,
      bookmarkState: bookmarkState,
      dailyMaterialAvailable: referenceMaterial
          .getDailyMaterialAvailable(dailyResetServer),
      onBookmark: usage != null ? (entryIndex) async {
        final db = ref.read(appDatabaseProvider);

        switch (bookmarkState) {
          case BookmarkState.none:
            await db.addMaterialBookmarks(materialCardToCompanions(item, usage!));
            break;
          case BookmarkState.partial:
            final result = await showPartialBookmarkBottomSheet(context, bookmarkedMaterials.data!, entryIndex);
            if (result == PartialBookmarkBottomSheetResult.reBookmark) {
              await db.removeMaterialBookmarksByHashes(bookmarkedMaterials.data!.map((e) => e.item.hash).toList());
              await db.addMaterialBookmarks(materialCardToCompanions(item, usage!));
            } else if (result == PartialBookmarkBottomSheetResult.remove) {
              await db.removeMaterialBookmarksByHashes(bookmarkedMaterials.data!.map((e) => e.item.hash).toList());
            }
            break;
          case BookmarkState.bookmarked:
            await db.removeMaterialBookmarksByHashes(bookmarkedMaterials.data!.map((e) => e.item.hash).toList());
            if (context.mounted) {
              final companions = materialCardToCompanions(item, usage!);
              showSnackBar(
                context: context,
                message: tr.materialCard.unBookmarked,
                action: SnackBarAction(
                  label: tr.common.undo,
                  onPressed: () {
                    db.addMaterialBookmarks(companions);
                  },
                ),
              );
            }
            break;
        }
      } : null,
    );
  }

  Future<PartialBookmarkBottomSheetResult?> showPartialBookmarkBottomSheet(
    BuildContext context,
    List<BookmarkWithMaterialDetails> bookmarkedMaterials,
    int expItemIndex,
  ) async {
    return await showModalBottomSheet<PartialBookmarkBottomSheetResult>(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (_) {
        return _PartialBookmarkBottomSheet(
          materialId: item.id,
          bookmarkedMaterials: bookmarkedMaterials,
          currentQuantity: item.sum,
          expItems: expItems,
          expItemIndex: expItemIndex,
        );
      },
    );
  }
}

class _PartialBookmarkBottomSheet extends ConsumerWidget {
  final String? materialId;
  final int expItemIndex;
  final List<ExpItem>? expItems;
  final List<BookmarkWithMaterialDetails> bookmarkedMaterials;
  final int currentQuantity;

  const _PartialBookmarkBottomSheet({
    required this.materialId,
    required this.bookmarkedMaterials,
    required this.currentQuantity,
    this.expItems,
    this.expItemIndex = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value;
    if (assetData == null) {
      return const SizedBox();
    }

    final expItem = (expItems ?? assetData.characterIngredients.expItems)[expItemIndex];
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                const Icon(Icons.bookmark_added),
                Image.file(
                  assetData.materials[itemId]!.getImageFile(assetData.assetDir),
                  width: 28,
                  height: 28,
                ),
                Text(
                  "x${processQuantity(bookmarkedMaterials.fold(0, (prev, e) => prev + e.item.quantity))}",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                const SizedBox(width: 16),

                const Icon(Symbols.sliders),
                Image.file(
                  assetData.materials[itemId]!.getImageFile(assetData.assetDir),
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
