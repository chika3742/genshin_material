import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "common.dart";
import "localized_text.dart";

part "material.freezed.dart";
part "material.g.dart";

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
    List<DayOfWeek>? availableDays,
  }) = _Material;

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);
}

@freezed
class MaterialsMeta with _$MaterialsMeta {
  const factory MaterialsMeta({
    required Map<MaterialCategoryType, LocalizedText> categories,
    required Map<String, int> sortOrder,
    required DailyMaterials daily,
    required Map<MaterialId, List<CharacterId>> specialCharactersUsingMaterials,
  }) = _MaterialsMeta;

  factory MaterialsMeta.fromJson(Map<String, dynamic> json) =>
      _$MaterialsMetaFromJson(json);
}

@freezed
class DailyMaterials with _$DailyMaterials {
  const factory DailyMaterials({
    required Map<String, List<DailyMaterial>> talent,
    required Map<String, List<DailyMaterial>> weapon,
  }) = _DailyMaterials;

  factory DailyMaterials.fromJson(Map<String, dynamic> json) =>
      _$DailyMaterialsFromJson(json);
}

@freezed
class DailyMaterial with _$DailyMaterial {
  const factory DailyMaterial({
    required LocalizedText description,
    required List<String> items,
  }) = _DailyMaterial;

  factory DailyMaterial.fromJson(Map<String, dynamic> json) =>
      _$DailyMaterialFromJson(json);
}
