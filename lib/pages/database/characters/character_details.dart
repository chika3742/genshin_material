import "dart:developer";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../../components/center_text.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/game_data_sync_indicator.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/labeled_check_box.dart";
import "../../../components/layout.dart";
import "../../../components/level_slider.dart";
import "../../../components/material_item.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../core/hoyolab_api.dart";
import "../../../database.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";
import "../../../models/material_bookmark_frame.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/preferences.dart";
import "../../../ui_core/snack_bar.dart";
import "../../../utils/ingredients_converter.dart";
import "../../../utils/lists.dart";

class CharacterDetailsPage extends StatelessWidget {
  final String id;

  const CharacterDetailsPage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData, assetDir) {
        final characterOrVariant = assetData.characters[id];
        if (characterOrVariant == null) {
          return Scaffold(
            appBar: AppBar(),
            body: CenterText(tr.errors.characterNotFound),
          );
        }

        final character = switch (characterOrVariant) {
          ListedCharacter() || CharacterGroup() => characterOrVariant,
          CharacterVariant(:final parentId) => assetData.characters[parentId]! as CharacterGroup,
          _ => throw UnsupportedError("Unsupported character type: $characterOrVariant"),
        } as CharacterWithLargeImage;
        
        return CharacterDetailsPageContents(
          character: character,
          assetData: assetData,
          assetDir: assetDir,
          initialVariant: characterOrVariant is CharacterVariant ? characterOrVariant.element : null,
        );
      },
    );
  }
}

/// Ensure that this widget is within a [DataAssetScope].
class CharacterDetailsPageContents extends StatefulHookConsumerWidget {
  final CharacterWithLargeImage character;
  final AssetData assetData;
  final String assetDir;
  final String? initialVariant;

  const CharacterDetailsPageContents({
    super.key,
    required this.character,
    required this.assetData,
    required this.assetDir,
    this.initialVariant,
  });

  @override
  ConsumerState<CharacterDetailsPageContents> createState() => _CharacterDetailsPageContentsState();
}

class _CharacterDetailsPageContentsState extends ConsumerState<CharacterDetailsPageContents> {
  final Map<Purpose, LevelRangeValues> _rangeValues = {};
  final Map<Purpose, List<int>> _sliderTickLabels = {};
  final Map<Purpose, bool> _checkedTalentTypes = {};

  final Map<Purpose, GlobalKey> _talentSectionKeys = {};

  @override
  void initState() {
    super.initState();

    // init the range values and checked talent types for each purpose
    final ingredients = widget.assetData.characterIngredients;
    for (final purpose in ingredients.purposes.keys) {
      final levels = ingredients.purposes[purpose]!.levels;
      _sliderTickLabels[purpose] = [1, ...levels.keys];
      _rangeValues[purpose] = LevelRangeValues(1, levels.keys.last);
      _checkedTalentTypes[purpose] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final assetData = widget.assetData;
    final assetDir = widget.assetDir;
    final character = widget.character;
    final ingredients = assetData.characterIngredients;
    final variants = useMemoized<Map<String, CharacterOrVariant>>(() {
      if (character is CharacterGroup) {
        return Map.fromEntries(
          character.variantIds.map((e) {
            final variant = (assetData.characters[e] as CharacterVariant);
            return MapEntry(variant.element, variant);
          }),
        );
      }
      return {(character as ListedCharacter).element: character};
    });

    final prefs = ref.watch(preferencesStateNotifierProvider);

    final isHoyolabSyncInProgress = useState(false);
    final sliderRangeInitialized = useState(!prefs.isLinkedWithHoyolab);
    final progressIndicatorMessage = useState<String?>(null);
    final variant = useState(
      variants[widget.initialVariant] ?? variants.values.first,
    );

    Future<void> syncGameData() async {
      if (!prefs.isLinkedWithHoyolab) {
        return;
      }

      isHoyolabSyncInProgress.value = true;
      progressIndicatorMessage.value = null;
      try {
        final uid = prefs.hyvUid!;
        final api = HoyolabApi(cookie: prefs.hyvCookie, uid: uid, region: prefs.hyvServer);

        final elements = assetData.elements;
        final weaponTypes = assetData.weaponTypes;

        final charaInfo = await HoyolabApiUtils.loopUntilCharacter(
          character.hyvIds,
              (page) {
            return api.avatarList(
              page,
              elementIds: [elements[variant.value.element]!.hyvId],
              weaponCatIds: [weaponTypes[character.weaponType]!.hyvId],
            );
          },
        );
        if (charaInfo != null) {
          setState(() {
            _rangeValues[Purpose.ascension] = LevelRangeValues(
              _sliderTickLabels[Purpose.ascension]!.lastWhere((e) => e <= int.parse(charaInfo.currentLevel)),
              charaInfo.maxLevel,
            );
          });

          final charaDetail = await api.avatarDetail(charaInfo.id);

          final skills = charaDetail.skills.where((element) => element.maxLevel != 1);
          skills.forEachIndexed((index, element) {
            final purpose = switch (index) {
              0 => Purpose.normalAttack,
              1 => Purpose.elementalSkill,
              2 => Purpose.elementalBurst,
              _ => throw "Invalid talent index",
            };
            setState(() {
              _rangeValues[purpose] = LevelRangeValues(element.currentLevel, element.maxLevel);
              _checkedTalentTypes[purpose] = element.currentLevel != element.maxLevel;
            });
          });

          final db = ref.read(appDatabaseProvider);
          await db.setCharacterLevels(
            uid,
            character.id,
            _rangeValues.map((key, value) => MapEntry(key, value.start)),
          );
        }

      } on HoyolabApiException catch (e, st) {
        if (e.retcode == Retcode.characterDoesNotExist) {
          progressIndicatorMessage.value = tr.hoyolab.characterDoesNotExist;
        } else {
          log("Failed to fetch character detail", error: e, stackTrace: st);
          if (context.mounted) {
            showSnackBar(
              context: context,
              message: e.getMessage(tr.hoyolab.failedToSyncGameData),
              error: true,
            );
          }
        }
      } catch (e, st) {
        log("Failed to fetch character detail", error: e, stackTrace: st);
        if (context.mounted) showSnackBar(context: context, message: tr.hoyolab.failedToSyncGameData, error: true);
      } finally {
        isHoyolabSyncInProgress.value = false;
      }
    }

    Future<void> setDefaultSliderValues() async {
      final uid = ref.read(preferencesStateNotifierProvider).hyvUid;
      if (uid == null) {
        return;
      }

      try {
        final db = ref.read(appDatabaseProvider);
        final levels = await db.getCharacterLevels(uid, variant.value.id);
        if (levels != null) {
          _rangeValues.addAll(levels.map((key, value) =>
              MapEntry(key, LevelRangeValues(value, _rangeValues[key]!.end)),),);
          _checkedTalentTypes.addAll(levels.map((key, value) =>
              MapEntry(key, value != _rangeValues[key]!.end),),);
          setState(() {});
        }
      } catch (e, st) {
        log("Failed to load character level cache", error: e, stackTrace: st);
      } finally {
        sliderRangeInitialized.value = true;
      }
    }

    useEffect(
      () {
        () async {
          await setDefaultSliderValues();

          if (prefs.syncCharaState && _rangeValues.values.any((e) => e.start != e.end)) {
            syncGameData();
          }
        }();
        return null;
      },
      [variant.value],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr.pages.characterDetails(
            character: character.name.localized,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GappedColumn(
                gap: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // character information
                  GameItemInfoBox(
                    itemImage: Image.file(
                      variant.value.getSmallImageFile(assetDir),
                      width: 70,
                      height: 70,
                    ),
                    children: [
                      // rarity
                      RarityStars(count: character.rarity),
                      // element
                      Row(
                        children: [
                          Image.file(
                            assetData.elements[variant.value.element]!.getImageFile(assetDir),
                            width: 26,
                            height: 26,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(width: 4),
                          Text(assetData.elements[variant.value.element]!.text.localized),
                        ],
                      ),
                      // weapon type
                      Text(assetData.weaponTypes[character.weaponType]!.name.localized),
                    ],
                  ),
                  if (variants.length > 1) DropdownButtonFormField(
                    value: variant.value.element,
                    items: variants.entries.map((e) {
                        return DropdownMenuItem(
                          value: e.key,
                          child: Row(
                            children: [
                              Image.file(
                                assetData.elements[e.value.element]!
                                    .getImageFile(assetDir),
                                width: 25,
                                height: 25,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              const SizedBox(width: 4),
                              Text(assetData.elements[e.value.element]!.text.localized),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                      label: Text(tr.common.element),
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      variant.value = variants[value]!;
                    },
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
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Visibility(
                            visible: sliderRangeInitialized.value,
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
                      ),
                      Wrap(
                        children: _buildAscensionMaterialCards(character),
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
                                            final context = _talentSectionKeys[purpose]!.currentContext;
                                            if (context?.mounted == true) {
                                              Scrollable.ensureVisible(
                                                context!,
                                                duration: const Duration(milliseconds: 300),
                                                curve: Curves.easeOutQuint,
                                                alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
                                              );
                                            }
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
                                              text: variant.value
                                                  .talents[purpose.name]!
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
                                          Visibility(
                                            visible: sliderRangeInitialized.value,
                                            child: LevelSlider(
                                              key: _talentSectionKeys[purpose] ??= GlobalKey(),
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Wrap(
                            children: _buildTalentMaterialCards(variant.value.talents, variant.value),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.7),
              ),
              child: GameDataSyncIndicator(
                show: isHoyolabSyncInProgress.value,
                message: progressIndicatorMessage.value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAscensionMaterialCards(Character character) {
    final mbFrames = widget.assetData.characterIngredients.purposes[Purpose.ascension]!.levels.mapInLevelRange(
      _rangeValues[Purpose.ascension]!,
      (key, value) {
        return toMaterialBookmarkFrames(
          level: key,
          ingredients: value,
          purposeType: Purpose.ascension,
          characterOrWeapon: character,
          assetData: widget.assetData,
        );
      },
    ).flattened.toList();
    final items = mergeMaterialBookmarkFrames(mbFrames);

    return sortMaterials(items, widget.assetData).map(
      (item) => MaterialItem(
        key: ValueKey(item.id),
        item: item,
        possiblePurposeTypes: const [Purpose.ascension],
        usage: MaterialUsage(
          characterId: widget.character.id,
          type: MaterialBookmarkType.character,
        ),
      ),
    ).toList();
  }

  List<Widget> _buildTalentMaterialCards(Talents talents, CharacterOrVariant variant) {
    final mbFrames = <MaterialBookmarkFrame>[];
    for (final talentType in talents.keys) {
      if (_checkedTalentTypes[Purpose.fromTalentType(talentType)]!) {
        mbFrames.addAll(
          widget.assetData.characterIngredients.purposes[Purpose.fromTalentType(talentType)]!.levels.mapInLevelRange(
            _rangeValues[Purpose.fromTalentType(talentType)]!,
            (key, value) {
              return toMaterialBookmarkFrames(
                level: key,
                ingredients: value,
                purposeType: Purpose.fromTalentType(talentType),
                characterOrWeapon: variant,
                assetData: widget.assetData,
              );
            },
          ).flattened,
        );
      }
    }
    final items = mergeMaterialBookmarkFrames(mbFrames);

    return sortMaterials(items, widget.assetData).map(
      (item) => MaterialItem(
        key: ValueKey(item.id),
        item: item,
        possiblePurposeTypes: talents.keys.map(Purpose.fromTalentType).toList(),
        usage: MaterialUsage(
          characterId: variant.id,
          type: MaterialBookmarkType.character,
        ),
      ),
    ).toList();
  }
}
