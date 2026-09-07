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




/// @nodoc
mixin _$GameDataSyncResult {

 Map<Purpose, int>? get levels; String? get equippedWeaponId; GameDataSyncErrorType? get errorType; Object? get error; bool get isStale;
/// Create a copy of GameDataSyncResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameDataSyncResultCopyWith<GameDataSyncResult> get copyWith => _$GameDataSyncResultCopyWithImpl<GameDataSyncResult>(this as GameDataSyncResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GameDataSyncResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDataSyncResult&&const DeepCollectionEquality().equals(other.levels, _this.levels)&&(identical(other.equippedWeaponId, _this.equippedWeaponId) || other.equippedWeaponId == _this.equippedWeaponId)&&(identical(other.errorType, _this.errorType) || other.errorType == _this.errorType)&&const DeepCollectionEquality().equals(other.error, _this.error)&&(identical(other.isStale, _this.isStale) || other.isStale == _this.isStale));
}


@override
int get hashCode {
  final _this = this as GameDataSyncResult;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.levels),_this.equippedWeaponId,_this.errorType,const DeepCollectionEquality().hash(_this.error),_this.isStale);
}

@override
String toString() {
  final _this = this as GameDataSyncResult;
  return 'GameDataSyncResult(levels: ${_this.levels}, equippedWeaponId: ${_this.equippedWeaponId}, errorType: ${_this.errorType}, error: ${_this.error}, isStale: ${_this.isStale})';
}


}

/// @nodoc
abstract mixin class $GameDataSyncResultCopyWith<$Res>  {
  factory $GameDataSyncResultCopyWith(GameDataSyncResult value, $Res Function(GameDataSyncResult) _then) = _$GameDataSyncResultCopyWithImpl;
@useResult
$Res call({
 Map<Purpose, int>? levels, String? equippedWeaponId, GameDataSyncErrorType? errorType, Object? error, bool isStale
});




}
/// @nodoc
class _$GameDataSyncResultCopyWithImpl<$Res>
    implements $GameDataSyncResultCopyWith<$Res> {
  _$GameDataSyncResultCopyWithImpl(this._self, this._then);

  final GameDataSyncResult _self;
  final $Res Function(GameDataSyncResult) _then;

/// Create a copy of GameDataSyncResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? levels = freezed,Object? equippedWeaponId = freezed,Object? errorType = freezed,Object? error = freezed,Object? isStale = null,}) {
  return _then(GameDataSyncResult(
levels: freezed == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as Map<Purpose, int>?,equippedWeaponId: freezed == equippedWeaponId ? _self.equippedWeaponId : equippedWeaponId // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as GameDataSyncErrorType?,error: freezed == error ? _self.error : error ,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}



/// @nodoc


class _GameDataSyncResult implements GameDataSyncResult {
  const _GameDataSyncResult({ Map<Purpose, int>? levels, this.equippedWeaponId, this.errorType, this.error, this.isStale = false}): _levels = levels;
  

 final  Map<Purpose, int>? _levels;
@override Map<Purpose, int>? get levels {
  final value = _levels;
  if (value == null) return null;
  if (_levels is EqualUnmodifiableMapView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? equippedWeaponId;
@override final  GameDataSyncErrorType? errorType;
@override final  Object? error;
@override@JsonKey() final  bool isStale;

/// Create a copy of GameDataSyncResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameDataSyncResultCopyWith<_GameDataSyncResult> get copyWith => __$GameDataSyncResultCopyWithImpl<_GameDataSyncResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameDataSyncResult&&const DeepCollectionEquality().equals(other.levels, _levels)&&(identical(other.equippedWeaponId, equippedWeaponId) || other.equippedWeaponId == equippedWeaponId)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.isStale, isStale) || other.isStale == isStale));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_levels),equippedWeaponId,errorType,const DeepCollectionEquality().hash(error),isStale);
}

@override
String toString() {
    return 'GameDataSyncResult(levels: $levels, equippedWeaponId: $equippedWeaponId, errorType: $errorType, error: $error, isStale: $isStale)';
}


}

/// @nodoc
abstract mixin class _$GameDataSyncResultCopyWith<$Res> implements $GameDataSyncResultCopyWith<$Res> {
  factory _$GameDataSyncResultCopyWith(_GameDataSyncResult value, $Res Function(_GameDataSyncResult) _then) = __$GameDataSyncResultCopyWithImpl;
@override @useResult
$Res call({
 Map<Purpose, int>? levels, String? equippedWeaponId, GameDataSyncErrorType? errorType, Object? error, bool isStale
});




}
/// @nodoc
class __$GameDataSyncResultCopyWithImpl<$Res>
    implements _$GameDataSyncResultCopyWith<$Res> {
  __$GameDataSyncResultCopyWithImpl(this._self, this._then);

  final _GameDataSyncResult _self;
  final $Res Function(_GameDataSyncResult) _then;

/// Create a copy of GameDataSyncResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? levels = freezed,Object? equippedWeaponId = freezed,Object? errorType = freezed,Object? error = freezed,Object? isStale = null,}) {
  return _then(_GameDataSyncResult(
levels: freezed == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as Map<Purpose, int>?,equippedWeaponId: freezed == equippedWeaponId ? _self.equippedWeaponId : equippedWeaponId // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as GameDataSyncErrorType?,error: freezed == error ? _self.error : error ,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
