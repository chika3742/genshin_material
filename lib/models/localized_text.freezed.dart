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
LocalizedText _$LocalizedTextFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'default':
          return TranslatableLocalizedText.fromJson(
            json
          );
                case 'untranslatable':
          return UntranslatableLocalizedText.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'LocalizedText',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$LocalizedText {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedText);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalizedText()';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class TranslatableLocalizedText extends LocalizedText {
  const TranslatableLocalizedText({required final  Map<String, String> locales, final  String? $type}): _locales = locales,$type = $type ?? 'default',super._();
  factory TranslatableLocalizedText.fromJson(Map<String, dynamic> json) => _$TranslatableLocalizedTextFromJson(json);

 final  Map<String, String> _locales;
 Map<String, String> get locales {
  if (_locales is EqualUnmodifiableMapView) return _locales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_locales);
}


@JsonKey(name: 'runtimeType')
final String $type;





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslatableLocalizedText&&const DeepCollectionEquality().equals(other._locales, _locales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_locales));

@override
String toString() {
  return 'LocalizedText(locales: $locales)';
}


}




/// @nodoc
@JsonSerializable(createToJson: false)

class UntranslatableLocalizedText extends LocalizedText {
  const UntranslatableLocalizedText({required this.text, final  String? $type}): $type = $type ?? 'untranslatable',super._();
  factory UntranslatableLocalizedText.fromJson(Map<String, dynamic> json) => _$UntranslatableLocalizedTextFromJson(json);

 final  String text;

@JsonKey(name: 'runtimeType')
final String $type;





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UntranslatableLocalizedText&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'LocalizedText.untranslatable(text: $text)';
}


}




// dart format on
