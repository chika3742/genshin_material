// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_grouped_bookmark_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaterialGroupedBookmarkListState {

 Map<String, List<MaterialBookmark>> get materials; BagCounts get bagCounts; bool get cannotShowBagCounts;



@override
bool operator ==(Object other) {
  final _this = this as MaterialGroupedBookmarkListState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialGroupedBookmarkListState&&const DeepCollectionEquality().equals(other.materials, _this.materials)&&const DeepCollectionEquality().equals(other.bagCounts, _this.bagCounts)&&(identical(other.cannotShowBagCounts, _this.cannotShowBagCounts) || other.cannotShowBagCounts == _this.cannotShowBagCounts));
}


@override
int get hashCode {
  final _this = this as MaterialGroupedBookmarkListState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.materials),const DeepCollectionEquality().hash(_this.bagCounts),_this.cannotShowBagCounts);
}

@override
String toString() {
  final _this = this as MaterialGroupedBookmarkListState;
  return 'MaterialGroupedBookmarkListState(materials: ${_this.materials}, bagCounts: ${_this.bagCounts}, cannotShowBagCounts: ${_this.cannotShowBagCounts})';
}


}





/// @nodoc


class _MaterialGroupedBookmarkListState implements MaterialGroupedBookmarkListState {
  const _MaterialGroupedBookmarkListState({required  Map<String, List<MaterialBookmark>> materials, required  BagCounts bagCounts, required this.cannotShowBagCounts}): _materials = materials,_bagCounts = bagCounts;
  

 final  Map<String, List<MaterialBookmark>> _materials;
@override Map<String, List<MaterialBookmark>> get materials {
  if (_materials is EqualUnmodifiableMapView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_materials);
}

 final  BagCounts _bagCounts;
@override BagCounts get bagCounts {
  if (_bagCounts is EqualUnmodifiableMapView) return _bagCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_bagCounts);
}

@override final  bool cannotShowBagCounts;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialGroupedBookmarkListState&&const DeepCollectionEquality().equals(other.materials, _materials)&&const DeepCollectionEquality().equals(other.bagCounts, _bagCounts)&&(identical(other.cannotShowBagCounts, cannotShowBagCounts) || other.cannotShowBagCounts == cannotShowBagCounts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_materials),const DeepCollectionEquality().hash(_bagCounts),cannotShowBagCounts);
}

@override
String toString() {
    return 'MaterialGroupedBookmarkListState(materials: $materials, bagCounts: $bagCounts, cannotShowBagCounts: $cannotShowBagCounts)';
}


}




// dart format on
