// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkWithDetails {
  Bookmark get metadata;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkWithDetails &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata);

  @override
  String toString() {
    return 'BookmarkWithDetails(metadata: $metadata)';
  }
}

/// @nodoc

class BookmarkWithMaterialDetails implements BookmarkWithDetails {
  const BookmarkWithMaterialDetails(
      {required this.metadata, required this.materialDetails});

  @override
  final Bookmark metadata;
  final BookmarkMaterialDetails materialDetails;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkWithMaterialDetails &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.materialDetails, materialDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(materialDetails));

  @override
  String toString() {
    return 'BookmarkWithDetails.material(metadata: $metadata, materialDetails: $materialDetails)';
  }
}

/// @nodoc

class BookmarkWithArtifactSetDetails implements BookmarkWithDetails {
  const BookmarkWithArtifactSetDetails(
      {required this.metadata, required this.artifactSetDetails});

  @override
  final Bookmark metadata;
  final BookmarkArtifactSetDetails artifactSetDetails;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkWithArtifactSetDetails &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.artifactSetDetails, artifactSetDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(artifactSetDetails));

  @override
  String toString() {
    return 'BookmarkWithDetails.artifactSet(metadata: $metadata, artifactSetDetails: $artifactSetDetails)';
  }
}

/// @nodoc

class BookmarkWithArtifactPieceDetails implements BookmarkWithDetails {
  const BookmarkWithArtifactPieceDetails(
      {required this.metadata, required this.artifactPieceDetails});

  @override
  final Bookmark metadata;
  final BookmarkArtifactPieceDetails artifactPieceDetails;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkWithArtifactPieceDetails &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.artifactPieceDetails, artifactPieceDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(artifactPieceDetails));

  @override
  String toString() {
    return 'BookmarkWithDetails.artifactPiece(metadata: $metadata, artifactPieceDetails: $artifactPieceDetails)';
  }
}

/// @nodoc
mixin _$BookmarkGroup {
  String get hash;
  BookmarkType get type;
  String get characterId;
  LevelRangeValues? get levelRange;
  List<BookmarkWithDetails> get bookmarks;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkGroup &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.levelRange, levelRange) ||
                other.levelRange == levelRange) &&
            const DeepCollectionEquality().equals(other.bookmarks, bookmarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash, type, characterId,
      levelRange, const DeepCollectionEquality().hash(bookmarks));

  @override
  String toString() {
    return 'BookmarkGroup(hash: $hash, type: $type, characterId: $characterId, levelRange: $levelRange, bookmarks: $bookmarks)';
  }
}

/// @nodoc

class _BookmarkGroup extends BookmarkGroup {
  const _BookmarkGroup(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookmarkGroup &&
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

  @override
  String toString() {
    return 'BookmarkGroup(hash: $hash, type: $type, characterId: $characterId, levelRange: $levelRange, bookmarks: $bookmarks)';
  }
}

// dart format on
