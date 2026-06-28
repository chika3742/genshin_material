// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerData {

 String get text; String get actionText; String get actionUrl;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerData&&(identical(other.text, text) || other.text == text)&&(identical(other.actionText, actionText) || other.actionText == actionText)&&(identical(other.actionUrl, actionUrl) || other.actionUrl == actionUrl));
}


@override
int get hashCode => Object.hash(runtimeType,text,actionText,actionUrl);

@override
String toString() {
  return 'BannerData(text: $text, actionText: $actionText, actionUrl: $actionUrl)';
}


}





/// @nodoc


class _BannerData implements BannerData {
  const _BannerData({required this.text, required this.actionText, required this.actionUrl});
  

@override final  String text;
@override final  String actionText;
@override final  String actionUrl;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerData&&(identical(other.text, text) || other.text == text)&&(identical(other.actionText, actionText) || other.actionText == actionText)&&(identical(other.actionUrl, actionUrl) || other.actionUrl == actionUrl));
}


@override
int get hashCode => Object.hash(runtimeType,text,actionText,actionUrl);

@override
String toString() {
  return 'BannerData(text: $text, actionText: $actionText, actionUrl: $actionUrl)';
}


}




// dart format on
