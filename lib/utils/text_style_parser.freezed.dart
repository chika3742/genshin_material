// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_style_parser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Fragment {

 FragmentType get type; String get text;



@override
bool operator ==(Object other) {
  final _this = this as Fragment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fragment&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.text, _this.text) || other.text == _this.text));
}


@override
int get hashCode {
  final _this = this as Fragment;
  return Object.hash(runtimeType,_this.type,_this.text);
}

@override
String toString() {
  final _this = this as Fragment;
  return 'Fragment(type: ${_this.type}, text: ${_this.text})';
}


}





/// @nodoc


class _Fragment implements Fragment {
  const _Fragment({required this.type, required this.text});
  

@override final  FragmentType type;
@override final  String text;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fragment&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,type,text);
}

@override
String toString() {
    return 'Fragment(type: $type, text: $text)';
}


}




// dart format on
