import "package:freezed_annotation/freezed_annotation.dart";

part "asset_release_version.freezed.dart";
part "asset_release_version.g.dart";


@freezed
sealed class AssetReleaseVersion with _$AssetReleaseVersion {
  const factory AssetReleaseVersion({
    required DateTime createdAt,
    required String dataVersion,
    required AssetChannel channel,
    required String distUrl,
    required int schemaVersion,
  }) = _AssetReleaseVersion;

  factory AssetReleaseVersion.fromJson(Map<String, dynamic> json) =>
      _$AssetReleaseVersionFromJson(json);
}

enum AssetChannel {
  prod,
  dev,
}
