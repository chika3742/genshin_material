import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/center_text.dart";
import "../../../components/game_data_sync_indicator.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/level_slider.dart";
import "../../../components/list_tile.dart";
import "../../../components/material_card_list.dart";
import "../../../components/rarity_stars.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../data/repositories/bag_counts_single_repository.dart";
import "../../../data/repositories/character_state_repository.dart";
import "../../../data/repositories/single_character_state_repository.dart";
import "../../../data/services/crashlytics_service.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";
import "../../../models/level_range_values.dart";
import "../../../providers/asset_image_resolver.dart";
import "../../../providers/is_sync_enabled.dart";
import "../../../routes.dart";
import "../../../ui_core/layout.dart";
import "../../../ui_core/snack_bar.dart";
import "../../../view_models/database/character_details_view_model.dart";

class CharacterDetailsPage extends HookConsumerWidget {
  final AssetData assetData;
  final CharacterOrVariantId id;

  const CharacterDetailsPage({super.key, required this.assetData, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = useMemoized(UniqueKey.new);
    final stateSnapshot = ref.watch(characterDetailsViewModelProvider(key, id));

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
    // character not found
    if (stateSnapshot.value == null) {
      return Scaffold(
        appBar: AppBar(),
        body: CenterText(tr.errors.characterNotFound),
      );
    }

    return _CharacterDetailsContents(
      assetData: assetData,
      provider: characterDetailsViewModelProvider(key, id),
      state: stateSnapshot.value!,
    );
  }
}

class _CharacterDetailsContents extends HookConsumerWidget {
  final AssetData assetData;
  final CharacterDetailsViewModelProvider provider;
  final CharacterDetailsState state;

  const _CharacterDetailsContents({
    required this.assetData,
    required this.provider,
    required this.state,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CharacterDetailsViewModel notifier() => ref.read(provider.notifier);

    final CharacterDetailsState(:character, :variant, :sliders) = state;

    final images = ref.watch(assetImageResolverProvider);
    final isCharaSyncEnabled = ref.watch(isCharacterSyncEnabledProvider(variantId: variant.id));
    final bagCounts = ref.watch(bagCountsSingleProvider(variantId: variant.id));
    final characterState = isCharaSyncEnabled
        ? ref.watch(singleCharacterStateRepositoryProvider(variant.id)).value
        : null;
    final fetchState = isCharaSyncEnabled
        ? ref.watch(SingleCharacterStateRepository.fetchMutation(variant.id))
        : null;

    final ingredients = assetData.characterIngredients;

    useEffect(() {
      if (isCharaSyncEnabled) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          SingleCharacterStateRepository.executeFetch(ref, variant.id)
              .catchError(ref.read(crashlyticsServiceProvider).logAndReport);
        });
      }
      return null;
    }, [variant.id, isCharaSyncEnabled]);

    if (isCharaSyncEnabled) {
      ref.listen(SingleCharacterStateRepository.fetchMutation(variant.id), (_, next) {
        if (next case MutationSuccess(value: FetchSuccess(state: CharacterState(:final levels)))) {
          notifier().applySyncedLevels(levels).then((removed) {
            if (removed && context.mounted) {
              showSnackBar(context: context, message: tr.common.removedObsoleteBookmarks);
            }
          });
        }
      });
    }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // character information
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GameItemInfoBox(
                      itemImage: Image.file(
                        images.getSmallFile(variant),
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
                              assetData.elements[variant.element]!.getImageFile(assetData.assetDir),
                              width: 26,
                              height: 26,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            const SizedBox(width: 4),
                            Text(assetData.elements[variant.element]!.text.localized),
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
                      Consumer(
                        builder: (context, ref, _) {
                          if (variant.disableSync) {
                            return const SizedBox();
                          }
                          final state = GameDataSyncStatus.combine([
                            if (fetchState != null)
                              GameDataSyncStatus.fromCharacterFetch(fetchState),
                            GameDataSyncStatus.fromAsyncValue(bagCounts),
                          ]);
                          return state != null ? GameDataSyncIndicator(
                            status: state,
                          ) : SizedBox();
                        },
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Symbols.swords),
                            onPressed: () {
                              WeaponListRoute(equipCharacterId: variant.id).push(context);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Symbols.person_play),
                            onPressed: () {
                              ArtifactListRoute(equipCharacterId: variant.id).push(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // character variant dropdown
              if (character.variants.length > 1)
                DropdownButtonFormField<VariantId>(
                  initialValue: variant.id,
                  items: character.variants.map((e) {
                    return DropdownMenuItem(
                      value: e.id,
                      child: Row(
                        children: [
                          Image.file(
                            assetData.elements[e.element]!
                                .getImageFile(assetData.assetDir),
                            width: 25,
                            height: 25,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(width: 4),
                          Text(assetData.elements[e.element]!.text.localized),
                        ],
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    label: Text(tr.common.element),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    notifier().selectVariant(value!);
                  },
                ),

              if (characterState != null)
                () {
                  final equippedWeapon = characterState.equippedWeaponId != null
                      ? assetData.weapons[characterState.equippedWeaponId]
                      : null;
                  return FullWidth(
                    child: ListTile(
                      title: Text(tr.characterDetailsPage.equippedWeapon),
                      subtitle: Text(equippedWeapon?.name.localized ?? tr.characterDetailsPage.unknownWeapon),
                      leading: equippedWeapon != null
                          ? Image.file(
                        images.getFile(equippedWeapon),
                        width: 50,
                        height: 50,
                      )
                          : const Icon(Symbols.question_mark, size: 38),
                      trailing: equippedWeapon != null ? const Icon(Symbols.chevron_right) : null,
                      onTap: equippedWeapon != null ? () {
                        WeaponDetailsRoute(
                          id: equippedWeapon.id,
                          initialSelectedCharacter: variant.id,
                        ).push(context);
                      } : null,
                    ),
                  );
                }(),

              Main(children: [
                for (final sliderGroup in ingredients.sliders)
                  Section(
                    heading: SectionHeading(sliderGroup.title.localized),
                    child: Column(
                      spacing: 16.0,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          spacing: 8.0,
                          children: [
                            for (final purpose in sliderGroup.purposes)
                              _buildSlider(
                                variant,
                                purpose,
                                sliders.ranges[purpose]!,
                                active: !sliders.hiddenPurposes.contains(purpose),
                                onActiveChanged: (value) {
                                  notifier().setActive(purpose, value);
                                },
                                onRangeChanged: (value) {
                                  notifier().setRange(purpose, value);
                                },
                              ),
                          ],
                        ),
                        MaterialCardList(
                          target: switch (sliderGroup.preferredTargetType) {
                                .group => character,
                                .variant || null => variant,
                          },
                          purposes: sliderGroup.purposes,
                          ingredientConf: ingredients,
                          bagCounts: bagCounts.value,
                          ranges: sliders.visibleRanges(sliderGroup.purposes),
                        ),
                      ],
                    ),
                  ),

                Section(
                  heading: SectionHeading(tr.characterDetailsPage.favoriteFurnishingSets),
                  child: Column(
                    children: assetData.furnishingSets.values
                        .where((e) => e.favoriteCharacterHyvIds
                        .any((id) => character.hyvIds.contains(id))).map((e) {
                      return FullWidth(
                        child: SimpleListTile(
                          leading: Image.file(
                            images.getFile(e),
                            width: listTileFurnishingSetImageWidth,
                          ),
                          title: e.name.localized,
                          location: FurnishingSetDetailsRoute(id: e.id).location,
                          routingStrategy: RoutingStrategy.push,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(
    CharacterVariant variant,
    Purpose purpose,
    LevelRangeValues values, {
    required bool active,
    required ValueChanged<bool> onActiveChanged,
    required ValueChanged<LevelRangeValues> onRangeChanged,
  }) {
    final context = useContext();
    final levels = assetData.characterIngredients
        .getLevels(rarity: variant.rarity, purpose: purpose);
    return LevelSlider(
      levels: levels.levels.keys.toList(),
      ticks: levels.sliderTicks,
      values: values,
      active: active,
      label: purpose != .ascension ? Text.rich(TextSpan(children: [
        TextSpan(
          text: tr.talentTypes[purpose.name]!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const TextSpan(text: "  "),
        TextSpan(
          text: variant.talents[purpose.name]!.name.localized,
        ),
      ])) : null,
      onActiveChanged: onActiveChanged,
      onChanged: onRangeChanged,
    );
  }
}
