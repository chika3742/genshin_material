// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_details_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterDetailsState implements DiagnosticableTreeMixin {

 CharacterVariant get variant;/// The levels and the equipped weapon synced from the game, or `null`
/// unless sync is on and the state has been stored.
 CharacterState? get characterState; LevelSliderState get sliders;
/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterDetailsStateCopyWith<CharacterDetailsState> get copyWith => _$CharacterDetailsStateCopyWithImpl<CharacterDetailsState>(this as CharacterDetailsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as CharacterDetailsState;
  properties
    ..add(DiagnosticsProperty('type', 'CharacterDetailsState'))
    ..add(DiagnosticsProperty('variant', _this.variant))..add(DiagnosticsProperty('characterState', _this.characterState))..add(DiagnosticsProperty('sliders', _this.sliders));
}

@override
bool operator ==(Object other) {
  final _this = this as CharacterDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsState&&(identical(other.variant, _this.variant) || other.variant == _this.variant)&&(identical(other.characterState, _this.characterState) || other.characterState == _this.characterState)&&(identical(other.sliders, _this.sliders) || other.sliders == _this.sliders));
}


@override
int get hashCode {
  final _this = this as CharacterDetailsState;
  return Object.hash(runtimeType,_this.variant,_this.characterState,_this.sliders);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as CharacterDetailsState;
  return 'CharacterDetailsState(variant: ${_this.variant}, characterState: ${_this.characterState}, sliders: ${_this.sliders})';
}


}

/// @nodoc
abstract mixin class $CharacterDetailsStateCopyWith<$Res>  {
  factory $CharacterDetailsStateCopyWith(CharacterDetailsState value, $Res Function(CharacterDetailsState) _then) = _$CharacterDetailsStateCopyWithImpl;
@useResult
$Res call({
 CharacterVariant variant, CharacterState? characterState, LevelSliderState sliders
});


$LevelSliderStateCopyWith<$Res> get sliders;

}
/// @nodoc
class _$CharacterDetailsStateCopyWithImpl<$Res>
    implements $CharacterDetailsStateCopyWith<$Res> {
  _$CharacterDetailsStateCopyWithImpl(this._self, this._then);

  final CharacterDetailsState _self;
  final $Res Function(CharacterDetailsState) _then;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variant = null,Object? characterState = freezed,Object? sliders = null,}) {
  return _then(CharacterDetailsState(
variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as CharacterVariant,characterState: freezed == characterState ? _self.characterState : characterState // ignore: cast_nullable_to_non_nullable
as CharacterState?,sliders: null == sliders ? _self.sliders : sliders // ignore: cast_nullable_to_non_nullable
as LevelSliderState,
  ));
}
/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LevelSliderStateCopyWith<$Res> get sliders {
  
  return $LevelSliderStateCopyWith<$Res>(_self.sliders, (value) {
    return _then(_self.copyWith(sliders: value));
  });
}
}



/// @nodoc


class _CharacterDetailsState with DiagnosticableTreeMixin implements CharacterDetailsState {
  const _CharacterDetailsState({required this.variant, required this.characterState, required this.sliders});
  

@override final  CharacterVariant variant;
/// The levels and the equipped weapon synced from the game, or `null`
/// unless sync is on and the state has been stored.
@override final  CharacterState? characterState;
@override final  LevelSliderState sliders;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterDetailsStateCopyWith<_CharacterDetailsState> get copyWith => __$CharacterDetailsStateCopyWithImpl<_CharacterDetailsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'CharacterDetailsState'))
    ..add(DiagnosticsProperty('variant', variant))..add(DiagnosticsProperty('characterState', characterState))..add(DiagnosticsProperty('sliders', sliders));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterDetailsState&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.characterState, characterState) || other.characterState == characterState)&&(identical(other.sliders, sliders) || other.sliders == sliders));
}


@override
int get hashCode {
    return Object.hash(runtimeType,variant,characterState,sliders);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'CharacterDetailsState(variant: $variant, characterState: $characterState, sliders: $sliders)';
}


}

/// @nodoc
abstract mixin class _$CharacterDetailsStateCopyWith<$Res> implements $CharacterDetailsStateCopyWith<$Res> {
  factory _$CharacterDetailsStateCopyWith(_CharacterDetailsState value, $Res Function(_CharacterDetailsState) _then) = __$CharacterDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 CharacterVariant variant, CharacterState? characterState, LevelSliderState sliders
});


@override $LevelSliderStateCopyWith<$Res> get sliders;

}
/// @nodoc
class __$CharacterDetailsStateCopyWithImpl<$Res>
    implements _$CharacterDetailsStateCopyWith<$Res> {
  __$CharacterDetailsStateCopyWithImpl(this._self, this._then);

  final _CharacterDetailsState _self;
  final $Res Function(_CharacterDetailsState) _then;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variant = null,Object? characterState = freezed,Object? sliders = null,}) {
  return _then(_CharacterDetailsState(
variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as CharacterVariant,characterState: freezed == characterState ? _self.characterState : characterState // ignore: cast_nullable_to_non_nullable
as CharacterState?,sliders: null == sliders ? _self.sliders : sliders // ignore: cast_nullable_to_non_nullable
as LevelSliderState,
  ));
}

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LevelSliderStateCopyWith<$Res> get sliders {
  
  return $LevelSliderStateCopyWith<$Res>(_self.sliders, (value) {
    return _then(_self.copyWith(sliders: value));
  });
}
}

// dart format on
