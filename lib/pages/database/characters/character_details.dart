import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/center_text.dart";
import "../../../components/game_data_sync_indicator.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/labeled_check_box.dart";
import "../../../components/level_slider.dart";
import "../../../components/material_card.dart";
import "../../../components/material_item.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../database.dart";
import "../../../db/bookmark_db_extension.dart";
import "../../../db/in_game_character_state_db_extension.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/character_ingredients.dart";
import "../../../models/common.dart";
import "../../../models/material_bookmark_frame.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/game_data_sync.dart";
import "../../../providers/preferences.dart";
import "../../../routes.dart";
import "../../../ui_core/layout.dart";
import "../../../ui_core/snack_bar.dart";
import "../../../utils/ingredients_converter.dart";
import "../../../utils/lists.dart";

part "character_details.freezed.dart";

class CharacterDetailsPage extends HookConsumerWidget {
  final AssetData assetData;
  final String id;

  const CharacterDetailsPage({super.key, required this.assetData, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final db = ref.watch(appDatabaseProvider);
    final (uid, syncCharaState) = ref.watch(preferencesStateNotifierProvider
        .select((e) => (e.hyvUid, e.syncCharaState)));

    final csResult = useMemoized(() => uid != null
        ? db.getCharacterState(uid, character.id)
        : Future.value(null));
    final csSnapshot = useFuture(csResult);

    // loading
    if (uid != null && syncCharaState && csSnapshot.connectionState != ConnectionState.done) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return _CharacterDetailsPageContents(
      character: character,
      assetData: assetData,
      initialVariant: characterOrVariant is CharacterVariant ? characterOrVariant.element : null,
      initialCharacterState: csSnapshot.data,
    );
  }
}

class _CharacterDetailsPageContents extends HookConsumerWidget {
  final CharacterWithLargeImage character;
  final AssetData assetData;
  final String? initialVariant;
  final InGameCharacterState? initialCharacterState;

  const _CharacterDetailsPageContents({
    required this.character,
    required this.assetData,
    this.initialVariant,
    this.initialCharacterState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = useState(useMemoized(() => _CharacterDetailsPageState.init(
      ingredients: assetData.characterIngredients,
      initialCharacterState: initialCharacterState,
    )));

    final character = this.character; // for type guard
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
    final db = ref.watch(appDatabaseProvider);

    final variant = useState(
      variants[initialVariant] ?? variants.values.first,
    );

    ref.listen(gameDataSyncCachedProvider(variantId: variant.value.id), (_, result) {
      if (!result.hasValue) return;

      var newState = state.value;
      if (result.value!.levels != null) {
        for (final e in result.value!.levels!.entries) {
          newState = newState.copyWith(
            rangeValues: {...newState.rangeValues}..[e.key] = LevelRangeValues(e.value, max(e.value, newState.rangeValues[e.key]!.end)),
            checkedTalentTypes: {...newState.checkedTalentTypes}..[e.key] = e.value < newState.sliderTickLabels[e.key]!.last,
          );
        }

        if (prefs.autoRemoveBookmarks) {
          db.deleteObsoleteBookmarks(
            characterId: variant.value.id,
            levels: result.value!.levels!,
          ).then((removed) {
            if (context.mounted && removed) {
              showSnackBar(context: context, message: tr.common.removedObsoleteBookmarks);
            }
          });
        }
      }
      if (result.value!.equippedWeaponId != null) {
        newState = newState.copyWith(
          equippedWeaponId: result.value!.equippedWeaponId,
        );
      }
      state.value = newState;
    });

    ref.listen(bagLackNumProvider(variantId: variant.value.id), (_, result) {
      if (!result.hasValue) return;

      state.value = state.value.copyWith(
        lackNums: result.value!,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr.pages.characterDetails(
            character: character.name.localized,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(tr.pages.hoyolabIntegrationSettings),
                  onTap: () {
                    HoyolabIntegrationSettingsRoute().push(context);
                  },
                ),
              ];
            },
          ),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: QuantityTickerHandler(
            child: SafeArea(
              child: GappedColumn(
                gap: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // character information
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GameItemInfoBox(
                          itemImage: Image.file(
                            variant.value.getSmallImageFile(assetData.assetDir),
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
                                  assetData.elements[variant.value.element]!.getImageFile(assetData.assetDir),
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
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (prefs.isLinkedWithHoyolab && prefs.syncCharaState)
                            Consumer(
                              builder: (context, ref, _) {
                                final state = ref.watch(gameDataSyncStateProvider(variantId: variant.value.id));
                                return GameDataSyncIndicator(
                                  status: state,
                                );
                              },
                            ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Symbols.swords),
                                onPressed: () {
                                  WeaponListRoute(equipCharacterId: variant.value.id).push(context);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Symbols.person_play),
                                onPressed: () {
                                  ArtifactListRoute(equipCharacterId: variant.value.id).push(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  // character variant dropdown
                  if (variants.length > 1)
                    DropdownButtonFormField(
                      value: variant.value.element,
                      items: variants.entries.map((e) {
                        return DropdownMenuItem(
                          value: e.key,
                          child: Row(
                            children: [
                              Image.file(
                                assetData.elements[e.value.element]!
                                    .getImageFile(assetData.assetDir),
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

                  if (state.value.equippedWeaponId != null)
                    FullWidth(
                      child: ListTile(
                        title: Text(tr.characterDetailsPage.equippedWeapon),
                        subtitle: Text(assetData.weapons[state.value.equippedWeaponId]!.name.localized),
                        leading: Image.file(
                          assetData.weapons[state.value.equippedWeaponId]!.getImageFile(assetData.assetDir),
                          width: 50,
                          height: 50,
                        ),
                        trailing: const Icon(Symbols.chevron_right),
                        onTap: () {
                          WeaponDetailsRoute(
                            id: state.value.equippedWeaponId!,
                            initialSelectedCharacter: variant.value.id,
                          ).push(context);
                        },
                      ),
                    ),

                  Section(
                    heading: SectionHeading(tr.characterDetailsPage.charaLevelUpAndAscensionMaterials),
                    child: GappedColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: LevelSlider(
                              levels: state.value.sliderTickLabels[Purpose.ascension]!,
                              ticks: ingredients.purposes[Purpose.ascension]!.sliderTicks,
                              values: state.value.rangeValues[Purpose.ascension]!,
                              onChanged: (values) {
                                // avoid overlapping slider handles
                                if (values.start == values.end) {
                                  return;
                                }

                                state.value = state.value.copyWith(
                                  rangeValues: {...state.value.rangeValues}..[Purpose.ascension] = values,
                                );
                              },
                            ),
                          ),
                        ),
                        Wrap(
                          children: _buildAscensionMaterialCards(state.value),
                        ),
                      ],
                    ),
                  ),

                  Section(
                    heading: SectionHeading(tr.characterDetailsPage.talentLevelUpMaterials),
                    child: GappedColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final purpose in ingredients.purposes.keys
                            .whereNot((e) => e == Purpose.ascension))
                          Card(
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  LabeledCheckBox(
                                    value: state.value.checkedTalentTypes[purpose]!,
                                    onChanged: (value) {
                                      state.value = state.value.copyWith(
                                        checkedTalentTypes: {...state.value.checkedTalentTypes}..[purpose] = value!,
                                      );

                                      // scroll to the talent materials section on checkbox checked
                                      if (value == true) {
                                        Future.delayed(const Duration(milliseconds: 200), () {
                                          final context = state.value.talentSectionKeys[purpose]!.currentContext;
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
                                    child: Expanded(
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
                                                  .name.localized,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedCrossFade( // talent level slider with size animation
                                    duration: const Duration(milliseconds: 300),
                                    crossFadeState: state.value.checkedTalentTypes[purpose]!
                                        ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                    firstCurve: Curves.easeOutQuint,
                                    secondCurve: Curves.easeOutQuint,
                                    sizeCurve: Curves.easeOutQuint,
                                    firstChild: Container(),
                                    secondChild: Column(
                                      children: [
                                        const SizedBox(height: 8),
                                        LevelSlider(
                                          key: state.value.talentSectionKeys[purpose] ??= GlobalKey(),
                                          ticks: ingredients.purposes[purpose]!.sliderTicks,
                                          levels: state.value.sliderTickLabels[purpose]!,
                                          values: state.value.rangeValues[purpose]!,
                                          onChanged: (values) {
                                            if (values.start == values.end) {
                                              return;
                                            }

                                            state.value = state.value.copyWith(
                                              rangeValues: {...state.value.rangeValues}..[purpose] = values,
                                            );
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
                          children: _buildTalentMaterialCards(
                            variant.value.talents,
                            variant.value,
                            state.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<MaterialCardMaterial> _getCardMaterials(List<Purpose> purposes, { Map<Purpose, LevelRangeValues>? ranges, Character? variant }) {
    final mbFrames = <MaterialBookmarkFrame>[];
    for (final purpose in purposes) {
      mbFrames.addAll(
        assetData.characterIngredients.purposes[purpose]!.levels.mapInLevelRange(
          ranges?[purpose] ?? LevelRangeValues(1, assetData.characterIngredients.purposes[purpose]!.levels.keys.last),
          (key, value) {
            return toMaterialBookmarkFrames(
              level: key,
              ingredients: value,
              purposeType: purpose,
              characterOrWeapon: variant ?? character,
              assetData: assetData,
            );
          },
        ).flattened,
      );
    }
    return mergeMaterialBookmarkFrames(mbFrames);
  }

  List<Widget> _buildAscensionMaterialCards(_CharacterDetailsPageState state) {
    final items = _getCardMaterials(
      [Purpose.ascension],
      ranges: {Purpose.ascension: state.rangeValues[Purpose.ascension]!},
    );

    final fullCardMaterials = useMemoized(() => _getCardMaterials([Purpose.ascension]));
    const defaultExpItemId = "heros-wit";

    return sortMaterials(items, assetData)
        .map(
          (item) => MaterialItem(
            key: ValueKey(item.id),
            item: item,
            possiblePurposeTypes: const [Purpose.ascension],
            expItems: assetData.characterIngredients.expItems,
            lackNum: state.lackNums[item.id ?? defaultExpItemId] != null
                ? state.lackNums[item.id ?? defaultExpItemId]! - (fullCardMaterials.firstWhere((e) => e.id == item.id).sum - item.sum)
                : null,
            usage: MaterialUsage(
              characterId: character.id,
            ),
          ),
        )
        .toList();
  }

  List<Widget> _buildTalentMaterialCards(
    Talents talents,
    CharacterOrVariant variant,
    _CharacterDetailsPageState state,
  ) {
    final items = _getCardMaterials(
      talents.keys.map(Purpose.fromTalentType).where((e) => state.checkedTalentTypes[e]!).toList(),
      ranges: state.rangeValues,
      variant: variant,
    );

    final fullCardMaterials = useMemoized(() => _getCardMaterials(
      talents.keys.map(Purpose.fromTalentType).toList(),
      variant: variant,
    ));

    return sortMaterials(items, assetData)
        .map(
          (item) => MaterialItem(
            key: ValueKey(item.id),
            item: item,
            possiblePurposeTypes:
                talents.keys.map(Purpose.fromTalentType).toList(),
            expItems: assetData.characterIngredients.expItems,
            lackNum: state.lackNums[item.id] != null
                ? state.lackNums[item.id]! - (fullCardMaterials.firstWhere((e) => e.id == item.id).sum - item.sum)
                : null,
            usage: MaterialUsage(
              characterId: variant.id,
            ),
          ),
        ).toList();
  }
}

@Freezed(copyWith: true)
sealed class _CharacterDetailsPageState with _$CharacterDetailsPageState {
  const factory _CharacterDetailsPageState({
    required Map<Purpose, LevelRangeValues> rangeValues,
    required Map<Purpose, List<int>> sliderTickLabels,
    required Map<Purpose, bool> checkedTalentTypes,
    required Map<Purpose, GlobalKey> talentSectionKeys,
    required Map<String, int> lackNums,
    required String? equippedWeaponId,
  }) = __CharacterDetailsPageState;

  /// Initializes state for each purpose
  factory _CharacterDetailsPageState.init({
    required CharacterIngredients ingredients,
    InGameCharacterState? initialCharacterState,
  }) {
    final sliderTickLabels = <Purpose, List<int>>{};
    final rangeValues = <Purpose, LevelRangeValues>{};
    final checkedTalentTypes = <Purpose, bool>{};
    final talentSectionKeys = <Purpose, GlobalKey>{};

    for (final purpose in ingredients.purposes.keys) {
      final levels = ingredients.purposes[purpose]!.levels;
      final initialSliderLowerRange = initialCharacterState?.purposes[purpose] ?? 1;

      sliderTickLabels[purpose] = [1, ...levels.keys];
      rangeValues[purpose] = LevelRangeValues(initialSliderLowerRange, levels.keys.last);
      checkedTalentTypes[purpose] = initialSliderLowerRange < levels.keys.last;
      talentSectionKeys[purpose] = GlobalKey();
    }

    return _CharacterDetailsPageState(
      rangeValues: rangeValues,
      sliderTickLabels: sliderTickLabels,
      checkedTalentTypes: checkedTalentTypes,
      talentSectionKeys: talentSectionKeys,
      lackNums: {},
      equippedWeaponId: initialCharacterState?.equippedWeaponId,
    );
  }
}
