import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";

part "material.freezed.dart";
part "material.g.dart";

@freezed
class MaterialData with _$MaterialData {
  const factory MaterialData({
    required List<Material> items,
    required List<MaterialCategory> categories,
    required Map<String, int> sortOrder,
  }) = _MaterialData;

  factory MaterialData.fromJson(Map<String, dynamic> json) =>
      _$MaterialDataFromJson(json);
}

@freezed
sealed class Material with _$Material, ImageGetter {
  const Material._();

  const factory Material({
    required String id,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    required int rarity,
    required String category,
    String? groupId,
    int? craftLevel,
  }) = _Material;

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);
}

@freezed
class MaterialCategory with _$MaterialCategory {
  const factory MaterialCategory({
    required String id,
    required LocalizedText text,
  }) = _MaterialCategory;

  factory MaterialCategory.fromJson(Map<String, dynamic> json) =>
      _$MaterialCategoryFromJson(json);
}
