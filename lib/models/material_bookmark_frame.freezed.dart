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
/// Create a copy of MaterialBookmarkFrame
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialBookmarkFrameCopyWith<MaterialBookmarkFrame> get copyWith => _$MaterialBookmarkFrameCopyWithImpl<MaterialBookmarkFrame>(this as MaterialBookmarkFrame, _$identity);



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
abstract mixin class $MaterialBookmarkFrameCopyWith<$Res>  {
  factory $MaterialBookmarkFrameCopyWith(MaterialBookmarkFrame value, $Res Function(MaterialBookmarkFrame) _then) = _$MaterialBookmarkFrameCopyWithImpl;
@useResult
$Res call({
 String materialId, int level, Purpose purposeType
});




}
/// @nodoc
class _$MaterialBookmarkFrameCopyWithImpl<$Res>
    implements $MaterialBookmarkFrameCopyWith<$Res> {
  _$MaterialBookmarkFrameCopyWithImpl(this._self, this._then);

  final MaterialBookmarkFrame _self;
  final $Res Function(MaterialBookmarkFrame) _then;

/// Create a copy of MaterialBookmarkFrame
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? materialId = null,Object? level = null,Object? purposeType = null,}) {
  return _then(_self.copyWith(
materialId: null == materialId ? _self.materialId! : materialId // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,purposeType: null == purposeType ? _self.purposeType : purposeType // ignore: cast_nullable_to_non_nullable
as Purpose,
  ));
}

}



/// @nodoc


class MaterialBookmarkFrameNormal implements MaterialBookmarkFrame {
  const MaterialBookmarkFrameNormal({required this.materialId, required this.level, required this.quantity, required this.purposeType});
  

@override final  String materialId;
@override final  int level;
 final  int quantity;
@override final  Purpose purposeType;

/// Create a copy of MaterialBookmarkFrame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialBookmarkFrameNormalCopyWith<MaterialBookmarkFrameNormal> get copyWith => _$MaterialBookmarkFrameNormalCopyWithImpl<MaterialBookmarkFrameNormal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialBookmarkFrameNormal&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.level, level) || other.level == level)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.purposeType, purposeType) || other.purposeType == purposeType));
}


@override
int get hashCode => Object.hash(runtimeType,materialId,level,quantity,purposeType);

@override
String toString() {
  return 'MaterialBookmarkFrame(materialId: $materialId, level: $level, quantity: $quantity, purposeType: $purposeType)';
}


}

/// @nodoc
abstract mixin class $MaterialBookmarkFrameNormalCopyWith<$Res> implements $MaterialBookmarkFrameCopyWith<$Res> {
  factory $MaterialBookmarkFrameNormalCopyWith(MaterialBookmarkFrameNormal value, $Res Function(MaterialBookmarkFrameNormal) _then) = _$MaterialBookmarkFrameNormalCopyWithImpl;
@override @useResult
$Res call({
 String materialId, int level, int quantity, Purpose purposeType
});




}
/// @nodoc
class _$MaterialBookmarkFrameNormalCopyWithImpl<$Res>
    implements $MaterialBookmarkFrameNormalCopyWith<$Res> {
  _$MaterialBookmarkFrameNormalCopyWithImpl(this._self, this._then);

  final MaterialBookmarkFrameNormal _self;
  final $Res Function(MaterialBookmarkFrameNormal) _then;

/// Create a copy of MaterialBookmarkFrame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? materialId = null,Object? level = null,Object? quantity = null,Object? purposeType = null,}) {
  return _then(MaterialBookmarkFrameNormal(
materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,purposeType: null == purposeType ? _self.purposeType : purposeType // ignore: cast_nullable_to_non_nullable
as Purpose,
  ));
}


}

/// @nodoc


class MaterialBookmarkFrameExp implements MaterialBookmarkFrame {
  const MaterialBookmarkFrameExp({this.materialId = null, required this.level, required this.exp, this.purposeType = Purpose.ascension});
  

@override@JsonKey() final  String? materialId;
@override final  int level;
 final  int exp;
@override@JsonKey() final  Purpose purposeType;

/// Create a copy of MaterialBookmarkFrame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialBookmarkFrameExpCopyWith<MaterialBookmarkFrameExp> get copyWith => _$MaterialBookmarkFrameExpCopyWithImpl<MaterialBookmarkFrameExp>(this, _$identity);



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
abstract mixin class $MaterialBookmarkFrameExpCopyWith<$Res> implements $MaterialBookmarkFrameCopyWith<$Res> {
  factory $MaterialBookmarkFrameExpCopyWith(MaterialBookmarkFrameExp value, $Res Function(MaterialBookmarkFrameExp) _then) = _$MaterialBookmarkFrameExpCopyWithImpl;
@override @useResult
$Res call({
 String? materialId, int level, int exp, Purpose purposeType
});




}
/// @nodoc
class _$MaterialBookmarkFrameExpCopyWithImpl<$Res>
    implements $MaterialBookmarkFrameExpCopyWith<$Res> {
  _$MaterialBookmarkFrameExpCopyWithImpl(this._self, this._then);

  final MaterialBookmarkFrameExp _self;
  final $Res Function(MaterialBookmarkFrameExp) _then;

/// Create a copy of MaterialBookmarkFrame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? materialId = freezed,Object? level = null,Object? exp = null,Object? purposeType = null,}) {
  return _then(MaterialBookmarkFrameExp(
materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,exp: null == exp ? _self.exp : exp // ignore: cast_nullable_to_non_nullable
as int,purposeType: null == purposeType ? _self.purposeType : purposeType // ignore: cast_nullable_to_non_nullable
as Purpose,
  ));
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
