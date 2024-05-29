import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "common.dart";
import "ingredient.dart";
import "material.dart";

part "bookmarkable_material.freezed.dart";

class BookmarkableMaterial {
  final String? id;
  final List<BookmarkableMaterialLevel> levels;

  final AssetData assetData;

  BookmarkableMaterial({
    this.id,
    required this.levels,
    required this.assetData,
  });

  int? _sum;
  Material? _material;
  int? _sortPriority;

  /// Sum of all quantities (non-exp items) or exps.
  int get sum => _sum ??= levels.fold<int>(
        0,
        (prev, level) =>
            prev +
            switch (level) {
              _BookmarkableMaterialLevel(:final quantity) => quantity,
              BookmarkableMaterialLevelExp(:final exp) => exp,
            },
      );

  bool get isExp => levels.every((e) => e is BookmarkableMaterialLevelExp);

  Material get material {
    if (_material != null) {
      return _material!;
    }

    final result = assetData.materials[id];
    if (result == null) {
      throw "Material not found for id: $id";
    }
    return _material = result;
  }

  int get sortPriority {
    if (_sortPriority != null) {
      return _sortPriority!;
    }

    if (isExp) {
      return -1;
    }

    final sortOrderMap = assetData.materialSortOrder;
    return _sortPriority = sortOrderMap["id:$id"] ?? sortOrderMap["category:${material.category}"] ?? 0;
  }
}

@freezed
sealed class BookmarkableMaterialLevel with _$BookmarkableMaterialLevel {
  const factory BookmarkableMaterialLevel({
    required int level,
    required int quantity,
    required Purpose purposeType,
  }) = _BookmarkableMaterialLevel;

  const factory BookmarkableMaterialLevel.exp({
    required int level,
    required int exp,
    @Default(Purpose.ascension) Purpose purposeType,
  }) = BookmarkableMaterialLevelExp;
}

@freezed
class IngredientsWithLevelAndPurpose with _$IngredientsWithLevelAndPurpose {
  const factory IngredientsWithLevelAndPurpose({
    required int level,
    required Purpose purposeType,
    required List<Ingredient> ingredients,
  }) = _IngredientsWithLevelAndPurpose;
}
