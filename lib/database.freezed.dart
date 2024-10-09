// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Bookmark {
  int get id => throw _privateConstructorUsedError;
  BookmarkType get type => throw _privateConstructorUsedError;
  String get characterId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get groupHash => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkImpl implements _Bookmark {
  const _$BookmarkImpl(
      {required this.id,
      required this.type,
      required this.characterId,
      required this.createdAt,
      required this.groupHash});

  @override
  final int id;
  @override
  final BookmarkType type;
  @override
  final String characterId;
  @override
  final DateTime createdAt;
  @override
  final String groupHash;

  @override
  String toString() {
    return 'Bookmark(id: $id, type: $type, characterId: $characterId, createdAt: $createdAt, groupHash: $groupHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.groupHash, groupHash) ||
                other.groupHash == groupHash));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, characterId, createdAt, groupHash);
}

abstract class _Bookmark implements Bookmark {
  const factory _Bookmark(
      {required final int id,
      required final BookmarkType type,
      required final String characterId,
      required final DateTime createdAt,
      required final String groupHash}) = _$BookmarkImpl;

  @override
  int get id;
  @override
  BookmarkType get type;
  @override
  String get characterId;
  @override
  DateTime get createdAt;
  @override
  String get groupHash;
}
