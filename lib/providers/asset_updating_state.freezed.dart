// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_updating_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssetUpdatingState {
  AssetUpdateProgressState? get state => throw _privateConstructorUsedError;
  double? get progress => throw _privateConstructorUsedError;
  int? get totalBytes => throw _privateConstructorUsedError;

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetUpdatingStateCopyWith<AssetUpdatingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetUpdatingStateCopyWith<$Res> {
  factory $AssetUpdatingStateCopyWith(
          AssetUpdatingState value, $Res Function(AssetUpdatingState) then) =
      _$AssetUpdatingStateCopyWithImpl<$Res, AssetUpdatingState>;
  @useResult
  $Res call(
      {AssetUpdateProgressState? state, double? progress, int? totalBytes});
}

/// @nodoc
class _$AssetUpdatingStateCopyWithImpl<$Res, $Val extends AssetUpdatingState>
    implements $AssetUpdatingStateCopyWith<$Res> {
  _$AssetUpdatingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? progress = freezed,
    Object? totalBytes = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AssetUpdateProgressState?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBytes: freezed == totalBytes
          ? _value.totalBytes
          : totalBytes // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetUpdatingStateImplCopyWith<$Res>
    implements $AssetUpdatingStateCopyWith<$Res> {
  factory _$$AssetUpdatingStateImplCopyWith(_$AssetUpdatingStateImpl value,
          $Res Function(_$AssetUpdatingStateImpl) then) =
      __$$AssetUpdatingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AssetUpdateProgressState? state, double? progress, int? totalBytes});
}

/// @nodoc
class __$$AssetUpdatingStateImplCopyWithImpl<$Res>
    extends _$AssetUpdatingStateCopyWithImpl<$Res, _$AssetUpdatingStateImpl>
    implements _$$AssetUpdatingStateImplCopyWith<$Res> {
  __$$AssetUpdatingStateImplCopyWithImpl(_$AssetUpdatingStateImpl _value,
      $Res Function(_$AssetUpdatingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? progress = freezed,
    Object? totalBytes = freezed,
  }) {
    return _then(_$AssetUpdatingStateImpl(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AssetUpdateProgressState?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBytes: freezed == totalBytes
          ? _value.totalBytes
          : totalBytes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AssetUpdatingStateImpl implements _AssetUpdatingState {
  const _$AssetUpdatingStateImpl(
      {required this.state, this.progress, this.totalBytes});

  @override
  final AssetUpdateProgressState? state;
  @override
  final double? progress;
  @override
  final int? totalBytes;

  @override
  String toString() {
    return 'AssetUpdatingState(state: $state, progress: $progress, totalBytes: $totalBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetUpdatingStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.totalBytes, totalBytes) ||
                other.totalBytes == totalBytes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, progress, totalBytes);

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetUpdatingStateImplCopyWith<_$AssetUpdatingStateImpl> get copyWith =>
      __$$AssetUpdatingStateImplCopyWithImpl<_$AssetUpdatingStateImpl>(
          this, _$identity);
}

abstract class _AssetUpdatingState implements AssetUpdatingState {
  const factory _AssetUpdatingState(
      {required final AssetUpdateProgressState? state,
      final double? progress,
      final int? totalBytes}) = _$AssetUpdatingStateImpl;

  @override
  AssetUpdateProgressState? get state;
  @override
  double? get progress;
  @override
  int? get totalBytes;

  /// Create a copy of AssetUpdatingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetUpdatingStateImplCopyWith<_$AssetUpdatingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
