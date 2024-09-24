import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../components/center_text.dart";
import "../../../components/character_select_dropdown.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/effect_description.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/item_source_widget.dart";
import "../../../components/level_slider.dart";
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

class WeaponDetailsPage extends StatelessWidget {
  final String id;
  final CharacterId? initialSelectedCharacter;

  const WeaponDetailsPage(this.id, {super.key, this.initialSelectedCharacter});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData, assetDir) {
        final weapon = assetData.weapons[id];
        if (weapon == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const CenterText("Weapon not found"),
          );
        }

        return WeaponDetailsPageContents(
          weapon: weapon,
          assetData: assetData,
          assetDir: assetDir,
          initialSelectedCharacter: initialSelectedCharacter,
        );
      },
    );
  }
}

class WeaponDetailsPageContents extends StatefulHookWidget {
  final Weapon weapon;
  final AssetData assetData;
  final String assetDir;
  final CharacterId? initialSelectedCharacter;

  const WeaponDetailsPageContents({
    super.key,
    required this.weapon,
    required this.assetData,
    required this.assetDir,
    this.initialSelectedCharacter,
  });

  @override
  State<WeaponDetailsPageContents> createState() => _WeaponDetailsPageContentsState();
}

class _WeaponDetailsPageContentsState extends State<WeaponDetailsPageContents> {
  late List<int> _sliderTickLabels;
  late LevelRangeValues _rangeValues;

  @override
  void initState() {
    super.initState();

    final levels = widget.assetData.weaponIngredients
        .rarities[widget.weapon.rarity]!.levels;
    _sliderTickLabels = [1, ...levels.keys];
    _rangeValues = LevelRangeValues(1, levels.keys.last);
  }

  @override
  Widget build(BuildContext context) {
    final weapon = widget.weapon;
    final assetData = widget.assetData;
    final assetDir = widget.assetDir;

    final characters = useMemoized(() => filterCharactersByWeaponType(assetData.characters.values, weapon.type).toList());
    final selectedCharacterIdInit = useMemoized(
      () => widget.initialSelectedCharacter != null &&
              characters.any((e) => e.id == widget.initialSelectedCharacter)
          ? widget.initialSelectedCharacter!
          : characters.first.id,
    );
    final selectedCharacterId = useState(selectedCharacterIdInit);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.weaponDetails(weapon: weapon.name.localized)),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: GappedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: 16,
            children: [
              GameItemInfoBox(
                itemImage: Image.file(
                  weapon.getImageFile(assetDir),
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
                  setState(() {
                    selectedCharacterId.value = value!;
                  });
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
                          levels: _sliderTickLabels,
                          values: _rangeValues,
                          onChanged: (values) {
                            // avoid overlapping slider handles
                            if (values.start == values.end) {
                              return;
                            }

                            setState(() {
                              _rangeValues = values;
                            });
                          },
                        ),
                      ),
                    ),
                    Wrap(
                      children: _buildMaterialCards(selectedCharacterId.value),
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
    );
  }

  List<Widget> _buildMaterialCards(String characterId) {
    final mbFrames = widget.assetData.weaponIngredients.rarities[widget.weapon.rarity]!.levels
        .mapInLevelRange(
          _rangeValues,
          (key, value) {
            return toMaterialBookmarkFrames(
              level: key,
              ingredients: value,
              purposeType: Purpose.ascension,
              characterOrWeapon: widget.weapon,
              assetData: widget.assetData,
            );
          },
        ).flattened.toList();
    final items = mergeMaterialBookmarkFrames(mbFrames);

    return sortMaterials(items, widget.assetData).map(
      (item) => MaterialItem(
        item: item,
        possiblePurposeTypes: const [Purpose.ascension],
        expItems: widget.assetData.weaponIngredients.expItems,
        usage: MaterialUsage(
          characterId: characterId,
          weaponId: widget.weapon.id,
        ),
      ),
    ).toList();
  }
}
