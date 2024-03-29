import "package:collection/collection.dart";
import "package:flutter/material.dart";

import "../../../components/center_text.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/layout.dart";
import "../../../components/level_slider.dart";
import "../../../components/material_item.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/weapon.dart";
import "../../../utils/ingredients_converter.dart";

class WeaponDetailsPage extends StatelessWidget {
  final String id;

  const WeaponDetailsPage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData) {
        final weapon = assetData.weapons!.firstWhereOrNull((element) => element.id == id);
        if (weapon == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const CenterText("Weapon not found"),
          );
        }

        return WeaponDetailsPageContents(
          weapon: weapon,
          assetData: assetData,
        );
      },
    );
  }
}

class WeaponDetailsPageContents extends StatefulWidget {
  final Weapon weapon;
  final AssetDataCache assetData;

  const WeaponDetailsPageContents({
    super.key,
    required this.weapon,
    required this.assetData,
  });

  @override
  State<WeaponDetailsPageContents> createState() => _WeaponDetailsPageContentsState();
}

class _WeaponDetailsPageContentsState extends State<WeaponDetailsPageContents> {
  late List<int> _sliderTickLabels;
  late LevelRangeValues _rangeValues;

  @override
  void initState() {
    super.initState();

    final levels = widget.assetData.weaponIngredients!
        .rarities[widget.weapon.rarity]!.levels;
    _sliderTickLabels = [1, ...levels.keys];
    _rangeValues = LevelRangeValues(1, levels.keys.last);
  }

  @override
  Widget build(BuildContext context) {
    final weapon = widget.weapon;
    final assetData = widget.assetData;
    final ingredients = widget.assetData.weaponIngredients!.rarities[weapon.rarity]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.weaponDetails(weapon: weapon.name.localized)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: GappedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          gap: 16,
          children: [
            GameItemInfoBox(
              itemImage: Image.file(
                weapon.getImageFile(assetData.assetDir!),
                width: 50,
                height: 50,
              ),
              children: [
                RarityStars(count: weapon.rarity),
                Text(
                  assetData.weaponTypes![weapon.type]!.localized,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),

            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: LevelSlider(
                  levels: _sliderTickLabels,
                  values: _rangeValues,
                  onChanged: (values) {
                    // avoid overlapping slider handles
                    if (values.start == values.end) {
                      return;
                    }

                    setState(() {
                      _rangeValues = values;
                    });
                  },
                ),
              ),
            ),

            Wrap(
              children: [
                for (final material in toBookmarkableMaterials(
                  levelMapToList(narrowLevelMap(ingredients.levels, _rangeValues)),
                  weapon.materials,
                ))
                  MaterialItem(
                    material: assetData.materials!.firstWhereOrNull((e) => e.id == material.id),
                    bookmarkableMaterial: material,
                    expItems: assetData.weaponIngredients!.expItems,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
