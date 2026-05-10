import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../i18n/strings.g.dart";
import "../../models/bookmark.dart";
import "../../models/common.dart";
import "../../models/material_bookmark_frame.dart";
import "../../providers/versions.dart";
import "../../routes.dart";
import "../../view_models/bookmarks/purpose_grouped_bookmark_list_view_model.dart";
import "../center_text.dart";
import "../material_item.dart";
import "item_link_button.dart";
import "list_item_container.dart";
import "purpose_detail_bottom_sheet.dart";

class BookmarksPurposeGroupedTab extends ConsumerWidget {
  const BookmarksPurposeGroupedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(purposeGroupedBookmarkListViewModelProvider);
    final assetData = ref.watch(assetDataProvider).requireValue;

    if (state.groups.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }

    return ReorderableListView.builder(
      itemCount: state.groups.length,
      padding: const EdgeInsets.only(top: 8),
      onReorder: ref.read(purposeGroupedBookmarkListViewModelProvider.notifier).reorder,
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final group = state.groups[index];

        return Column(
          key: ValueKey(group.hash),
          children: [
            BookmarkListItemContainer(
              index: index,
              group: group,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (final MapEntry(key: materialId, value: items) in state.sortedBookmarks[group.hash]?.entries ?? {})
                    MaterialItem(
                      key: ValueKey("${group.hash}:$materialId"),
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
                      showPurposeBookmarkDetailBottomSheet(
                        context: context,
                        groupHash: group.hash,
                      );
                    },
                  ),

                  if (group.type == BookmarkType.artifactSet)
                    _ArtifactSetDetails(group.bookmarks.first as BookmarkWithArtifactSetDetails),

                  if (group.type == BookmarkType.artifactPiece)
                    _ArtifactPieceDetails(group.bookmarks.first as BookmarkWithArtifactPieceDetails),
                ],
              ),
            ),
            if (index < state.groups.length - 1)
              Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}

class _ArtifactSetDetails extends ConsumerWidget {
  final BookmarkWithArtifactSetDetails bookmark;

  const _ArtifactSetDetails(this.bookmark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        Row(
          children: [
            for (final set in bookmark.artifactSetDetails.sets)
              Flexible(
                child: ItemLinkButton(
                  onTap: () {
                    ArtifactDetailsRoute(id: set).push(context);
                  },
                  child: Row(
                    children: [
                      Image.file(
                        assetData.artifactSets[set]!
                            .getFirstPiece(assetData)
                            .getImageFile(assetData.assetDir),
                        width: 35,
                        height: 35,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Wrap(
                          spacing: 8,
                          children: [
                            Text(assetData.artifactSets[set]!.name.localized),
                            Text("(${tr.artifactDetailsPage.nSet(n: 4 ~/ bookmark.artifactSetDetails.sets.length)})"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),

        for (final e in bookmark.artifactSetDetails.mainStats.entries)
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "${tr.bookmarksPage.main} (${assetData.artifactPieceTypes[e.key]!.desc.localized})",
              ),
              const TextSpan(text: ": "),
              TextSpan(text: assetData.stats[e.value]!.localized, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),

        if (bookmark.artifactSetDetails.subStats.isNotEmpty)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.sub),
              const TextSpan(text: ": "),
              TextSpan(text: bookmark.artifactSetDetails.subStats.map((e) => assetData.stats[e]!.localized).join(", "), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
      ],
    );
  }
}

class _ArtifactPieceDetails extends ConsumerWidget {
  final BookmarkWithArtifactPieceDetails bookmark;

  const _ArtifactPieceDetails(this.bookmark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    final pieceId = bookmark.artifactPieceDetails.piece;
    final setId = assetData.artifactPieces[pieceId]!.parentId;

    final piece = assetData.artifactPieces[pieceId]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        ItemLinkButton(
          onTap: () {
            ArtifactDetailsRoute(id: setId).push(context);
          },
          child: Row(
            children: [
              Image.file(piece.getImageFile(assetData.assetDir), width: 35, height: 35),
              const SizedBox(width: 8),
              Flexible(
                child: Wrap(
                  spacing: 8,
                  children: [
                    Text(piece.name.localized),
                    Text("(${assetData.artifactPieceTypes[piece.type]!.desc.localized})"),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (bookmark.artifactPieceDetails.mainStat != null)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.main),
              const TextSpan(text: ": "),
              TextSpan(text: assetData.stats[bookmark.artifactPieceDetails.mainStat]!.localized, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),

        if (bookmark.artifactPieceDetails.subStats.isNotEmpty)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.sub),
              const TextSpan(text: ": "),
              TextSpan(text: bookmark.artifactPieceDetails.subStats.map((e) => assetData.stats[e]!.localized).join(", "), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
      ],
    );
  }
}
