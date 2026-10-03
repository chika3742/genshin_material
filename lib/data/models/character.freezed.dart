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
CharacterAsset _$CharacterAssetFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'group':
          return _CharacterAssetGroup.fromJson(
            json
          );
                case 'variant':
          return _CharacterAssetVariant.fromJson(
            json
          );
        
          default:
            return _CharacterAssetDefault.fromJson(
  json
);
        }
      
}

/// @nodoc
mixin _$CharacterAsset {

 String get id; LocalizedText get name; String get jaPronunciation; String get smallImageUrl; int get rarity; WeaponType get weaponType; MaterialDefinitions get materials;



@override
bool operator ==(Object other) {
  final _this = this as CharacterAsset;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterAsset&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.jaPronunciation, _this.jaPronunciation) || other.jaPronunciation == _this.jaPronunciation)&&(identical(other.smallImageUrl, _this.smallImageUrl) || other.smallImageUrl == _this.smallImageUrl)&&(identical(other.rarity, _this.rarity) || other.rarity == _this.rarity)&&(identical(other.weaponType, _this.weaponType) || other.weaponType == _this.weaponType)&&const DeepCollectionEquality().equals(other.materials, _this.materials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CharacterAsset;
  return Object.hash(runtimeType,_this.id,_this.name,_this.jaPronunciation,_this.smallImageUrl,_this.rarity,_this.weaponType,const DeepCollectionEquality().hash(_this.materials));
}

@override
String toString() {
  final _this = this as CharacterAsset;
  return 'CharacterAsset(id: ${_this.id}, name: ${_this.name}, jaPronunciation: ${_this.jaPronunciation}, smallImageUrl: ${_this.smallImageUrl}, rarity: ${_this.rarity}, weaponType: ${_this.weaponType}, materials: ${_this.materials})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _CharacterAssetDefault extends CharacterAsset {
  const _CharacterAssetDefault({required this.id, this.disableSync = false, required  List<int> hyvIds, required this.name, required this.jaPronunciation, required this.imageUrl, required this.smallImageUrl, required this.rarity, required this.weaponType, required this.element, required  Talents talents, required  MaterialDefinitions materials,  String? $type}): _hyvIds = hyvIds,_talents = talents,_materials = materials,$type = $type ?? 'default',super._();
  factory _CharacterAssetDefault.fromJson(Map<String, dynamic> json) => _$CharacterAssetDefaultFromJson(json);

@override final  String id;
@JsonKey() final  bool disableSync;
 final  List<int> _hyvIds;
 List<int> get hyvIds {
  if (_hyvIds is EqualUnmodifiableListView) return _hyvIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hyvIds);
}

@override final  LocalizedText name;
@override final  String jaPronunciation;
 final  String imageUrl;
@override final  String smallImageUrl;
@override final  int rarity;
@override final  WeaponType weaponType;
 final  TeyvatElement element;
 final  Talents _talents;
 Talents get talents {
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


@JsonKey(name: 'runtimeType')
final String $type;





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterAssetDefault&&(identical(other.id, id) || other.id == id)&&(identical(other.disableSync, disableSync) || other.disableSync == disableSync)&&const DeepCollectionEquality().equals(other.hyvIds, _hyvIds)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.smallImageUrl, smallImageUrl) || other.smallImageUrl == smallImageUrl)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.weaponType, weaponType) || other.weaponType == weaponType)&&(identical(other.element, element) || other.element == element)&&const DeepCollectionEquality().equals(other.talents, _talents)&&const DeepCollectionEquality().equals(other.materials, _materials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,disableSync,const DeepCollectionEquality().hash(_hyvIds),name,jaPronunciation,imageUrl,smallImageUrl,rarity,weaponType,element,const DeepCollectionEquality().hash(_talents),const DeepCollectionEquality().hash(_materials));
}

@override
String toString() {
    return 'CharacterAsset(id: $id, disableSync: $disableSync, hyvIds: $hyvIds, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, element: $element, talents: $talents, materials: $materials)';
}


}




/// @nodoc
@JsonSerializable(createToJson: false)

class _CharacterAssetGroup extends CharacterAsset {
  const _CharacterAssetGroup({required this.id, required  List<int> hyvIds, required this.name, required this.jaPronunciation, required this.imageUrl, required this.smallImageUrl, required this.rarity, required this.weaponType, required  List<String> variantIds, required  MaterialDefinitions materials,  String? $type}): _hyvIds = hyvIds,_variantIds = variantIds,_materials = materials,$type = $type ?? 'group',super._();
  factory _CharacterAssetGroup.fromJson(Map<String, dynamic> json) => _$CharacterAssetGroupFromJson(json);

@override final  String id;
 final  List<int> _hyvIds;
 List<int> get hyvIds {
  if (_hyvIds is EqualUnmodifiableListView) return _hyvIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hyvIds);
}

@override final  LocalizedText name;
@override final  String jaPronunciation;
 final  String imageUrl;
@override final  String smallImageUrl;
@override final  int rarity;
@override final  WeaponType weaponType;
 final  List<String> _variantIds;
 List<String> get variantIds {
  if (_variantIds is EqualUnmodifiableListView) return _variantIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variantIds);
}

 final  MaterialDefinitions _materials;
@override MaterialDefinitions get materials {
  if (_materials is EqualUnmodifiableMapView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_materials);
}


@JsonKey(name: 'runtimeType')
final String $type;





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterAssetGroup&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.hyvIds, _hyvIds)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.smallImageUrl, smallImageUrl) || other.smallImageUrl == smallImageUrl)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.weaponType, weaponType) || other.weaponType == weaponType)&&const DeepCollectionEquality().equals(other.variantIds, _variantIds)&&const DeepCollectionEquality().equals(other.materials, _materials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_hyvIds),name,jaPronunciation,imageUrl,smallImageUrl,rarity,weaponType,const DeepCollectionEquality().hash(_variantIds),const DeepCollectionEquality().hash(_materials));
}

@override
String toString() {
    return 'CharacterAsset.group(id: $id, hyvIds: $hyvIds, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, variantIds: $variantIds, materials: $materials)';
}


}




/// @nodoc
@JsonSerializable(createToJson: false)

class _CharacterAssetVariant extends CharacterAsset {
  const _CharacterAssetVariant({required this.id, this.disableSync = false, required this.parentId, required this.name, required this.jaPronunciation, required this.smallImageUrl, required this.rarity, required this.element, required this.weaponType, required  Talents talents, required  MaterialDefinitions materials,  String? $type}): _talents = talents,_materials = materials,$type = $type ?? 'variant',super._();
  factory _CharacterAssetVariant.fromJson(Map<String, dynamic> json) => _$CharacterAssetVariantFromJson(json);

@override final  String id;
@JsonKey() final  bool disableSync;
 final  String parentId;
@override final  LocalizedText name;
@override final  String jaPronunciation;
@override final  String smallImageUrl;
@override final  int rarity;
 final  TeyvatElement element;
@override final  WeaponType weaponType;
 final  Talents _talents;
 Talents get talents {
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


@JsonKey(name: 'runtimeType')
final String $type;





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterAssetVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.disableSync, disableSync) || other.disableSync == disableSync)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.smallImageUrl, smallImageUrl) || other.smallImageUrl == smallImageUrl)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.element, element) || other.element == element)&&(identical(other.weaponType, weaponType) || other.weaponType == weaponType)&&const DeepCollectionEquality().equals(other.talents, _talents)&&const DeepCollectionEquality().equals(other.materials, _materials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,disableSync,parentId,name,jaPronunciation,smallImageUrl,rarity,element,weaponType,const DeepCollectionEquality().hash(_talents),const DeepCollectionEquality().hash(_materials));
}

@override
String toString() {
    return 'CharacterAsset.variant(id: $id, disableSync: $disableSync, parentId: $parentId, name: $name, jaPronunciation: $jaPronunciation, smallImageUrl: $smallImageUrl, rarity: $rarity, element: $element, weaponType: $weaponType, talents: $talents, materials: $materials)';
}


}




// dart format on
