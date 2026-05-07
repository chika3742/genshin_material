// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purpose_grouped_bookmark_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurposeGroupedBookmarkListState {

 List<BookmarkGroup> get groups;/// Map of group hashes.
 Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>> get sortedBookmarks;
/// Create a copy of PurposeGroupedBookmarkListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurposeGroupedBookmarkListStateCopyWith<PurposeGroupedBookmarkListState> get copyWith => _$PurposeGroupedBookmarkListStateCopyWithImpl<PurposeGroupedBookmarkListState>(this as PurposeGroupedBookmarkListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurposeGroupedBookmarkListState&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.sortedBookmarks, sortedBookmarks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(sortedBookmarks));

@override
String toString() {
  return 'PurposeGroupedBookmarkListState(groups: $groups, sortedBookmarks: $sortedBookmarks)';
}


}

/// @nodoc
abstract mixin class $PurposeGroupedBookmarkListStateCopyWith<$Res>  {
  factory $PurposeGroupedBookmarkListStateCopyWith(PurposeGroupedBookmarkListState value, $Res Function(PurposeGroupedBookmarkListState) _then) = _$PurposeGroupedBookmarkListStateCopyWithImpl;
@useResult
$Res call({
 List<BookmarkGroup> groups, Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>> sortedBookmarks
});




}
/// @nodoc
class _$PurposeGroupedBookmarkListStateCopyWithImpl<$Res>
    implements $PurposeGroupedBookmarkListStateCopyWith<$Res> {
  _$PurposeGroupedBookmarkListStateCopyWithImpl(this._self, this._then);

  final PurposeGroupedBookmarkListState _self;
  final $Res Function(PurposeGroupedBookmarkListState) _then;

/// Create a copy of PurposeGroupedBookmarkListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,Object? sortedBookmarks = null,}) {
  return _then(_self.copyWith(
groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<BookmarkGroup>,sortedBookmarks: null == sortedBookmarks ? _self.sortedBookmarks : sortedBookmarks // ignore: cast_nullable_to_non_nullable
as Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>>,
  ));
}

}



/// @nodoc


class _PurposeGroupedBookmarkListState implements PurposeGroupedBookmarkListState {
  const _PurposeGroupedBookmarkListState({required final  List<BookmarkGroup> groups, required final  Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>> sortedBookmarks}): _groups = groups,_sortedBookmarks = sortedBookmarks;
  

 final  List<BookmarkGroup> _groups;
@override List<BookmarkGroup> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

/// Map of group hashes.
 final  Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>> _sortedBookmarks;
/// Map of group hashes.
@override Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>> get sortedBookmarks {
  if (_sortedBookmarks is EqualUnmodifiableMapView) return _sortedBookmarks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sortedBookmarks);
}


/// Create a copy of PurposeGroupedBookmarkListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurposeGroupedBookmarkListStateCopyWith<_PurposeGroupedBookmarkListState> get copyWith => __$PurposeGroupedBookmarkListStateCopyWithImpl<_PurposeGroupedBookmarkListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurposeGroupedBookmarkListState&&const DeepCollectionEquality().equals(other._groups, _groups)&&const DeepCollectionEquality().equals(other._sortedBookmarks, _sortedBookmarks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(_sortedBookmarks));

@override
String toString() {
  return 'PurposeGroupedBookmarkListState(groups: $groups, sortedBookmarks: $sortedBookmarks)';
}


}

/// @nodoc
abstract mixin class _$PurposeGroupedBookmarkListStateCopyWith<$Res> implements $PurposeGroupedBookmarkListStateCopyWith<$Res> {
  factory _$PurposeGroupedBookmarkListStateCopyWith(_PurposeGroupedBookmarkListState value, $Res Function(_PurposeGroupedBookmarkListState) _then) = __$PurposeGroupedBookmarkListStateCopyWithImpl;
@override @useResult
$Res call({
 List<BookmarkGroup> groups, Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>> sortedBookmarks
});




}
/// @nodoc
class __$PurposeGroupedBookmarkListStateCopyWithImpl<$Res>
    implements _$PurposeGroupedBookmarkListStateCopyWith<$Res> {
  __$PurposeGroupedBookmarkListStateCopyWithImpl(this._self, this._then);

  final _PurposeGroupedBookmarkListState _self;
  final $Res Function(_PurposeGroupedBookmarkListState) _then;

/// Create a copy of PurposeGroupedBookmarkListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = null,Object? sortedBookmarks = null,}) {
  return _then(_PurposeGroupedBookmarkListState(
groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<BookmarkGroup>,sortedBookmarks: null == sortedBookmarks ? _self._sortedBookmarks : sortedBookmarks // ignore: cast_nullable_to_non_nullable
as Map<String, Map<MaterialId?, List<BookmarkWithMaterialDetails>>>,
  ));
}


}

// dart format on
