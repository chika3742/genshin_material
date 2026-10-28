import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_ui/material_ui.dart";

import "../core/pref_keys.dart";
import "../data/models/bag_counts.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/level_range_values.dart";
import "../models/material_bookmark_frame.dart";
import "../models/weapon.dart";
import "../providers/pref_notifier.dart";
import "../providers/versions.dart";
import "../utils/material_calculator.dart";
import "material_item.dart";

class MaterialCardList extends HookConsumerWidget {
  final CharacterOrWeapon target;
  final List<Purpose> purposes;
  final IngredientConfigurations ingredientConf;
  final Map<Purpose, LevelRangeValues> ranges;
  final BagCounts? bagCounts;
  final VariantId? wSelectedCharacter;

  const MaterialCardList({
    super.key,
    required this.target,
    required this.purposes,
    required this.ingredientConf,
    required this.ranges,
    this.bagCounts,
    this.wSelectedCharacter,
  }) : assert(target is! Weapon || wSelectedCharacter != null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).requireValue;

    final items = useMemoized(
      () => generateMaterialCardsFromRange(assetData, ingredientConf, target, ranges),
      [target, ranges, ingredientConf, assetData],
    );

    var effectiveBagCounts = bagCounts;
    Map<MaterialId, int>? craftedCounts;
    if (bagCounts case final bagCounts? when ref.watch(prefProvider(PrefKeys.showCraftConvertedLackNum))) {
      final needs = {
        for (final e in items)
          ?e.id: e.sum,
      };
      final result = applyCrafting(bagCounts, needs, assetData);
      effectiveBagCounts = result.effective;
      craftedCounts = result.crafted;
    }

    return Wrap(
      children: [
        for (final item in items)
          MaterialItem(
            key: ValueKey(item.id),
            item: item,
            possiblePurposeTypes: purposes,
            targetType: target.targetType,
            bagCounts: effectiveBagCounts,
            craftedCounts: craftedCounts,
            usage: switch (target.targetType) {
              .character => MaterialUsage(
                characterId: CharacterOrVariantId(target.id),
              ),
              .weapon => MaterialUsage(
                characterId: wSelectedCharacter!,
                weaponId: target.id,
              ),
            },
          ),
      ],
    );
  }
}
