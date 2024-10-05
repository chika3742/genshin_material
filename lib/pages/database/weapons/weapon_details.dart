import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../components/center_text.dart";
import "../../../components/character_select_dropdown.dart";
import "../../../components/effect_description.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/item_source_widget.dart";
import "../../../components/level_slider.dart";
import "../../../components/material_card.dart";
import "../../../components/material_item.dart";
import "../../../components/rarity_stars.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../models/material_bookmark_frame.dart";
import "../../../models/weapon.dart";
import "../../../ui_core/layout.dart";
import "../../../utils/filtering.dart";
import "../../../utils/ingredients_converter.dart";
import "../../../utils/lists.dart";

class WeaponDetailsPage extends HookWidget {
  final AssetData assetData;
  final String id;
  final CharacterId? initialSelectedCharacter;

  const WeaponDetailsPage({super.key, required this.id, required this.assetData, this.initialSelectedCharacter});

  @override
  Widget build(BuildContext context) {
    final weapon = assetData.weapons[id];
    if (weapon == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const CenterText("Weapon not found"),
      );
    }

    final levels = assetData.weaponIngredients
        .rarities[weapon.rarity]!.levels;
    final sliderTickLabels = [1, ...levels.keys];
    final rangeValues = useState(LevelRangeValues(1, levels.keys.last));

    final characters = useMemoized(() => filterCharactersByWeaponType(assetData.characters.values, weapon.type).toList());
    final selectedCharacterIdInit = useMemoized(
      () => initialSelectedCharacter != null && characters.any((e) => e.id == initialSelectedCharacter)
            ? initialSelectedCharacter!
            : characters.first.id,
    );
    final selectedCharacterId = useState(selectedCharacterIdInit);

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
                GameItemInfoBox(
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
                            levels: sliderTickLabels,
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
                        children: _buildMaterialCards(selectedCharacterId.value, weapon, rangeValues.value),
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

  List<Widget> _buildMaterialCards(String characterId, Weapon weapon, LevelRangeValues levelRange) {
    final mbFrames = assetData.weaponIngredients.rarities[weapon.rarity]!.levels
        .mapInLevelRange(
      levelRange,
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

    return sortMaterials(items, assetData).map(
          (item) => MaterialItem(
        item: item,
        possiblePurposeTypes: const [Purpose.ascension],
        expItems: assetData.weaponIngredients.expItems,
        usage: MaterialUsage(
          characterId: characterId,
          weaponId: weapon.id,
        ),
      ),
    ).toList();
  }
}
