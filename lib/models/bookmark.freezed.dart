// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaterialBookmark {

 BookmarkMaterialGroup get group; BookmarkMaterialItem get item;



@override
bool operator ==(Object other) {
  final _this = this as MaterialBookmark;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialBookmark&&(identical(other.group, _this.group) || other.group == _this.group)&&(identical(other.item, _this.item) || other.item == _this.item));
}


@override
int get hashCode {
  final _this = this as MaterialBookmark;
  return Object.hash(runtimeType,_this.group,_this.item);
}

@override
String toString() {
  final _this = this as MaterialBookmark;
  return 'MaterialBookmark(group: ${_this.group}, item: ${_this.item})';
}


}





/// @nodoc


class _MaterialBookmark implements MaterialBookmark {
  const _MaterialBookmark({required this.group, required this.item});
  

@override final  BookmarkMaterialGroup group;
@override final  BookmarkMaterialItem item;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialBookmark&&(identical(other.group, group) || other.group == group)&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode {
    return Object.hash(runtimeType,group,item);
}

@override
String toString() {
    return 'MaterialBookmark(group: $group, item: $item)';
}


}




/// @nodoc
mixin _$BookmarkGroup {

 String get hash; CharacterOrVariantId get characterId; String get orderIndex; LevelRangeValues get levelRange; List<MaterialBookmark> get bookmarks;



@override
bool operator ==(Object other) {
  final _this = this as BookmarkGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkGroup&&(identical(other.hash, _this.hash) || other.hash == _this.hash)&&(identical(other.characterId, _this.characterId) || other.characterId == _this.characterId)&&(identical(other.orderIndex, _this.orderIndex) || other.orderIndex == _this.orderIndex)&&(identical(other.levelRange, _this.levelRange) || other.levelRange == _this.levelRange)&&const DeepCollectionEquality().equals(other.bookmarks, _this.bookmarks));
}


@override
int get hashCode {
  final _this = this as BookmarkGroup;
  return Object.hash(runtimeType,_this.hash,_this.characterId,_this.orderIndex,_this.levelRange,const DeepCollectionEquality().hash(_this.bookmarks));
}

@override
String toString() {
  final _this = this as BookmarkGroup;
  return 'BookmarkGroup(hash: ${_this.hash}, characterId: ${_this.characterId}, orderIndex: ${_this.orderIndex}, levelRange: ${_this.levelRange}, bookmarks: ${_this.bookmarks})';
}


}





/// @nodoc


class _BookmarkGroup extends BookmarkGroup {
  const _BookmarkGroup({required this.hash, required this.characterId, required this.orderIndex, required this.levelRange, required  List<MaterialBookmark> bookmarks}): _bookmarks = bookmarks,super._();
  

@override final  String hash;
@override final  CharacterOrVariantId characterId;
@override final  String orderIndex;
@override final  LevelRangeValues levelRange;
 final  List<MaterialBookmark> _bookmarks;
@override List<MaterialBookmark> get bookmarks {
  if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookmarks);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkGroup&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.levelRange, levelRange) || other.levelRange == levelRange)&&const DeepCollectionEquality().equals(other.bookmarks, _bookmarks));
}


@override
int get hashCode {
    return Object.hash(runtimeType,hash,characterId,orderIndex,levelRange,const DeepCollectionEquality().hash(_bookmarks));
}

@override
String toString() {
    return 'BookmarkGroup(hash: $hash, characterId: $characterId, orderIndex: $orderIndex, levelRange: $levelRange, bookmarks: $bookmarks)';
}


}




// dart format on
