// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resin_calculator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResinCalculationResult {

 DateTime get fullyReplenishedBy; Duration get timeToFull; int get currentResin; int get wastedResin; List<ResinBreakpoint> get breakpoints;



@override
bool operator ==(Object other) {
  final _this = this as ResinCalculationResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResinCalculationResult&&(identical(other.fullyReplenishedBy, _this.fullyReplenishedBy) || other.fullyReplenishedBy == _this.fullyReplenishedBy)&&(identical(other.timeToFull, _this.timeToFull) || other.timeToFull == _this.timeToFull)&&(identical(other.currentResin, _this.currentResin) || other.currentResin == _this.currentResin)&&(identical(other.wastedResin, _this.wastedResin) || other.wastedResin == _this.wastedResin)&&const DeepCollectionEquality().equals(other.breakpoints, _this.breakpoints));
}


@override
int get hashCode {
  final _this = this as ResinCalculationResult;
  return Object.hash(runtimeType,_this.fullyReplenishedBy,_this.timeToFull,_this.currentResin,_this.wastedResin,const DeepCollectionEquality().hash(_this.breakpoints));
}

@override
String toString() {
  final _this = this as ResinCalculationResult;
  return 'ResinCalculationResult(fullyReplenishedBy: ${_this.fullyReplenishedBy}, timeToFull: ${_this.timeToFull}, currentResin: ${_this.currentResin}, wastedResin: ${_this.wastedResin}, breakpoints: ${_this.breakpoints})';
}


}





/// @nodoc


class _ResinCalculationResult implements ResinCalculationResult {
  const _ResinCalculationResult({required this.fullyReplenishedBy, required this.timeToFull, required this.currentResin, required this.wastedResin, required  List<ResinBreakpoint> breakpoints}): _breakpoints = breakpoints;
  

@override final  DateTime fullyReplenishedBy;
@override final  Duration timeToFull;
@override final  int currentResin;
@override final  int wastedResin;
 final  List<ResinBreakpoint> _breakpoints;
@override List<ResinBreakpoint> get breakpoints {
  if (_breakpoints is EqualUnmodifiableListView) return _breakpoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breakpoints);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResinCalculationResult&&(identical(other.fullyReplenishedBy, fullyReplenishedBy) || other.fullyReplenishedBy == fullyReplenishedBy)&&(identical(other.timeToFull, timeToFull) || other.timeToFull == timeToFull)&&(identical(other.currentResin, currentResin) || other.currentResin == currentResin)&&(identical(other.wastedResin, wastedResin) || other.wastedResin == wastedResin)&&const DeepCollectionEquality().equals(other.breakpoints, _breakpoints));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fullyReplenishedBy,timeToFull,currentResin,wastedResin,const DeepCollectionEquality().hash(_breakpoints));
}

@override
String toString() {
    return 'ResinCalculationResult(fullyReplenishedBy: $fullyReplenishedBy, timeToFull: $timeToFull, currentResin: $currentResin, wastedResin: $wastedResin, breakpoints: $breakpoints)';
}


}




/// @nodoc
mixin _$ResinBreakpoint {

 int get resin; DateTime get fullyReplenishedBy; Duration get timeToFull;



@override
bool operator ==(Object other) {
  final _this = this as ResinBreakpoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResinBreakpoint&&(identical(other.resin, _this.resin) || other.resin == _this.resin)&&(identical(other.fullyReplenishedBy, _this.fullyReplenishedBy) || other.fullyReplenishedBy == _this.fullyReplenishedBy)&&(identical(other.timeToFull, _this.timeToFull) || other.timeToFull == _this.timeToFull));
}


@override
int get hashCode {
  final _this = this as ResinBreakpoint;
  return Object.hash(runtimeType,_this.resin,_this.fullyReplenishedBy,_this.timeToFull);
}

@override
String toString() {
  final _this = this as ResinBreakpoint;
  return 'ResinBreakpoint(resin: ${_this.resin}, fullyReplenishedBy: ${_this.fullyReplenishedBy}, timeToFull: ${_this.timeToFull})';
}


}





/// @nodoc


class _ResinBreakpoint implements ResinBreakpoint {
  const _ResinBreakpoint({required this.resin, required this.fullyReplenishedBy, required this.timeToFull});
  

@override final  int resin;
@override final  DateTime fullyReplenishedBy;
@override final  Duration timeToFull;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResinBreakpoint&&(identical(other.resin, resin) || other.resin == resin)&&(identical(other.fullyReplenishedBy, fullyReplenishedBy) || other.fullyReplenishedBy == fullyReplenishedBy)&&(identical(other.timeToFull, timeToFull) || other.timeToFull == timeToFull));
}


@override
int get hashCode {
    return Object.hash(runtimeType,resin,fullyReplenishedBy,timeToFull);
}

@override
String toString() {
    return 'ResinBreakpoint(resin: $resin, fullyReplenishedBy: $fullyReplenishedBy, timeToFull: $timeToFull)';
}


}




// dart format on
