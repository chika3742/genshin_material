// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArtifactSet {

 String get id; LocalizedText get name; String get jaPronunciation; int get maxRarity; List<String>? get tags; Map<ArtifactPieceTypeId, ArtifactPieceId> get consistsOf; List<ArtifactSetBonus> get bonuses;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactSet;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactSet&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.jaPronunciation, _this.jaPronunciation) || other.jaPronunciation == _this.jaPronunciation)&&(identical(other.maxRarity, _this.maxRarity) || other.maxRarity == _this.maxRarity)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&const DeepCollectionEquality().equals(other.consistsOf, _this.consistsOf)&&const DeepCollectionEquality().equals(other.bonuses, _this.bonuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactSet;
  return Object.hash(runtimeType,_this.id,_this.name,_this.jaPronunciation,_this.maxRarity,const DeepCollectionEquality().hash(_this.tags),const DeepCollectionEquality().hash(_this.consistsOf),const DeepCollectionEquality().hash(_this.bonuses));
}

@override
String toString() {
  final _this = this as ArtifactSet;
  return 'ArtifactSet(id: ${_this.id}, name: ${_this.name}, jaPronunciation: ${_this.jaPronunciation}, maxRarity: ${_this.maxRarity}, tags: ${_this.tags}, consistsOf: ${_this.consistsOf}, bonuses: ${_this.bonuses})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _ArtifactSet extends ArtifactSet {
  const _ArtifactSet({required this.id, required this.name, required this.jaPronunciation, required this.maxRarity,  List<String>? tags, required  Map<ArtifactPieceTypeId, ArtifactPieceId> consistsOf, required  List<ArtifactSetBonus> bonuses}): _tags = tags,_consistsOf = consistsOf,_bonuses = bonuses,super._();
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
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactSet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.maxRarity, maxRarity) || other.maxRarity == maxRarity)&&const DeepCollectionEquality().equals(other.tags, _tags)&&const DeepCollectionEquality().equals(other.consistsOf, _consistsOf)&&const DeepCollectionEquality().equals(other.bonuses, _bonuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,jaPronunciation,maxRarity,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_consistsOf),const DeepCollectionEquality().hash(_bonuses));
}

@override
String toString() {
    return 'ArtifactSet(id: $id, name: $name, jaPronunciation: $jaPronunciation, maxRarity: $maxRarity, tags: $tags, consistsOf: $consistsOf, bonuses: $bonuses)';
}


}





/// @nodoc
mixin _$ArtifactPiece {

 String get id; LocalizedText get name; String get jaPronunciation; String get parentId; ArtifactPieceTypeId get type; String get imageUrl;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactPiece;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactPiece&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.jaPronunciation, _this.jaPronunciation) || other.jaPronunciation == _this.jaPronunciation)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactPiece;
  return Object.hash(runtimeType,_this.id,_this.name,_this.jaPronunciation,_this.parentId,_this.type,_this.imageUrl);
}

@override
String toString() {
  final _this = this as ArtifactPiece;
  return 'ArtifactPiece(id: ${_this.id}, name: ${_this.name}, jaPronunciation: ${_this.jaPronunciation}, parentId: ${_this.parentId}, type: ${_this.type}, imageUrl: ${_this.imageUrl})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

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
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactPiece&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,jaPronunciation,parentId,type,imageUrl);
}

@override
String toString() {
    return 'ArtifactPiece(id: $id, name: $name, jaPronunciation: $jaPronunciation, parentId: $parentId, type: $type, imageUrl: $imageUrl)';
}


}





/// @nodoc
mixin _$ArtifactSetBonus {

 String get type; LocalizedText get description;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactSetBonus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactSetBonus&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactSetBonus;
  return Object.hash(runtimeType,_this.type,_this.description);
}

@override
String toString() {
  final _this = this as ArtifactSetBonus;
  return 'ArtifactSetBonus(type: ${_this.type}, description: ${_this.description})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _ArtifactSetBonus implements ArtifactSetBonus {
  const _ArtifactSetBonus({required this.type, required this.description});
  factory _ArtifactSetBonus.fromJson(Map<String, dynamic> json) => _$ArtifactSetBonusFromJson(json);

@override final  String type;
@override final  LocalizedText description;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactSetBonus&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,description);
}

@override
String toString() {
    return 'ArtifactSetBonus(type: $type, description: $description)';
}


}





/// @nodoc
mixin _$ArtifactsMeta {

 Map<StatId, LocalizedText> get stats; Map<ArtifactPieceTypeId, ArtifactPieceType> get pieceTypes; List<StatId> get possibleSubStats; ArtifactTagCategoriesInternal get tags;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactsMeta;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactsMeta&&const DeepCollectionEquality().equals(other.stats, _this.stats)&&const DeepCollectionEquality().equals(other.pieceTypes, _this.pieceTypes)&&const DeepCollectionEquality().equals(other.possibleSubStats, _this.possibleSubStats)&&(identical(other.tags, _this.tags) || other.tags == _this.tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactsMeta;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.stats),const DeepCollectionEquality().hash(_this.pieceTypes),const DeepCollectionEquality().hash(_this.possibleSubStats),_this.tags);
}

@override
String toString() {
  final _this = this as ArtifactsMeta;
  return 'ArtifactsMeta(stats: ${_this.stats}, pieceTypes: ${_this.pieceTypes}, possibleSubStats: ${_this.possibleSubStats}, tags: ${_this.tags})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _ArtifactsMeta implements ArtifactsMeta {
  const _ArtifactsMeta({required  Map<StatId, LocalizedText> stats, required  Map<ArtifactPieceTypeId, ArtifactPieceType> pieceTypes, required  List<StatId> possibleSubStats, required this.tags}): _stats = stats,_pieceTypes = pieceTypes,_possibleSubStats = possibleSubStats;
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
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactsMeta&&const DeepCollectionEquality().equals(other.stats, _stats)&&const DeepCollectionEquality().equals(other.pieceTypes, _pieceTypes)&&const DeepCollectionEquality().equals(other.possibleSubStats, _possibleSubStats)&&(identical(other.tags, tags) || other.tags == tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_stats),const DeepCollectionEquality().hash(_pieceTypes),const DeepCollectionEquality().hash(_possibleSubStats),tags);
}

@override
String toString() {
    return 'ArtifactsMeta(stats: $stats, pieceTypes: $pieceTypes, possibleSubStats: $possibleSubStats, tags: $tags)';
}


}





/// @nodoc
mixin _$ArtifactPieceType {

 ArtifactPieceTypeId get id; LocalizedText get desc; List<StatId> get possibleMainStats;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactPieceType;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactPieceType&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.desc, _this.desc) || other.desc == _this.desc)&&const DeepCollectionEquality().equals(other.possibleMainStats, _this.possibleMainStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactPieceType;
  return Object.hash(runtimeType,_this.id,_this.desc,const DeepCollectionEquality().hash(_this.possibleMainStats));
}

@override
String toString() {
  final _this = this as ArtifactPieceType;
  return 'ArtifactPieceType(id: ${_this.id}, desc: ${_this.desc}, possibleMainStats: ${_this.possibleMainStats})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _ArtifactPieceType implements ArtifactPieceType {
  const _ArtifactPieceType({required this.id, required this.desc, required  List<StatId> possibleMainStats}): _possibleMainStats = possibleMainStats;
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
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactPieceType&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc)&&const DeepCollectionEquality().equals(other.possibleMainStats, _possibleMainStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,desc,const DeepCollectionEquality().hash(_possibleMainStats));
}

@override
String toString() {
    return 'ArtifactPieceType(id: $id, desc: $desc, possibleMainStats: $possibleMainStats)';
}


}





/// @nodoc
mixin _$ArtifactStat {

 StatId get id; LocalizedText get desc;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactStat;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactStat&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.desc, _this.desc) || other.desc == _this.desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactStat;
  return Object.hash(runtimeType,_this.id,_this.desc);
}

@override
String toString() {
  final _this = this as ArtifactStat;
  return 'ArtifactStat(id: ${_this.id}, desc: ${_this.desc})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _ArtifactStat implements ArtifactStat {
  const _ArtifactStat({required this.id, required this.desc});
  factory _ArtifactStat.fromJson(Map<String, dynamic> json) => _$ArtifactStatFromJson(json);

@override final  StatId id;
@override final  LocalizedText desc;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactStat&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,desc);
}

@override
String toString() {
    return 'ArtifactStat(id: $id, desc: $desc)';
}


}





/// @nodoc
mixin _$ArtifactTagCategoriesInternal {

 List<ArtifactTagCategory> get categories;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactTagCategoriesInternal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactTagCategoriesInternal&&const DeepCollectionEquality().equals(other.categories, _this.categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactTagCategoriesInternal;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.categories));
}

@override
String toString() {
  final _this = this as ArtifactTagCategoriesInternal;
  return 'ArtifactTagCategoriesInternal(categories: ${_this.categories})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _ArtifactTagCategoriesInternal implements ArtifactTagCategoriesInternal {
  const _ArtifactTagCategoriesInternal({required  List<ArtifactTagCategory> categories}): _categories = categories;
  factory _ArtifactTagCategoriesInternal.fromJson(Map<String, dynamic> json) => _$ArtifactTagCategoriesInternalFromJson(json);

 final  List<ArtifactTagCategory> _categories;
@override List<ArtifactTagCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactTagCategoriesInternal&&const DeepCollectionEquality().equals(other.categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));
}

@override
String toString() {
    return 'ArtifactTagCategoriesInternal(categories: $categories)';
}


}





/// @nodoc
mixin _$ArtifactTagCategory {

 LocalizedText get desc; List<ArtifactTag> get items;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactTagCategory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactTagCategory&&(identical(other.desc, _this.desc) || other.desc == _this.desc)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactTagCategory;
  return Object.hash(runtimeType,_this.desc,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as ArtifactTagCategory;
  return 'ArtifactTagCategory(desc: ${_this.desc}, items: ${_this.items})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _ArtifactTagCategory implements ArtifactTagCategory {
  const _ArtifactTagCategory({required this.desc, required  List<ArtifactTag> items}): _items = items;
  factory _ArtifactTagCategory.fromJson(Map<String, dynamic> json) => _$ArtifactTagCategoryFromJson(json);

@override final  LocalizedText desc;
 final  List<ArtifactTag> _items;
@override List<ArtifactTag> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactTagCategory&&(identical(other.desc, desc) || other.desc == desc)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,desc,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'ArtifactTagCategory(desc: $desc, items: $items)';
}


}





/// @nodoc
mixin _$ArtifactTag {

 String get id; LocalizedText get desc;



@override
bool operator ==(Object other) {
  final _this = this as ArtifactTag;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtifactTag&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.desc, _this.desc) || other.desc == _this.desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ArtifactTag;
  return Object.hash(runtimeType,_this.id,_this.desc);
}

@override
String toString() {
  final _this = this as ArtifactTag;
  return 'ArtifactTag(id: ${_this.id}, desc: ${_this.desc})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _ArtifactTag implements ArtifactTag {
  const _ArtifactTag({required this.id, required this.desc});
  factory _ArtifactTag.fromJson(Map<String, dynamic> json) => _$ArtifactTagFromJson(json);

@override final  String id;
@override final  LocalizedText desc;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtifactTag&&(identical(other.id, id) || other.id == id)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,desc);
}

@override
String toString() {
    return 'ArtifactTag(id: $id, desc: $desc)';
}


}




// dart format on
