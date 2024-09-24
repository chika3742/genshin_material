import "package:collection/collection.dart";
import "package:drift/drift.dart" show Value, Insertable, Expression;
import "package:freezed_annotation/freezed_annotation.dart";

import "../components/level_slider.dart";
import "../core/asset_cache.dart";
import "../database.dart";
import "common.dart";

part "bookmark.freezed.dart";

@freezed
sealed class BookmarkWithDetails with _$BookmarkWithDetails {
  const factory BookmarkWithDetails.material({
    required Bookmark metadata,
    required BookmarkMaterialDetails materialDetails,
  }) = BookmarkWithMaterialDetails;

  const factory BookmarkWithDetails.artifactSet({
    required Bookmark metadata,
    required BookmarkArtifactSetDetails artifactSetDetails,
  }) = BookmarkWithArtifactSetDetails;

  const factory BookmarkWithDetails.artifactPiece({
    required Bookmark metadata,
    required BookmarkArtifactPieceDetails artifactPieceDetails,
  }) = BookmarkWithArtifactPieceDetails;
}

/// Workaround for the issue the type of common properties in union type becomes InvalidType in generated code
@Freezed(copyWith: true)
class BookmarkCompanionWorkaround with _$BookmarkCompanionWorkaround implements Insertable<Bookmark> {
  const BookmarkCompanionWorkaround._();

  const factory BookmarkCompanionWorkaround({
    required String characterId,
    required BookmarkType type,
    required String groupHash,
  }) = _BookmarkCompanionWorkaround;

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return BookmarkCompanion.insert(
      characterId: characterId,
      type: type,
      groupHash: groupHash,
    ).toColumns(nullToAbsent);
  }
}

@freezed
class BookmarkMaterialDetailsCompanionWithoutParent with _$BookmarkMaterialDetailsCompanionWithoutParent {
  const BookmarkMaterialDetailsCompanionWithoutParent._();

  const factory BookmarkMaterialDetailsCompanionWithoutParent({
    @Default(Value.absent()) Value<String?> weaponId,
    @Default(Value.absent()) Value<String?> materialId,
    required int quantity,
    required int upperLevel,
    required Purpose purposeType,
    required String hash,
  }) = _BookmarkMaterialDetailsCompanionWithoutParent;

  BookmarkMaterialDetailsCompanion withParentId(int parentId) {
    return BookmarkMaterialDetailsCompanion.insert(
      parentId: parentId,
      weaponId: weaponId,
      materialId: materialId,
      quantity: quantity,
      upperLevel: upperLevel,
      purposeType: purposeType,
      hash: hash,
    );
  }
}

@freezed
class BookmarkArtifactSetDetailsCompanionWithoutParent with _$BookmarkArtifactSetDetailsCompanionWithoutParent {
  const BookmarkArtifactSetDetailsCompanionWithoutParent._();

  const factory BookmarkArtifactSetDetailsCompanionWithoutParent({
    required List<ArtifactSetId> sets,
    required Map<ArtifactPieceTypeId, StatId?> mainStats,
    required List<StatId> subStats,
  }) = _BookmarkArtifactSetDetailsCompanionWithoutParent;

  BookmarkArtifactSetDetailsCompanion withParentId(int parentId) {
    return BookmarkArtifactSetDetailsCompanion.insert(
      parentId: parentId,
      sets: sets,
      mainStats: mainStats,
      subStats: subStats,
    );
  }
}

@freezed
class BookmarkArtifactPieceDetailsCompanionWithoutParent with _$BookmarkArtifactPieceDetailsCompanionWithoutParent {
  const BookmarkArtifactPieceDetailsCompanionWithoutParent._();

  const factory BookmarkArtifactPieceDetailsCompanionWithoutParent({
    required ArtifactPieceId piece,
    @Default(Value.absent()) Value<StatId?> mainStat,
    required List<StatId> subStats,
  }) = _BookmarkArtifactPieceDetailsCompanionWithoutParent;

  BookmarkArtifactPieceDetailsCompanion withParentId(int parentId) {
    return BookmarkArtifactPieceDetailsCompanion.insert(
      parentId: parentId,
      piece: piece,
      mainStat: mainStat,
      subStats: subStats,
    );
  }
}

@freezed
sealed class BookmarkCompanionWithDetails with _$BookmarkCompanionWithDetails {
  const factory BookmarkCompanionWithDetails.material({
    required final BookmarkCompanionWorkaround metadata,
    required final BookmarkMaterialDetailsCompanionWithoutParent materialDetails,
  }) = BookmarkCompanionWithMaterialDetails;

  const factory BookmarkCompanionWithDetails.artifactSet({
    required final BookmarkCompanionWorkaround metadata,
    required final BookmarkArtifactSetDetailsCompanionWithoutParent artifactSetDetails,
  }) = BookmarkCompanionWithArtifactSetDetails;

  const factory BookmarkCompanionWithDetails.artifactPiece({
    required final BookmarkCompanionWorkaround metadata,
    required final BookmarkArtifactPieceDetailsCompanionWithoutParent artifactPieceDetails,
  }) = BookmarkCompanionWithArtifactPieceDetails;
}

@freezed
class BookmarkGroup with _$BookmarkGroup {
  const BookmarkGroup._();

  const factory BookmarkGroup({
    required String hash,
    required BookmarkType type,
    required String characterId,
    LevelRangeValues? levelRange,
    required List<BookmarkWithDetails> bookmarks,
  }) = _BookmarkGroup;

  factory BookmarkGroup.fromBookmarks(List<BookmarkWithDetails> bookmarks, AssetData assetData) {
    assert(bookmarks.isNotEmpty);
    assert(bookmarks.every((e) => e.metadata.groupHash == bookmarks.first.metadata.groupHash), "All bookmarks should have the same group hash");

    LevelRangeValues? levelRange;
    if (bookmarks.first.metadata.type == BookmarkType.material) {
      final levels = bookmarks.cast<BookmarkWithMaterialDetails>()
          .sorted((a, b) => a.materialDetails.upperLevel - b.materialDetails.upperLevel);
      final levelTicks = assetData.characterIngredients.purposes[levels.first.materialDetails.purposeType]!.levels.keys.toList();
      levelRange = LevelRangeValues(
        levelTicks.indexOf(levels.first.materialDetails.upperLevel) >= 1 ? levelTicks[levelTicks.indexOf(levels.first.materialDetails.upperLevel) - 1] : 1,
        levels.last.materialDetails.upperLevel,
      );
    }

    return BookmarkGroup(
      hash: bookmarks.first.metadata.groupHash,
      type: bookmarks.first.metadata.type,
      characterId: bookmarks.first.metadata.characterId,
      levelRange: levelRange,
      bookmarks: bookmarks,
    );
  }

  BookmarkWithArtifactSetDetails asArtifactSet() {
    return bookmarks.first as BookmarkWithArtifactSetDetails;
  }

  BookmarkWithArtifactPieceDetails asArtifactPiece() {
    return bookmarks.first as BookmarkWithArtifactPieceDetails;
  }
}
