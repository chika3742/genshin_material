import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";
import "where_to_get.dart";

part "weapon.freezed.dart";
part "weapon.g.dart";

@freezed
class Weapon with _$Weapon, ImageGetter {
  const Weapon._();

  const factory Weapon({
    required String id,
    required int hyvId,
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

@freezed
class WeaponsMeta with _$WeaponsMeta {
  const factory WeaponsMeta({
    required Map<WeaponSubStat, LocalizedText> subStats,
    required Map<WeaponType, WeaponTypeInfo> types,
  }) = _WeaponsMeta;

  factory WeaponsMeta.fromJson(Map<String, dynamic> json) =>
      _$WeaponsMetaFromJson(json);
}

@freezed
class WeaponTypeInfo with _$WeaponTypeInfo {
  const factory WeaponTypeInfo({
    required int hyvId,
    required LocalizedText name,
  }) = _WeaponTypeInfo;

  factory WeaponTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$WeaponTypeInfoFromJson(json);
}
