
import "package:collection/collection.dart";

import "../components/level_slider.dart";
import "../core/asset_cache.dart";
import "../models/bookmarkable_material.dart";
import "../models/common.dart";
import "../models/ingredient.dart";

String getConcreteItemId(Ingredient ingredient, MaterialDefinitions definitions, AssetData assetData) {
  return switch (ingredient) {
    IngredientByType() => () {
        final definition = definitions[ingredient.type];
        if (definition == null) {
          throw "Unknown type: ${ingredient.type}";
        }

        final [defType, expr] = definition.split(":");
        if (defType == "id") {
          return expr;
        }
        if (defType == "group") {
          return assetData.materials.values
              .firstWhere(
                (e) => e.groupId == expr && e.craftLevel == ingredient.craftLevel,
              )
              .id;
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
  required MaterialDefinitions definitions,
  required AssetData assetData,
}) {
  final result = <MaterialBookmarkFrame>[];

  for (final ingredient in ingredients) {
    final materialId = getConcreteItemId(ingredient, definitions, assetData);

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
