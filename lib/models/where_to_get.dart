import "package:freezed_annotation/freezed_annotation.dart";

import "../i18n/strings.g.dart";
import "localized_text.dart";

part "where_to_get.freezed.dart";
part "where_to_get.g.dart";

@freezed
sealed class WhereToGet with _$WhereToGet {
  /// One of [text] or [key] must be provided.
  const factory WhereToGet.text({
    LocalizedText? text,
    String? key,
  }) = WhereToGetText;

  factory WhereToGet.fromJson(Map<String, dynamic> json) =>
      _$WhereToGetFromJson(json);
}

extension LocalizedTextGetter on WhereToGetText {
  String get localizedText {
    assert(text != null || key != null);
    return text?.localized ?? tr.whereToGet[key]!;
  }
}
