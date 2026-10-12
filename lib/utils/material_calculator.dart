import "package:collection/collection.dart";

import "../core/asset_cache.dart";
import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/level_range_values.dart";
import "../models/material_bookmark_frame.dart";
import "ingredients_converter.dart";
import "lists.dart";

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
