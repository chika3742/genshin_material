// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_bookmark_frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaterialBookmarkFrame {

 String? get materialId; int get level; Purpose get purposeType;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialBookmarkFrame&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.level, level) || other.level == level)&&(identical(other.purposeType, purposeType) || other.purposeType == purposeType));
}


@override
int get hashCode => Object.hash(runtimeType,materialId,level,purposeType);

@override
String toString() {
  return 'MaterialBookmarkFrame(materialId: $materialId, level: $level, purposeType: $purposeType)';
}


}





/// @nodoc


class _MaterialBookmarkFrame implements MaterialBookmarkFrame {
  const _MaterialBookmarkFrame({required this.materialId, required this.level, required this.quantity, required this.purposeType});
  

@override final  String materialId;
@override final  int level;
 final  int quantity;
@override final  Purpose purposeType;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialBookmarkFrame&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.level, level) || other.level == level)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.purposeType, purposeType) || other.purposeType == purposeType));
}


@override
int get hashCode => Object.hash(runtimeType,materialId,level,quantity,purposeType);

@override
String toString() {
  return 'MaterialBookmarkFrame(materialId: $materialId, level: $level, quantity: $quantity, purposeType: $purposeType)';
}


}




/// @nodoc


class MaterialBookmarkFrameExp implements MaterialBookmarkFrame {
  const MaterialBookmarkFrameExp({this.materialId = null, required this.level, required this.exp, this.purposeType = Purpose.ascension});
  

@override@JsonKey() final  String? materialId;
@override final  int level;
 final  int exp;
@override@JsonKey() final  Purpose purposeType;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialBookmarkFrameExp&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.level, level) || other.level == level)&&(identical(other.exp, exp) || other.exp == exp)&&(identical(other.purposeType, purposeType) || other.purposeType == purposeType));
}


@override
int get hashCode => Object.hash(runtimeType,materialId,level,exp,purposeType);

@override
String toString() {
  return 'MaterialBookmarkFrame.exp(materialId: $materialId, level: $level, exp: $exp, purposeType: $purposeType)';
}


}




/// @nodoc
mixin _$MaterialUsage {

 String get characterId; String? get weaponId;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialUsage&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.weaponId, weaponId) || other.weaponId == weaponId));
}


@override
int get hashCode => Object.hash(runtimeType,characterId,weaponId);

@override
String toString() {
  return 'MaterialUsage(characterId: $characterId, weaponId: $weaponId)';
}


}





/// @nodoc


class _MaterialUsage implements MaterialUsage {
  const _MaterialUsage({required this.characterId, this.weaponId});
  

@override final  String characterId;
@override final  String? weaponId;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialUsage&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.weaponId, weaponId) || other.weaponId == weaponId));
}


@override
int get hashCode => Object.hash(runtimeType,characterId,weaponId);

@override
String toString() {
  return 'MaterialUsage(characterId: $characterId, weaponId: $weaponId)';
}


}




// dart format on
