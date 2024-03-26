import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";
import "where_to_get.dart";

part "weapon.freezed.dart";
part "weapon.g.dart";

@freezed
class WeaponData with _$WeaponData {
  const factory WeaponData({
    required Map<WeaponSubStat, LocalizedText> subStats,
    required Map<WeaponType, LocalizedText> types,
    required List<Weapon> items,
  }) = _WeaponData;

  factory WeaponData.fromJson(Map<String, dynamic> json) =>
      _$WeaponDataFromJson(json);
}

@freezed
class Weapon with _$Weapon, ImageGetter, WithMaterialDefinitions {
  const Weapon._();

  const factory Weapon({
    required String id,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    required int rarity,
    required WeaponSubStat? subStat,
    required WeaponType type,
    required Map<MaterialUsageType, String> materials,
    WhereToGet? whereToGet,
  }) = _Weapon;

  factory Weapon.fromJson(Map<String, dynamic> json) =>
      _$WeaponFromJson(json);
}
