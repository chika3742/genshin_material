import "package:freezed_annotation/freezed_annotation.dart";

import "localized_text.dart";

part "wishes.g.dart";
part "wishes.freezed.dart";

@freezed
sealed class WishesMeta with _$WishesMeta {
  const factory WishesMeta({
    required String userAgent,
    required List<GachaType> gachaTypes,
  }) = _WishesMeta;

  factory WishesMeta.fromJson(Map<String, dynamic> json) =>
      _$WishesMetaFromJson(json);
}

@freezed
sealed class GachaType with _$GachaType {
  const factory GachaType({
    required String id,
    required LocalizedText title,
  }) = _GachaType;

  factory GachaType.fromJson(Map<String, dynamic> json) =>
      _$GachaTypeFromJson(json);
}
