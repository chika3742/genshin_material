import "package:collection/collection.dart";
import "package:flutter/material.dart";

import "../../../components/center_text.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/gapped_flex.dart";
import "../../../components/level_slider.dart";
import "../../../components/rarity_stars.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";

class CharacterDetailsPage extends StatefulWidget {
  final String id;

  const CharacterDetailsPage({super.key, required this.id});

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  LevelRangeValues? _range;

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData) {
        final character = assetData.characters!.firstWhereOrNull((e) => e.id == widget.id);
        if (character == null || character is! CharacterWithSmallImage) {
          return CenterText(tr.errors.characterNotFound);
        }
        
        final ingredients = assetData.characterIngredients!
            .getIngredientsForRarity(PurposeType.ascension, character.rarity);
        _range ??= LevelRangeValues(1, ingredients.keys.last);

        final sliderTickLabels = [1, ...ingredients.keys,];

        return Scaffold(
          appBar: AppBar(
            title: Text(
              tr.pages.characterDetails(
                character: character.name.localized,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GappedColumn(
              gap: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // character information
                Row(
                  children: [
                    Image.file(character.getSmallImageFile(assetData.assetDir!), width: 70, height: 70,),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // rarity
                        RarityStars(count: character.rarity),
                        const SizedBox(height: 4),
                        // element
                        Row(
                          children: [
                            Image.file(
                              assetData.elements![character.element]!.getImageFile(assetData.assetDir!),
                              width: 26,
                              height: 26,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            Text(assetData.elements![character.element]!.text.localized + tr.common.element),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // weapon type
                        Text(character.weaponType.text),
                      ],
                    ),
                  ],
                ),
                Text(
                  tr.characterDetailsPage.charaLevelUpAndAscensionMaterials,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                LevelSlider(
                  levels: sliderTickLabels,
                  values: _range!,
                  onChanged: (values) {
                    if (values.start == values.end) {
                      return;
                    }

                    setState(() {
                      _range = values;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
