// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bookmark {
  int get id;
  BookmarkType get type;
  String get characterId;
  DateTime get createdAt;
  String get groupHash;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bookmark &&
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

  @override
  String toString() {
    return 'Bookmark(id: $id, type: $type, characterId: $characterId, createdAt: $createdAt, groupHash: $groupHash)';
  }
}

/// @nodoc

class _Bookmark implements Bookmark {
  const _Bookmark(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bookmark &&
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

  @override
  String toString() {
    return 'Bookmark(id: $id, type: $type, characterId: $characterId, createdAt: $createdAt, groupHash: $groupHash)';
  }
}

// dart format on
