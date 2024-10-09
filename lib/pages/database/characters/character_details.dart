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
import "../../../db/character_level_info_db_extension.dart";
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
    final prefs = ref.watch(preferencesStateNotifierProvider);
    final syncedCharacterLevelsFuture = useMemoized(() => prefs.isLinkedWithHoyolab
        ? db.getCharacterLevels(prefs.hyvUid!, characterOrVariant is CharacterGroup ? characterOrVariant.variantIds.first : id)
        : Future.value(null),);
    final syncedCharacterLevelsAsync = useFuture(syncedCharacterLevelsFuture);

    if (syncedCharacterLevelsAsync.connectionState == ConnectionState.done) {
      return _CharacterDetailsPageContents(
        character: character,
        assetData: assetData,
        initialVariant: characterOrVariant is CharacterVariant ? characterOrVariant.element : null,
        initialCharacterLevels: syncedCharacterLevelsAsync.data,
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
  }
}

class _CharacterDetailsPageContents extends HookConsumerWidget {
  final CharacterWithLargeImage character;
  final AssetData assetData;
  final String? initialVariant;
  final Map<Purpose, int>? initialCharacterLevels;

  const _CharacterDetailsPageContents({
    required this.character,
    required this.assetData,
    this.initialVariant,
    this.initialCharacterLevels,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = useState(useMemoized(() => _CharacterDetailsPageState.init(
      ingredients: assetData.characterIngredients,
      initialCharacterLevels: initialCharacterLevels,
    ),),);

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
    final equippedWeaponId = useStream(
      useMemoized(() => prefs.isLinkedWithHoyolab ? db.watchCharacterWeapon(prefs.hyvUid!, variant.value.id) : Stream.value(null)),
      preserveState: false,
    );

    useValueChanged<CharacterOrVariant, void>(variant.value, (_, __) async {
      if (prefs.isLinkedWithHoyolab) {
        final db = ref.read(appDatabaseProvider);
        final levelsByPurpose = await db.getCharacterLevels(prefs.hyvUid!, variant.value.id);
        if (levelsByPurpose != null) {
          _updateSliderRange(levelsByPurpose, state);
        }
      }
    });

    useEffect(() {
      if (prefs.isLinkedWithHoyolab) {
        ref.read(levelBagSyncStateNotifierProvider(variantId: variant.value.id).notifier)
            .syncInGameCharacter().then((result) {
              var newState = state.value;
              for (final e in result.entries) {
                newState = newState.copyWith(
                  rangeValues: {...newState.rangeValues}..[e.key] = LevelRangeValues(e.value, max(e.value, newState.rangeValues[e.key]!.end)),
                  checkedTalentTypes: {...newState.checkedTalentTypes}..[e.key] = e.value < newState.sliderTickLabels[e.key]!.last,
                );
              }
              state.value = newState;
            });
      }
      return null;
    }, [variant.value],);

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
                              final status = ref.watch(levelBagSyncStateNotifierProvider(variantId: variant.value.id));
                              return GameDataSyncIndicator(
                                status: status,
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

                if (equippedWeaponId.data != null)
                  FullWidth(
                    child: ListTile(
                      title: Text(tr.characterDetailsPage.equippedWeapon),
                      subtitle: Text(assetData.weapons[equippedWeaponId.data]!.name.localized),
                      leading: Image.file(
                        assetData.weapons[equippedWeaponId.data]!.getImageFile(assetData.assetDir),
                        width: 50,
                        height: 50,
                      ),
                      trailing: const Icon(Symbols.chevron_right),
                      onTap: () {
                        WeaponDetailsRoute(
                          id: equippedWeaponId.data!,
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
    );
  }

  List<Widget> _buildAscensionMaterialCards(_CharacterDetailsPageState state) {
    final mbFrames = assetData.characterIngredients.purposes[Purpose.ascension]!.levels.mapInLevelRange(
      state.rangeValues[Purpose.ascension]!,
      (key, value) {
        return toMaterialBookmarkFrames(
          level: key,
          ingredients: value,
          purposeType: Purpose.ascension,
          characterOrWeapon: character,
          assetData: assetData,
        );
      },
    ).flattened.toList();
    final items = mergeMaterialBookmarkFrames(mbFrames);

    return sortMaterials(items, assetData)
        .map(
          (item) => MaterialItem(
            key: ValueKey(item.id),
            item: item,
            possiblePurposeTypes: const [Purpose.ascension],
            expItems: assetData.characterIngredients.expItems,
            usage: MaterialUsage(
              characterId: character.id,
            ),
            bagCounts: state.bagCounts,
          ),
        )
        .toList();
  }

  List<Widget> _buildTalentMaterialCards(
    Talents talents,
    CharacterOrVariant variant,
    _CharacterDetailsPageState state,
  ) {
    final mbFrames = <MaterialBookmarkFrame>[];
    for (final talentType in talents.keys) {
      if (state.checkedTalentTypes[Purpose.fromTalentType(talentType)]!) {
        mbFrames.addAll(
          assetData.characterIngredients.purposes[Purpose.fromTalentType(talentType)]!.levels.mapInLevelRange(
            state.rangeValues[Purpose.fromTalentType(talentType)]!,
                (key, value) {
              return toMaterialBookmarkFrames(
                level: key,
                ingredients: value,
                purposeType: Purpose.fromTalentType(talentType),
                characterOrWeapon: variant,
                assetData: assetData,
              );
            },
          ).flattened,
        );
      }
    }
    final items = mergeMaterialBookmarkFrames(mbFrames);

    return sortMaterials(items, assetData)
        .map(
          (item) => MaterialItem(
            key: ValueKey(item.id),
            item: item,
            possiblePurposeTypes:
                talents.keys.map(Purpose.fromTalentType).toList(),
            expItems: assetData.characterIngredients.expItems,
            usage: MaterialUsage(
              characterId: variant.id,
            ),
            bagCounts: state.bagCounts,
          ),
        ).toList();
  }

  Future<void> _updateSliderRange(Map<Purpose, int> levelsByPurpose, ValueNotifier<_CharacterDetailsPageState> state) async {
    state.value = state.value.copyWith(
      rangeValues: state.value.rangeValues.map((key, value) =>
          MapEntry(key, LevelRangeValues(value.start, levelsByPurpose[key] ?? value.end)),),
      checkedTalentTypes: state.value.checkedTalentTypes.map((key, value) =>
          MapEntry(key, levelsByPurpose[key] != null && levelsByPurpose[key]! < state.value.sliderTickLabels[key]!.last),),
    );
  }
}

@Freezed(copyWith: true)
class _CharacterDetailsPageState with _$CharacterDetailsPageState {
  const factory _CharacterDetailsPageState({
    required Map<Purpose, LevelRangeValues> rangeValues,
    required Map<Purpose, List<int>> sliderTickLabels,
    required Map<Purpose, bool> checkedTalentTypes,
    required Map<Purpose, GlobalKey> talentSectionKeys,
    required Map<int, int> bagCounts,
  }) = __CharacterDetailsPageState;

  /// Initializes state for each purpose
  factory _CharacterDetailsPageState.init({
    required CharacterIngredients ingredients,
    Map<Purpose, int>? initialCharacterLevels,
  }) {
    final sliderTickLabels = <Purpose, List<int>>{};
    final rangeValues = <Purpose, LevelRangeValues>{};
    final checkedTalentTypes = <Purpose, bool>{};
    final talentSectionKeys = <Purpose, GlobalKey>{};

    for (final purpose in ingredients.purposes.keys) {
      final levels = ingredients.purposes[purpose]!.levels;
      final initialSliderLowerRange = initialCharacterLevels?[purpose] ?? 1;

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
      bagCounts: {},
    );
  }
}
