// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localized_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalizedText _$LocalizedTextFromJson(Map<String, dynamic> json) {
  return _LocalizedText.fromJson(json);
}

/// @nodoc
mixin _$LocalizedText {
  Map<String, String> get locales => throw _privateConstructorUsedError;

  /// Serializes this LocalizedText to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$LocalizedTextImpl extends _LocalizedText {
  const _$LocalizedTextImpl({required final Map<String, String> locales})
      : _locales = locales,
        super._();

  factory _$LocalizedTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizedTextImplFromJson(json);

  final Map<String, String> _locales;
  @override
  Map<String, String> get locales {
    if (_locales is EqualUnmodifiableMapView) return _locales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_locales);
  }

  @override
  String toString() {
    return 'LocalizedText(locales: $locales)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizedTextImplToJson(
      this,
    );
  }
}

abstract class _LocalizedText extends LocalizedText {
  const factory _LocalizedText({required final Map<String, String> locales}) =
      _$LocalizedTextImpl;
  const _LocalizedText._() : super._();

  factory _LocalizedText.fromJson(Map<String, dynamic> json) =
      _$LocalizedTextImpl.fromJson;

  @override
  Map<String, String> get locales;
}
