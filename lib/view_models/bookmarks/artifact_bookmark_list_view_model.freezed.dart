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
mixin _$ArtifactBookmarkItemState {

 int get id; String get characterId; String get orderIndex; List<String> get subStats;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactBookmarkItemState&&(identical(other.id, id) || other.id == id)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&const DeepCollectionEquality().equals(other.subStats, subStats));
}


@override
int get hashCode => Object.hash(runtimeType,id,characterId,orderIndex,const DeepCollectionEquality().hash(subStats));

@override
String toString() {
  return 'ArtifactBookmarkItemState(id: $id, characterId: $characterId, orderIndex: $orderIndex, subStats: $subStats)';
}


}





/// @nodoc


class ArtifactSetBookmarkItemState implements ArtifactBookmarkItemState {
  const ArtifactSetBookmarkItemState({required this.id, required this.characterId, required this.orderIndex, required final  List<String> sets, required final  Map<String, String?> mainStats, required final  List<String> subStats}): _sets = sets,_mainStats = mainStats,_subStats = subStats;
  

@override final  int id;
@override final  String characterId;
@override final  String orderIndex;
 final  List<String> _sets;
 List<String> get sets {
  if (_sets is EqualUnmodifiableListView) return _sets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sets);
}

 final  Map<String, String?> _mainStats;
 Map<String, String?> get mainStats {
  if (_mainStats is EqualUnmodifiableMapView) return _mainStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_mainStats);
}

 final  List<String> _subStats;
@override List<String> get subStats {
  if (_subStats is EqualUnmodifiableListView) return _subStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subStats);
}





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactSetBookmarkItemState&&(identical(other.id, id) || other.id == id)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&const DeepCollectionEquality().equals(other._sets, _sets)&&const DeepCollectionEquality().equals(other._mainStats, _mainStats)&&const DeepCollectionEquality().equals(other._subStats, _subStats));
}


@override
int get hashCode => Object.hash(runtimeType,id,characterId,orderIndex,const DeepCollectionEquality().hash(_sets),const DeepCollectionEquality().hash(_mainStats),const DeepCollectionEquality().hash(_subStats));

@override
String toString() {
  return 'ArtifactBookmarkItemState.set(id: $id, characterId: $characterId, orderIndex: $orderIndex, sets: $sets, mainStats: $mainStats, subStats: $subStats)';
}


}




/// @nodoc


class ArtifactPieceBookmarkItemState implements ArtifactBookmarkItemState {
  const ArtifactPieceBookmarkItemState({required this.id, required this.characterId, required this.orderIndex, required this.piece, required this.mainStat, required final  List<String> subStats}): _subStats = subStats;
  

@override final  int id;
@override final  String characterId;
@override final  String orderIndex;
 final  String piece;
 final  String? mainStat;
 final  List<String> _subStats;
@override List<String> get subStats {
  if (_subStats is EqualUnmodifiableListView) return _subStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subStats);
}





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactPieceBookmarkItemState&&(identical(other.id, id) || other.id == id)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.piece, piece) || other.piece == piece)&&(identical(other.mainStat, mainStat) || other.mainStat == mainStat)&&const DeepCollectionEquality().equals(other._subStats, _subStats));
}


@override
int get hashCode => Object.hash(runtimeType,id,characterId,orderIndex,piece,mainStat,const DeepCollectionEquality().hash(_subStats));

@override
String toString() {
  return 'ArtifactBookmarkItemState.piece(id: $id, characterId: $characterId, orderIndex: $orderIndex, piece: $piece, mainStat: $mainStat, subStats: $subStats)';
}


}




// dart format on
