// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReleaseNote _$ReleaseNoteFromJson(Map<String, dynamic> json) {
  return _ReleaseNote.fromJson(json);
}

/// @nodoc
mixin _$ReleaseNote {
  String get releasedOn => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;

  /// Serializes this ReleaseNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReleaseNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReleaseNoteCopyWith<ReleaseNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseNoteCopyWith<$Res> {
  factory $ReleaseNoteCopyWith(
          ReleaseNote value, $Res Function(ReleaseNote) then) =
      _$ReleaseNoteCopyWithImpl<$Res, ReleaseNote>;
  @useResult
  $Res call({String releasedOn, String version, String contents});
}

/// @nodoc
class _$ReleaseNoteCopyWithImpl<$Res, $Val extends ReleaseNote>
    implements $ReleaseNoteCopyWith<$Res> {
  _$ReleaseNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReleaseNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releasedOn = null,
    Object? version = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      releasedOn: null == releasedOn
          ? _value.releasedOn
          : releasedOn // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReleaseNoteImplCopyWith<$Res>
    implements $ReleaseNoteCopyWith<$Res> {
  factory _$$ReleaseNoteImplCopyWith(
          _$ReleaseNoteImpl value, $Res Function(_$ReleaseNoteImpl) then) =
      __$$ReleaseNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String releasedOn, String version, String contents});
}

/// @nodoc
class __$$ReleaseNoteImplCopyWithImpl<$Res>
    extends _$ReleaseNoteCopyWithImpl<$Res, _$ReleaseNoteImpl>
    implements _$$ReleaseNoteImplCopyWith<$Res> {
  __$$ReleaseNoteImplCopyWithImpl(
      _$ReleaseNoteImpl _value, $Res Function(_$ReleaseNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReleaseNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releasedOn = null,
    Object? version = null,
    Object? contents = null,
  }) {
    return _then(_$ReleaseNoteImpl(
      releasedOn: null == releasedOn
          ? _value.releasedOn
          : releasedOn // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReleaseNoteImpl implements _ReleaseNote {
  const _$ReleaseNoteImpl(
      {required this.releasedOn,
      required this.version,
      required this.contents});

  factory _$ReleaseNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReleaseNoteImplFromJson(json);

  @override
  final String releasedOn;
  @override
  final String version;
  @override
  final String contents;

  @override
  String toString() {
    return 'ReleaseNote(releasedOn: $releasedOn, version: $version, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReleaseNoteImpl &&
            (identical(other.releasedOn, releasedOn) ||
                other.releasedOn == releasedOn) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, releasedOn, version, contents);

  /// Create a copy of ReleaseNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReleaseNoteImplCopyWith<_$ReleaseNoteImpl> get copyWith =>
      __$$ReleaseNoteImplCopyWithImpl<_$ReleaseNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReleaseNoteImplToJson(
      this,
    );
  }
}

abstract class _ReleaseNote implements ReleaseNote {
  const factory _ReleaseNote(
      {required final String releasedOn,
      required final String version,
      required final String contents}) = _$ReleaseNoteImpl;

  factory _ReleaseNote.fromJson(Map<String, dynamic> json) =
      _$ReleaseNoteImpl.fromJson;

  @override
  String get releasedOn;
  @override
  String get version;
  @override
  String get contents;

  /// Create a copy of ReleaseNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReleaseNoteImplCopyWith<_$ReleaseNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
