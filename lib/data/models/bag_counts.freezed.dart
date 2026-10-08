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

 Set<({VariantId? variantId, WeaponId? weaponId,})> get requests;



@override
bool operator ==(Object other) {
  final _this = this as BagCountRequests;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BagCountRequests&&const DeepCollectionEquality().equals(other.requests, _this.requests));
}


@override
int get hashCode {
  final _this = this as BagCountRequests;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.requests));
}

@override
String toString() {
  final _this = this as BagCountRequests;
  return 'BagCountRequests(requests: ${_this.requests})';
}


}





/// @nodoc


class _BagCountRequests implements BagCountRequests {
  const _BagCountRequests({required  Set<({VariantId? variantId, WeaponId? weaponId,})> requests}): _requests = requests;
  

 final  Set<({VariantId? variantId, WeaponId? weaponId,})> _requests;
@override Set<({VariantId? variantId, WeaponId? weaponId,})> get requests {
  if (_requests is EqualUnmodifiableSetView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_requests);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BagCountRequests&&const DeepCollectionEquality().equals(other.requests, _requests));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests));
}

@override
String toString() {
    return 'BagCountRequests(requests: $requests)';
}


}




// dart format on
