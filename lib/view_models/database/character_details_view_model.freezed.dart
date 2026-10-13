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

 Character get character; CharacterVariant get variant; LevelSliderState get sliders;
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
    ..add(DiagnosticsProperty('character', _this.character))..add(DiagnosticsProperty('variant', _this.variant))..add(DiagnosticsProperty('sliders', _this.sliders));
}

@override
bool operator ==(Object other) {
  final _this = this as CharacterDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsState&&(identical(other.character, _this.character) || other.character == _this.character)&&(identical(other.variant, _this.variant) || other.variant == _this.variant)&&(identical(other.sliders, _this.sliders) || other.sliders == _this.sliders));
}


@override
int get hashCode {
  final _this = this as CharacterDetailsState;
  return Object.hash(runtimeType,_this.character,_this.variant,_this.sliders);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as CharacterDetailsState;
  return 'CharacterDetailsState(character: ${_this.character}, variant: ${_this.variant}, sliders: ${_this.sliders})';
}


}

/// @nodoc
abstract mixin class $CharacterDetailsStateCopyWith<$Res>  {
  factory $CharacterDetailsStateCopyWith(CharacterDetailsState value, $Res Function(CharacterDetailsState) _then) = _$CharacterDetailsStateCopyWithImpl;
@useResult
$Res call({
 Character character, CharacterVariant variant, LevelSliderState sliders
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
@pragma('vm:prefer-inline') @override $Res call({Object? character = null,Object? variant = null,Object? sliders = null,}) {
  return _then(CharacterDetailsState(
character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as Character,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as CharacterVariant,sliders: null == sliders ? _self.sliders : sliders // ignore: cast_nullable_to_non_nullable
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
  const _CharacterDetailsState({required this.character, required this.variant, required this.sliders});
  

@override final  Character character;
@override final  CharacterVariant variant;
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
    ..add(DiagnosticsProperty('character', character))..add(DiagnosticsProperty('variant', variant))..add(DiagnosticsProperty('sliders', sliders));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterDetailsState&&(identical(other.character, character) || other.character == character)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.sliders, sliders) || other.sliders == sliders));
}


@override
int get hashCode {
    return Object.hash(runtimeType,character,variant,sliders);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'CharacterDetailsState(character: $character, variant: $variant, sliders: $sliders)';
}


}

/// @nodoc
abstract mixin class _$CharacterDetailsStateCopyWith<$Res> implements $CharacterDetailsStateCopyWith<$Res> {
  factory _$CharacterDetailsStateCopyWith(_CharacterDetailsState value, $Res Function(_CharacterDetailsState) _then) = __$CharacterDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Character character, CharacterVariant variant, LevelSliderState sliders
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
@override @pragma('vm:prefer-inline') $Res call({Object? character = null,Object? variant = null,Object? sliders = null,}) {
  return _then(_CharacterDetailsState(
character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as Character,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as CharacterVariant,sliders: null == sliders ? _self.sliders : sliders // ignore: cast_nullable_to_non_nullable
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
