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

 Map<String, String> get locales;

  /// Serializes this LocalizedText to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedText&&const DeepCollectionEquality().equals(other.locales, locales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(locales));

@override
String toString() {
  return 'LocalizedText(locales: $locales)';
}


}





/// @nodoc
@JsonSerializable()

class _LocalizedText extends LocalizedText {
  const _LocalizedText({required final  Map<String, String> locales}): _locales = locales,super._();
  factory _LocalizedText.fromJson(Map<String, dynamic> json) => _$LocalizedTextFromJson(json);

 final  Map<String, String> _locales;
@override Map<String, String> get locales {
  if (_locales is EqualUnmodifiableMapView) return _locales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_locales);
}



@override
Map<String, dynamic> toJson() {
  return _$LocalizedTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizedText&&const DeepCollectionEquality().equals(other._locales, _locales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_locales));

@override
String toString() {
  return 'LocalizedText(locales: $locales)';
}


}




// dart format on
