// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localized_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalizedText {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedText);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalizedText()';
}


}





/// @nodoc


class TranslatableLocalizedText extends LocalizedText {
  const TranslatableLocalizedText({required final  Map<String, String> locales}): _locales = locales,super._();
  

 final  Map<String, String> _locales;
 Map<String, String> get locales {
  if (_locales is EqualUnmodifiableMapView) return _locales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_locales);
}





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslatableLocalizedText&&const DeepCollectionEquality().equals(other._locales, _locales));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_locales));

@override
String toString() {
  return 'LocalizedText(locales: $locales)';
}


}




/// @nodoc


class UntranslatableLocalizedText extends LocalizedText {
  const UntranslatableLocalizedText({required this.text}): super._();
  

 final  String text;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UntranslatableLocalizedText&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'LocalizedText.untranslatable(text: $text)';
}


}




// dart format on
