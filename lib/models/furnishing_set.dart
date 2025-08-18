import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";
import "material.dart";

part "furnishing_set.freezed.dart";
part "furnishing_set.g.dart";

@freezed
sealed class Furnishing with _$Furnishing, ImageGetter, Searchable {
  const Furnishing._();

  const factory Furnishing({
    required String id,
    required int hyvId,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    ItemSource? source,
  }) = _Furnishing;

  factory Furnishing.fromJson(Map<String, dynamic> json) =>
      _$FurnishingFromJson(json);
}

@freezed
sealed class FurnishingSetMeta with _$FurnishingSetMeta {
  const factory FurnishingSetMeta({
    required Map<FurnishingSetTypeId, LocalizedText> setTypes,
  }) = _FurnishingSetMeta;

  factory FurnishingSetMeta.fromJson(Map<String, dynamic> json) =>
      _$FurnishingSetMetaFromJson(json);
}

@freezed
sealed class FurnishingSetComponent with _$FurnishingSetComponent {
  const factory FurnishingSetComponent({
    required String furnishingId,
    required int quantity,
  }) = _FurnishingSetComponent;

  factory FurnishingSetComponent.fromJson(Map<String, dynamic> json) =>
      _$FurnishingSetComponentFromJson(json);
}

@freezed
sealed class FurnishingSet with _$FurnishingSet, ImageGetter, Searchable {
  const FurnishingSet._();

  const factory FurnishingSet({
    required String id,
    required int hyvId,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    required String type,
    required List<int> favoriteCharacterHyvIds,
    required List<FurnishingSetComponent> consistsOf,
  }) = _FurnishingSet;

  factory FurnishingSet.fromJson(Map<String, dynamic> json) =>
      _$FurnishingSetFromJson(json);
}
