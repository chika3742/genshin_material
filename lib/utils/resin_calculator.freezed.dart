// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resin_calculator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResinCalculationResult {
  DateTime get fullyReplenishedBy => throw _privateConstructorUsedError;
  Duration get timeToFull => throw _privateConstructorUsedError;
  int get currentResin => throw _privateConstructorUsedError;
  int get wastedResin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResinCalculationResultCopyWith<ResinCalculationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResinCalculationResultCopyWith<$Res> {
  factory $ResinCalculationResultCopyWith(ResinCalculationResult value,
          $Res Function(ResinCalculationResult) then) =
      _$ResinCalculationResultCopyWithImpl<$Res, ResinCalculationResult>;
  @useResult
  $Res call(
      {DateTime fullyReplenishedBy,
      Duration timeToFull,
      int currentResin,
      int wastedResin});
}

/// @nodoc
class _$ResinCalculationResultCopyWithImpl<$Res,
        $Val extends ResinCalculationResult>
    implements $ResinCalculationResultCopyWith<$Res> {
  _$ResinCalculationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullyReplenishedBy = null,
    Object? timeToFull = null,
    Object? currentResin = null,
    Object? wastedResin = null,
  }) {
    return _then(_value.copyWith(
      fullyReplenishedBy: null == fullyReplenishedBy
          ? _value.fullyReplenishedBy
          : fullyReplenishedBy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeToFull: null == timeToFull
          ? _value.timeToFull
          : timeToFull // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentResin: null == currentResin
          ? _value.currentResin
          : currentResin // ignore: cast_nullable_to_non_nullable
              as int,
      wastedResin: null == wastedResin
          ? _value.wastedResin
          : wastedResin // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResinCalculationResultImplCopyWith<$Res>
    implements $ResinCalculationResultCopyWith<$Res> {
  factory _$$ResinCalculationResultImplCopyWith(
          _$ResinCalculationResultImpl value,
          $Res Function(_$ResinCalculationResultImpl) then) =
      __$$ResinCalculationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime fullyReplenishedBy,
      Duration timeToFull,
      int currentResin,
      int wastedResin});
}

/// @nodoc
class __$$ResinCalculationResultImplCopyWithImpl<$Res>
    extends _$ResinCalculationResultCopyWithImpl<$Res,
        _$ResinCalculationResultImpl>
    implements _$$ResinCalculationResultImplCopyWith<$Res> {
  __$$ResinCalculationResultImplCopyWithImpl(
      _$ResinCalculationResultImpl _value,
      $Res Function(_$ResinCalculationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullyReplenishedBy = null,
    Object? timeToFull = null,
    Object? currentResin = null,
    Object? wastedResin = null,
  }) {
    return _then(_$ResinCalculationResultImpl(
      fullyReplenishedBy: null == fullyReplenishedBy
          ? _value.fullyReplenishedBy
          : fullyReplenishedBy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeToFull: null == timeToFull
          ? _value.timeToFull
          : timeToFull // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentResin: null == currentResin
          ? _value.currentResin
          : currentResin // ignore: cast_nullable_to_non_nullable
              as int,
      wastedResin: null == wastedResin
          ? _value.wastedResin
          : wastedResin // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ResinCalculationResultImpl implements _ResinCalculationResult {
  const _$ResinCalculationResultImpl(
      {required this.fullyReplenishedBy,
      required this.timeToFull,
      required this.currentResin,
      required this.wastedResin});

  @override
  final DateTime fullyReplenishedBy;
  @override
  final Duration timeToFull;
  @override
  final int currentResin;
  @override
  final int wastedResin;

  @override
  String toString() {
    return 'ResinCalculationResult(fullyReplenishedBy: $fullyReplenishedBy, timeToFull: $timeToFull, currentResin: $currentResin, wastedResin: $wastedResin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResinCalculationResultImpl &&
            (identical(other.fullyReplenishedBy, fullyReplenishedBy) ||
                other.fullyReplenishedBy == fullyReplenishedBy) &&
            (identical(other.timeToFull, timeToFull) ||
                other.timeToFull == timeToFull) &&
            (identical(other.currentResin, currentResin) ||
                other.currentResin == currentResin) &&
            (identical(other.wastedResin, wastedResin) ||
                other.wastedResin == wastedResin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, fullyReplenishedBy, timeToFull, currentResin, wastedResin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResinCalculationResultImplCopyWith<_$ResinCalculationResultImpl>
      get copyWith => __$$ResinCalculationResultImplCopyWithImpl<
          _$ResinCalculationResultImpl>(this, _$identity);
}

abstract class _ResinCalculationResult implements ResinCalculationResult {
  const factory _ResinCalculationResult(
      {required final DateTime fullyReplenishedBy,
      required final Duration timeToFull,
      required final int currentResin,
      required final int wastedResin}) = _$ResinCalculationResultImpl;

  @override
  DateTime get fullyReplenishedBy;
  @override
  Duration get timeToFull;
  @override
  int get currentResin;
  @override
  int get wastedResin;
  @override
  @JsonKey(ignore: true)
  _$$ResinCalculationResultImplCopyWith<_$ResinCalculationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
