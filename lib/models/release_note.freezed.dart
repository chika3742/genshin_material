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
}
