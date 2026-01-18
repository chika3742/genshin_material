import "dart:developer";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/center_text.dart";
import "../../components/material_item.dart";
import "../../core/asset_cache.dart";
import "../../db/bookmark_db_extension.dart";
import "../../db/bookmark_order_registry_db_extension.dart";
import "../../i18n/strings.g.dart";
import "../../models/bookmark.dart";
import "../../models/common.dart";
import "../../models/material_bookmark_frame.dart";
import "../../providers/database_provider.dart";
import "../../providers/versions.dart";
import "../../utils/bookmark_sorting.dart";
import "artifact_detail_widgets.dart";
import "bookmark_widgets.dart";
import "level_bookmark_detail.dart";

class PurposeGroupedBookmarkList extends ConsumerWidget {
  const PurposeGroupedBookmarkList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");
    final assetData = assetDataAsync.value!;

    final bookmarks = ref.watch(bookmarksProvider()).value ?? [];
    if (bookmarks.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }

    final bookmarkGroups = groupBookmarksByHash<String, BookmarkWithDetails>(
      bookmarks,
      (e) => e.metadata.groupHash,
    ).values.map((e) => BookmarkGroup.fromBookmarks(e, assetData)).toList();

    final bookmarkOrderSnapshot = ref.watch(bookmarkOrderProvider);
    final bookmarkOrder = bookmarkOrderSnapshot.value;

    if (bookmarkOrder != null) {
      sortBookmarkGroups(bookmarkGroups, bookmarkOrder);
    }

    return Stack(
      children: [
        ReorderableListView.builder(
          itemCount: bookmarkGroups.length,
          padding: const EdgeInsets.only(top: 8),
          onReorder: (oldIndex, newIndex) {
            if (bookmarkOrder == null) {
              return;
            }

            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            try {
              bookmarkOrder.insert(newIndex, bookmarkOrder.removeAt(oldIndex));
              // sort with new order to avoid flickering when reordering
              sortBookmarkGroups(bookmarkGroups, bookmarkOrder);

              final db = ref.read(appDatabaseProvider);
              db.updateBookmarkOrder(bookmarkOrder);
            } on RangeError catch (e, st) {
              log("Reorder failed: $oldIndex -> $newIndex, length: ${bookmarkOrder.length}", error: e, stackTrace: st);
            }
          },
          buildDefaultDragHandles: false,
          itemBuilder: (context, index) {
            final group = bookmarkGroups[index];

            return Padding(
              key: Key(group.hash),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // group header
                  Row(
                    children: [
                      ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Symbols.drag_handle, size: 32),
                      ),
                      Expanded(child: PurposeHeader(group: group)),
                    ],
                  ),
                  if (group.type == BookmarkType.material)
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (final items in sortBookmarks(group.bookmarks.cast<BookmarkWithMaterialDetails>(), assetData)
                              .groupListsBy((e) => e.materialDetails.materialId).values)
                          MaterialItem(
                            key: Key("${group.hash}:${items.first.materialDetails.materialId}"),
                            item: MaterialCardMaterial.fromBookmarks(items.map((e) => e.materialDetails).toList()),
                            usage: MaterialUsage(
                              characterId: group.characterId,
                              weaponId: items.first.materialDetails.weaponId,
                            ),
                            hashes: items.map((e) => e.materialDetails.hash).toList(),
                            expItems: items.first.materialDetails.weaponId == null
                                ? assetData.characterIngredients.expItems
                                : assetData.weaponIngredients.expItems,
                          ),
                        IconButton(
                          icon: const Icon(Symbols.expand_content),
                          iconSize: 28,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              showDragHandle: true,
                              isScrollControlled: true,
                              builder: (context) {
                                return LevelBookmarkDetail(groupHash: group.hash);
                              },
                            );
                          },
                        ),
                      ],
                    ),

                  if (group.type == BookmarkType.artifactSet)
                    ArtifactSetDetails(group.bookmarks.first as BookmarkWithArtifactSetDetails),

                  if (group.type == BookmarkType.artifactPiece)
                    ArtifactPieceDetails(group.bookmarks.first as BookmarkWithArtifactPieceDetails),

                  Visibility(
                    visible: index < bookmarkGroups.length - 1,
                    replacement: const SizedBox(height: 16),
                    child: const Divider(),
                  ),
                ],
              ),
            );
          },
        ),
        if (bookmarks.isEmpty) Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          child: Text(tr.bookmarksPage.noBookmarks, style: const TextStyle(
            fontSize: 16,
          ),),
        ),
      ],
    );
  }
}
