import "package:freezed_annotation/freezed_annotation.dart";

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
    required MaterialCategory category,
    required String groupId,
    required int craftLevel,
  }) = _Material;

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);
}
