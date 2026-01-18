import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../../../components/material_item.dart";
import "../../../../models/bookmark.dart";
import "../../../../models/material_bookmark_frame.dart";
import "../../../../providers/database_provider.dart";
import "../../../../providers/versions.dart";
import "../../../../ui_core/scroll_blur_effect.dart";
import "purpose_header.dart";

/// Bottom sheet that shows material bookmarks grouped by purpose
class MaterialBookmarkDetail extends StatelessWidget {
  const MaterialBookmarkDetail({
    super.key,
    required this.materialId,
    required this.hasWeapon,
  });

  final String? materialId;
  final bool hasWeapon;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      initialChildSize: 0.6,
      expand: false,
      snap: true,
      builder: (context, scrollController) {
        return HookConsumer(
          builder: (context, ref, child) {
            final assetData = ref.watch(assetDataProvider).value!;
            final bookmarks = ref
                .watch(bookmarksProvider(
                    materialFilter: (
                  materialId: materialId,
                  hasWeapon: hasWeapon,
                )))
                .value
                ?.cast<BookmarkWithMaterialDetails>();

            useValueChanged<bool?, void>(bookmarks?.isEmpty, (_, _) {
              if (bookmarks != null && bookmarks.isEmpty) {
                Navigator.of(context).pop();
              }
            });

            if (bookmarks == null || bookmarks.isEmpty) {
              return const SizedBox(width: double.infinity);
            }

            int sortByLevels(BookmarkWithMaterialDetails a,
                BookmarkWithMaterialDetails b) {
              return a.materialDetails.upperLevel -
                  b.materialDetails.upperLevel;
            }

            final groups = bookmarks
                .groupFoldBy<String, List<BookmarkWithMaterialDetails>>(
                  (e) => e.metadata.groupHash,
                  (prev, element) {
                    if (prev == null) {
                      return <BookmarkWithMaterialDetails>[element];
                    } else {
                      prev.add(element);
                      return prev;
                    }
                  },
                )
                .values
                .map((e) =>
                    BookmarkGroup.fromBookmarks(e.sorted(sortByLevels), assetData))
                .toList();

            final headerIndexes = [1];
            for (int i = 1; i < groups.length; i++) {
              headerIndexes.add(
                  headerIndexes.last + groups[i - 1].bookmarks.length + 1);
            }

            return ScrollBlurEffect(
              scrollController: scrollController,
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: 1 +
                    groups.length +
                    groups.fold(0, (v, e) => v + e.bookmarks.length),
                itemExtent: 64,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return MaterialItem(
                      item: MaterialCardMaterial.fromBookmarks(bookmarks
                          .map((e) => e.materialDetails)
                          .toList()),
                      hashes: bookmarks
                          .map((e) => e.materialDetails.hash)
                          .toList(),
                      expItems: bookmarks.first.materialDetails.weaponId == null
                          ? assetData.characterIngredients.expItems
                          : assetData.weaponIngredients.expItems,
                    );
                  }
                  final headerIndexesIndex =
                      headerIndexes.lastIndexWhere((i) => i <= index);
                  if (headerIndexes[headerIndexesIndex] == index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: PurposeHeader(group: groups[headerIndexesIndex]),
                    );
                  }

                  final bookmark = groups[headerIndexesIndex].bookmarks[
                      index - headerIndexes[headerIndexesIndex] - 1] as BookmarkWithMaterialDetails;
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, bottom: 2.0, top: 2.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: Text.rich(TextSpan(
                            children: [
                              const TextSpan(
                                  text: "Lv. ",
                                  style: TextStyle(fontSize: 18)),
                              TextSpan(
                                text: bookmark.materialDetails.upperLevel
                                    .toString(),
                                style: GoogleFonts.titilliumWeb(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          )),
                        ),
                        Flexible(
                          child: MaterialItem(
                            item: MaterialCardMaterial.fromBookmarks(
                                [bookmark.materialDetails]),
                            usage: MaterialUsage(
                              characterId: bookmark.metadata.characterId,
                              weaponId: bookmark.materialDetails.weaponId,
                            ),
                            expItems:
                                bookmark.materialDetails.weaponId == null
                                    ? assetData.characterIngredients.expItems
                                    : assetData.weaponIngredients.expItems,
                            hashes: [bookmark.materialDetails.hash],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
