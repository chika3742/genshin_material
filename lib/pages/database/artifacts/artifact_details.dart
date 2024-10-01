import "package:flutter/material.dart";

import "../../../components/artifact_bookmark_dialog.dart";
import "../../../components/center_text.dart";
import "../../../components/effect_description.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../ui_core/layout.dart";

class ArtifactDetailsPage extends StatelessWidget {
  final AssetData assetData;
  final String id;
  final CharacterId? initialSelectedCharacter;

  const ArtifactDetailsPage({
    super.key,
    required this.assetData,
    required this.id,
    required this.initialSelectedCharacter,
  });

  @override
  Widget build(BuildContext context) {
    final artifactSet = assetData.artifactSets[id];
    if (artifactSet == null) {
      return Scaffold(
        appBar: AppBar(),
        body: CenterText(tr.errors.artifactNotFound),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.artifactDetails(artifact: artifactSet.name.localized)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GappedColumn(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameItemInfoBox(
                  itemImage: Image.file(
                    artifactSet.consistsOf.values.first.getImageFile(assetData.assetDir),
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

                // set effects
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
              ],
            ),
            const SizedBox(height: 8),

            GappedColumn(
              gap: 16,
              children: [
                if (artifactSet.bonuses.length >= 2)
                  Section(
                    heading: SectionHeading(tr.artifactDetailsPage.bookmarkSet),
                    child: GappedColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            showArtifactBookmarkDialog(
                              context: context,
                              firstSetId: artifactSet.id,
                              initialSelectedCharacter: initialSelectedCharacter,
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
                              initialSelectedCharacter: initialSelectedCharacter,
                            );
                          },
                          icon: const Icon(Icons.bookmark),
                          label: Text(tr.artifactDetailsPage.bookmarkFourPcSet),
                        ),
                      ],
                    ),
                  ),

                Section(
                  heading: SectionHeading(tr.artifactDetailsPage.bookmarkPiece),
                  child: Column(
                    children: [
                      for(final piece in artifactSet.consistsOf.values)
                        SizedBox(
                          height: 56,
                          child: ListTile(
                            leading: Image.file(
                              piece.getImageFile(assetData.assetDir),
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
                                  initialSelectedCharacter: initialSelectedCharacter,
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
