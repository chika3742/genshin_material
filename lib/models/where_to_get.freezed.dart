// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'where_to_get.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WhereToGet _$WhereToGetFromJson(Map<String, dynamic> json) {
  return WhereToGetText.fromJson(json);
}

/// @nodoc
mixin _$WhereToGet {
  LocalizedText get text => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LocalizedText text) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LocalizedText text)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LocalizedText text)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WhereToGetText value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WhereToGetText value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WhereToGetText value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhereToGetCopyWith<WhereToGet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhereToGetCopyWith<$Res> {
  factory $WhereToGetCopyWith(
          WhereToGet value, $Res Function(WhereToGet) then) =
      _$WhereToGetCopyWithImpl<$Res, WhereToGet>;
  @useResult
  $Res call({LocalizedText text});

  $LocalizedTextCopyWith<$Res> get text;
}

/// @nodoc
class _$WhereToGetCopyWithImpl<$Res, $Val extends WhereToGet>
    implements $WhereToGetCopyWith<$Res> {
  _$WhereToGetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get text {
    return $LocalizedTextCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WhereToGetTextImplCopyWith<$Res>
    implements $WhereToGetCopyWith<$Res> {
  factory _$$WhereToGetTextImplCopyWith(_$WhereToGetTextImpl value,
          $Res Function(_$WhereToGetTextImpl) then) =
      __$$WhereToGetTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalizedText text});

  @override
  $LocalizedTextCopyWith<$Res> get text;
}

/// @nodoc
class __$$WhereToGetTextImplCopyWithImpl<$Res>
    extends _$WhereToGetCopyWithImpl<$Res, _$WhereToGetTextImpl>
    implements _$$WhereToGetTextImplCopyWith<$Res> {
  __$$WhereToGetTextImplCopyWithImpl(
      _$WhereToGetTextImpl _value, $Res Function(_$WhereToGetTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$WhereToGetTextImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WhereToGetTextImpl implements WhereToGetText {
  const _$WhereToGetTextImpl({required this.text});

  factory _$WhereToGetTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhereToGetTextImplFromJson(json);

  @override
  final LocalizedText text;

  @override
  String toString() {
    return 'WhereToGet.text(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhereToGetTextImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WhereToGetTextImplCopyWith<_$WhereToGetTextImpl> get copyWith =>
      __$$WhereToGetTextImplCopyWithImpl<_$WhereToGetTextImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LocalizedText text) text,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LocalizedText text)? text,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LocalizedText text)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WhereToGetText value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WhereToGetText value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WhereToGetText value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WhereToGetTextImplToJson(
      this,
    );
  }
}

abstract class WhereToGetText implements WhereToGet {
  const factory WhereToGetText({required final LocalizedText text}) =
      _$WhereToGetTextImpl;

  factory WhereToGetText.fromJson(Map<String, dynamic> json) =
      _$WhereToGetTextImpl.fromJson;

  @override
  LocalizedText get text;
  @override
  @JsonKey(ignore: true)
  _$$WhereToGetTextImplCopyWith<_$WhereToGetTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
