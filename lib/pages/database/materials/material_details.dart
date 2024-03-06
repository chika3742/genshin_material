import "package:collection/collection.dart";
import "package:flutter/material.dart";

import "../../../components/center_text.dart";
import "../../../components/character_small_card.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/layout.dart";
import "../../../components/rarity_stars.dart";
import "../../../i18n/strings.g.dart";
import "../../../utils/material_usage.dart";

class MaterialDetailsPage extends StatelessWidget {
  final String id;

  const MaterialDetailsPage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData) {
        final material = assetData.materials!.firstWhereOrNull((m) => m.id == id);
        if (material == null) {
          return Scaffold(
            appBar: AppBar(),
            body: CenterText(tr.errors.materialNotFound),
          );
        }

        final characters = getCharactersUsingMaterial(material, assetData.characters!);

        return Scaffold(
          appBar: AppBar(
            title: Text(tr.pages.materialDetails(material: material.name.localized)),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: GappedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: 16,
              children: [
                GappedRow(
                  children: [
                    Image.file(
                      material.getImageFile(assetData.assetDir!),
                      width: 50,
                      height: 50,
                    ),
                    GappedColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      gap: 4,
                      children: [
                        RarityStars(count: material.rarity),
                        Text(
                          assetData.materialCategories!
                              .firstWhere((c) => c.id == material.category).text.localized,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                SectionHeading(tr.materialDetailsPage.charactersUsing),
                Wrap(
                  children: [
                    for (final character in characters)
                      CharacterSmallCard(character),
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
