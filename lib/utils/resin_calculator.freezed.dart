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
  List<ResinBreakpoint> get breakpoints => throw _privateConstructorUsedError;
}

/// @nodoc

class _$ResinCalculationResultImpl implements _ResinCalculationResult {
  const _$ResinCalculationResultImpl(
      {required this.fullyReplenishedBy,
      required this.timeToFull,
      required this.currentResin,
      required this.wastedResin,
      required final List<ResinBreakpoint> breakpoints})
      : _breakpoints = breakpoints;

  @override
  final DateTime fullyReplenishedBy;
  @override
  final Duration timeToFull;
  @override
  final int currentResin;
  @override
  final int wastedResin;
  final List<ResinBreakpoint> _breakpoints;
  @override
  List<ResinBreakpoint> get breakpoints {
    if (_breakpoints is EqualUnmodifiableListView) return _breakpoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakpoints);
  }

  @override
  String toString() {
    return 'ResinCalculationResult(fullyReplenishedBy: $fullyReplenishedBy, timeToFull: $timeToFull, currentResin: $currentResin, wastedResin: $wastedResin, breakpoints: $breakpoints)';
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
                other.wastedResin == wastedResin) &&
            const DeepCollectionEquality()
                .equals(other._breakpoints, _breakpoints));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullyReplenishedBy,
      timeToFull,
      currentResin,
      wastedResin,
      const DeepCollectionEquality().hash(_breakpoints));
}

abstract class _ResinCalculationResult implements ResinCalculationResult {
  const factory _ResinCalculationResult(
          {required final DateTime fullyReplenishedBy,
          required final Duration timeToFull,
          required final int currentResin,
          required final int wastedResin,
          required final List<ResinBreakpoint> breakpoints}) =
      _$ResinCalculationResultImpl;

  @override
  DateTime get fullyReplenishedBy;
  @override
  Duration get timeToFull;
  @override
  int get currentResin;
  @override
  int get wastedResin;
  @override
  List<ResinBreakpoint> get breakpoints;
}

/// @nodoc
mixin _$ResinBreakpoint {
  int get resin => throw _privateConstructorUsedError;
  DateTime get fullyReplenishedBy => throw _privateConstructorUsedError;
  Duration get timeToFull => throw _privateConstructorUsedError;
}

/// @nodoc

class _$ResinBreakpointImpl implements _ResinBreakpoint {
  const _$ResinBreakpointImpl(
      {required this.resin,
      required this.fullyReplenishedBy,
      required this.timeToFull});

  @override
  final int resin;
  @override
  final DateTime fullyReplenishedBy;
  @override
  final Duration timeToFull;

  @override
  String toString() {
    return 'ResinBreakpoint(resin: $resin, fullyReplenishedBy: $fullyReplenishedBy, timeToFull: $timeToFull)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResinBreakpointImpl &&
            (identical(other.resin, resin) || other.resin == resin) &&
            (identical(other.fullyReplenishedBy, fullyReplenishedBy) ||
                other.fullyReplenishedBy == fullyReplenishedBy) &&
            (identical(other.timeToFull, timeToFull) ||
                other.timeToFull == timeToFull));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, resin, fullyReplenishedBy, timeToFull);
}

abstract class _ResinBreakpoint implements ResinBreakpoint {
  const factory _ResinBreakpoint(
      {required final int resin,
      required final DateTime fullyReplenishedBy,
      required final Duration timeToFull}) = _$ResinBreakpointImpl;

  @override
  int get resin;
  @override
  DateTime get fullyReplenishedBy;
  @override
  Duration get timeToFull;
}
