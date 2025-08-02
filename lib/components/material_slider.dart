import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../composables/use_list_state.dart";
import "../core/asset_cache.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/material_bookmark_frame.dart";
import "../models/weapon.dart";
import "../providers/game_data_sync.dart";
import "../providers/versions.dart";
import "../utils/ingredients_converter.dart";
import "../utils/lists.dart";
import "labeled_check_box.dart";
import "level_slider.dart";
import "material_item.dart";

typedef LabelWidgetBuilder = Widget? Function(
  BuildContext context,
  Purpose purpose,
);

class MaterialSlider extends HookConsumerWidget {
  const MaterialSlider({
    super.key,
    required this.ingredientConf,
    required this.target,
    this.characterId,
    required this.purposes,
    required this.ranges,
    this.labelBuilder,
    this.lackNums,
    required this.onRangesChanged,
  });

  final IngredientConfigurations ingredientConf;
  final CharacterOrWeapon target;

  /// Required if [target] is a weapon.
  final String? characterId;
  final List<Purpose> purposes;
  final UnmodifiableMapView<Purpose, LevelRangeValues> ranges;
  final LabelWidgetBuilder? labelBuilder;
  final ValueChanged<Map<Purpose, LevelRangeValues>> onRangesChanged;
  final ItemLackNums? lackNums;

  bool get showActiveCheckbox => purposes.length >= 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;

    final activeSliders = useListState<Purpose>(purposes);

    useEffect(() {
      ranges.forEach((k, v) {
        if (showActiveCheckbox && v.start == v.end) {
          activeSliders.remove(k);
        }
      });
      return null;
    }, [ranges]);

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final purpose in purposes)
          _buildSliderContainer(
            purpose: purpose,
            active: activeSliders.contains(purpose),
            onActiveChanged: (active) {
              if (active) {
                activeSliders.add(purpose);
              } else {
                activeSliders.remove(purpose);
              }
            },
            child: _buildSlider(
              purpose: purpose,
              values: ranges[purpose]!,
              onChanged: (values) {
                onRangesChanged({
                  ...ranges,
                  purpose: values,
                });
              },
            ),
          ),
        Wrap(
          children: _buildMaterialCards(
            assetData: assetData,
            activeSliders: activeSliders,
          ),
        ),
      ],
    );
  }

  Widget _buildSliderContainer({
    required Purpose purpose,
    required bool active,
    required ValueChanged<bool> onActiveChanged,
    required Widget child,
  }) {
    final context = useContext();
    final labelWidget = labelBuilder?.call(context, purpose);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: labelWidget != null && showActiveCheckbox ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LabeledCheckBox(
              value: active,
              onChanged: (value) {
                onActiveChanged(value ?? false);
              },
              child: Expanded(
                child: labelWidget,
              ),
            ),
            AnimatedCrossFade( // resize animation
              crossFadeState: active ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
              firstCurve: Curves.easeOutQuint,
              secondCurve: Curves.easeOutQuint,
              sizeCurve: Curves.easeOutQuint,
              firstChild: SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: child,
              ),
            ),
          ],
        ) : child,
      ),
    );
  }

  Widget _buildSlider({
    required Purpose purpose,
    required LevelRangeValues values,
    required ValueChanged<LevelRangeValues> onChanged,
  }) {
    final iLevels = ingredientConf.getLevels(rarity: target.rarity, purpose: purpose);
    return LevelSlider(
      levels: iLevels.levels.keys.toList(),
      ticks: iLevels.sliderTicks,
      values: values,
      onChanged: (value) {
        if (value.start != value.end) {
          onChanged(value);
        }
      },
    );
  }

  List<Widget> _buildMaterialCards({
    required AssetData assetData,
    required List<Purpose> activeSliders,
  }) {
    final fullQuantities = useMemoized(
      () => _calculateFullQuantities(assetData),
      [purposes, target, ingredientConf],
    );

    final mbFrames = <MaterialBookmarkFrame>[];
    for (final purpose in purposes) {
      if (activeSliders.contains(purpose)) {
        mbFrames.addAll(
          ingredientConf
              .getLevels(rarity: target.rarity, purpose: purpose)
              .levels
              .mapInLevelRange(
            ranges[purpose]!,
            (key, value) {
              return toMaterialBookmarkFrames(
                level: key,
                ingredients: value,
                purposeType: purpose,
                characterOrWeapon: target,
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
            possiblePurposeTypes: purposes,
            expItems: assetData.characterIngredients.expItems,
            lackNum: _calculateLackNum(item.id, fullQuantities[item.id], item.sum),
            usage: MaterialUsage(
              characterId: target is Character ? target.id : characterId!,
              weaponId: target is Weapon ? target.id : null,
            ),
          ),
        )
        .toList();
  }

  /// Returns Item id to full quantity map. Null item id represents an exp item.
  Map<String?, int> _calculateFullQuantities(AssetData assetData) {
    final frames = purposes.map((purpose) => ingredientConf
        .getLevels(rarity: target.rarity, purpose: purpose)
        .levels
        .entries
        .map(
      (e) {
        return toMaterialBookmarkFrames(
          level: e.key,
          ingredients: e.value,
          purposeType: purpose,
          characterOrWeapon: target,
          assetData: assetData,
        );
      },
    ).flattened).flattened.toList();
    final items = mergeMaterialBookmarkFrames(frames);
    return Map.fromEntries(items.map((item) => MapEntry(item.id, item.sum)));
  }

  int? _calculateLackNum(String? itemId, int? fullQuantity, int currentQuantity) {
    if (fullQuantity == null) {
      return null;
    }
    if (itemId == null) {
      final expItem = ingredientConf.expItems.firstWhere((e) => e.isDefault);
      final lackNum = lackNums?[expItem.itemId];
      if (lackNum == null) {
        return null;
      }
      // fullQuantity and currentQuantity is the total exp needed and lackNum is the number of exp
      // items needed.
      return lackNum - ((fullQuantity - currentQuantity) / expItem.expPerItem).ceil();
    }
    final lackNum = lackNums?[itemId];
    if (lackNum == null) {
      return null;
    }
    return lackNum - (fullQuantity - currentQuantity);
  }
}
