// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bag_counts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BagCountRequests {

 Set<VariantId> get variantIds; Set<WeaponId> get weaponIds;



@override
bool operator ==(Object other) {
  final _this = this as BagCountRequests;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BagCountRequests&&const DeepCollectionEquality().equals(other.variantIds, _this.variantIds)&&const DeepCollectionEquality().equals(other.weaponIds, _this.weaponIds));
}


@override
int get hashCode {
  final _this = this as BagCountRequests;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.variantIds),const DeepCollectionEquality().hash(_this.weaponIds));
}

@override
String toString() {
  final _this = this as BagCountRequests;
  return 'BagCountRequests(variantIds: ${_this.variantIds}, weaponIds: ${_this.weaponIds})';
}


}





/// @nodoc


class _BagCountRequests implements BagCountRequests {
  const _BagCountRequests({ Set<VariantId> variantIds = const {},  Set<WeaponId> weaponIds = const {}}): _variantIds = variantIds,_weaponIds = weaponIds;
  

 final  Set<VariantId> _variantIds;
@override@JsonKey() Set<VariantId> get variantIds {
  if (_variantIds is EqualUnmodifiableSetView) return _variantIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_variantIds);
}

 final  Set<WeaponId> _weaponIds;
@override@JsonKey() Set<WeaponId> get weaponIds {
  if (_weaponIds is EqualUnmodifiableSetView) return _weaponIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_weaponIds);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BagCountRequests&&const DeepCollectionEquality().equals(other.variantIds, _variantIds)&&const DeepCollectionEquality().equals(other.weaponIds, _weaponIds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_variantIds),const DeepCollectionEquality().hash(_weaponIds));
}

@override
String toString() {
    return 'BagCountRequests(variantIds: $variantIds, weaponIds: $weaponIds)';
}


}




// dart format on
