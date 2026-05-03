// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact_bookmark_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArtifactBookmarkListState {

 List<BookmarkGroup> get bookmarks;
/// Create a copy of ArtifactBookmarkListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtifactBookmarkListStateCopyWith<ArtifactBookmarkListState> get copyWith => _$ArtifactBookmarkListStateCopyWithImpl<ArtifactBookmarkListState>(this as ArtifactBookmarkListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactBookmarkListState&&const DeepCollectionEquality().equals(other.bookmarks, bookmarks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bookmarks));

@override
String toString() {
  return 'ArtifactBookmarkListState(bookmarks: $bookmarks)';
}


}

/// @nodoc
abstract mixin class $ArtifactBookmarkListStateCopyWith<$Res>  {
  factory $ArtifactBookmarkListStateCopyWith(ArtifactBookmarkListState value, $Res Function(ArtifactBookmarkListState) _then) = _$ArtifactBookmarkListStateCopyWithImpl;
@useResult
$Res call({
 List<BookmarkGroup> bookmarks
});




}
/// @nodoc
class _$ArtifactBookmarkListStateCopyWithImpl<$Res>
    implements $ArtifactBookmarkListStateCopyWith<$Res> {
  _$ArtifactBookmarkListStateCopyWithImpl(this._self, this._then);

  final ArtifactBookmarkListState _self;
  final $Res Function(ArtifactBookmarkListState) _then;

/// Create a copy of ArtifactBookmarkListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookmarks = null,}) {
  return _then(_self.copyWith(
bookmarks: null == bookmarks ? _self.bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as List<BookmarkGroup>,
  ));
}

}



/// @nodoc


class _ArtifactBookmarkListState implements ArtifactBookmarkListState {
  const _ArtifactBookmarkListState({required final  List<BookmarkGroup> bookmarks}): _bookmarks = bookmarks;
  

 final  List<BookmarkGroup> _bookmarks;
@override List<BookmarkGroup> get bookmarks {
  if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookmarks);
}


/// Create a copy of ArtifactBookmarkListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtifactBookmarkListStateCopyWith<_ArtifactBookmarkListState> get copyWith => __$ArtifactBookmarkListStateCopyWithImpl<_ArtifactBookmarkListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactBookmarkListState&&const DeepCollectionEquality().equals(other._bookmarks, _bookmarks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bookmarks));

@override
String toString() {
  return 'ArtifactBookmarkListState(bookmarks: $bookmarks)';
}


}

/// @nodoc
abstract mixin class _$ArtifactBookmarkListStateCopyWith<$Res> implements $ArtifactBookmarkListStateCopyWith<$Res> {
  factory _$ArtifactBookmarkListStateCopyWith(_ArtifactBookmarkListState value, $Res Function(_ArtifactBookmarkListState) _then) = __$ArtifactBookmarkListStateCopyWithImpl;
@override @useResult
$Res call({
 List<BookmarkGroup> bookmarks
});




}
/// @nodoc
class __$ArtifactBookmarkListStateCopyWithImpl<$Res>
    implements _$ArtifactBookmarkListStateCopyWith<$Res> {
  __$ArtifactBookmarkListStateCopyWithImpl(this._self, this._then);

  final _ArtifactBookmarkListState _self;
  final $Res Function(_ArtifactBookmarkListState) _then;

/// Create a copy of ArtifactBookmarkListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookmarks = null,}) {
  return _then(_ArtifactBookmarkListState(
bookmarks: null == bookmarks ? _self._bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as List<BookmarkGroup>,
  ));
}


}

// dart format on
