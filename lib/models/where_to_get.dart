import "package:freezed_annotation/freezed_annotation.dart";

import "localized_text.dart";

part "where_to_get.freezed.dart";
part "where_to_get.g.dart";

@freezed
sealed class WhereToGet with _$WhereToGet {
  const factory WhereToGet.text({
    required LocalizedText text,
  }) = WhereToGetText;

  factory WhereToGet.fromJson(Map<String, dynamic> json) =>
      _$WhereToGetFromJson(json);
}
