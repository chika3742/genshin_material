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

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ElementCopyWith<Element> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementCopyWith<$Res> {
  factory $ElementCopyWith(Element value, $Res Function(Element) then) =
      _$ElementCopyWithImpl<$Res, Element>;
  @useResult
  $Res call({int hyvId, String imageUrl, LocalizedText text});

  $LocalizedTextCopyWith<$Res> get text;
}

/// @nodoc
class _$ElementCopyWithImpl<$Res, $Val extends Element>
    implements $ElementCopyWith<$Res> {
  _$ElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hyvId = null,
    Object? imageUrl = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      hyvId: null == hyvId
          ? _value.hyvId
          : hyvId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ) as $Val);
  }

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get text {
    return $LocalizedTextCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ElementImplCopyWith<$Res> implements $ElementCopyWith<$Res> {
  factory _$$ElementImplCopyWith(
          _$ElementImpl value, $Res Function(_$ElementImpl) then) =
      __$$ElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hyvId, String imageUrl, LocalizedText text});

  @override
  $LocalizedTextCopyWith<$Res> get text;
}

/// @nodoc
class __$$ElementImplCopyWithImpl<$Res>
    extends _$ElementCopyWithImpl<$Res, _$ElementImpl>
    implements _$$ElementImplCopyWith<$Res> {
  __$$ElementImplCopyWithImpl(
      _$ElementImpl _value, $Res Function(_$ElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hyvId = null,
    Object? imageUrl = null,
    Object? text = null,
  }) {
    return _then(_$ElementImpl(
      hyvId: null == hyvId
          ? _value.hyvId
          : hyvId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementImpl &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hyvId, imageUrl, text);

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ElementImplCopyWith<_$ElementImpl> get copyWith =>
      __$$ElementImplCopyWithImpl<_$ElementImpl>(this, _$identity);

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

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ElementImplCopyWith<_$ElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
