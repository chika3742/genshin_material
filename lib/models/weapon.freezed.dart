// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Weapon {

 String get id; bool get disableSync; int get hyvId; LocalizedText get name; String get jaPronunciation; String get imageUrl; int get rarity; WeaponSubStat? get subStat; LocalizedText? get weaponAffixDesc; WeaponType get type; Map<MaterialUsageType, String>? get materials; LocalizedText? get levelingDescription; ItemSource? get source;



@override
bool operator ==(Object other) {
  final _this = this as Weapon;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Weapon&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.disableSync, _this.disableSync) || other.disableSync == _this.disableSync)&&(identical(other.hyvId, _this.hyvId) || other.hyvId == _this.hyvId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.jaPronunciation, _this.jaPronunciation) || other.jaPronunciation == _this.jaPronunciation)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.rarity, _this.rarity) || other.rarity == _this.rarity)&&(identical(other.subStat, _this.subStat) || other.subStat == _this.subStat)&&(identical(other.weaponAffixDesc, _this.weaponAffixDesc) || other.weaponAffixDesc == _this.weaponAffixDesc)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.materials, _this.materials)&&(identical(other.levelingDescription, _this.levelingDescription) || other.levelingDescription == _this.levelingDescription)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Weapon;
  return Object.hash(runtimeType,_this.id,_this.disableSync,_this.hyvId,_this.name,_this.jaPronunciation,_this.imageUrl,_this.rarity,_this.subStat,_this.weaponAffixDesc,_this.type,const DeepCollectionEquality().hash(_this.materials),_this.levelingDescription,_this.source);
}

@override
String toString() {
  final _this = this as Weapon;
  return 'Weapon(id: ${_this.id}, disableSync: ${_this.disableSync}, hyvId: ${_this.hyvId}, name: ${_this.name}, jaPronunciation: ${_this.jaPronunciation}, imageUrl: ${_this.imageUrl}, rarity: ${_this.rarity}, subStat: ${_this.subStat}, weaponAffixDesc: ${_this.weaponAffixDesc}, type: ${_this.type}, materials: ${_this.materials}, levelingDescription: ${_this.levelingDescription}, source: ${_this.source})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _Weapon extends Weapon {
  const _Weapon({required this.id, this.disableSync = false, required this.hyvId, required this.name, required this.jaPronunciation, required this.imageUrl, required this.rarity, required this.subStat, required this.weaponAffixDesc, required this.type,  Map<MaterialUsageType, String>? materials, this.levelingDescription, this.source}): _materials = materials,super._();
  factory _Weapon.fromJson(Map<String, dynamic> json) => _$WeaponFromJson(json);

@override final  String id;
@override@JsonKey() final  bool disableSync;
@override final  int hyvId;
@override final  LocalizedText name;
@override final  String jaPronunciation;
@override final  String imageUrl;
@override final  int rarity;
@override final  WeaponSubStat? subStat;
@override final  LocalizedText? weaponAffixDesc;
@override final  WeaponType type;
 final  Map<MaterialUsageType, String>? _materials;
@override Map<MaterialUsageType, String>? get materials {
  final value = _materials;
  if (value == null) return null;
  if (_materials is EqualUnmodifiableMapView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  LocalizedText? levelingDescription;
@override final  ItemSource? source;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Weapon&&(identical(other.id, id) || other.id == id)&&(identical(other.disableSync, disableSync) || other.disableSync == disableSync)&&(identical(other.hyvId, hyvId) || other.hyvId == hyvId)&&(identical(other.name, name) || other.name == name)&&(identical(other.jaPronunciation, jaPronunciation) || other.jaPronunciation == jaPronunciation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.subStat, subStat) || other.subStat == subStat)&&(identical(other.weaponAffixDesc, weaponAffixDesc) || other.weaponAffixDesc == weaponAffixDesc)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.materials, _materials)&&(identical(other.levelingDescription, levelingDescription) || other.levelingDescription == levelingDescription)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,disableSync,hyvId,name,jaPronunciation,imageUrl,rarity,subStat,weaponAffixDesc,type,const DeepCollectionEquality().hash(_materials),levelingDescription,source);
}

@override
String toString() {
    return 'Weapon(id: $id, disableSync: $disableSync, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, rarity: $rarity, subStat: $subStat, weaponAffixDesc: $weaponAffixDesc, type: $type, materials: $materials, levelingDescription: $levelingDescription, source: $source)';
}


}





/// @nodoc
mixin _$WeaponsMeta {

 Map<WeaponSubStat, LocalizedText> get subStats; Map<WeaponType, WeaponTypeInfo> get types;



@override
bool operator ==(Object other) {
  final _this = this as WeaponsMeta;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeaponsMeta&&const DeepCollectionEquality().equals(other.subStats, _this.subStats)&&const DeepCollectionEquality().equals(other.types, _this.types));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeaponsMeta;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.subStats),const DeepCollectionEquality().hash(_this.types));
}

@override
String toString() {
  final _this = this as WeaponsMeta;
  return 'WeaponsMeta(subStats: ${_this.subStats}, types: ${_this.types})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _WeaponsMeta implements WeaponsMeta {
  const _WeaponsMeta({required  Map<WeaponSubStat, LocalizedText> subStats, required  Map<WeaponType, WeaponTypeInfo> types}): _subStats = subStats,_types = types;
  factory _WeaponsMeta.fromJson(Map<String, dynamic> json) => _$WeaponsMetaFromJson(json);

 final  Map<WeaponSubStat, LocalizedText> _subStats;
@override Map<WeaponSubStat, LocalizedText> get subStats {
  if (_subStats is EqualUnmodifiableMapView) return _subStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_subStats);
}

 final  Map<WeaponType, WeaponTypeInfo> _types;
@override Map<WeaponType, WeaponTypeInfo> get types {
  if (_types is EqualUnmodifiableMapView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_types);
}





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeaponsMeta&&const DeepCollectionEquality().equals(other.subStats, _subStats)&&const DeepCollectionEquality().equals(other.types, _types));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_subStats),const DeepCollectionEquality().hash(_types));
}

@override
String toString() {
    return 'WeaponsMeta(subStats: $subStats, types: $types)';
}


}





/// @nodoc
mixin _$WeaponTypeInfo {

 int get hyvId; LocalizedText get name;



@override
bool operator ==(Object other) {
  final _this = this as WeaponTypeInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeaponTypeInfo&&(identical(other.hyvId, _this.hyvId) || other.hyvId == _this.hyvId)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeaponTypeInfo;
  return Object.hash(runtimeType,_this.hyvId,_this.name);
}

@override
String toString() {
  final _this = this as WeaponTypeInfo;
  return 'WeaponTypeInfo(hyvId: ${_this.hyvId}, name: ${_this.name})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _WeaponTypeInfo implements WeaponTypeInfo {
  const _WeaponTypeInfo({required this.hyvId, required this.name});
  factory _WeaponTypeInfo.fromJson(Map<String, dynamic> json) => _$WeaponTypeInfoFromJson(json);

@override final  int hyvId;
@override final  LocalizedText name;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeaponTypeInfo&&(identical(other.hyvId, hyvId) || other.hyvId == hyvId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,hyvId,name);
}

@override
String toString() {
    return 'WeaponTypeInfo(hyvId: $hyvId, name: $name)';
}


}




// dart format on
