import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/experimental/mutation.dart";
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
import "../../../data/repositories/character_state_repository.dart";
import "../../../data/repositories/single_character_state_repository.dart";
import "../../../data/services/crashlytics_service.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";
import "../../../models/ingredients.dart";
import "../../../models/level_range_values.dart";
import "../../../models/weapon.dart";
import "../../../providers/asset_image_resolver.dart";
import "../../../providers/is_sync_enabled.dart";
import "../../../ui_core/layout.dart";
import "../../../ui_core/snack_bar.dart";
import "../../../view_models/database/single_bag_counts.dart";
import "../../../view_models/database/weapon_details_view_model.dart";

class WeaponDetailsPage extends HookConsumerWidget {
  const WeaponDetailsPage({
    super.key,
    required this.id,
    required this.assetData,
    this.initialSelectedCharacter,
  });

  final AssetData assetData;
  final WeaponId id;
  final VariantId? initialSelectedCharacter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = useMemoized(UniqueKey.new);
    final provider = weaponDetailsViewModelProvider(key, id, initialSelectedCharacter);
    final stateSnapshot = ref.watch(provider);

    // loading initial state
    if (!stateSnapshot.hasValue && stateSnapshot.isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    // failed to create state
    if (stateSnapshot.hasError) {
      return Scaffold(
        appBar: AppBar(),
        body: CenterText(tr.common.error),
      );
    }
    // weapon not found
    if (stateSnapshot.value == null) {
      return Scaffold(
        appBar: AppBar(),
        body: CenterText(tr.errors.weaponNotFound),
      );
    }

    return _WeaponDetailsContents(
      assetData: assetData,
      weapon: assetData.weapons[id]!,
      provider: provider,
      state: stateSnapshot.value!,
    );
  }
}

class _WeaponDetailsContents extends HookConsumerWidget {
  final AssetData assetData;
  final Weapon weapon;
  final WeaponDetailsViewModelProvider provider;
  final WeaponDetailsState state;

  const _WeaponDetailsContents({
    required this.assetData,
    required this.weapon,
    required this.provider,
    required this.state,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeaponDetailsViewModel notifier() => ref.read(provider.notifier);

    final WeaponDetailsState(:selectableCharacters, :selectedCharacter, :syncedLevels, :sliders) = state;

    final images = ref.watch(assetImageResolverProvider);
    final ingredients = assetData.weaponIngredients;

    final isSyncEnabled = ref.watch(isCharacterSyncEnabledProvider(
      variantId: selectedCharacter.id,
      weaponId: weapon.id,
    ));

    final bagCounts = ref.watch(singleBagCountsProvider(weaponId: weapon.id));

    final fetchState = isSyncEnabled
        ? ref.watch(SingleCharacterStateRepository.fetchMutation(selectedCharacter.id))
        : null;

    useEffect(() {
      if (isSyncEnabled) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          SingleCharacterStateRepository.executeFetch(ref, selectedCharacter.id)
              .catchError(ref.read(crashlyticsServiceProvider).logAndReport);
        });
      }
      return null;
    }, [selectedCharacter.id, isSyncEnabled]);

    if (isSyncEnabled) {
      ref.listen(SingleCharacterStateRepository.fetchMutation(selectedCharacter.id), (_, next) {
        if (next case MutationSuccess(value: FetchSuccess(state: CharacterState(:final equippedWeaponId, :final weaponLevels)))
            when equippedWeaponId == weapon.id) {
          notifier().applySyncedLevels(weaponLevels).then((removed) {
            if (removed && context.mounted) {
              showSnackBar(context: context, message: tr.common.removedObsoleteBookmarks);
            }
          });
        }
      });
    }

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
                if (isSyncEnabled)
                  Consumer(
                    builder: (context, ref, _) {
                      final syncStatus = GameDataSyncStatus.combine([
                        if (fetchState case MutationSuccess(value: FetchSuccess(state: CharacterState(:final equippedWeaponId))) when equippedWeaponId != weapon.id)
                          GameDataSyncStatus.weaponNotEquipped(),
                        if (fetchState != null)
                          GameDataSyncStatus.fromCharacterFetch(fetchState),
                        GameDataSyncStatus.fromAsyncValue(bagCounts),
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
              characters: selectableCharacters,
              initialValue: selectedCharacter.id,
              onChanged: (value) {
                notifier().selectCharacter(value!);
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
                          sliders.ranges[purpose]!,
                          syncedLevel: syncedLevels?[purpose],
                          reserveSyncedLevelSpace: isSyncEnabled,
                          onRangeChanged: (value) {
                            notifier().setRange(purpose, value);
                          },
                        ),

                      if (weapon.materials != null)
                        MaterialCardList(
                          target: weapon,
                          purposes: slider.purposes,
                          ingredientConf: ingredients,
                          bagCounts: bagCounts.value,
                          ranges: sliders.ranges,
                          wSelectedCharacter: selectedCharacter.id,
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
    int? syncedLevel,
    required bool reserveSyncedLevelSpace,
    required ValueChanged<LevelRangeValues> onRangeChanged,
  }) {
    final levels = ingredients.getLevels(rarity: weapon.rarity, purpose: purpose);
    return LevelSlider(
      levels: levels.levels.keys.toList(),
      ticks: levels.sliderTicks,
      values: values,
      syncedLevel: syncedLevel,
      reserveSyncedLevelSpace: reserveSyncedLevelSpace,
      onChanged: onRangeChanged,
    );
  }
}
