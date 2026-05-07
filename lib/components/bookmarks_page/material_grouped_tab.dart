import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../i18n/strings.g.dart";
import "../../models/material_bookmark_frame.dart";
import "../../providers/versions.dart";
import "../../ui_core/snack_bar.dart";
import "../../view_models/bookmarks/material_grouped_bookmark_list_view_model.dart";
import "../center_text.dart";
import "../material_item.dart";
import "material_detail_bottom_sheet.dart";

class BookmarksMaterialGroupedTab extends ConsumerWidget {
  const BookmarksMaterialGroupedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final state = ref.watch(materialGroupedBookmarkListViewModelProvider);
    final entries = state.materials.entries.toList();

    if (entries.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }

    return ListView.separated(
      itemCount: entries.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final MapEntry(key: materialId, value: bookmarks) = entries[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            key: ValueKey(materialId),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: MaterialItem(
                  item: MaterialCardMaterial.fromBookmarks(bookmarks),
                  hashes: bookmarks.map((e) => e.item.hash).toList(),
                  expItems: bookmarks.first.group.weaponId == null
                      ? assetData.characterIngredients.expItems
                      : assetData.weaponIngredients.expItems,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Symbols.bookmark_remove),
                    onPressed: () async {
                      final undo = await ref.read(materialGroupedBookmarkListViewModelProvider.notifier)
                          .unbookmark(bookmarks);

                      if (context.mounted) {
                        showSnackBar(
                          context: context,
                          message: tr.materialCard.unBookmarked,
                          action: SnackBarAction(
                            label: tr.common.undo,
                            onPressed: undo,
                          ),
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Symbols.expand_content),
                    onPressed: () {
                      showMaterialBookmarkDetailBottomSheet(
                        context: context,
                        materialId: bookmarks.first.item.materialId,
                        hasWeapon: bookmarks.first.group.weaponId != null,
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
