// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Element {

 int get hyvId; String get imageUrl; LocalizedText get text;



@override
bool operator ==(Object other) {
  final _this = this as Element;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Element&&(identical(other.hyvId, _this.hyvId) || other.hyvId == _this.hyvId)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.text, _this.text) || other.text == _this.text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Element;
  return Object.hash(runtimeType,_this.hyvId,_this.imageUrl,_this.text);
}

@override
String toString() {
  final _this = this as Element;
  return 'Element(hyvId: ${_this.hyvId}, imageUrl: ${_this.imageUrl}, text: ${_this.text})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class _Element extends Element {
  const _Element({required this.hyvId, required this.imageUrl, required this.text}): super._();
  factory _Element.fromJson(Map<String, dynamic> json) => _$ElementFromJson(json);

@override final  int hyvId;
@override final  String imageUrl;
@override final  LocalizedText text;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Element&&(identical(other.hyvId, hyvId) || other.hyvId == hyvId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,hyvId,imageUrl,text);
}

@override
String toString() {
    return 'Element(hyvId: $hyvId, imageUrl: $imageUrl, text: $text)';
}


}




// dart format on
