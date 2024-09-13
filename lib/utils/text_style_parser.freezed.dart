// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_style_parser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Fragment {
  FragmentType get type => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
}

/// @nodoc

class _$FragmentImpl implements _Fragment {
  const _$FragmentImpl({required this.type, required this.text});

  @override
  final FragmentType type;
  @override
  final String text;

  @override
  String toString() {
    return 'Fragment(type: $type, text: $text)';
  }
}

abstract class _Fragment implements Fragment {
  const factory _Fragment(
      {required final FragmentType type,
      required final String text}) = _$FragmentImpl;

  @override
  FragmentType get type;
  @override
  String get text;
}
