import "dart:io";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:path/path.dart" as path;

import "localized_text.dart";

part "element.freezed.dart";
part "element.g.dart";

@freezed
class Element with _$Element {
  const Element._();

  const factory Element({
    required int hyvId,
    required String imageUrl,
    required LocalizedText text,
  }) = _Element;

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);

  File getImageFile(String assetDir) {
    return File(path.join(assetDir, imageUrl));
  }
}
