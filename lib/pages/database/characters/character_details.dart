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
import "../../../components/level_slider.dart";
import "../../../components/material_card.dart";
import "../../../components/material_slider.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../db/bookmark_db_extension.dart";
import "../../../db/in_game_character_state_db_extension.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";
import "../../../models/ingredients.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/game_data_sync.dart";
import "../../../providers/preferences.dart";
import "../../../routes.dart";
import "../../../ui_core/layout.dart";
import "../../../ui_core/snack_bar.dart";

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

    final characterLevels = ref.watch(gameDataSyncCachedProvider(
      variantId: characterOrVariant is CharacterGroup ? characterOrVariant.variantIds.first : id,
    ));

    if (characterLevels.hasValue) {
      return _CharacterDetailsPageContents(
        character: character,
        assetData: assetData,
        initialVariant: characterOrVariant is CharacterVariant ? characterOrVariant.element : null,
        initialCharacterLevels: characterLevels.value!.levels,
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
    final character = this.character; // for type guard

    final state = useState(useMemoized(() => _CharacterDetailsPageState.init(
      ingredients: assetData.characterIngredients,
      rarity: character.rarity,
      initialCharacterLevels: initialCharacterLevels,
    )));

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
          final ingLevels = ingredients.getLevels(rarity: character.rarity, purpose: e.key);newState = newState.copyWith(
            rangeValues: {...newState.rangeValues}..[e.key] = LevelRangeValues(e.value, max(e.value, newState.rangeValues[e.key]!.end)),
            checkedTalentTypes: {...newState.checkedTalentTypes}..[e.key] = e.value < ingLevels.levels.keys.last,
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

                  for (final slider in ingredients.sliders)
                    Section(
                      heading: SectionHeading(slider.title.localized),
                      child: MaterialSlider(
                        ingredientConf: ingredients,
                        purposes: slider.purposes,
                        target: switch (slider.preferredTargetType) {
                          PreferredTargetType.group => character,
                          PreferredTargetType.variant || null => variant.value,
                        },
                        ranges: UnmodifiableMapView(state.value.rangeValues),
                        labelBuilder: (context, purpose) {
                          if (purpose != Purpose.ascension) {
                            return Text.rich( // checkbox label
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
                            );
                          }
                          return null; // no label for ascension
                        },
                        onRangesChanged: (value) {
                          state.value = state.value.copyWith(
                            rangeValues: value,
                          );
                        },
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
}

@Freezed(copyWith: true)
sealed class _CharacterDetailsPageState with _$CharacterDetailsPageState {
  const factory _CharacterDetailsPageState({
    required Map<Purpose, LevelRangeValues> rangeValues,
    required Map<Purpose, bool> checkedTalentTypes,
    required Map<Purpose, GlobalKey> talentSectionKeys,
    required Map<String, int> lackNums,
    required String? equippedWeaponId,
  }) = __CharacterDetailsPageState;

  /// Initializes state for each purpose
  factory _CharacterDetailsPageState.init({
    required IngredientConfigurations ingredients,
    required int rarity,
    Map<Purpose, int>? initialCharacterLevels,
  }) {
    final rangeValues = <Purpose, LevelRangeValues>{};
    final checkedTalentTypes = <Purpose, bool>{};
    final talentSectionKeys = <Purpose, GlobalKey>{};

    for (final purpose in ingredients.rarities[rarity]!.purposes.keys) {
      final levels = ingredients.getLevels(rarity: rarity, purpose: purpose).levels;
      final initialSliderLowerRange = initialCharacterLevels?[purpose] ?? 1;

      rangeValues[purpose] = LevelRangeValues(initialSliderLowerRange, levels.keys.last);
      checkedTalentTypes[purpose] = initialSliderLowerRange < levels.keys.last;
      talentSectionKeys[purpose] = GlobalKey();
    }

    return _CharacterDetailsPageState(
      rangeValues: rangeValues,
      checkedTalentTypes: checkedTalentTypes,
      talentSectionKeys: talentSectionKeys,
      lackNums: {},
      equippedWeaponId: null,
    );
  }
}
