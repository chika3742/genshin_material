import "package:freezed_annotation/freezed_annotation.dart";

part "banner_data.freezed.dart";

/// The contents of the announcement banner, as configured by Remote Config.
@freezed
sealed class BannerData with _$BannerData {
  const factory BannerData({
    required String text,
    required String actionText,
    required String actionUrl,
  }) = _BannerData;
}
