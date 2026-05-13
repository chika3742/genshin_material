// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookmarkWithDetails {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkWithDetails);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookmarkWithDetails()';
}


}





/// @nodoc


class BookmarkWithMaterialDetails implements BookmarkWithDetails {
  const BookmarkWithMaterialDetails({required this.group, required this.item});
  

 final  BookmarkMaterialGroup group;
 final  BookmarkMaterialItem item;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkWithMaterialDetails&&(identical(other.group, group) || other.group == group)&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,group,item);

@override
String toString() {
  return 'BookmarkWithDetails.material(group: $group, item: $item)';
}


}




/// @nodoc


class BookmarkWithArtifactSetDetails implements BookmarkWithDetails {
  const BookmarkWithArtifactSetDetails({required this.artifact, required this.artifactSet});
  

 final  BookmarkArtifact artifact;
 final  BookmarkArtifactSet artifactSet;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkWithArtifactSetDetails&&(identical(other.artifact, artifact) || other.artifact == artifact)&&(identical(other.artifactSet, artifactSet) || other.artifactSet == artifactSet));
}


@override
int get hashCode => Object.hash(runtimeType,artifact,artifactSet);

@override
String toString() {
  return 'BookmarkWithDetails.artifactSet(artifact: $artifact, artifactSet: $artifactSet)';
}


}




/// @nodoc


class BookmarkWithArtifactPieceDetails implements BookmarkWithDetails {
  const BookmarkWithArtifactPieceDetails({required this.artifact, required this.artifactPiece});
  

 final  BookmarkArtifact artifact;
 final  BookmarkArtifactPiece artifactPiece;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkWithArtifactPieceDetails&&(identical(other.artifact, artifact) || other.artifact == artifact)&&(identical(other.artifactPiece, artifactPiece) || other.artifactPiece == artifactPiece));
}


@override
int get hashCode => Object.hash(runtimeType,artifact,artifactPiece);

@override
String toString() {
  return 'BookmarkWithDetails.artifactPiece(artifact: $artifact, artifactPiece: $artifactPiece)';
}


}




/// @nodoc
mixin _$BookmarkGroup {

 String get hash; BookmarkType get type; String get characterId; String get orderIndex; LevelRangeValues? get levelRange; List<BookmarkWithDetails> get bookmarks;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkGroup&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.type, type) || other.type == type)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.levelRange, levelRange) || other.levelRange == levelRange)&&const DeepCollectionEquality().equals(other.bookmarks, bookmarks));
}


@override
int get hashCode => Object.hash(runtimeType,hash,type,characterId,orderIndex,levelRange,const DeepCollectionEquality().hash(bookmarks));

@override
String toString() {
  return 'BookmarkGroup(hash: $hash, type: $type, characterId: $characterId, orderIndex: $orderIndex, levelRange: $levelRange, bookmarks: $bookmarks)';
}


}





/// @nodoc


class _BookmarkGroup extends BookmarkGroup {
  const _BookmarkGroup({required this.hash, required this.type, required this.characterId, required this.orderIndex, this.levelRange, required final  List<BookmarkWithDetails> bookmarks}): _bookmarks = bookmarks,super._();
  

@override final  String hash;
@override final  BookmarkType type;
@override final  String characterId;
@override final  String orderIndex;
@override final  LevelRangeValues? levelRange;
 final  List<BookmarkWithDetails> _bookmarks;
@override List<BookmarkWithDetails> get bookmarks {
  if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookmarks);
}





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkGroup&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.type, type) || other.type == type)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.levelRange, levelRange) || other.levelRange == levelRange)&&const DeepCollectionEquality().equals(other._bookmarks, _bookmarks));
}


@override
int get hashCode => Object.hash(runtimeType,hash,type,characterId,orderIndex,levelRange,const DeepCollectionEquality().hash(_bookmarks));

@override
String toString() {
  return 'BookmarkGroup(hash: $hash, type: $type, characterId: $characterId, orderIndex: $orderIndex, levelRange: $levelRange, bookmarks: $bookmarks)';
}


}




// dart format on
