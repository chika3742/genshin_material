import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/center_text.dart";
import "../../../components/character_small_card.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/item_source_widget.dart";
import "../../../components/list_tile.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../routes.dart";
import "../../../ui_core/layout.dart";
import "../../../utils/material_usage.dart";

class MaterialDetailsPage extends HookConsumerWidget {
  final AssetData assetData;
  final String id;

  const MaterialDetailsPage({super.key, required this.assetData, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bagCountInfoKey = useMemoized(() => GlobalKey());

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
    final weaponsUsingMaterial = getWeaponsUsingMaterial(material, assetData.weapons.values)
        .sorted((a, b) => b.rarity - a.rarity);
    // final bagCount = ref.watch(bagCountProvider(material.hyvId));

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.materialDetails(material: material.name.localized)),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              GameItemInfoBox(
                itemImage: Image.file(
                  material.getImageFile(assetData.assetDir),
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
                    Row(
                      spacing: 8.0,
                      children: [
                        const Icon(Symbols.event_available, color: Colors.green),
                        Text(tr.materialDetailsPage.availableToday),
                      ],
                    ),
                ],
              ),

              Main(children: [
                if (material.source != null)
                  Section(
                    heading: SectionHeading(tr.materialDetailsPage.source),
                    child: ItemSourceWidget(material.source!),
                  ),

                if (charactersUsingMaterial.isNotEmpty)
                  Section(
                    heading: SectionHeading(tr.materialDetailsPage.charactersUsing),
                    child: Wrap(
                      children: [
                        for (final character in charactersUsingMaterial)
                          CharacterSmallCard(character),
                      ],
                    ),
                  ),

                if (weaponsUsingMaterial.isNotEmpty)
                  Section(
                    heading: SectionHeading(tr.materialDetailsPage.weaponsUsing),
                    child: Column(
                      children: [
                        for (final weaponTypes in weaponsUsingMaterial.groupListsBy((w) => w.type).entries)
                          ...[
                            SectionInnerHeading(assetData.weaponTypes[weaponTypes.key]!.name.localized),
                            Column(
                              children: [
                                for (final weapon in weaponTypes.value)
                                  GameItemListTile(
                                    image: weapon.getImageFile(assetData.assetDir),
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
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
