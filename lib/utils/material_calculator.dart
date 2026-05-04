import "package:collection/collection.dart";

import "../core/asset_cache.dart";
import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/level_range_values.dart";
import "../models/material_bookmark_frame.dart";
import "ingredients_converter.dart";
import "lists.dart";

/// Returns the quantity per item for all materials of the specified [Purpose].
/// `null` item id represents an exp item.
Map<String?, int> calculateFullQuantities(
  AssetData assetData,
  List<Purpose> purposes,
  IngredientConfigurations ingredientConf,
  CharacterOrWeapon target,
) {
  final frames = purposes
      .map(
        (purpose) => ingredientConf
            .getLevels(rarity: target.rarity, purpose: purpose)
            .levels
            .entries
            .map((e) {
              return toMaterialBookmarkFrames(
                level: e.key,
                ingredients: e.value,
                purposeType: purpose,
                characterOrWeapon: target,
                assetData: assetData,
              );
            })
            .flattened,
      )
      .flattened
      .toList();
  final items = mergeMaterialBookmarkFrames(frames);
  return Map.fromEntries(items.map((item) => MapEntry(item.id, item.sum)));
}

List<MaterialCardMaterial> generateMaterialCardsFromRange(
  AssetData assetData,
  IngredientConfigurations ingredientConf,
  CharacterOrWeapon target,
  Map<Purpose, LevelRangeValues> ranges,
) {
  final mbFrames = <MaterialBookmarkFrame>[];
  for (final MapEntry(key: purpose, value: range) in ranges.entries) {
    mbFrames.addAll(
      ingredientConf
          .getLevels(rarity: target.rarity, purpose: purpose)
          .levels
          .mapInLevelRange(range, (key, value) {
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
  final items = mergeMaterialBookmarkFrames(mbFrames);

  return sortMaterials(items, assetData);
}

int? calculateLackNum(
  IngredientConfigurations ingredientConf,
  Map<String, int>? lackNums, {
  required String? itemId,
  required int? fullQuantity,
  required int currentQuantity,
}) {
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
