// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_release_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetReleaseVersion _$AssetReleaseVersionFromJson(Map<String, dynamic> json) {
  return _AssetReleaseVersion.fromJson(json);
}

/// @nodoc
mixin _$AssetReleaseVersion {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get dataVersion => throw _privateConstructorUsedError;
  AssetChannel get channel => throw _privateConstructorUsedError;
  String get distUrl => throw _privateConstructorUsedError;
  int get schemaVersion => throw _privateConstructorUsedError;

  /// Serializes this AssetReleaseVersion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$AssetReleaseVersionImpl implements _AssetReleaseVersion {
  const _$AssetReleaseVersionImpl(
      {required this.createdAt,
      required this.dataVersion,
      required this.channel,
      required this.distUrl,
      required this.schemaVersion});

  factory _$AssetReleaseVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetReleaseVersionImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final String dataVersion;
  @override
  final AssetChannel channel;
  @override
  final String distUrl;
  @override
  final int schemaVersion;

  @override
  String toString() {
    return 'AssetReleaseVersion(createdAt: $createdAt, dataVersion: $dataVersion, channel: $channel, distUrl: $distUrl, schemaVersion: $schemaVersion)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetReleaseVersionImplToJson(
      this,
    );
  }
}

abstract class _AssetReleaseVersion implements AssetReleaseVersion {
  const factory _AssetReleaseVersion(
      {required final DateTime createdAt,
      required final String dataVersion,
      required final AssetChannel channel,
      required final String distUrl,
      required final int schemaVersion}) = _$AssetReleaseVersionImpl;

  factory _AssetReleaseVersion.fromJson(Map<String, dynamic> json) =
      _$AssetReleaseVersionImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  String get dataVersion;
  @override
  AssetChannel get channel;
  @override
  String get distUrl;
  @override
  int get schemaVersion;
}
