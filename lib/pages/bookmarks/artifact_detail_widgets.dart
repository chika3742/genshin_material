import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../core/asset_cache.dart";
import "../../i18n/strings.g.dart";
import "../../models/bookmark.dart";
import "../../providers/versions.dart";
import "../../routes.dart";
import "bookmark_widgets.dart";

/// Displays artifact set bookmark details
class ArtifactSetDetails extends ConsumerWidget {
  final BookmarkWithArtifactSetDetails bookmark;

  const ArtifactSetDetails(this.bookmark, {super.key});

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
          ),),

        if (bookmark.artifactSetDetails.subStats.isNotEmpty)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.sub),
              const TextSpan(text: ": "),
              TextSpan(text: bookmark.artifactSetDetails.subStats.map((e) => assetData.stats[e]!.localized).join(", "), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),),
      ],
    );
  }
}

/// Displays artifact piece bookmark details
class ArtifactPieceDetails extends ConsumerWidget {
  final BookmarkWithArtifactPieceDetails bookmark;

  const ArtifactPieceDetails(this.bookmark, {super.key});

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
          ),),

        if (bookmark.artifactPieceDetails.subStats.isNotEmpty)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.sub),
              const TextSpan(text: ": "),
              TextSpan(text: bookmark.artifactPieceDetails.subStats.map((e) => assetData.stats[e]!.localized).join(", "), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),),
      ],
    );
  }
}
