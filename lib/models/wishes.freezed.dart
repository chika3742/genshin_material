// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishesMeta {

 String get userAgent; List<GachaType> get gachaTypes;

  /// Serializes this WishesMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishesMeta&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&const DeepCollectionEquality().equals(other.gachaTypes, gachaTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userAgent,const DeepCollectionEquality().hash(gachaTypes));

@override
String toString() {
  return 'WishesMeta(userAgent: $userAgent, gachaTypes: $gachaTypes)';
}


}





/// @nodoc
@JsonSerializable()

class _WishesMeta implements WishesMeta {
  const _WishesMeta({required this.userAgent, required final  List<GachaType> gachaTypes}): _gachaTypes = gachaTypes;
  factory _WishesMeta.fromJson(Map<String, dynamic> json) => _$WishesMetaFromJson(json);

@override final  String userAgent;
 final  List<GachaType> _gachaTypes;
@override List<GachaType> get gachaTypes {
  if (_gachaTypes is EqualUnmodifiableListView) return _gachaTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gachaTypes);
}



@override
Map<String, dynamic> toJson() {
  return _$WishesMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishesMeta&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&const DeepCollectionEquality().equals(other._gachaTypes, _gachaTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userAgent,const DeepCollectionEquality().hash(_gachaTypes));

@override
String toString() {
  return 'WishesMeta(userAgent: $userAgent, gachaTypes: $gachaTypes)';
}


}





/// @nodoc
mixin _$GachaType {

 String get id; LocalizedText get title;

  /// Serializes this GachaType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GachaType&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'GachaType(id: $id, title: $title)';
}


}





/// @nodoc
@JsonSerializable()

class _GachaType implements GachaType {
  const _GachaType({required this.id, required this.title});
  factory _GachaType.fromJson(Map<String, dynamic> json) => _$GachaTypeFromJson(json);

@override final  String id;
@override final  LocalizedText title;


@override
Map<String, dynamic> toJson() {
  return _$GachaTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GachaType&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'GachaType(id: $id, title: $title)';
}


}




// dart format on
