import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../../components/center_text.dart";
import "../../../components/character_select_dropdown.dart";
import "../../../components/effect_description.dart";
import "../../../components/game_data_sync_indicator.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/item_source_widget.dart";
import "../../../components/level_slider.dart";
import "../../../components/material_card.dart";
import "../../../components/material_item.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../database.dart";
import "../../../db/in_game_weapon_state_db_extension.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../models/material_bookmark_frame.dart";
import "../../../models/weapon.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/game_data_sync.dart";
import "../../../providers/preferences.dart";
import "../../../ui_core/layout.dart";
import "../../../utils/filtering.dart";
import "../../../utils/ingredients_converter.dart";
import "../../../utils/lists.dart";

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
    final prefs = ref.watch(preferencesStateNotifierProvider);

    final levelsEntry = assetData.weaponIngredients
        .rarities[weapon.rarity]!;
    final rangeValues = useState(LevelRangeValues(initialWeaponState?.purposes[Purpose.ascension] ?? 1, levelsEntry.levels.keys.last));
    final lackNums = useState(<String, int>{});

    final characters = useMemoized(() => filterCharactersByWeaponType(assetData.characters.values, weapon.type).toList());
    final selectedCharacterId = useState(initialSelectedCharacter);

    ref.listen(gameDataSyncCachedProvider(
      variantId: selectedCharacterId.value,
      weaponId: weapon.id,
    ), (_, result) {
      if (result.value?.levels?[Purpose.ascension] == null) return;

      rangeValues.value = LevelRangeValues(
        result.value!.levels![Purpose.ascension]!,
        max(rangeValues.value.end, result.value!.levels![Purpose.ascension]!),
      );
    });

    ref.listen(bagLackNumProvider(
      variantId: selectedCharacterId.value,
      weaponId: weapon.id,
    ), (_, result) {
      if (!result.hasValue) return;

      lackNums.value = result.value!;
    });

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
                              variantId: selectedCharacterId.value,
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
                  value: selectedCharacterId.value,
                  onChanged: (value) {
                    selectedCharacterId.value = value!;
                  },
                ),

                Section(
                  heading: SectionHeading(tr.weaponDetailsPage.ascension),
                  child: GappedColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: LevelSlider(
                            ticks: levelsEntry.sliderTicks,
                            levels: [1, ...levelsEntry.levels.keys],
                            values: rangeValues.value,
                            onChanged: (values) {
                              // avoid overlapping slider handles
                              if (values.start == values.end) {
                                return;
                              }

                              rangeValues.value = values;
                            },
                          ),
                        ),
                      ),
                      Wrap(
                        children: _buildMaterialCards(selectedCharacterId.value, weapon, rangeValues.value, lackNums.value),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMaterialCards(String characterId, Weapon weapon, LevelRangeValues levelRange, Map<String, int> lackNums) {
    final items = _getCardMaterials(weapon, levelRange);
    final fullMaterials = useMemoized(() => _getCardMaterials(weapon));

    const defaultExpItemId = "mystic-enhancement-ore";

    return sortMaterials(items, assetData).map(
          (item) => MaterialItem(
        item: item,
        possiblePurposeTypes: const [Purpose.ascension],
        expItems: assetData.weaponIngredients.expItems,
        lackNum: lackNums[item.id ?? defaultExpItemId] != null
            ? lackNums[item.id ?? defaultExpItemId]! - (fullMaterials.firstWhere((e) => e.id == item.id).sum - item.sum)
            : null,
        usage: MaterialUsage(
          characterId: characterId,
          weaponId: weapon.id,
        ),
      ),
    ).toList();
  }

  List<MaterialCardMaterial> _getCardMaterials(Weapon weapon, [LevelRangeValues? levelRange]) {
    final mbFrames = assetData.weaponIngredients.rarities[weapon.rarity]!.levels
        .mapInLevelRange(
      levelRange ?? LevelRangeValues(1, assetData.weaponIngredients.rarities[weapon.rarity]!.levels.keys.last),
      (key, value) {
        return toMaterialBookmarkFrames(
          level: key,
          ingredients: value,
          purposeType: Purpose.ascension,
          characterOrWeapon: weapon,
          assetData: assetData,
        );
      },
    ).flattened.toList();
    final items = mergeMaterialBookmarkFrames(mbFrames);
    return items;
  }
}
