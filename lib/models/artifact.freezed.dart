// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArtifactSet {

 String get id; LocalizedText get name; String get jaPronunciation; int get maxRarity; List<String>? get tags; Map<ArtifactPieceTypeId, ArtifactPieceId> get consistsOf; List<ArtifactSetBonus> get bonuses;

  /// Serializes this ArtifactSet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactSet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.maxRarity, maxRarity) || other.maxRarity == maxRarity)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.consistsOf, consistsOf)&&const DeepCollectionEquality().equals(other.bonuses, bonuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,jaPronunciation,maxRarity,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(consistsOf),const DeepCollectionEquality().hash(bonuses));

@override
String toString() {
  return 'ArtifactSet(id: $id, name: $name, jaPronunciation: $jaPronunciation, maxRarity: $maxRarity, tags: $tags, consistsOf: $consistsOf, bonuses: $bonuses)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactSet extends ArtifactSet {
  const _ArtifactSet({required this.id, required this.name, required this.jaPronunciation, required this.maxRarity, final  List<String>? tags, required final  Map<ArtifactPieceTypeId, ArtifactPieceId> consistsOf, required final  List<ArtifactSetBonus> bonuses}): _tags = tags,_consistsOf = consistsOf,_bonuses = bonuses,super._();
  factory _ArtifactSet.fromJson(Map<String, dynamic> json) => _$ArtifactSetFromJson(json);

@override final  String id;
@override final  LocalizedText name;
@override final  String jaPronunciation;
@override final  int maxRarity;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<ArtifactPieceTypeId, ArtifactPieceId> _consistsOf;
@override Map<ArtifactPieceTypeId, ArtifactPieceId> get consistsOf {
  if (_consistsOf is EqualUnmodifiableMapView) return _consistsOf;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_consistsOf);
}

 final  List<ArtifactSetBonus> _bonuses;
@override List<ArtifactSetBonus> get bonuses {
  if (_bonuses is EqualUnmodifiableListView) return _bonuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bonuses);
}



@override
Map<String, dynamic> toJson() {
  return _$ArtifactSetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactSet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.maxRarity, maxRarity) || other.maxRarity == maxRarity)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._consistsOf, _consistsOf)&&const DeepCollectionEquality().equals(other._bonuses, _bonuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,jaPronunciation,maxRarity,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_consistsOf),const DeepCollectionEquality().hash(_bonuses));

@override
String toString() {
  return 'ArtifactSet(id: $id, name: $name, jaPronunciation: $jaPronunciation, maxRarity: $maxRarity, tags: $tags, consistsOf: $consistsOf, bonuses: $bonuses)';
}


}





/// @nodoc
mixin _$ArtifactPiece {

 String get id; LocalizedText get name; String get jaPronunciation; String get parentId; ArtifactPieceTypeId get type; String get imageUrl;

  /// Serializes this ArtifactPiece to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactPiece&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,jaPronunciation,parentId,type,imageUrl);

@override
String toString() {
  return 'ArtifactPiece(id: $id, name: $name, jaPronunciation: $jaPronunciation, parentId: $parentId, type: $type, imageUrl: $imageUrl)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactPiece extends ArtifactPiece {
  const _ArtifactPiece({required this.id, required this.name, required this.jaPronunciation, required this.parentId, required this.type, required this.imageUrl}): super._();
  factory _ArtifactPiece.fromJson(Map<String, dynamic> json) => _$ArtifactPieceFromJson(json);

@override final  String id;
@override final  LocalizedText name;
@override final  String jaPronunciation;
@override final  String parentId;
@override final  ArtifactPieceTypeId type;
@override final  String imageUrl;


@override
Map<String, dynamic> toJson() {
  return _$ArtifactPieceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactPiece&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,jaPronunciation,parentId,type,imageUrl);

@override
String toString() {
  return 'ArtifactPiece(id: $id, name: $name, jaPronunciation: $jaPronunciation, parentId: $parentId, type: $type, imageUrl: $imageUrl)';
}


}





/// @nodoc
mixin _$ArtifactSetBonus {

 String get type; LocalizedText get description;

  /// Serializes this ArtifactSetBonus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactSetBonus&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,description);

@override
String toString() {
  return 'ArtifactSetBonus(type: $type, description: $description)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactSetBonus implements ArtifactSetBonus {
  const _ArtifactSetBonus({required this.type, required this.description});
  factory _ArtifactSetBonus.fromJson(Map<String, dynamic> json) => _$ArtifactSetBonusFromJson(json);

@override final  String type;
@override final  LocalizedText description;


@override
Map<String, dynamic> toJson() {
  return _$ArtifactSetBonusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactSetBonus&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,description);

@override
String toString() {
  return 'ArtifactSetBonus(type: $type, description: $description)';
}


}





/// @nodoc
mixin _$ArtifactsMeta {

 Map<StatId, LocalizedText> get stats; Map<ArtifactPieceTypeId, ArtifactPieceType> get pieceTypes; List<StatId> get possibleSubStats; ArtifactTagCategoriesInternal get tags;

  /// Serializes this ArtifactsMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactsMeta&&const DeepCollectionEquality().equals(other.stats, stats)&&const DeepCollectionEquality().equals(other.pieceTypes, pieceTypes)&&const DeepCollectionEquality().equals(other.possibleSubStats, possibleSubStats)&&(identical(other.tags, tags) || other.tags == tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(stats),const DeepCollectionEquality().hash(pieceTypes),const DeepCollectionEquality().hash(possibleSubStats),tags);

@override
String toString() {
  return 'ArtifactsMeta(stats: $stats, pieceTypes: $pieceTypes, possibleSubStats: $possibleSubStats, tags: $tags)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactsMeta implements ArtifactsMeta {
  const _ArtifactsMeta({required final  Map<StatId, LocalizedText> stats, required final  Map<ArtifactPieceTypeId, ArtifactPieceType> pieceTypes, required final  List<StatId> possibleSubStats, required this.tags}): _stats = stats,_pieceTypes = pieceTypes,_possibleSubStats = possibleSubStats;
  factory _ArtifactsMeta.fromJson(Map<String, dynamic> json) => _$ArtifactsMetaFromJson(json);

 final  Map<StatId, LocalizedText> _stats;
@override Map<StatId, LocalizedText> get stats {
  if (_stats is EqualUnmodifiableMapView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_stats);
}

 final  Map<ArtifactPieceTypeId, ArtifactPieceType> _pieceTypes;
@override Map<ArtifactPieceTypeId, ArtifactPieceType> get pieceTypes {
  if (_pieceTypes is EqualUnmodifiableMapView) return _pieceTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pieceTypes);
}

 final  List<StatId> _possibleSubStats;
@override List<StatId> get possibleSubStats {
  if (_possibleSubStats is EqualUnmodifiableListView) return _possibleSubStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_possibleSubStats);
}

@override final  ArtifactTagCategoriesInternal tags;


@override
Map<String, dynamic> toJson() {
  return _$ArtifactsMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactsMeta&&const DeepCollectionEquality().equals(other._stats, _stats)&&const DeepCollectionEquality().equals(other._pieceTypes, _pieceTypes)&&const DeepCollectionEquality().equals(other._possibleSubStats, _possibleSubStats)&&(identical(other.tags, tags) || other.tags == tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_stats),const DeepCollectionEquality().hash(_pieceTypes),const DeepCollectionEquality().hash(_possibleSubStats),tags);

@override
String toString() {
  return 'ArtifactsMeta(stats: $stats, pieceTypes: $pieceTypes, possibleSubStats: $possibleSubStats, tags: $tags)';
}


}





/// @nodoc
mixin _$ArtifactPieceType {

 ArtifactPieceTypeId get id; LocalizedText get desc; List<StatId> get possibleMainStats;

  /// Serializes this ArtifactPieceType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactPieceType&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc)&&const DeepCollectionEquality().equals(other.possibleMainStats, possibleMainStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,desc,const DeepCollectionEquality().hash(possibleMainStats));

@override
String toString() {
  return 'ArtifactPieceType(id: $id, desc: $desc, possibleMainStats: $possibleMainStats)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactPieceType implements ArtifactPieceType {
  const _ArtifactPieceType({required this.id, required this.desc, required final  List<StatId> possibleMainStats}): _possibleMainStats = possibleMainStats;
  factory _ArtifactPieceType.fromJson(Map<String, dynamic> json) => _$ArtifactPieceTypeFromJson(json);

@override final  ArtifactPieceTypeId id;
@override final  LocalizedText desc;
 final  List<StatId> _possibleMainStats;
@override List<StatId> get possibleMainStats {
  if (_possibleMainStats is EqualUnmodifiableListView) return _possibleMainStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_possibleMainStats);
}



@override
Map<String, dynamic> toJson() {
  return _$ArtifactPieceTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactPieceType&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc)&&const DeepCollectionEquality().equals(other._possibleMainStats, _possibleMainStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,desc,const DeepCollectionEquality().hash(_possibleMainStats));

@override
String toString() {
  return 'ArtifactPieceType(id: $id, desc: $desc, possibleMainStats: $possibleMainStats)';
}


}





/// @nodoc
mixin _$ArtifactStat {

 StatId get id; LocalizedText get desc;

  /// Serializes this ArtifactStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactStat&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,desc);

@override
String toString() {
  return 'ArtifactStat(id: $id, desc: $desc)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactStat implements ArtifactStat {
  const _ArtifactStat({required this.id, required this.desc});
  factory _ArtifactStat.fromJson(Map<String, dynamic> json) => _$ArtifactStatFromJson(json);

@override final  StatId id;
@override final  LocalizedText desc;


@override
Map<String, dynamic> toJson() {
  return _$ArtifactStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactStat&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,desc);

@override
String toString() {
  return 'ArtifactStat(id: $id, desc: $desc)';
}


}





/// @nodoc
mixin _$ArtifactTagCategoriesInternal {

 List<ArtifactTagCategory> get categories;

  /// Serializes this ArtifactTagCategoriesInternal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactTagCategoriesInternal&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ArtifactTagCategoriesInternal(categories: $categories)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactTagCategoriesInternal implements ArtifactTagCategoriesInternal {
  const _ArtifactTagCategoriesInternal({required final  List<ArtifactTagCategory> categories}): _categories = categories;
  factory _ArtifactTagCategoriesInternal.fromJson(Map<String, dynamic> json) => _$ArtifactTagCategoriesInternalFromJson(json);

 final  List<ArtifactTagCategory> _categories;
@override List<ArtifactTagCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}



@override
Map<String, dynamic> toJson() {
  return _$ArtifactTagCategoriesInternalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactTagCategoriesInternal&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ArtifactTagCategoriesInternal(categories: $categories)';
}


}





/// @nodoc
mixin _$ArtifactTagCategory {

 LocalizedText get desc; List<ArtifactTag> get items;

  /// Serializes this ArtifactTagCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactTagCategory&&(identical(other.desc, desc) || other.desc == desc)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,desc,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ArtifactTagCategory(desc: $desc, items: $items)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactTagCategory implements ArtifactTagCategory {
  const _ArtifactTagCategory({required this.desc, required final  List<ArtifactTag> items}): _items = items;
  factory _ArtifactTagCategory.fromJson(Map<String, dynamic> json) => _$ArtifactTagCategoryFromJson(json);

@override final  LocalizedText desc;
 final  List<ArtifactTag> _items;
@override List<ArtifactTag> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}



@override
Map<String, dynamic> toJson() {
  return _$ArtifactTagCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactTagCategory&&(identical(other.desc, desc) || other.desc == desc)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,desc,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ArtifactTagCategory(desc: $desc, items: $items)';
}


}





/// @nodoc
mixin _$ArtifactTag {

 String get id; LocalizedText get desc;

  /// Serializes this ArtifactTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactTag&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,desc);

@override
String toString() {
  return 'ArtifactTag(id: $id, desc: $desc)';
}


}





/// @nodoc
@JsonSerializable()

class _ArtifactTag implements ArtifactTag {
  const _ArtifactTag({required this.id, required this.desc});
  factory _ArtifactTag.fromJson(Map<String, dynamic> json) => _$ArtifactTagFromJson(json);

@override final  String id;
@override final  LocalizedText desc;


@override
Map<String, dynamic> toJson() {
  return _$ArtifactTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactTag&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,desc);

@override
String toString() {
  return 'ArtifactTag(id: $id, desc: $desc)';
}


}




// dart format on
