// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_slider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterSliderState {

 Map<Purpose, LevelRangeValues> get ranges; Set<Purpose> get hiddenPurposes;
/// Create a copy of CharacterSliderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterSliderStateCopyWith<CharacterSliderState> get copyWith => _$CharacterSliderStateCopyWithImpl<CharacterSliderState>(this as CharacterSliderState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CharacterSliderState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterSliderState&&const DeepCollectionEquality().equals(other.ranges, _this.ranges)&&const DeepCollectionEquality().equals(other.hiddenPurposes, _this.hiddenPurposes));
}


@override
int get hashCode {
  final _this = this as CharacterSliderState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.ranges),const DeepCollectionEquality().hash(_this.hiddenPurposes));
}

@override
String toString() {
  final _this = this as CharacterSliderState;
  return 'CharacterSliderState(ranges: ${_this.ranges}, hiddenPurposes: ${_this.hiddenPurposes})';
}


}

/// @nodoc
abstract mixin class $CharacterSliderStateCopyWith<$Res>  {
  factory $CharacterSliderStateCopyWith(CharacterSliderState value, $Res Function(CharacterSliderState) _then) = _$CharacterSliderStateCopyWithImpl;
@useResult
$Res call({
 Map<Purpose, LevelRangeValues> ranges, Set<Purpose> hiddenPurposes
});




}
/// @nodoc
class _$CharacterSliderStateCopyWithImpl<$Res>
    implements $CharacterSliderStateCopyWith<$Res> {
  _$CharacterSliderStateCopyWithImpl(this._self, this._then);

  final CharacterSliderState _self;
  final $Res Function(CharacterSliderState) _then;

/// Create a copy of CharacterSliderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ranges = null,Object? hiddenPurposes = null,}) {
  return _then(CharacterSliderState(
ranges: null == ranges ? _self.ranges : ranges // ignore: cast_nullable_to_non_nullable
as Map<Purpose, LevelRangeValues>,hiddenPurposes: null == hiddenPurposes ? _self.hiddenPurposes : hiddenPurposes // ignore: cast_nullable_to_non_nullable
as Set<Purpose>,
  ));
}

}



/// @nodoc


class _CharacterSliderState extends CharacterSliderState {
  const _CharacterSliderState({required  Map<Purpose, LevelRangeValues> ranges, required  Set<Purpose> hiddenPurposes}): _ranges = ranges,_hiddenPurposes = hiddenPurposes,super._();
  

 final  Map<Purpose, LevelRangeValues> _ranges;
@override Map<Purpose, LevelRangeValues> get ranges {
  if (_ranges is EqualUnmodifiableMapView) return _ranges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ranges);
}

 final  Set<Purpose> _hiddenPurposes;
@override Set<Purpose> get hiddenPurposes {
  if (_hiddenPurposes is EqualUnmodifiableSetView) return _hiddenPurposes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_hiddenPurposes);
}


/// Create a copy of CharacterSliderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterSliderStateCopyWith<_CharacterSliderState> get copyWith => __$CharacterSliderStateCopyWithImpl<_CharacterSliderState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterSliderState&&const DeepCollectionEquality().equals(other.ranges, _ranges)&&const DeepCollectionEquality().equals(other.hiddenPurposes, _hiddenPurposes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_ranges),const DeepCollectionEquality().hash(_hiddenPurposes));
}

@override
String toString() {
    return 'CharacterSliderState(ranges: $ranges, hiddenPurposes: $hiddenPurposes)';
}


}

/// @nodoc
abstract mixin class _$CharacterSliderStateCopyWith<$Res> implements $CharacterSliderStateCopyWith<$Res> {
  factory _$CharacterSliderStateCopyWith(_CharacterSliderState value, $Res Function(_CharacterSliderState) _then) = __$CharacterSliderStateCopyWithImpl;
@override @useResult
$Res call({
 Map<Purpose, LevelRangeValues> ranges, Set<Purpose> hiddenPurposes
});




}
/// @nodoc
class __$CharacterSliderStateCopyWithImpl<$Res>
    implements _$CharacterSliderStateCopyWith<$Res> {
  __$CharacterSliderStateCopyWithImpl(this._self, this._then);

  final _CharacterSliderState _self;
  final $Res Function(_CharacterSliderState) _then;

/// Create a copy of CharacterSliderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ranges = null,Object? hiddenPurposes = null,}) {
  return _then(_CharacterSliderState(
ranges: null == ranges ? _self._ranges : ranges // ignore: cast_nullable_to_non_nullable
as Map<Purpose, LevelRangeValues>,hiddenPurposes: null == hiddenPurposes ? _self._hiddenPurposes : hiddenPurposes // ignore: cast_nullable_to_non_nullable
as Set<Purpose>,
  ));
}


}

// dart format on
