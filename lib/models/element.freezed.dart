// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Element {

 int get hyvId; String get imageUrl; LocalizedText get text;

  /// Serializes this Element to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Element&&(identical(other.hyvId, hyvId) || other.hyvId == hyvId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hyvId,imageUrl,text);

@override
String toString() {
  return 'Element(hyvId: $hyvId, imageUrl: $imageUrl, text: $text)';
}


}





/// @nodoc
@JsonSerializable()

class _Element extends Element {
  const _Element({required this.hyvId, required this.imageUrl, required this.text}): super._();
  factory _Element.fromJson(Map<String, dynamic> json) => _$ElementFromJson(json);

@override final  int hyvId;
@override final  String imageUrl;
@override final  LocalizedText text;


@override
Map<String, dynamic> toJson() {
  return _$ElementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Element&&(identical(other.hyvId, hyvId) || other.hyvId == hyvId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hyvId,imageUrl,text);

@override
String toString() {
  return 'Element(hyvId: $hyvId, imageUrl: $imageUrl, text: $text)';
}


}




// dart format on
