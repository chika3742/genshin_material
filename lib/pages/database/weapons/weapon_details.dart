import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../../components/center_text.dart";
import "../../../components/character_select_dropdown.dart";
import "../../../components/effect_description.dart";
import "../../../components/game_data_sync_indicator.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/item_source_widget.dart";
import "../../../components/level_slider.dart";
import "../../../components/material_card.dart";
import "../../../components/material_slider.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../db/in_game_weapon_state_db_extension.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/game_data_sync.dart";
import "../../../providers/preferences.dart";
import "../../../ui_core/layout.dart";
import "../../../ui_core/snack_bar.dart";
import "../../../utils/filtering.dart";

part "weapon_details.freezed.dart";

class WeaponDetailsPage extends HookConsumerWidget {
  final AssetData assetData;
  final String id;
  final CharacterId? initialSelectedCharacter;

  const WeaponDetailsPage({super.key, required this.id, required this.assetData, this.initialSelectedCharacter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesStateNotifierProvider);

    final weapon = assetData.weapons[id];
    if (weapon == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const CenterText("Weapon not found"),
      );
    }

    final ingredients = assetData.weaponIngredients;
    final levelsEntry = ingredients.getLevels(
      rarity: weapon.rarity,
      purpose: Purpose.ascension,
    );

    final characters = useMemoized(() => filterCharactersByWeaponType(assetData.characters.values, weapon.type).toList());
    final selectedCharacterIdInit = useMemoized(
      () => initialSelectedCharacter != null && characters.any((e) => e.id == initialSelectedCharacter)
            ? initialSelectedCharacter!
            : characters.first.id,
    );
    final state = useState(_WeaponDetailsPageState.init(
      rangeValues: LevelRangeValues(1, levelsEntry.levels.keys.last),
      selectedCharacterId: selectedCharacterIdInit,
    ));

    final sliderRangeInitialized = useState(!prefs.isLinkedWithHoyolab); // Set to true initially when not linked
    useEffect(() {
      if (prefs.isLinkedWithHoyolab) {
        ref.read(levelBagSyncStateNotifierProvider(variantId: selectedCharacterId.value, weaponId: weapon.id).notifier)
            .syncInGameCharacter().then((result) {
              if (result != null) {
                for (final e in result.levels.entries) {
                  final purpose = e.key;
                  state.value = state.value.copyWithDrv(LevelRangeValues(
                    e.value,
                    max(state.value.rangeValues[purpose]?.end ?? e.value, e.value),
                  ));
                }
                if (result.hasRemovedBookmarks && context.mounted) {
                  showSnackBar(context: context, message: tr.common.removedObsoleteBookmarks);
                }
              }
            });
        db.getWeaponLevel(prefs.hyvUid!, selectedCharacterId.value, weapon.id).then((value) {
          if (value != null) {
            state.value = state.value.copyWithDrv(LevelRangeValues(
              value,
              max(state.value.defaultRangeValues.end, value),
            ));
          }
          sliderRangeInitialized.value = true;
        });
      }
      return null;
    }, [state.value.selectedCharacterId]);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.weaponDetails(weapon: weapon.name.localized)),
      ),
      body: QuantityTickerHandler(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: GappedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: 16,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GameItemInfoBox(
                        itemImage: Image.file(
                          weapon.getImageFile(assetData.assetDir),
                          width: 50,
                          height: 50,
                        ),
                        children: [
                          RarityStars(count: weapon.rarity),
                          Text(
                            assetData.weaponTypes[weapon.type]!.name.localized,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    if (prefs.isLinkedWithHoyolab)
                      Consumer(
                        builder: (context, ref, _) {
                          return GameDataSyncIndicator(
                            status: ref.watch(gameDataSyncStateProvider(
                              variantId: state.value.selectedCharacterId,
                              weaponId: weapon.id,
                            )),
                          );
                        },
                      ),
                  ],
                ),

                CharacterSelectDropdown(
                  label: tr.weaponDetailsPage.characterToEquip,
                  characters: characters,
                  value: state.value.selectedCharacterId,
                  onChanged: (value) {
                    state.value = state.value.copyWith(
                      selectedCharacterId: value!,
                    );
                  },
                ),

                for (final slider in ingredients.sliders)
                  Section(
                    heading: SectionHeading(slider.title.localized),
                    child: MaterialSlider(
                      ingredientConf: ingredients,
                      purposes: slider.purposes,
                      target: weapon,
                      characterId: state.value.selectedCharacterId,
                      ranges: UnmodifiableMapView(state.value.rangeValues),
                      onRangesChanged: (value) {
                        state.value = state.value.copyWith(
                          rangeValues: value,
                        );
                      },
                    ),
                  ),

                Section(
                  heading: SectionHeading(tr.weaponDetailsPage.skillEffect),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: EffectDescription(weapon.weaponAffixDesc?.localized ?? tr.common.none),
                  ),
                ),

                if (weapon.source != null)
                  Section(
                    heading: SectionHeading(tr.materialDetailsPage.source),
                    child: ItemSourceWidget(weapon.source!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@Freezed(copyWith: true)
sealed class _WeaponDetailsPageState with _$WeaponDetailsPageState {
  const _WeaponDetailsPageState._();

  const factory _WeaponDetailsPageState({
    required Map<Purpose, LevelRangeValues> rangeValues,
    required CharacterId selectedCharacterId,
  }) = __WeaponDetailsPageState;

  factory _WeaponDetailsPageState.init({
    required LevelRangeValues rangeValues,
    required CharacterId selectedCharacterId,
  }) {
    return _WeaponDetailsPageState(
      rangeValues: {
        Purpose.ascension: rangeValues,
      },
      selectedCharacterId: selectedCharacterId,
    );
  }

  LevelRangeValues get defaultRangeValues {
    return rangeValues[Purpose.ascension]!;
  }

  /// Copy with default range values
  _WeaponDetailsPageState copyWithDrv(LevelRangeValues rangeValues) {
    return copyWith(rangeValues: {
      ...this.rangeValues,
      Purpose.ascension: rangeValues,
    });
  }
}
