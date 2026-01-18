import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/center_text.dart";
import "../../components/material_item.dart";
import "../../core/asset_cache.dart";
import "../../database.dart";
import "../../db/bookmark_db_extension.dart";
import "../../i18n/strings.g.dart";
import "../../models/bookmark.dart";
import "../../models/material_bookmark_frame.dart";
import "../../providers/database_provider.dart";
import "../../providers/versions.dart";
import "../../ui_core/snack_bar.dart";
import "../../utils/bookmark_sorting.dart";
import "material_bookmark_detail.dart";

class MaterialGroupedBookmarkList extends ConsumerWidget {
  const MaterialGroupedBookmarkList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;
    final bookmarks = ref.watch(bookmarksProvider()).value ?? [];
    if (bookmarks.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }

    final bookmarkMaterials = groupBookmarksByHash<String?, BookmarkWithMaterialDetails>(
      sortBookmarks(bookmarks.whereType<BookmarkWithMaterialDetails>(), assetData),
      (e) => e.materialDetails.materialId ?? (e.materialDetails.weaponId != null).toString(),
    );

    return ListView.separated(
      itemCount: bookmarkMaterials.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final bookmarks = bookmarkMaterials.values.elementAt(index);
        final assetData = ref.watch(assetDataProvider).value!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            key: ValueKey(bookmarks.first.materialDetails.materialId),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: MaterialItem(
                  item: MaterialCardMaterial.fromBookmarks(bookmarks.map((e) => e.materialDetails).toList()),
                  hashes: bookmarks.map((e) => e.materialDetails.hash).toList(),
                  expItems: bookmarks.first.materialDetails.weaponId == null
                      ? assetData.characterIngredients.expItems
                      : assetData.weaponIngredients.expItems,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Symbols.bookmark_remove),
                    onPressed: () async {
                      final db = ref.read(appDatabaseProvider);
                      await db.removeBookmarks(bookmarks.map((e) => e.metadata.id).toList());

                      if (context.mounted) {
                        showSnackBar(
                          context: context,
                          message: tr.materialCard.unBookmarked,
                          action: SnackBarAction(
                            label: tr.common.undo,
                            onPressed: () {
                              db.addMaterialBookmarks(bookmarks.map((e) => MaterialBookmarkInsertable(
                                metadataId: e.metadata.id,
                                characterId: e.metadata.characterId,
                                weaponId: e.materialDetails.weaponId,
                                materialId: e.materialDetails.materialId,
                                upperLevel: e.materialDetails.upperLevel,
                                purposeType: e.materialDetails.purposeType,
                                quantity: e.materialDetails.quantity,
                              ),).toList(),);
                            },
                          ),
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Symbols.expand_content),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (context) {
                          return MaterialBookmarkDetail(
                            materialId: bookmarks.first.materialDetails.materialId,
                            hasWeapon: bookmarks.first.materialDetails.weaponId != null,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
