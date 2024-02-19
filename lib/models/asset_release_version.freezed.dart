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
  DateTime get releasedAt => throw _privateConstructorUsedError;
  String get dataVersion => throw _privateConstructorUsedError;
  AssetChannel get channel => throw _privateConstructorUsedError;
  String get distUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetReleaseVersionCopyWith<AssetReleaseVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetReleaseVersionCopyWith<$Res> {
  factory $AssetReleaseVersionCopyWith(
          AssetReleaseVersion value, $Res Function(AssetReleaseVersion) then) =
      _$AssetReleaseVersionCopyWithImpl<$Res, AssetReleaseVersion>;
  @useResult
  $Res call(
      {DateTime releasedAt,
      String dataVersion,
      AssetChannel channel,
      String distUrl});
}

/// @nodoc
class _$AssetReleaseVersionCopyWithImpl<$Res, $Val extends AssetReleaseVersion>
    implements $AssetReleaseVersionCopyWith<$Res> {
  _$AssetReleaseVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releasedAt = null,
    Object? dataVersion = null,
    Object? channel = null,
    Object? distUrl = null,
  }) {
    return _then(_value.copyWith(
      releasedAt: null == releasedAt
          ? _value.releasedAt
          : releasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataVersion: null == dataVersion
          ? _value.dataVersion
          : dataVersion // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as AssetChannel,
      distUrl: null == distUrl
          ? _value.distUrl
          : distUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetReleaseVersionImplCopyWith<$Res>
    implements $AssetReleaseVersionCopyWith<$Res> {
  factory _$$AssetReleaseVersionImplCopyWith(_$AssetReleaseVersionImpl value,
          $Res Function(_$AssetReleaseVersionImpl) then) =
      __$$AssetReleaseVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime releasedAt,
      String dataVersion,
      AssetChannel channel,
      String distUrl});
}

/// @nodoc
class __$$AssetReleaseVersionImplCopyWithImpl<$Res>
    extends _$AssetReleaseVersionCopyWithImpl<$Res, _$AssetReleaseVersionImpl>
    implements _$$AssetReleaseVersionImplCopyWith<$Res> {
  __$$AssetReleaseVersionImplCopyWithImpl(_$AssetReleaseVersionImpl _value,
      $Res Function(_$AssetReleaseVersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releasedAt = null,
    Object? dataVersion = null,
    Object? channel = null,
    Object? distUrl = null,
  }) {
    return _then(_$AssetReleaseVersionImpl(
      releasedAt: null == releasedAt
          ? _value.releasedAt
          : releasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataVersion: null == dataVersion
          ? _value.dataVersion
          : dataVersion // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as AssetChannel,
      distUrl: null == distUrl
          ? _value.distUrl
          : distUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetReleaseVersionImpl implements _AssetReleaseVersion {
  const _$AssetReleaseVersionImpl(
      {required this.releasedAt,
      required this.dataVersion,
      required this.channel,
      required this.distUrl});

  factory _$AssetReleaseVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetReleaseVersionImplFromJson(json);

  @override
  final DateTime releasedAt;
  @override
  final String dataVersion;
  @override
  final AssetChannel channel;
  @override
  final String distUrl;

  @override
  String toString() {
    return 'AssetReleaseVersion(releasedAt: $releasedAt, dataVersion: $dataVersion, channel: $channel, distUrl: $distUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetReleaseVersionImpl &&
            (identical(other.releasedAt, releasedAt) ||
                other.releasedAt == releasedAt) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.distUrl, distUrl) || other.distUrl == distUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, releasedAt, dataVersion, channel, distUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetReleaseVersionImplCopyWith<_$AssetReleaseVersionImpl> get copyWith =>
      __$$AssetReleaseVersionImplCopyWithImpl<_$AssetReleaseVersionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetReleaseVersionImplToJson(
      this,
    );
  }
}

abstract class _AssetReleaseVersion implements AssetReleaseVersion {
  const factory _AssetReleaseVersion(
      {required final DateTime releasedAt,
      required final String dataVersion,
      required final AssetChannel channel,
      required final String distUrl}) = _$AssetReleaseVersionImpl;

  factory _AssetReleaseVersion.fromJson(Map<String, dynamic> json) =
      _$AssetReleaseVersionImpl.fromJson;

  @override
  DateTime get releasedAt;
  @override
  String get dataVersion;
  @override
  AssetChannel get channel;
  @override
  String get distUrl;
  @override
  @JsonKey(ignore: true)
  _$$AssetReleaseVersionImplCopyWith<_$AssetReleaseVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
