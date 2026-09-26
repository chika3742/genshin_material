// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_state_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterState {

 Map<Purpose, int> get levels;/// `null` means an unknown item where ID mapping failed, for example
/// because it does not exist in the asset data.
 String? get equippedWeaponId; Map<Purpose, int> get weaponLevels; DateTime get lastUpdatedAt;



@override
bool operator ==(Object other) {
  final _this = this as CharacterState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterState&&const DeepCollectionEquality().equals(other.levels, _this.levels)&&(identical(other.equippedWeaponId, _this.equippedWeaponId) || other.equippedWeaponId == _this.equippedWeaponId)&&const DeepCollectionEquality().equals(other.weaponLevels, _this.weaponLevels)&&(identical(other.lastUpdatedAt, _this.lastUpdatedAt) || other.lastUpdatedAt == _this.lastUpdatedAt));
}


@override
int get hashCode {
  final _this = this as CharacterState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.levels),_this.equippedWeaponId,const DeepCollectionEquality().hash(_this.weaponLevels),_this.lastUpdatedAt);
}

@override
String toString() {
  final _this = this as CharacterState;
  return 'CharacterState(levels: ${_this.levels}, equippedWeaponId: ${_this.equippedWeaponId}, weaponLevels: ${_this.weaponLevels}, lastUpdatedAt: ${_this.lastUpdatedAt})';
}


}





/// @nodoc


class _CharacterState implements CharacterState {
  const _CharacterState({required  Map<Purpose, int> levels, required this.equippedWeaponId, required  Map<Purpose, int> weaponLevels, required this.lastUpdatedAt}): _levels = levels,_weaponLevels = weaponLevels;
  

 final  Map<Purpose, int> _levels;
@override Map<Purpose, int> get levels {
  if (_levels is EqualUnmodifiableMapView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_levels);
}

/// `null` means an unknown item where ID mapping failed, for example
/// because it does not exist in the asset data.
@override final  String? equippedWeaponId;
 final  Map<Purpose, int> _weaponLevels;
@override Map<Purpose, int> get weaponLevels {
  if (_weaponLevels is EqualUnmodifiableMapView) return _weaponLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_weaponLevels);
}

@override final  DateTime lastUpdatedAt;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterState&&const DeepCollectionEquality().equals(other.levels, _levels)&&(identical(other.equippedWeaponId, equippedWeaponId) || other.equippedWeaponId == equippedWeaponId)&&const DeepCollectionEquality().equals(other.weaponLevels, _weaponLevels)&&(identical(other.lastUpdatedAt, lastUpdatedAt) || other.lastUpdatedAt == lastUpdatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_levels),equippedWeaponId,const DeepCollectionEquality().hash(_weaponLevels),lastUpdatedAt);
}

@override
String toString() {
    return 'CharacterState(levels: $levels, equippedWeaponId: $equippedWeaponId, weaponLevels: $weaponLevels, lastUpdatedAt: $lastUpdatedAt)';
}


}




// dart format on
