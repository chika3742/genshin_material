// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'furnishing_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Furnishing {

 String get id; int get hyvId; LocalizedText get name; String get jaPronunciation; String get imageUrl; ItemSource? get source;



@override
bool operator ==(Object other) {
  final _this = this as Furnishing;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Furnishing&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.hyvId, _this.hyvId) || other.hyvId == _this.hyvId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.jaPronunciation, _this.jaPronunciation) || other.jaPronunciation == _this.jaPronunciation)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Furnishing;
  return Object.hash(runtimeType,_this.id,_this.hyvId,_this.name,_this.jaPronunciation,_this.imageUrl,_this.source);
}

@override
String toString() {
  final _this = this as Furnishing;
  return 'Furnishing(id: ${_this.id}, hyvId: ${_this.hyvId}, name: ${_this.name}, jaPronunciation: ${_this.jaPronunciation}, imageUrl: ${_this.imageUrl}, source: ${_this.source})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _Furnishing extends Furnishing {
  const _Furnishing({required this.id, required this.hyvId, required this.name, required this.jaPronunciation, required this.imageUrl, this.source}): super._();
  factory _Furnishing.fromJson(Map<String, dynamic> json) => _$FurnishingFromJson(json);

@override final  String id;
@override final  int hyvId;
@override final  LocalizedText name;
@override final  String jaPronunciation;
@override final  String imageUrl;
@override final  ItemSource? source;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Furnishing&&(identical(other.id, id) || other.id == id)&&(identical(other.hyvId, hyvId) || other.hyvId == hyvId)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,hyvId,name,jaPronunciation,imageUrl,source);
}

@override
String toString() {
    return 'Furnishing(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, source: $source)';
}


}





/// @nodoc
mixin _$FurnishingSetMeta {

 Map<FurnishingSetTypeId, LocalizedText> get setTypes;



@override
bool operator ==(Object other) {
  final _this = this as FurnishingSetMeta;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FurnishingSetMeta&&const DeepCollectionEquality().equals(other.setTypes, _this.setTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FurnishingSetMeta;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.setTypes));
}

@override
String toString() {
  final _this = this as FurnishingSetMeta;
  return 'FurnishingSetMeta(setTypes: ${_this.setTypes})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _FurnishingSetMeta implements FurnishingSetMeta {
  const _FurnishingSetMeta({required  Map<FurnishingSetTypeId, LocalizedText> setTypes}): _setTypes = setTypes;
  factory _FurnishingSetMeta.fromJson(Map<String, dynamic> json) => _$FurnishingSetMetaFromJson(json);

 final  Map<FurnishingSetTypeId, LocalizedText> _setTypes;
@override Map<FurnishingSetTypeId, LocalizedText> get setTypes {
  if (_setTypes is EqualUnmodifiableMapView) return _setTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_setTypes);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FurnishingSetMeta&&const DeepCollectionEquality().equals(other.setTypes, _setTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_setTypes));
}

@override
String toString() {
    return 'FurnishingSetMeta(setTypes: $setTypes)';
}


}





/// @nodoc
mixin _$FurnishingSetComponent {

 String get furnishingId; int get quantity;

  /// Serializes this FurnishingSetComponent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FurnishingSetComponent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FurnishingSetComponent&&(identical(other.furnishingId, _this.furnishingId) || other.furnishingId == _this.furnishingId)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FurnishingSetComponent;
  return Object.hash(runtimeType,_this.furnishingId,_this.quantity);
}

@override
String toString() {
  final _this = this as FurnishingSetComponent;
  return 'FurnishingSetComponent(furnishingId: ${_this.furnishingId}, quantity: ${_this.quantity})';
}


}





/// @nodoc
@JsonSerializable()

class _FurnishingSetComponent implements FurnishingSetComponent {
  const _FurnishingSetComponent({required this.furnishingId, required this.quantity});
  factory _FurnishingSetComponent.fromJson(Map<String, dynamic> json) => _$FurnishingSetComponentFromJson(json);

@override final  String furnishingId;
@override final  int quantity;


@override
Map<String, dynamic> toJson() {
  return _$FurnishingSetComponentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FurnishingSetComponent&&(identical(other.furnishingId, furnishingId) || other.furnishingId == furnishingId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,furnishingId,quantity);
}

@override
String toString() {
    return 'FurnishingSetComponent(furnishingId: $furnishingId, quantity: $quantity)';
}


}





/// @nodoc
mixin _$FurnishingSet {

 String get id; int get hyvId; LocalizedText get name; String get jaPronunciation; String get imageUrl; String get type; List<int> get favoriteCharacterHyvIds; List<FurnishingSetComponent> get consistsOf;



@override
bool operator ==(Object other) {
  final _this = this as FurnishingSet;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FurnishingSet&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.hyvId, _this.hyvId) || other.hyvId == _this.hyvId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.jaPronunciation, _this.jaPronunciation) || other.jaPronunciation == _this.jaPronunciation)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.favoriteCharacterHyvIds, _this.favoriteCharacterHyvIds)&&const DeepCollectionEquality().equals(other.consistsOf, _this.consistsOf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FurnishingSet;
  return Object.hash(runtimeType,_this.id,_this.hyvId,_this.name,_this.jaPronunciation,_this.imageUrl,_this.type,const DeepCollectionEquality().hash(_this.favoriteCharacterHyvIds),const DeepCollectionEquality().hash(_this.consistsOf));
}

@override
String toString() {
  final _this = this as FurnishingSet;
  return 'FurnishingSet(id: ${_this.id}, hyvId: ${_this.hyvId}, name: ${_this.name}, jaPronunciation: ${_this.jaPronunciation}, imageUrl: ${_this.imageUrl}, type: ${_this.type}, favoriteCharacterHyvIds: ${_this.favoriteCharacterHyvIds}, consistsOf: ${_this.consistsOf})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _FurnishingSet extends FurnishingSet {
  const _FurnishingSet({required this.id, required this.hyvId, required this.name, required this.jaPronunciation, required this.imageUrl, required this.type, required  List<int> favoriteCharacterHyvIds, required  List<FurnishingSetComponent> consistsOf}): _favoriteCharacterHyvIds = favoriteCharacterHyvIds,_consistsOf = consistsOf,super._();
  factory _FurnishingSet.fromJson(Map<String, dynamic> json) => _$FurnishingSetFromJson(json);

@override final  String id;
@override final  int hyvId;
@override final  LocalizedText name;
@override final  String jaPronunciation;
@override final  String imageUrl;
@override final  String type;
 final  List<int> _favoriteCharacterHyvIds;
@override List<int> get favoriteCharacterHyvIds {
  if (_favoriteCharacterHyvIds is EqualUnmodifiableListView) return _favoriteCharacterHyvIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteCharacterHyvIds);
}

 final  List<FurnishingSetComponent> _consistsOf;
@override List<FurnishingSetComponent> get consistsOf {
  if (_consistsOf is EqualUnmodifiableListView) return _consistsOf;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consistsOf);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FurnishingSet&&(identical(other.id, id) || other.id == id)&&(identical(other.hyvId, hyvId) || other.hyvId == hyvId)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.favoriteCharacterHyvIds, _favoriteCharacterHyvIds)&&const DeepCollectionEquality().equals(other.consistsOf, _consistsOf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,hyvId,name,jaPronunciation,imageUrl,type,const DeepCollectionEquality().hash(_favoriteCharacterHyvIds),const DeepCollectionEquality().hash(_consistsOf));
}

@override
String toString() {
    return 'FurnishingSet(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, type: $type, favoriteCharacterHyvIds: $favoriteCharacterHyvIds, consistsOf: $consistsOf)';
}


}




// dart format on
