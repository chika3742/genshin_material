// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_details_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeaponDetailsState implements DiagnosticableTreeMixin {

 List<CharacterVariant> get selectableCharacters; CharacterVariant get selectedCharacter; LevelSliderState get sliders;
/// Create a copy of WeaponDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeaponDetailsStateCopyWith<WeaponDetailsState> get copyWith => _$WeaponDetailsStateCopyWithImpl<WeaponDetailsState>(this as WeaponDetailsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as WeaponDetailsState;
  properties
    ..add(DiagnosticsProperty('type', 'WeaponDetailsState'))
    ..add(DiagnosticsProperty('selectableCharacters', _this.selectableCharacters))..add(DiagnosticsProperty('selectedCharacter', _this.selectedCharacter))..add(DiagnosticsProperty('sliders', _this.sliders));
}

@override
bool operator ==(Object other) {
  final _this = this as WeaponDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeaponDetailsState&&const DeepCollectionEquality().equals(other.selectableCharacters, _this.selectableCharacters)&&(identical(other.selectedCharacter, _this.selectedCharacter) || other.selectedCharacter == _this.selectedCharacter)&&(identical(other.sliders, _this.sliders) || other.sliders == _this.sliders));
}


@override
int get hashCode {
  final _this = this as WeaponDetailsState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.selectableCharacters),_this.selectedCharacter,_this.sliders);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as WeaponDetailsState;
  return 'WeaponDetailsState(selectableCharacters: ${_this.selectableCharacters}, selectedCharacter: ${_this.selectedCharacter}, sliders: ${_this.sliders})';
}


}

/// @nodoc
abstract mixin class $WeaponDetailsStateCopyWith<$Res>  {
  factory $WeaponDetailsStateCopyWith(WeaponDetailsState value, $Res Function(WeaponDetailsState) _then) = _$WeaponDetailsStateCopyWithImpl;
@useResult
$Res call({
 List<CharacterVariant> selectableCharacters, CharacterVariant selectedCharacter, LevelSliderState sliders
});


$LevelSliderStateCopyWith<$Res> get sliders;

}
/// @nodoc
class _$WeaponDetailsStateCopyWithImpl<$Res>
    implements $WeaponDetailsStateCopyWith<$Res> {
  _$WeaponDetailsStateCopyWithImpl(this._self, this._then);

  final WeaponDetailsState _self;
  final $Res Function(WeaponDetailsState) _then;

/// Create a copy of WeaponDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectableCharacters = null,Object? selectedCharacter = null,Object? sliders = null,}) {
  return _then(WeaponDetailsState(
selectableCharacters: null == selectableCharacters ? _self.selectableCharacters : selectableCharacters // ignore: cast_nullable_to_non_nullable
as List<CharacterVariant>,selectedCharacter: null == selectedCharacter ? _self.selectedCharacter : selectedCharacter // ignore: cast_nullable_to_non_nullable
as CharacterVariant,sliders: null == sliders ? _self.sliders : sliders // ignore: cast_nullable_to_non_nullable
as LevelSliderState,
  ));
}
/// Create a copy of WeaponDetailsState
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


class _WeaponDetailsState with DiagnosticableTreeMixin implements WeaponDetailsState {
  const _WeaponDetailsState({required  List<CharacterVariant> selectableCharacters, required this.selectedCharacter, required this.sliders}): _selectableCharacters = selectableCharacters;
  

 final  List<CharacterVariant> _selectableCharacters;
@override List<CharacterVariant> get selectableCharacters {
  if (_selectableCharacters is EqualUnmodifiableListView) return _selectableCharacters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectableCharacters);
}

@override final  CharacterVariant selectedCharacter;
@override final  LevelSliderState sliders;

/// Create a copy of WeaponDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeaponDetailsStateCopyWith<_WeaponDetailsState> get copyWith => __$WeaponDetailsStateCopyWithImpl<_WeaponDetailsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'WeaponDetailsState'))
    ..add(DiagnosticsProperty('selectableCharacters', selectableCharacters))..add(DiagnosticsProperty('selectedCharacter', selectedCharacter))..add(DiagnosticsProperty('sliders', sliders));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeaponDetailsState&&const DeepCollectionEquality().equals(other.selectableCharacters, _selectableCharacters)&&(identical(other.selectedCharacter, selectedCharacter) || other.selectedCharacter == selectedCharacter)&&(identical(other.sliders, sliders) || other.sliders == sliders));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectableCharacters),selectedCharacter,sliders);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'WeaponDetailsState(selectableCharacters: $selectableCharacters, selectedCharacter: $selectedCharacter, sliders: $sliders)';
}


}

/// @nodoc
abstract mixin class _$WeaponDetailsStateCopyWith<$Res> implements $WeaponDetailsStateCopyWith<$Res> {
  factory _$WeaponDetailsStateCopyWith(_WeaponDetailsState value, $Res Function(_WeaponDetailsState) _then) = __$WeaponDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 List<CharacterVariant> selectableCharacters, CharacterVariant selectedCharacter, LevelSliderState sliders
});


@override $LevelSliderStateCopyWith<$Res> get sliders;

}
/// @nodoc
class __$WeaponDetailsStateCopyWithImpl<$Res>
    implements _$WeaponDetailsStateCopyWith<$Res> {
  __$WeaponDetailsStateCopyWithImpl(this._self, this._then);

  final _WeaponDetailsState _self;
  final $Res Function(_WeaponDetailsState) _then;

/// Create a copy of WeaponDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectableCharacters = null,Object? selectedCharacter = null,Object? sliders = null,}) {
  return _then(_WeaponDetailsState(
selectableCharacters: null == selectableCharacters ? _self._selectableCharacters : selectableCharacters // ignore: cast_nullable_to_non_nullable
as List<CharacterVariant>,selectedCharacter: null == selectedCharacter ? _self.selectedCharacter : selectedCharacter // ignore: cast_nullable_to_non_nullable
as CharacterVariant,sliders: null == sliders ? _self.sliders : sliders // ignore: cast_nullable_to_non_nullable
as LevelSliderState,
  ));
}

/// Create a copy of WeaponDetailsState
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
