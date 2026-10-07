// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Character {

 CharacterId get id; List<int> get hyvIds; LocalizedText get name; List<CharacterVariant> get variants; String get jaPronunciation; String get imageUrl; String get smallImageUrl; int get rarity; WeaponType get weaponType; MaterialDefinitions get materials;



@override
bool operator ==(Object other) {
  final _this = this as Character;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Character&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.hyvIds, _this.hyvIds)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.variants, _this.variants)&&(identical(other.jaPronunciation, _this.jaPronunciation) || other.jaPronunciation == _this.jaPronunciation)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.smallImageUrl, _this.smallImageUrl) || other.smallImageUrl == _this.smallImageUrl)&&(identical(other.rarity, _this.rarity) || other.rarity == _this.rarity)&&(identical(other.weaponType, _this.weaponType) || other.weaponType == _this.weaponType)&&const DeepCollectionEquality().equals(other.materials, _this.materials));
}


@override
int get hashCode {
  final _this = this as Character;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.hyvIds),_this.name,const DeepCollectionEquality().hash(_this.variants),_this.jaPronunciation,_this.imageUrl,_this.smallImageUrl,_this.rarity,_this.weaponType,const DeepCollectionEquality().hash(_this.materials));
}

@override
String toString() {
  final _this = this as Character;
  return 'Character(id: ${_this.id}, hyvIds: ${_this.hyvIds}, name: ${_this.name}, variants: ${_this.variants}, jaPronunciation: ${_this.jaPronunciation}, imageUrl: ${_this.imageUrl}, smallImageUrl: ${_this.smallImageUrl}, rarity: ${_this.rarity}, weaponType: ${_this.weaponType}, materials: ${_this.materials})';
}


}





/// @nodoc


class _Character extends Character {
   _Character({required this.id, required  List<int> hyvIds, required this.name, required  List<CharacterVariant> variants, required this.jaPronunciation, required this.imageUrl, required this.smallImageUrl, required this.rarity, required this.weaponType, required  MaterialDefinitions materials}): assert(variants.isNotEmpty, 'A character must have at least one variant'),_hyvIds = hyvIds,_variants = variants,_materials = materials,super._();
  

@override final  CharacterId id;
 final  List<int> _hyvIds;
@override List<int> get hyvIds {
  if (_hyvIds is EqualUnmodifiableListView) return _hyvIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hyvIds);
}

@override final  LocalizedText name;
 final  List<CharacterVariant> _variants;
@override List<CharacterVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override final  String jaPronunciation;
@override final  String imageUrl;
@override final  String smallImageUrl;
@override final  int rarity;
@override final  WeaponType weaponType;
 final  MaterialDefinitions _materials;
@override MaterialDefinitions get materials {
  if (_materials is EqualUnmodifiableMapView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_materials);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Character&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.hyvIds, _hyvIds)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.variants, _variants)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.smallImageUrl, smallImageUrl) || other.smallImageUrl == smallImageUrl)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.weaponType, weaponType) || other.weaponType == weaponType)&&const DeepCollectionEquality().equals(other.materials, _materials));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_hyvIds),name,const DeepCollectionEquality().hash(_variants),jaPronunciation,imageUrl,smallImageUrl,rarity,weaponType,const DeepCollectionEquality().hash(_materials));
}

@override
String toString() {
    return 'Character(id: $id, hyvIds: $hyvIds, name: $name, variants: $variants, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, materials: $materials)';
}


}




/// @nodoc
mixin _$CharacterVariant {

 VariantId get id; CharacterId get characterId; bool get disableSync; LocalizedText get name; String get jaPronunciation; String get smallImageUrl; int get rarity; WeaponType get weaponType; TeyvatElement get element; Talents get talents; MaterialDefinitions get materials;



@override
bool operator ==(Object other) {
  final _this = this as CharacterVariant;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterVariant&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.characterId, _this.characterId) || other.characterId == _this.characterId)&&(identical(other.disableSync, _this.disableSync) || other.disableSync == _this.disableSync)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.jaPronunciation, _this.jaPronunciation) || other.jaPronunciation == _this.jaPronunciation)&&(identical(other.smallImageUrl, _this.smallImageUrl) || other.smallImageUrl == _this.smallImageUrl)&&(identical(other.rarity, _this.rarity) || other.rarity == _this.rarity)&&(identical(other.weaponType, _this.weaponType) || other.weaponType == _this.weaponType)&&(identical(other.element, _this.element) || other.element == _this.element)&&const DeepCollectionEquality().equals(other.talents, _this.talents)&&const DeepCollectionEquality().equals(other.materials, _this.materials));
}


@override
int get hashCode {
  final _this = this as CharacterVariant;
  return Object.hash(runtimeType,_this.id,_this.characterId,_this.disableSync,_this.name,_this.jaPronunciation,_this.smallImageUrl,_this.rarity,_this.weaponType,_this.element,const DeepCollectionEquality().hash(_this.talents),const DeepCollectionEquality().hash(_this.materials));
}

@override
String toString() {
  final _this = this as CharacterVariant;
  return 'CharacterVariant(id: ${_this.id}, characterId: ${_this.characterId}, disableSync: ${_this.disableSync}, name: ${_this.name}, jaPronunciation: ${_this.jaPronunciation}, smallImageUrl: ${_this.smallImageUrl}, rarity: ${_this.rarity}, weaponType: ${_this.weaponType}, element: ${_this.element}, talents: ${_this.talents}, materials: ${_this.materials})';
}


}





/// @nodoc


class _CharacterVariant extends CharacterVariant {
  const _CharacterVariant({required this.id, required this.characterId, required this.disableSync, required this.name, required this.jaPronunciation, required this.smallImageUrl, required this.rarity, required this.weaponType, required this.element, required  Talents talents, required  MaterialDefinitions materials}): _talents = talents,_materials = materials,super._();
  

@override final  VariantId id;
@override final  CharacterId characterId;
@override final  bool disableSync;
@override final  LocalizedText name;
@override final  String jaPronunciation;
@override final  String smallImageUrl;
@override final  int rarity;
@override final  WeaponType weaponType;
@override final  TeyvatElement element;
 final  Talents _talents;
@override Talents get talents {
  if (_talents is EqualUnmodifiableMapView) return _talents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_talents);
}

 final  MaterialDefinitions _materials;
@override MaterialDefinitions get materials {
  if (_materials is EqualUnmodifiableMapView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_materials);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.disableSync, disableSync) || other.disableSync == disableSync)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.smallImageUrl, smallImageUrl) || other.smallImageUrl == smallImageUrl)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.weaponType, weaponType) || other.weaponType == weaponType)&&(identical(other.element, element) || other.element == element)&&const DeepCollectionEquality().equals(other.talents, _talents)&&const DeepCollectionEquality().equals(other.materials, _materials));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,characterId,disableSync,name,jaPronunciation,smallImageUrl,rarity,weaponType,element,const DeepCollectionEquality().hash(_talents),const DeepCollectionEquality().hash(_materials));
}

@override
String toString() {
    return 'CharacterVariant(id: $id, characterId: $characterId, disableSync: $disableSync, name: $name, jaPronunciation: $jaPronunciation, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, element: $element, talents: $talents, materials: $materials)';
}


}





/// @nodoc
mixin _$CharacterTalent {

 List<int> get idList; LocalizedText get name;



@override
bool operator ==(Object other) {
  final _this = this as CharacterTalent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterTalent&&const DeepCollectionEquality().equals(other.idList, _this.idList)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CharacterTalent;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.idList),_this.name);
}

@override
String toString() {
  final _this = this as CharacterTalent;
  return 'CharacterTalent(idList: ${_this.idList}, name: ${_this.name})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _CharacterTalent implements CharacterTalent {
  const _CharacterTalent({required  List<int> idList, required this.name}): _idList = idList;
  factory _CharacterTalent.fromJson(Map<String, dynamic> json) => _$CharacterTalentFromJson(json);

 final  List<int> _idList;
@override List<int> get idList {
  if (_idList is EqualUnmodifiableListView) return _idList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_idList);
}

@override final  LocalizedText name;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterTalent&&const DeepCollectionEquality().equals(other.idList, _idList)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_idList),name);
}

@override
String toString() {
    return 'CharacterTalent(idList: $idList, name: $name)';
}


}




// dart format on
