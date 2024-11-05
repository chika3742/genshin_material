// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookmarkWithDetails {
  Bookmark get metadata => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkWithMaterialDetailsImpl implements BookmarkWithMaterialDetails {
  const _$BookmarkWithMaterialDetailsImpl(
      {required this.metadata, required this.materialDetails});

  @override
  final Bookmark metadata;
  @override
  final BookmarkMaterialDetails materialDetails;

  @override
  String toString() {
    return 'BookmarkWithDetails.material(metadata: $metadata, materialDetails: $materialDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkWithMaterialDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.materialDetails, materialDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(materialDetails));
}

abstract class BookmarkWithMaterialDetails implements BookmarkWithDetails {
  const factory BookmarkWithMaterialDetails(
          {required final Bookmark metadata,
          required final BookmarkMaterialDetails materialDetails}) =
      _$BookmarkWithMaterialDetailsImpl;

  @override
  Bookmark get metadata;
  BookmarkMaterialDetails get materialDetails;
}

/// @nodoc

class _$BookmarkWithArtifactSetDetailsImpl
    implements BookmarkWithArtifactSetDetails {
  const _$BookmarkWithArtifactSetDetailsImpl(
      {required this.metadata, required this.artifactSetDetails});

  @override
  final Bookmark metadata;
  @override
  final BookmarkArtifactSetDetails artifactSetDetails;

  @override
  String toString() {
    return 'BookmarkWithDetails.artifactSet(metadata: $metadata, artifactSetDetails: $artifactSetDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkWithArtifactSetDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.artifactSetDetails, artifactSetDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(artifactSetDetails));
}

abstract class BookmarkWithArtifactSetDetails implements BookmarkWithDetails {
  const factory BookmarkWithArtifactSetDetails(
          {required final Bookmark metadata,
          required final BookmarkArtifactSetDetails artifactSetDetails}) =
      _$BookmarkWithArtifactSetDetailsImpl;

  @override
  Bookmark get metadata;
  BookmarkArtifactSetDetails get artifactSetDetails;
}

/// @nodoc

class _$BookmarkWithArtifactPieceDetailsImpl
    implements BookmarkWithArtifactPieceDetails {
  const _$BookmarkWithArtifactPieceDetailsImpl(
      {required this.metadata, required this.artifactPieceDetails});

  @override
  final Bookmark metadata;
  @override
  final BookmarkArtifactPieceDetails artifactPieceDetails;

  @override
  String toString() {
    return 'BookmarkWithDetails.artifactPiece(metadata: $metadata, artifactPieceDetails: $artifactPieceDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkWithArtifactPieceDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.artifactPieceDetails, artifactPieceDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(artifactPieceDetails));
}

abstract class BookmarkWithArtifactPieceDetails implements BookmarkWithDetails {
  const factory BookmarkWithArtifactPieceDetails(
          {required final Bookmark metadata,
          required final BookmarkArtifactPieceDetails artifactPieceDetails}) =
      _$BookmarkWithArtifactPieceDetailsImpl;

  @override
  Bookmark get metadata;
  BookmarkArtifactPieceDetails get artifactPieceDetails;
}

/// @nodoc
mixin _$BookmarkGroup {
  String get hash => throw _privateConstructorUsedError;
  BookmarkType get type => throw _privateConstructorUsedError;
  String get characterId => throw _privateConstructorUsedError;
  LevelRangeValues? get levelRange => throw _privateConstructorUsedError;
  List<BookmarkWithDetails> get bookmarks => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkGroupImpl extends _BookmarkGroup {
  const _$BookmarkGroupImpl(
      {required this.hash,
      required this.type,
      required this.characterId,
      this.levelRange,
      required final List<BookmarkWithDetails> bookmarks})
      : _bookmarks = bookmarks,
        super._();

  @override
  final String hash;
  @override
  final BookmarkType type;
  @override
  final String characterId;
  @override
  final LevelRangeValues? levelRange;
  final List<BookmarkWithDetails> _bookmarks;
  @override
  List<BookmarkWithDetails> get bookmarks {
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

  @override
  String toString() {
    return 'BookmarkGroup(hash: $hash, type: $type, characterId: $characterId, levelRange: $levelRange, bookmarks: $bookmarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkGroupImpl &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.levelRange, levelRange) ||
                other.levelRange == levelRange) &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash, type, characterId,
      levelRange, const DeepCollectionEquality().hash(_bookmarks));
}

abstract class _BookmarkGroup extends BookmarkGroup {
  const factory _BookmarkGroup(
          {required final String hash,
          required final BookmarkType type,
          required final String characterId,
          final LevelRangeValues? levelRange,
          required final List<BookmarkWithDetails> bookmarks}) =
      _$BookmarkGroupImpl;
  const _BookmarkGroup._() : super._();

  @override
  String get hash;
  @override
  BookmarkType get type;
  @override
  String get characterId;
  @override
  LevelRangeValues? get levelRange;
  @override
  List<BookmarkWithDetails> get bookmarks;
}
