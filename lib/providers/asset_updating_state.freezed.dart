// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_updating_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetUpdatingState {
  AssetUpdateProgressState get state;
  double? get progress;
  int? get totalBytes;
  Object? get error;

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssetUpdatingStateCopyWith<AssetUpdatingState> get copyWith =>
      _$AssetUpdatingStateCopyWithImpl<AssetUpdatingState>(
          this as AssetUpdatingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetUpdatingState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.totalBytes, totalBytes) ||
                other.totalBytes == totalBytes) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, progress, totalBytes,
      const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'AssetUpdatingState(state: $state, progress: $progress, totalBytes: $totalBytes, error: $error)';
  }
}

/// @nodoc
abstract mixin class $AssetUpdatingStateCopyWith<$Res> {
  factory $AssetUpdatingStateCopyWith(
          AssetUpdatingState value, $Res Function(AssetUpdatingState) _then) =
      _$AssetUpdatingStateCopyWithImpl;
  @useResult
  $Res call(
      {AssetUpdateProgressState state,
      double? progress,
      int? totalBytes,
      Object? error});
}

/// @nodoc
class _$AssetUpdatingStateCopyWithImpl<$Res>
    implements $AssetUpdatingStateCopyWith<$Res> {
  _$AssetUpdatingStateCopyWithImpl(this._self, this._then);

  final AssetUpdatingState _self;
  final $Res Function(AssetUpdatingState) _then;

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? progress = freezed,
    Object? totalBytes = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as AssetUpdateProgressState,
      progress: freezed == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBytes: freezed == totalBytes
          ? _self.totalBytes
          : totalBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error ? _self.error : error,
    ));
  }
}

/// @nodoc

class _AssetUpdatingState implements AssetUpdatingState {
  const _AssetUpdatingState(
      {this.state = AssetUpdateProgressState.none,
      this.progress,
      this.totalBytes,
      this.error});

  @override
  @JsonKey()
  final AssetUpdateProgressState state;
  @override
  final double? progress;
  @override
  final int? totalBytes;
  @override
  final Object? error;

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssetUpdatingStateCopyWith<_AssetUpdatingState> get copyWith =>
      __$AssetUpdatingStateCopyWithImpl<_AssetUpdatingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssetUpdatingState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.totalBytes, totalBytes) ||
                other.totalBytes == totalBytes) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, progress, totalBytes,
      const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'AssetUpdatingState(state: $state, progress: $progress, totalBytes: $totalBytes, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$AssetUpdatingStateCopyWith<$Res>
    implements $AssetUpdatingStateCopyWith<$Res> {
  factory _$AssetUpdatingStateCopyWith(
          _AssetUpdatingState value, $Res Function(_AssetUpdatingState) _then) =
      __$AssetUpdatingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AssetUpdateProgressState state,
      double? progress,
      int? totalBytes,
      Object? error});
}

/// @nodoc
class __$AssetUpdatingStateCopyWithImpl<$Res>
    implements _$AssetUpdatingStateCopyWith<$Res> {
  __$AssetUpdatingStateCopyWithImpl(this._self, this._then);

  final _AssetUpdatingState _self;
  final $Res Function(_AssetUpdatingState) _then;

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? state = null,
    Object? progress = freezed,
    Object? totalBytes = freezed,
    Object? error = freezed,
  }) {
    return _then(_AssetUpdatingState(
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as AssetUpdateProgressState,
      progress: freezed == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBytes: freezed == totalBytes
          ? _self.totalBytes
          : totalBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error ? _self.error : error,
    ));
  }
}

// dart format on
