// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterFilterState {

 PossessionStatus? get possessionStatus; int? get rarity; TeyvatElement? get element; WeaponType? get weaponType; CharacterSortType get sortType;
/// Create a copy of CharacterFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterFilterStateCopyWith<CharacterFilterState> get copyWith => _$CharacterFilterStateCopyWithImpl<CharacterFilterState>(this as CharacterFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterFilterState&&(identical(other.possessionStatus, possessionStatus) || other.possessionStatus == possessionStatus)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.element, element) || other.element == element)&&(identical(other.weaponType, weaponType) || other.weaponType == weaponType)&&(identical(other.sortType, sortType) || other.sortType == sortType));
}


@override
int get hashCode => Object.hash(runtimeType,possessionStatus,rarity,element,weaponType,sortType);

@override
String toString() {
  return 'CharacterFilterState(possessionStatus: $possessionStatus, rarity: $rarity, element: $element, weaponType: $weaponType, sortType: $sortType)';
}


}

/// @nodoc
abstract mixin class $CharacterFilterStateCopyWith<$Res>  {
  factory $CharacterFilterStateCopyWith(CharacterFilterState value, $Res Function(CharacterFilterState) _then) = _$CharacterFilterStateCopyWithImpl;
@useResult
$Res call({
 PossessionStatus? possessionStatus, int? rarity, TeyvatElement? element, WeaponType? weaponType, CharacterSortType sortType
});




}
/// @nodoc
class _$CharacterFilterStateCopyWithImpl<$Res>
    implements $CharacterFilterStateCopyWith<$Res> {
  _$CharacterFilterStateCopyWithImpl(this._self, this._then);

  final CharacterFilterState _self;
  final $Res Function(CharacterFilterState) _then;

/// Create a copy of CharacterFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? possessionStatus = freezed,Object? rarity = freezed,Object? element = freezed,Object? weaponType = freezed,Object? sortType = null,}) {
  return _then(_self.copyWith(
possessionStatus: freezed == possessionStatus ? _self.possessionStatus : possessionStatus // ignore: cast_nullable_to_non_nullable
as PossessionStatus?,rarity: freezed == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as int?,element: freezed == element ? _self.element : element // ignore: cast_nullable_to_non_nullable
as TeyvatElement?,weaponType: freezed == weaponType ? _self.weaponType : weaponType // ignore: cast_nullable_to_non_nullable
as WeaponType?,sortType: null == sortType ? _self.sortType : sortType // ignore: cast_nullable_to_non_nullable
as CharacterSortType,
  ));
}

}



/// @nodoc


class _CharacterFilterState extends CharacterFilterState {
  const _CharacterFilterState({this.possessionStatus, this.rarity, this.element, this.weaponType, this.sortType = CharacterSortType.defaultSort}): super._();
  

@override final  PossessionStatus? possessionStatus;
@override final  int? rarity;
@override final  TeyvatElement? element;
@override final  WeaponType? weaponType;
@override@JsonKey() final  CharacterSortType sortType;

/// Create a copy of CharacterFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterFilterStateCopyWith<_CharacterFilterState> get copyWith => __$CharacterFilterStateCopyWithImpl<_CharacterFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterFilterState&&(identical(other.possessionStatus, possessionStatus) || other.possessionStatus == possessionStatus)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.element, element) || other.element == element)&&(identical(other.weaponType, weaponType) || other.weaponType == weaponType)&&(identical(other.sortType, sortType) || other.sortType == sortType));
}


@override
int get hashCode => Object.hash(runtimeType,possessionStatus,rarity,element,weaponType,sortType);

@override
String toString() {
  return 'CharacterFilterState(possessionStatus: $possessionStatus, rarity: $rarity, element: $element, weaponType: $weaponType, sortType: $sortType)';
}


}

/// @nodoc
abstract mixin class _$CharacterFilterStateCopyWith<$Res> implements $CharacterFilterStateCopyWith<$Res> {
  factory _$CharacterFilterStateCopyWith(_CharacterFilterState value, $Res Function(_CharacterFilterState) _then) = __$CharacterFilterStateCopyWithImpl;
@override @useResult
$Res call({
 PossessionStatus? possessionStatus, int? rarity, TeyvatElement? element, WeaponType? weaponType, CharacterSortType sortType
});




}
/// @nodoc
class __$CharacterFilterStateCopyWithImpl<$Res>
    implements _$CharacterFilterStateCopyWith<$Res> {
  __$CharacterFilterStateCopyWithImpl(this._self, this._then);

  final _CharacterFilterState _self;
  final $Res Function(_CharacterFilterState) _then;

/// Create a copy of CharacterFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? possessionStatus = freezed,Object? rarity = freezed,Object? element = freezed,Object? weaponType = freezed,Object? sortType = null,}) {
  return _then(_CharacterFilterState(
possessionStatus: freezed == possessionStatus ? _self.possessionStatus : possessionStatus // ignore: cast_nullable_to_non_nullable
as PossessionStatus?,rarity: freezed == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as int?,element: freezed == element ? _self.element : element // ignore: cast_nullable_to_non_nullable
as TeyvatElement?,weaponType: freezed == weaponType ? _self.weaponType : weaponType // ignore: cast_nullable_to_non_nullable
as WeaponType?,sortType: null == sortType ? _self.sortType : sortType // ignore: cast_nullable_to_non_nullable
as CharacterSortType,
  ));
}


}

/// @nodoc
mixin _$ArtifactFilterState {

 List<String> get tags;
/// Create a copy of ArtifactFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtifactFilterStateCopyWith<ArtifactFilterState> get copyWith => _$ArtifactFilterStateCopyWithImpl<ArtifactFilterState>(this as ArtifactFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactFilterState&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ArtifactFilterState(tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ArtifactFilterStateCopyWith<$Res>  {
  factory $ArtifactFilterStateCopyWith(ArtifactFilterState value, $Res Function(ArtifactFilterState) _then) = _$ArtifactFilterStateCopyWithImpl;
@useResult
$Res call({
 List<String> tags
});




}
/// @nodoc
class _$ArtifactFilterStateCopyWithImpl<$Res>
    implements $ArtifactFilterStateCopyWith<$Res> {
  _$ArtifactFilterStateCopyWithImpl(this._self, this._then);

  final ArtifactFilterState _self;
  final $Res Function(ArtifactFilterState) _then;

/// Create a copy of ArtifactFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tags = null,}) {
  return _then(_self.copyWith(
tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}



/// @nodoc


class _ArtifactFilterState implements ArtifactFilterState {
  const _ArtifactFilterState({final  List<String> tags = const []}): _tags = tags;
  

 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of ArtifactFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtifactFilterStateCopyWith<_ArtifactFilterState> get copyWith => __$ArtifactFilterStateCopyWithImpl<_ArtifactFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactFilterState&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ArtifactFilterState(tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ArtifactFilterStateCopyWith<$Res> implements $ArtifactFilterStateCopyWith<$Res> {
  factory _$ArtifactFilterStateCopyWith(_ArtifactFilterState value, $Res Function(_ArtifactFilterState) _then) = __$ArtifactFilterStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> tags
});




}
/// @nodoc
class __$ArtifactFilterStateCopyWithImpl<$Res>
    implements _$ArtifactFilterStateCopyWith<$Res> {
  __$ArtifactFilterStateCopyWithImpl(this._self, this._then);

  final _ArtifactFilterState _self;
  final $Res Function(_ArtifactFilterState) _then;

/// Create a copy of ArtifactFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tags = null,}) {
  return _then(_ArtifactFilterState(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
