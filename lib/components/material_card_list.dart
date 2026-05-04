import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../models/character.dart";
import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/material_bookmark_frame.dart";
import "../models/weapon.dart";
import "../providers/game_data_sync.dart";
import "../providers/versions.dart";
import "../utils/material_calculator.dart";
import "level_slider.dart";
import "material_item.dart";

class MaterialCardList extends HookConsumerWidget {
  final CharacterOrWeapon target;
  final List<Purpose> purposes;
  final IngredientConfigurations ingredientConf;
  final Map<Purpose, LevelRangeValues> ranges;
  final ItemLackNums? lackNums;
  final CharacterId? wSelectedCharacter;

  const MaterialCardList({
    super.key,
    required this.target,
    required this.purposes,
    required this.ingredientConf,
    required this.ranges,
    this.lackNums,
    this.wSelectedCharacter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).requireValue;

    final fullQuantities = useMemoized(
      () => calculateFullQuantities(assetData, purposes, ingredientConf, target),
      [target, ingredientConf, purposes, assetData],
    );

    final items = useMemoized(
      () => generateMaterialCardsFromRange(assetData, ingredientConf, target, ranges),
      [target, ranges, ingredientConf, assetData],
    );

    return Wrap(
      children: [
        for (final item in items)
          MaterialItem(
            key: ValueKey(item.id),
            item: item,
            possiblePurposeTypes: purposes,
            expItems: ingredientConf.expItems,
            lackNum: calculateLackNum(
              ingredientConf,
              lackNums,
              itemId: item.id,
              fullQuantity: fullQuantities[item.id],
              currentQuantity: item.sum,
            ),
            usage: switch (target) {
              CharacterOrVariant(:final id) => MaterialUsage(
                characterId: id,
              ),
              Weapon(:final id) => MaterialUsage(
                characterId: wSelectedCharacter!,
                weaponId: id,
              ),
              _ => throw Exception("Unreachable"),
            },
          ),
      ],
    );
  }
}
