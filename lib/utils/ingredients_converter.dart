import "package:collection/collection.dart";

import "../components/level_slider.dart";
import "../core/asset_cache.dart";
import "../models/common.dart";
import "../models/ingredients.dart";
import "../models/material_bookmark_frame.dart";

String? getConcreteItemId(Ingredient ingredient, CharacterOrWeapon characterOrWeapon, AssetData assetData) {
  return switch (ingredient) {
    IngredientByType() => () {
        if (ingredient.targetSpecific?.containsKey(characterOrWeapon.id) == true) {
          return ingredient.targetSpecific?[characterOrWeapon.id];
        }

        final definition = characterOrWeapon.materials[ingredient.type];
        if (definition == null) {
          throw "Unknown type: ${ingredient.type}";
        }

        final [defType, expr] = definition.split(":");
        if (defType == "id") {
          return expr;
        }
        if (defType == "group") {
          final material = assetData.materials.values
              .firstWhereOrNull(
                (e) => e.groupId == expr && e.craftLevel == ingredient.craftLevel,
              );
          assert(material != null, "No material found for group id $expr and craft level ${ingredient.craftLevel}");
          return material!.id;
        }

        throw "Unknown type: $defType";
      }(),
    IngredientWithFixedId(:final itemId) => itemId,
    _ => "exp",
  };
}

Map<int, List<Ingredient>> narrowLevelMap(
  Map<int, List<Ingredient>> map,
  LevelRangeValues levelRangeValues,
) {
  return Map.fromEntries(
    map.entries.where(
      (e) => e.key > levelRangeValues.start && e.key <= levelRangeValues.end,
    ),
  );
}

void runInMapKeyRange(
  Map<int, List<Ingredient>> map,
  LevelRangeValues levelRangeValues,
  void Function(int, List<Ingredient>) callback,
) {
  for (final entry in map.entries) {
    final level = entry.key;
    if (level > levelRangeValues.start && level <= levelRangeValues.end) {
      callback(level, entry.value);
    }
  }
}

/// Converts the ingredients to material bookmark frames.
List<MaterialBookmarkFrame> toMaterialBookmarkFrames({
  required int level,
  required List<Ingredient> ingredients,
  required Purpose purposeType,
  required CharacterOrWeapon characterOrWeapon,
  required AssetData assetData,
}) {
  final result = <MaterialBookmarkFrame>[];

  for (final ingredient in ingredients) {
    final materialId = getConcreteItemId(ingredient, characterOrWeapon, assetData);

    if (materialId == null) {
      continue;
    }

    result.add(
      switch (ingredient) {
        IngredientExp(:final exp) => MaterialBookmarkFrame.exp(
            level: level,
            exp: exp,
          ),
        IngredientWithFixedId(:final quantity) ||
        IngredientByType(:final quantity) =>
          MaterialBookmarkFrame(
            materialId: materialId,
            level: level,
            quantity: quantity,
            purposeType: purposeType,
          ),
      },
    );
  }

  return result;
}

/// Merges the ingredients of the same id in the list.
List<MaterialCardMaterial> mergeMaterialBookmarkFrames(List<MaterialBookmarkFrame> frames) {
  final merged = <String?, List<MaterialBookmarkFrame>>{};
  for (final frame in frames) {
    (merged[frame.materialId] ??= []).add(frame);
  }

  return merged.entries.map(
    (e) => MaterialCardMaterial(
      id: e.key,
      levels: e.value,
    ),
  ).toList();
}

List<MaterialCardMaterial> sortMaterials(
  List<MaterialCardMaterial> materials,
  AssetData assetData,
) {
  return materials.sorted((a, b) => a.getSortPriority(assetData).compareTo(b.getSortPriority(assetData)));
}
