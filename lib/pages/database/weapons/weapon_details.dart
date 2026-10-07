import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../../components/center_text.dart";
import "../../../components/character_select_dropdown.dart";
import "../../../components/effect_description.dart";
import "../../../components/game_data_sync_indicator.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/item_source_widget.dart";
import "../../../components/level_slider.dart";
import "../../../components/material_card_list.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../core/pref_keys.dart";
import "../../../data/repositories/character_state_repository.dart";
import "../../../data/repositories/single_character_state_repository.dart";
import "../../../data/services/crashlytics_service.dart";
import "../../../db/bookmark_db_extension.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";
import "../../../models/ingredients.dart";
import "../../../models/level_range_values.dart";
import "../../../models/weapon.dart";
import "../../../providers/asset_image_resolver.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/game_data_sync.dart";
import "../../../providers/is_sync_enabled.dart";
import "../../../providers/pref_notifier.dart";
import "../../../ui_core/layout.dart";
import "../../../ui_core/snack_bar.dart";

part "weapon_details.freezed.dart";

class WeaponDetailsPage extends HookConsumerWidget {
  const WeaponDetailsPage({
    super.key,
    required this.id,
    required this.assetData,
    this.initialSelectedCharacter,
  });

  final AssetData assetData;
  final String id;
  final VariantId? initialSelectedCharacter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weapon = assetData.weapons[id];
    if (weapon == null) {
      return Scaffold(
        appBar: AppBar(),
        body: CenterText(tr.errors.weaponNotFound),
      );
    }

    final db = ref.watch(appDatabaseProvider);

    final characters = useMemoized(() =>
        _filterCharactersByWeaponType(assetData.variants.values, weapon.type));
    final initialCharacter = characters.firstWhereOrNull((e) => e.id == initialSelectedCharacter)
        ?? characters.first;

    final weaponSyncEnabled = ref.watch(isCharacterSyncEnabledProvider(
      variantId: initialCharacter.id,
      weaponId: weapon.id,
    ));
    final characterState = weaponSyncEnabled
        ? ref.watch(singleCharacterStateRepositoryProvider(initialCharacter.id))
        : null;

    final bookmarkRangesResult = useMemoized(
        () => db.getWeaponMaterialBookmarkLevelRanges(id));
    final bookmarkRangesSnapshot = useFuture(bookmarkRangesResult);

    // loading
    if (bookmarkRangesSnapshot.connectionState != ConnectionState.done
        || (characterState is AsyncLoading<CharacterState?> && !characterState.hasValue)) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return WeaponDetailsPageContents(
      weapon: weapon,
      assetData: assetData,
      initialSelectedCharacter: initialCharacter.id,
      initialCharacterState: characterState?.value,
      initialBookmarkRanges: bookmarkRangesSnapshot.data ?? {},
    );
  }
}


class WeaponDetailsPageContents extends HookConsumerWidget {
  final AssetData assetData;
  final Weapon weapon;
  final VariantId initialSelectedCharacter;
  final CharacterState? initialCharacterState;
  final Map<Purpose, ({int minUpperLevel, int maxUpperLevel})> initialBookmarkRanges;

  const WeaponDetailsPageContents({
    super.key,
    required this.weapon,
    required this.assetData,
    required this.initialSelectedCharacter,
    this.initialCharacterState,
    this.initialBookmarkRanges = const {},
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(assetImageResolverProvider);
    final ingredients = assetData.weaponIngredients;

    final state = useState(_WeaponDetailsPageState.init(
      ingredients: ingredients,
      weapon: weapon,
      selectedCharacterId: initialSelectedCharacter,
      initialCharacterState: initialCharacterState,
      bookmarkRanges: initialBookmarkRanges,
    ));

    final characters = useMemoized(() => _filterCharactersByWeaponType(assetData.variants.values, weapon.type));
    final selectedCharacter = characters.firstWhere((e) => e.id == state.value.selectedCharacterId);

    final isWeaponSyncEnabled = ref.watch(isCharacterSyncEnabledProvider(
      variantId: selectedCharacter.id,
      weaponId: weapon.id,
    ));
    final isLackNumSyncEnabled = ref.watch(isBagLackNumSyncEnabledProvider(variantId: selectedCharacter.id));

    // Watch bag lack nums directly so the value is available immediately even when the provider
    // already has a cached result (e.g. the same weapon screen is open in another ShellRoute).
    final syncCharacter = GameDataSyncCharacter.single(
      variantId: state.value.selectedCharacterId,
      weaponId: weapon.id,
    );
    final lackNums = isLackNumSyncEnabled
        ? ref.watch(bagLackNumProvider(syncCharacter)).value
        : null;

    final fetchState = isWeaponSyncEnabled
        ? ref.watch(SingleCharacterStateRepository.fetchMutation(selectedCharacter.id))
        : null;
    final characterState = isWeaponSyncEnabled
        ? ref.watch(singleCharacterStateRepositoryProvider(selectedCharacter.id))
        : null;

    void applyWeaponState(Map<Purpose, int> levels) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentLevel = levels[Purpose.ascension]!;
        state.value = state.value.copyWith(
          rangeValues: {
            .ascension: LevelRangeValues(
              currentLevel,
              max(currentLevel, state.value.rangeValues[Purpose.ascension]!.end),
            ),
          },
        );
      });
    }

    useEffect(() {
      if (fetchState case MutationSuccess(value: FetchSuccess(:final state)) when state.equippedWeaponId == weapon.id) {
        applyWeaponState(state.weaponLevels);

        if (ref.read(prefProvider(PrefKeys.autoRemoveBookmarks))) {
          ref.read(appDatabaseProvider).deleteObsoleteBookmarks(
            characterId: selectedCharacter.id,
            weaponId: weapon.id,
            levels: state.weaponLevels,
          ).then((removed) {
            if (context.mounted && removed) {
              showSnackBar(context: context, message: tr.common.removedObsoleteBookmarks);
            }
          });
        }
      }
      return null;
    }, [fetchState]);

    // applies weapon state when selected character is changed
    useValueChanged<String, void>(selectedCharacter.id, (_, _) {
      if (characterState?.value case final s? when s.equippedWeaponId == weapon.id) {
        applyWeaponState(s.weaponLevels);
      }
    });

    useEffect(() {
      if (isWeaponSyncEnabled) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          SingleCharacterStateRepository.executeFetch(ref, selectedCharacter.id)
              .catchError(ref.read(crashlyticsServiceProvider).logAndReport);
        });
      }
      return null;
    }, [selectedCharacter.id, isWeaponSyncEnabled]);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.weaponDetails(weapon: weapon.name.localized)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Row(
              children: [
                Expanded(
                  child: GameItemInfoBox(
                    itemImage: Image.file(
                      images.getFile(weapon),
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
                if (isWeaponSyncEnabled)
                  Consumer(
                    builder: (context, ref, _) {
                      final syncStatus = GameDataSyncStatus.combine([
                        if (fetchState case MutationSuccess(value: FetchSuccess(state: CharacterState(:final equippedWeaponId))) when equippedWeaponId != weapon.id)
                          GameDataSyncStatus.weaponNotEquipped(),
                        if (fetchState != null)
                          GameDataSyncStatus.fromCharacterFetch(fetchState),
                        ref.watch(gameDataSyncStateProvider(
                          variantId: state.value.selectedCharacterId,
                          weaponId: weapon.id,
                        )),
                      ]);
                      return syncStatus != null
                          ? GameDataSyncIndicator(
                              status: syncStatus,
                            )
                          : const SizedBox.shrink();
                    },
                ),
              ],
            ),

            CharacterSelectDropdown(
              label: tr.weaponDetailsPage.characterToEquip,
              characters: characters,
              initialValue: state.value.selectedCharacterId,
              onChanged: (value) {
                state.value = state.value.copyWith(
                  selectedCharacterId: value!,
                );
              },
            ),

            Main(children: [
              for (final slider in ingredients.sliders)
                Section(
                  heading: SectionHeading(slider.title.localized),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: .stretch,
                    children: [
                      for (final purpose in slider.purposes)
                        _buildSlider(
                          ingredients,
                          purpose,
                          state.value.rangeValues[purpose]!,
                          onRangeChanged: (value) {
                            state.value = state.value.copyWith(
                              rangeValues: {...state.value.rangeValues}..[purpose] = value,
                            );
                          },
                        ),

                      if (weapon.materials != null)
                        MaterialCardList(
                          target: weapon,
                          purposes: slider.purposes,
                          ingredientConf: ingredients,
                          lackNums: lackNums,
                          ranges: state.value.rangeValues,
                          wSelectedCharacter: state.value.selectedCharacterId,
                        )
                      else if (weapon.levelingDescription case final levelingDescription?)
                        Text(
                          levelingDescription.localized,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                    ],
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
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(
    IngredientConfigurations ingredients,
    Purpose purpose,
    LevelRangeValues values, {
    required ValueChanged<LevelRangeValues> onRangeChanged,
  }) {
    final levels = ingredients.getLevels(rarity: weapon.rarity, purpose: purpose);
    return LevelSlider(
      levels: levels.levels.keys.toList(),
      ticks: levels.sliderTicks,
      values: values,
      onChanged: onRangeChanged,
    );
  }
}

@Freezed(copyWith: true)
sealed class _WeaponDetailsPageState with _$WeaponDetailsPageState {
  const _WeaponDetailsPageState._();

  const factory _WeaponDetailsPageState({
    required Map<Purpose, LevelRangeValues> rangeValues,
    required VariantId selectedCharacterId,
  }) = __WeaponDetailsPageState;

  factory _WeaponDetailsPageState.init({
    required IngredientConfigurations ingredients,
    required Weapon weapon,
    required VariantId selectedCharacterId,
    required CharacterState? initialCharacterState,
    Map<Purpose, ({int minUpperLevel, int maxUpperLevel})> bookmarkRanges = const {},
  }) {
    final levelsEntry = ingredients.getLevels(
      rarity: weapon.rarity,
      purpose: Purpose.ascension,
    );
    final levelTicks = levelsEntry.levels.keys.toList();

    final LevelRangeValues ascensionRange;
    if (bookmarkRanges.containsKey(Purpose.ascension)) {
      final bookmark = bookmarkRanges[Purpose.ascension]!;
      final minUpperLevelIndex = levelTicks.indexOf(bookmark.minUpperLevel);
      final start = minUpperLevelIndex >= 1 ? levelTicks[minUpperLevelIndex - 1] : 1;
      ascensionRange = LevelRangeValues(start, bookmark.maxUpperLevel);
    } else {
      final currentLevel = initialCharacterState?.equippedWeaponId == weapon.id
          ? initialCharacterState!.weaponLevels[Purpose.ascension]
          : null;
      ascensionRange = LevelRangeValues(currentLevel ?? 1, levelTicks.last);
    }

    return _WeaponDetailsPageState(
      rangeValues: {
        Purpose.ascension: ascensionRange,
      },
      selectedCharacterId: selectedCharacterId,
    );
  }
}

List<CharacterVariant> _filterCharactersByWeaponType(Iterable<CharacterVariant> characters, WeaponType? weaponType) {
  return characters.where(
    (e) => weaponType == null || e.weaponType == weaponType,
  ).toList();
}
