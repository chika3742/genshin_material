// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_data_sync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameDataSyncCharacter {

 String get variantId; String? get weaponId;



@override
bool operator ==(Object other) {
  final _this = this as GameDataSyncCharacter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDataSyncCharacter&&(identical(other.variantId, _this.variantId) || other.variantId == _this.variantId)&&(identical(other.weaponId, _this.weaponId) || other.weaponId == _this.weaponId));
}


@override
int get hashCode {
  final _this = this as GameDataSyncCharacter;
  return Object.hash(runtimeType,_this.variantId,_this.weaponId);
}

@override
String toString() {
  final _this = this as GameDataSyncCharacter;
  return 'GameDataSyncCharacter(variantId: ${_this.variantId}, weaponId: ${_this.weaponId})';
}


}





/// @nodoc


class _GameDataSyncCharacter implements GameDataSyncCharacter {
  const _GameDataSyncCharacter({required this.variantId, this.weaponId});
  

@override final  String variantId;
@override final  String? weaponId;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameDataSyncCharacter&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.weaponId, weaponId) || other.weaponId == weaponId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,variantId,weaponId);
}

@override
String toString() {
    return 'GameDataSyncCharacter(variantId: $variantId, weaponId: $weaponId)';
}


}




/// @nodoc
mixin _$ComputeBagRequestItem {

 List<int> get ids; CharacterOrVariant get variant; String? get weaponId;



@override
bool operator ==(Object other) {
  final _this = this as _ComputeBagRequestItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComputeBagRequestItem&&const DeepCollectionEquality().equals(other.ids, _this.ids)&&(identical(other.variant, _this.variant) || other.variant == _this.variant)&&(identical(other.weaponId, _this.weaponId) || other.weaponId == _this.weaponId));
}


@override
int get hashCode {
  final _this = this as _ComputeBagRequestItem;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.ids),_this.variant,_this.weaponId);
}

@override
String toString() {
  final _this = this as _ComputeBagRequestItem;
  return '_ComputeBagRequestItem(ids: ${_this.ids}, variant: ${_this.variant}, weaponId: ${_this.weaponId})';
}


}





/// @nodoc


class __ComputeBagRequestItem implements _ComputeBagRequestItem {
  const __ComputeBagRequestItem({required  List<int> ids, required this.variant, this.weaponId}): _ids = ids;
  

 final  List<int> _ids;
@override List<int> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}

@override final  CharacterOrVariant variant;
@override final  String? weaponId;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is __ComputeBagRequestItem&&const DeepCollectionEquality().equals(other.ids, _ids)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.weaponId, weaponId) || other.weaponId == weaponId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_ids),variant,weaponId);
}

@override
String toString() {
    return '_ComputeBagRequestItem(ids: $ids, variant: $variant, weaponId: $weaponId)';
}


}




// dart format on
