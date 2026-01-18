import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/center_text.dart";
import "../../../components/material_item.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/material_bookmark_frame.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/versions.dart";
import "../viewmodels/material_grouped_bookmark_viewmodel.dart";
import "components/material_bookmark_detail.dart";

/// View that displays bookmarks grouped by material type
class MaterialGroupedBookmarkView extends ConsumerWidget {
  const MaterialGroupedBookmarkView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;
    final bookmarks = ref.watch(bookmarksProvider()).value ?? [];
    if (bookmarks.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }

    final viewModel =
        ref.read(materialGroupedBookmarkViewModelProvider.notifier);
    final bookmarkMaterials =
        viewModel.groupBookmarksByMaterial(bookmarks, assetData);

    return ListView.separated(
      itemCount: bookmarkMaterials.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final bookmarkList = bookmarkMaterials.values.elementAt(index);
        final assetData = ref.watch(assetDataProvider).value!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            key: ValueKey(bookmarkList.first.materialDetails.materialId),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: MaterialItem(
                  item: MaterialCardMaterial.fromBookmarks(
                      bookmarkList.map((e) => e.materialDetails).toList()),
                  hashes: bookmarkList
                      .map((e) => e.materialDetails.hash)
                      .toList(),
                  expItems: bookmarkList.first.materialDetails.weaponId == null
                      ? assetData.characterIngredients.expItems
                      : assetData.weaponIngredients.expItems,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Symbols.bookmark_remove),
                    onPressed: () async {
                      await viewModel.removeBookmarksWithUndo(
                        context: context,
                        bookmarks: bookmarkList,
                      );
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
                            materialId:
                                bookmarkList.first.materialDetails.materialId,
                            hasWeapon:
                                bookmarkList.first.materialDetails.weaponId !=
                                    null,
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
