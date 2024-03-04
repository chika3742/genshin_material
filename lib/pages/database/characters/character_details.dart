import "package:collection/collection.dart";
import "package:flutter/material.dart";

import "../../../components/center_text.dart";
import "../../../components/gapped_flex.dart";
import "../../../components/labeled_check_box.dart";
import "../../../components/level_slider.dart";
import "../../../components/material_item.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/bookmarkable_material.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";
import "../../../utils/ingredients_converter.dart";

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

  final _talentMaterialsKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // initialize character and ingredients
    final c = widget.assetData.characters!
        .firstWhereOrNull((element) => element.id == widget.id);
    if (c != null && c is CharacterWithSmallImage) {
      _character = c;
      // init the range values and checked talent types for each purpose
      final ingredients = widget.assetData.characterIngredients!;
      for (final purpose in ingredients.purposes.keys) {
        final levels = ingredients.purposes[purpose]!.levels;
        _sliderTickLabels[purpose] = [1, ...levels.keys];
        _rangeValues[purpose] = LevelRangeValues(1, levels.keys.last);
        _checkedTalentTypes[purpose] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // show error message if character is not initialized
    if (_character == null) {
      return CenterText(tr.errors.characterNotFound);
    }

    final assetData = widget.assetData;
    final ingredients = assetData.characterIngredients!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr.pages.characterDetails(
            character: _character!.name.localized,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GappedColumn(
            gap: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // character information
              Row(
                children: [
                  Image.file(
                    _character!.getSmallImageFile(assetData.assetDir!),
                    width: 70,
                    height: 70,
                  ),
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
                            assetData.elements![_character!.element]!.getImageFile(assetData.assetDir!),
                            width: 26,
                            height: 26,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          Text(assetData.elements![_character!.element]!.text.localized),
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
                          // avoid overlapping slider handles
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
                  Wrap(
                    children: [
                      for (final material in toBookmarkableMaterials(
                        levelMapToList(narrowLevelMap(ingredients.purposes[Purpose.ascension]!.levels, _rangeValues[Purpose.ascension]!)),
                        _character!.materials,
                      ))
                        MaterialItem(
                          material: assetData.materials!.firstWhereOrNull((e) => e.id == material.id),
                          bookmarkableMaterial: material,
                        ),
                    ],
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final purpose in ingredients.purposes.keys
                          .whereNot((e) => e == Purpose.ascension))
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                LabeledCheckBox(
                                  value: _checkedTalentTypes[purpose]!,
                                  onChanged: (value) {
                                    setState(() {
                                      _checkedTalentTypes[purpose] = value!;
                                    });

                                    // scroll to the talent materials section on checkbox checked
                                    if (value == true) {
                                      Future.delayed(const Duration(milliseconds: 200), () {
                                        Scrollable.ensureVisible(
                                          _talentMaterialsKey.currentContext!,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeOutQuint,
                                          alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
                                        );
                                      });
                                    }
                                  },
                                  child: Text.rich( // checkbox label
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: tr.talentTypes[purpose.name]!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        const TextSpan(text: "  "),
                                        TextSpan(
                                          text: _character!
                                              .talents[TalentType.fromPurpose(
                                                  purpose,)]!
                                              .localized,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                AnimatedCrossFade( // talent level slider with size animation
                                  duration: const Duration(milliseconds: 300),
                                  crossFadeState: _checkedTalentTypes[purpose]!
                                      ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                  firstCurve: Curves.easeOutQuint,
                                  secondCurve: Curves.easeOutQuint,
                                  sizeCurve: Curves.easeOutQuint,
                                  firstChild: Container(),
                                  secondChild: Column(
                                    children: [
                                      const SizedBox(height: 8),
                                      LevelSlider(
                                        levels: _sliderTickLabels[purpose]!,
                                        values: _rangeValues[purpose]!,
                                        onChanged: (values) {
                                          if (values.start == values.end) {
                                            return;
                                          }

                                          setState(() {
                                            _rangeValues[purpose] = values;
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
                      Wrap(
                        key: _talentMaterialsKey,
                        children: toBookmarkableMaterials(
                          _getTalentIngredients(),
                          _character!.materials,
                        ).map(
                              (bm) => MaterialItem(
                                material: bm.isExp ? null : bm.material,
                                bookmarkableMaterial: bm,
                              ),
                            ).toList(),
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

  List<IngredientsWithLevel> _getTalentIngredients() {
    final result = <IngredientsWithLevel>[];
    for (final talentType in _character!.talents.keys) {
      if (_checkedTalentTypes[Purpose.fromTalentType(talentType)]!) {
        result.addAll(
          levelMapToList(
            narrowLevelMap(
              widget.assetData.characterIngredients!.purposes[Purpose.fromTalentType(talentType)]!.levels,
              _rangeValues[Purpose.fromTalentType(talentType)]!,
            ),
          ),
        );
      }
    }
    return result;
  }
}
