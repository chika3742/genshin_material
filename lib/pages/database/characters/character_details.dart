import "package:collection/collection.dart";
import "package:flutter/material.dart";

import "../../../components/center_text.dart";
import "../../../components/gapped_flex.dart";
import "../../../components/labeled_check_box.dart";
import "../../../components/level_slider.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/character_ingredients.dart";
import "../../../models/common.dart";

class CharacterDetailsPage extends StatefulWidget {
  final String id;
  final AssetDataCache assetData;

  const CharacterDetailsPage({
    super.key,
    required this.id,
    required this.assetData,
  });

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  final Map<Purpose, LevelRangeValues> _rangeValues = {};
  final Map<Purpose, List<int>> _sliderTickLabels = {};
  final Map<Purpose, bool> _checkedTalentTypes = {};

  CharacterWithSmallImage? _character;
  late CharacterIngredientsPurposes _ingredientsForRarity;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    final c = widget.assetData.characters!
        .firstWhereOrNull((element) => element.id == widget.id);
    if (c != null && c is CharacterWithSmallImage) {
      _character = c;
      _ingredientsForRarity =
          widget.assetData.characterIngredients!.rarities[_character!.rarity]!;
      for (final purpose in _ingredientsForRarity.purposes.keys) {
        _sliderTickLabels[purpose] = [
          1,
          ..._ingredientsForRarity.purposes[purpose]!.levels.keys,
        ];
        _rangeValues[purpose] = LevelRangeValues(
            1, _ingredientsForRarity.purposes[purpose]!.levels.keys.last,);
        _checkedTalentTypes[purpose] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_character == null) {
      return CenterText(tr.errors.characterNotFound);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr.pages.characterDetails(
            character: _character!.name.localized,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GappedColumn(
            gap: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // character information
              Row(
                children: [
                  Image.file(_character!.getSmallImageFile(widget.assetData.assetDir!), width: 70, height: 70,),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // rarity
                      RarityStars(count: _character!.rarity),
                      const SizedBox(height: 4),
                      // element
                      Row(
                        children: [
                          Image.file(
                            widget.assetData.elements![_character!.element]!.getImageFile(widget.assetData.assetDir!),
                            width: 26,
                            height: 26,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          Text(widget.assetData.elements![_character!.element]!.text.localized),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // weapon type
                      Text(_character!.weaponType.text),
                    ],
                  ),
                ],
              ),
              GappedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.characterDetailsPage.charaLevelUpAndAscensionMaterials,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: LevelSlider(
                        levels: _sliderTickLabels[Purpose.ascension]!,
                        values: _rangeValues[Purpose.ascension]!,
                        onChanged: (values) {
                          if (values.start == values.end) {
                            return;
                          }

                          setState(() {
                            _rangeValues[Purpose.ascension] = values;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              GappedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.characterDetailsPage.talentLevelUpMaterials,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Column(
                    children: [
                      for (final talentType in _ingredientsForRarity.purposes.keys
                          .whereNot((e) => e == Purpose.ascension))
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                LabeledCheckBox(
                                  value: _checkedTalentTypes[talentType]!,
                                  onChanged: (value) {
                                    setState(() {
                                      _checkedTalentTypes[talentType] = value!;
                                    });
                                  },
                                  child: Text(tr.talentTypes[talentType.name]!),
                                ),
                                AnimatedCrossFade(
                                  duration: const Duration(milliseconds: 300),
                                  crossFadeState: _checkedTalentTypes[talentType]!
                                      ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                  firstCurve: Curves.easeOutQuint,
                                  secondCurve: Curves.easeOutQuint,
                                  sizeCurve: Curves.easeOutQuint,
                                  firstChild: Container(),
                                  secondChild: Column(
                                    children: [
                                      const SizedBox(height: 8),
                                      LevelSlider(
                                        levels: _sliderTickLabels[talentType]!,
                                        values: _rangeValues[talentType]!,
                                        onChanged: (values) {
                                          if (values.start == values.end) {
                                            return;
                                          }

                                          setState(() {
                                            _rangeValues[talentType] = values;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
