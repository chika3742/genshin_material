import "package:flutter/material.dart";

import "../../../components/artifact_bookmark_dialog.dart";
import "../../../components/center_text.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/effect_description.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/layout.dart";
import "../../../components/rarity_stars.dart";
import "../../../i18n/strings.g.dart";

class ArtifactDetailsPage extends StatelessWidget {
  final String id;

  const ArtifactDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData, assetDir) {
        final artifactSet = assetData.artifactSets[id];
        if (artifactSet == null) {
          return Scaffold(
            appBar: AppBar(),
            body: CenterError(tr.errors.artifactNotFound),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(tr.pages.artifactDetails(artifact: artifactSet.name.localized)),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: GappedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GameItemInfoBox(
                  itemImage: Image.file(
                    artifactSet.consistsOf.values.first.getImageFile(assetDir),
                    width: 50,
                    height: 50,
                  ),
                  children: [
                    GappedRow(
                      children: [
                        Text(
                          tr.artifactDetailsPage.maxRarity,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        RarityStars(count: artifactSet.maxRarity),
                      ],
                    ),
                  ],
                ),

                for (final bonus in artifactSet.bonuses) ...[
                  Text(
                    tr.artifactsPage.bonusTypes[bonus.type]!,
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: EffectDescription(
                      bonus.description.localized,
                    ),
                  ),
                ],

                const Divider(),

                if (artifactSet.bonuses.length >= 2) ...[
                  SectionHeading(tr.artifactDetailsPage.bookmarkSet),
                  ElevatedButton.icon(
                    onPressed: () {
                      showArtifactBookmarkDialog(
                        context: context,
                        firstSetId: artifactSet.id,
                        showSecondSetChooser: true,
                      );
                    },
                    icon: const Icon(Icons.bookmarks),
                    label: Text(tr.artifactDetailsPage.bookmarkTwoAndTwoPcSet),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      showArtifactBookmarkDialog(
                        context: context,
                        firstSetId: artifactSet.id,
                      );
                    },
                    icon: const Icon(Icons.bookmark),
                    label: Text(tr.artifactDetailsPage.bookmarkFourPcSet),
                  ),
                ],

                const SizedBox(), // add 8px gap
                SectionHeading(tr.artifactDetailsPage.bookmarkPiece),
                Column(
                  children: [
                    for(final piece in artifactSet.consistsOf.values)
                      SizedBox(
                        height: 56,
                        child: ListTile(
                          leading: Image.file(
                            piece.getImageFile(assetDir),
                            width: 32,
                            height: 32,
                          ),
                          title: Text(piece.name.localized),
                          subtitle: Text(assetData.artifactPieceTypes[piece.type]!.desc.localized),
                          trailing: IconButton(
                            icon: const Icon(Icons.bookmark),
                            onPressed: () {
                              showArtifactBookmarkDialog(
                                context: context,
                                pieceId: piece.id,
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
