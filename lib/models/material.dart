import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "../utils/daily_material_weekday.dart";
import "common.dart";
import "localized_text.dart";

part "material.freezed.dart";
part "material.g.dart";

@Freezed(toJson: false)
sealed class Material with _$Material, ImageGetter, Searchable {
  const Material._();

  const factory Material({
    required String id,
    required int hyvId,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    required int rarity,
    required String category,
    String? groupId,
    int? craftLevel,
    List<DayOfWeek>? availableDays,
    ItemSource? source,
  }) = _Material;

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);

  bool getDailyMaterialAvailable(GameServer server) {
    if (availableDays == null) {
      return false;
    }

    final currentWeekday = getCurrentDailyMaterialWeekday(server);
    return availableDays!.any((day) => day.value == currentWeekday);
  }

  int getSortPriority(AssetData assetData) {
    final sortOrderMap = assetData.materialSortOrder;
    return sortOrderMap["id:$id"] ?? sortOrderMap["category:$category"] ?? 0;
  }
}

@Freezed(toJson: false)
sealed class ItemSource with _$ItemSource {
  const factory ItemSource.teyvatMap({
    required String typeId,
    String? center,
  }) = TeyvatMapItemSource;

  const factory ItemSource.text({
    required LocalizedText text,
  }) = TextItemSource;

  const factory ItemSource.sourceList({
    required List<LocalizedText> list,
  }) = SourceListItemSource;

  factory ItemSource.fromJson(Map<String, dynamic> json) =>
      _$ItemSourceFromJson(json);
}

@Freezed(toJson: false)
sealed class MaterialsMeta with _$MaterialsMeta {
  const factory MaterialsMeta({
    required Map<MaterialCategoryType, LocalizedText> categories,
    required Map<String, int> sortOrder,
    required DailyMaterials daily,
    required Map<MaterialId, List<CharacterId>> specialCharactersUsingMaterials,
  }) = _MaterialsMeta;

  factory MaterialsMeta.fromJson(Map<String, dynamic> json) =>
      _$MaterialsMetaFromJson(json);
}

@Freezed(toJson: false)
sealed class DailyMaterials with _$DailyMaterials {
  const factory DailyMaterials({
    required Map<String, List<DailyMaterial>> talent,
    required Map<String, List<DailyMaterial>> weapon,
  }) = _DailyMaterials;

  factory DailyMaterials.fromJson(Map<String, dynamic> json) =>
      _$DailyMaterialsFromJson(json);
}

@Freezed(toJson: false)
sealed class DailyMaterial with _$DailyMaterial {
  const factory DailyMaterial({
    required LocalizedText description,
    required List<String> items,
  }) = _DailyMaterial;

  factory DailyMaterial.fromJson(Map<String, dynamic> json) =>
      _$DailyMaterialFromJson(json);
}
