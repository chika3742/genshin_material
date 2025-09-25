// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_release_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetReleaseVersion {

 DateTime get createdAt; String get dataVersion; AssetChannel get channel; String get distUrl; int get schemaVersion;

  /// Serializes this AssetReleaseVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetReleaseVersion&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.dataVersion, dataVersion) || other.dataVersion == dataVersion)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.distUrl, distUrl) || other.distUrl == distUrl)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,dataVersion,channel,distUrl,schemaVersion);

@override
String toString() {
  return 'AssetReleaseVersion(createdAt: $createdAt, dataVersion: $dataVersion, channel: $channel, distUrl: $distUrl, schemaVersion: $schemaVersion)';
}


}





/// @nodoc
@JsonSerializable()

class _AssetReleaseVersion implements AssetReleaseVersion {
  const _AssetReleaseVersion({required this.createdAt, required this.dataVersion, required this.channel, required this.distUrl, required this.schemaVersion});
  factory _AssetReleaseVersion.fromJson(Map<String, dynamic> json) => _$AssetReleaseVersionFromJson(json);

@override final  DateTime createdAt;
@override final  String dataVersion;
@override final  AssetChannel channel;
@override final  String distUrl;
@override final  int schemaVersion;


@override
Map<String, dynamic> toJson() {
  return _$AssetReleaseVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetReleaseVersion&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.dataVersion, dataVersion) || other.dataVersion == dataVersion)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.distUrl, distUrl) || other.distUrl == distUrl)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,dataVersion,channel,distUrl,schemaVersion);

@override
String toString() {
  return 'AssetReleaseVersion(createdAt: $createdAt, dataVersion: $dataVersion, channel: $channel, distUrl: $distUrl, schemaVersion: $schemaVersion)';
}


}




// dart format on
