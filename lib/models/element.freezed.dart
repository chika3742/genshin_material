// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Element _$ElementFromJson(Map<String, dynamic> json) {
  return _Element.fromJson(json);
}

/// @nodoc
mixin _$Element {
  int get hyvId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  LocalizedText get text => throw _privateConstructorUsedError;

  /// Serializes this Element to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$ElementImpl extends _Element {
  const _$ElementImpl(
      {required this.hyvId, required this.imageUrl, required this.text})
      : super._();

  factory _$ElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElementImplFromJson(json);

  @override
  final int hyvId;
  @override
  final String imageUrl;
  @override
  final LocalizedText text;

  @override
  String toString() {
    return 'Element(hyvId: $hyvId, imageUrl: $imageUrl, text: $text)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ElementImplToJson(
      this,
    );
  }
}

abstract class _Element extends Element {
  const factory _Element(
      {required final int hyvId,
      required final String imageUrl,
      required final LocalizedText text}) = _$ElementImpl;
  const _Element._() : super._();

  factory _Element.fromJson(Map<String, dynamic> json) = _$ElementImpl.fromJson;

  @override
  int get hyvId;
  @override
  String get imageUrl;
  @override
  LocalizedText get text;
}
