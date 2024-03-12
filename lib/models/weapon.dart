import "package:freezed_annotation/freezed_annotation.dart";

import "localized_text.dart";

part "weapon.freezed.dart";
part "weapon.g.dart";

@freezed
class WeaponData with _$WeaponData {
  const factory WeaponData({
    required Map<String, LocalizedText> types,
  }) = _WeaponData;

  factory WeaponData.fromJson(Map<String, dynamic> json) =>
      _$WeaponDataFromJson(json);
}