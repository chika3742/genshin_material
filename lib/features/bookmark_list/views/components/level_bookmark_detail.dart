import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../../../components/material_item.dart";
import "../../../../i18n/strings.g.dart";
import "../../../../models/bookmark.dart";
import "../../../../models/material_bookmark_frame.dart";
import "../../../../providers/database_provider.dart";
import "../../../../providers/versions.dart";
import "../../../../ui_core/bottom_sheet.dart";
import "../../../../ui_core/layout.dart";
import "../../utils/bookmark_sort_util.dart";

/// Bottom sheet that shows detailed level-by-level materials for a bookmark group
class LevelBookmarkDetail extends StatelessWidget {
  final String groupHash;

  const LevelBookmarkDetail({super.key, required this.groupHash});

  @override
  Widget build(BuildContext context) {
    return ScrollableBottomSheet(
      maxChildSize: 0.9,
      initialChildSize: 0.6,
      builder: (context) {
        return HookConsumer(
          builder: (context, ref, child) {
            final assetData = ref.watch(assetDataProvider).value!;
            final bookmarks = ref
                .watch(bookmarksProvider(groupHash: groupHash))
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

            final levels =
                bookmarks.groupListsBy((e) => e.materialDetails.upperLevel);

            return Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, bottom: 16.0, right: 16.0),
              child: Column(
                spacing: 8.0,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Transform.translate(
                    offset: const Offset(-8, 0),
                    child: SectionInnerHeading(tr.purposes[
                        bookmarks.first.materialDetails.purposeType.name]!),
                  ),
                  for (final level
                      in levels.entries.sorted((a, b) => a.key.compareTo(b.key))) ...[
                    Text("Lv. ${level.key}",
                        style: GoogleFonts.titilliumWeb(fontSize: 20)),
                    Wrap(
                      children: [
                        for (final item
                            in sortBookmarks(level.value, assetData))
                          MaterialItem(
                            item: MaterialCardMaterial.fromBookmarks(
                                [item.materialDetails]),
                            usage: MaterialUsage(
                              characterId: item.metadata.characterId,
                              weaponId: item.materialDetails.weaponId,
                            ),
                            expItems: item.materialDetails.weaponId == null
                                ? assetData.characterIngredients.expItems
                                : assetData.weaponIngredients.expItems,
                            hashes: [item.materialDetails.hash],
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
