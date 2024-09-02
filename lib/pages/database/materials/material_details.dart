import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/center_text.dart";
import "../../../components/character_small_card.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/item_source_widget.dart";
import "../../../components/layout.dart";
import "../../../components/list_tile.dart";
import "../../../components/rarity_stars.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../routes.dart";
import "../../../utils/material_usage.dart";

class MaterialDetailsPage extends StatelessWidget {
  final String id;

  const MaterialDetailsPage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData, assetDir) {
        final material = assetData.materials[id];
        if (material == null) {
          return Scaffold(
            appBar: AppBar(),
            body: CenterText(tr.errors.materialNotFound),
          );
        }

        final charactersUsingMaterial = getCharactersUsingMaterial(
          material,
          assetData.characters.values,
          assetData.specialCharactersUsingMaterials,
        );
        final weaponsUseMaterial = getWeaponsUsingMaterial(material, assetData.weapons.values)
            .sorted((a, b) => b.rarity - a.rarity);

        return Scaffold(
          appBar: AppBar(
            title: Text(tr.pages.materialDetails(material: material.name.localized)),
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: GappedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                gap: 16,
                children: [
                  GameItemInfoBox(
                    itemImage: Image.file(
                      material.getImageFile(assetDir),
                      width: 50,
                      height: 50,
                    ),
                    children: [
                      RarityStars(count: material.rarity),
                      Text(
                        assetData.materialCategories[material.category]!.localized,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      if (material.getDailyMaterialAvailable(GameServer.asia))
                        GappedRow(
                          children: [
                            const Icon(Symbols.event_available, color: Colors.green),
                            Text(tr.materialDetailsPage.availableToday),
                          ],
                        ),
                    ],
                  ),

                  if (material.source != null)
                    _buildSection(
                      headingText: tr.materialDetailsPage.source,
                      child: ItemSourceWidget(material.source!),
                    ),

                  if (charactersUsingMaterial.isNotEmpty)
                    _buildSection(
                      headingText: tr.materialDetailsPage.charactersUsing,
                      child: Wrap(
                        children: [
                          for (final character in charactersUsingMaterial)
                            CharacterSmallCard(character),
                        ],
                      ),
                    ),

                  if (weaponsUseMaterial.isNotEmpty)
                    _buildSection(
                      headingText: tr.materialDetailsPage.weaponsUsing,
                      child: Column(
                        children: [
                          for (final weaponTypes in weaponsUseMaterial.groupListsBy((w) => w.type).entries)
                            ...[
                              SectionInnerHeading(assetData.weaponTypes[weaponTypes.key]!.name.localized),
                              Column(
                                children: [
                                  for (final weapon in weaponTypes.value)
                                    GameItemListTile(
                                      image: weapon.getImageFile(assetDir),
                                      name: weapon.name.localized,
                                      rarity: weapon.rarity,
                                      rounded: true,
                                      onTap: () {
                                        WeaponDetailsRoute(id: weapon.id).push(context);
                                      },
                                    ),
                                ],
                              ),
                            ],
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection({required String headingText, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(headingText),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
