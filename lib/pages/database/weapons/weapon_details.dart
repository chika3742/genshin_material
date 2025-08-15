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
import "../../../components/material_slider.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../database.dart";
import "../../../db/in_game_weapon_state_db_extension.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../models/weapon.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/game_data_sync.dart";
import "../../../providers/preferences.dart";
import "../../../ui_core/layout.dart";
import "../../../utils/filtering.dart";

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
  final CharacterId? initialSelectedCharacter;

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
    final (uid, syncWeaponState) = ref.watch(preferencesStateNotifierProvider
        .select((e) => (e.hyvUid, e.syncWeaponState)));

    final characters = useMemoized(() =>
        filterCharactersByWeaponType(assetData.characters.values, weapon.type));
    final initialCharacterId = initialSelectedCharacter != null && characters.any((e) => e.id == initialSelectedCharacter)
        ? initialSelectedCharacter!
        : characters.first.id;

    final wsResult = useMemoized(() => uid != null
        ? db.getWeaponState(uid, initialCharacterId, id)
        : Future.value(null));
    final wsSnapshot = useFuture(wsResult);

    // loading
    if (uid != null && syncWeaponState && wsSnapshot.connectionState != ConnectionState.done) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return WeaponDetailsPageContents(
      weapon: weapon,
      assetData: assetData,
      initialSelectedCharacter: initialCharacterId,
      initialWeaponState: wsSnapshot.data,
    );
  }
}


class WeaponDetailsPageContents extends HookConsumerWidget {
  final AssetData assetData;
  final Weapon weapon;
  final CharacterId initialSelectedCharacter;
  final InGameWeaponState? initialWeaponState;

  const WeaponDetailsPageContents({
    super.key,
    required this.weapon,
    required this.assetData,
    required this.initialSelectedCharacter,
    this.initialWeaponState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredients = assetData.weaponIngredients;
    final levelsEntry = ingredients.getLevels(
      rarity: weapon.rarity,
      purpose: Purpose.ascension,
    );

    final state = useState(_WeaponDetailsPageState.init(
      rangeValues: LevelRangeValues(1, levelsEntry.levels.keys.last),
      selectedCharacterId: initialSelectedCharacter,
    ));

    final characters = useMemoized(() => filterCharactersByWeaponType(assetData.characters.values, weapon.type).toList());
    final selectedCharacterId = useState(initialSelectedCharacter);

    ref.listen(gameDataSyncCachedProvider(
      variantId: selectedCharacterId.value,
      weaponId: weapon.id,
    ), (_, result) {
      if (result.value?.levels != null) {
        for (final e in result.value!.levels!.entries) {
          final purpose = e.key;
          state.value = state.value.copyWithDrv(LevelRangeValues(
            e.value,
            max(state.value.rangeValues[purpose]?.end ?? e.value, e.value),
          ));
        }
      }
    });

    ref.listen(bagLackNumProvider(GameDataSyncCharacter.single(
      variantId: selectedCharacterId.value,
      weaponId: weapon.id,
    )), (_, result) {
      if (result.valueOrNull == null) return;

      state.value = state.value.copyWith(
        lackNums: result.value!,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.weaponDetails(weapon: weapon.name.localized)),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
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
                  Consumer(
                    builder: (context, ref, _) {
                      final syncStatus = ref.watch(gameDataSyncStateProvider(
                          variantId: state.value.selectedCharacterId,
                          weaponId: weapon.id,
                        ));
                      return Visibility(
                        visible: syncStatus != null,
                        child: GameDataSyncIndicator(
                          status: syncStatus!,
                        ),
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

              Main(children: [
                for (final slider in ingredients.sliders)
                  Section(
                    heading: SectionHeading(slider.title.localized),
                    child: MaterialSlider(
                      ingredientConf: ingredients,
                      purposes: slider.purposes,
                      target: weapon,
                      characterId: state.value.selectedCharacterId,
                      ranges: UnmodifiableMapView(state.value.rangeValues),
                      lackNums: state.value.lackNums,
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
              ]),
            ],
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
    required Map<String, int> lackNums,
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
      lackNums: {},
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
