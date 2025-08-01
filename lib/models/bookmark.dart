import "package:collection/collection.dart";
import "package:drift/drift.dart" show Value;
import "package:freezed_annotation/freezed_annotation.dart";
import "package:uuid/uuid.dart";

import "../components/level_slider.dart";
import "../core/asset_cache.dart";
import "../database.dart";
import "../utils/hash.dart";
import "common.dart";

part "bookmark.freezed.dart";

sealed class BookmarkInsertable<T> {
  final int? metadataId;
  final CharacterId characterId;

  BookmarkInsertable({this.metadataId, required this.characterId});

  String? _groupHash;
  String get groupHash => _groupHash ??= _groupHashInit();

  String _groupHashInit();

  BookmarkCompanion toMetadata();

  T toDetails({required int parentId});
}

class MaterialBookmarkInsertable extends BookmarkInsertable<BookmarkMaterialDetailsCompanion> {
  final WeaponId? weaponId;
  final MaterialId? materialId;
  final int quantity;
  final int upperLevel;
  final Purpose purposeType;

  MaterialBookmarkInsertable({
    super.metadataId,
    required super.characterId,
    required this.weaponId,
    required this.materialId,
    required this.quantity,
    required this.upperLevel,
    required this.purposeType,
  });

  @override
  String _groupHashInit() {
    return generateBookmarkGroupHash(
      characterId: characterId,
      type: BookmarkType.material,
      purposeType: purposeType,
      weaponId: weaponId,
    );
  }

  @override
  BookmarkCompanion toMetadata() {
    return BookmarkCompanion.insert(
      id: Value.absentIfNull(metadataId),
      characterId: characterId,
      type: BookmarkType.material,
      groupHash: groupHash,
    );
  }

  @override
  BookmarkMaterialDetailsCompanion toDetails({required int parentId}) {
    return BookmarkMaterialDetailsCompanion.insert(
      parentId: parentId,
      weaponId: Value.absentIfNull(weaponId),
      materialId: Value.absentIfNull(materialId),
      quantity: quantity,
      upperLevel: upperLevel,
      purposeType: purposeType,
      hash: hash,
    );
  }

  String get hash => combineMaterialBookmarkElements(
    characterId,
    purposeType,
    weaponId,
    materialId,
    upperLevel,
  );
}

class ArtifactSetBookmarkInsertable extends BookmarkInsertable<BookmarkArtifactSetDetailsCompanion> {
  final List<ArtifactSetId> sets;
  final Map<ArtifactPieceTypeId, StatId?> mainStats;
  final List<StatId> subStats;

  ArtifactSetBookmarkInsertable({
    required super.characterId,
    required this.sets,
    required this.mainStats,
    required this.subStats,
  });

  @override
  String _groupHashInit() {
    return const Uuid().v4(); // Random hash because artifact bookmarks don't have a group
  }

  @override
  BookmarkCompanion toMetadata() {
    return BookmarkCompanion.insert(
      characterId: characterId,
      type: BookmarkType.artifactSet,
      groupHash: groupHash,
    );
  }

  @override
  BookmarkArtifactSetDetailsCompanion toDetails({required int parentId}) {
    return BookmarkArtifactSetDetailsCompanion.insert(
      parentId: parentId,
      sets: sets,
      mainStats: mainStats,
      subStats: subStats,
    );
  }
}

class ArtifactPieceBookmarkInsertable extends BookmarkInsertable<BookmarkArtifactPieceDetailsCompanion> {
  final ArtifactPieceId piece;
  final StatId? mainStat;
  final List<StatId> subStats;

  ArtifactPieceBookmarkInsertable({
    required super.characterId,
    required this.piece,
    required this.mainStat,
    required this.subStats,
  });

  @override
  String _groupHashInit() {
    return const Uuid().v4(); // Random hash because artifact bookmarks don't have a group
  }

  @override
  BookmarkCompanion toMetadata() {
    return BookmarkCompanion.insert(
      characterId: characterId,
      type: BookmarkType.artifactPiece,
      groupHash: groupHash,
    );
  }

  @override
  BookmarkArtifactPieceDetailsCompanion toDetails({required int parentId}) {
    return BookmarkArtifactPieceDetailsCompanion.insert(
      parentId: parentId,
      piece: piece,
      mainStat: Value.absentIfNull(mainStat),
      subStats: subStats,
    );
  }
}

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

@freezed
sealed class BookmarkGroup with _$BookmarkGroup {
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
    final sample = bookmarks.first;
    if (sample is BookmarkWithMaterialDetails) {
      final levels = bookmarks.cast<BookmarkWithMaterialDetails>()
          .sorted((a, b) => a.materialDetails.upperLevel - b.materialDetails.upperLevel);
      final ingredients = switch(sample.materialDetails.weaponId) {
        null => assetData.characterIngredients.getLevels(
          rarity: assetData.characters[bookmarks.first.metadata.characterId]!.rarity,
          purpose: sample.materialDetails.purposeType,
        ),
        _ => assetData.weaponIngredients.getLevels(
          rarity: assetData.weapons[sample.materialDetails.weaponId]!.rarity,
          purpose: sample.materialDetails.purposeType,
        ),
      };
      final levelTicks = ingredients.levels.keys.toList();
      final upperLevelIndex = levelTicks.indexOf(levels.first.materialDetails.upperLevel);
      levelRange = LevelRangeValues(
        upperLevelIndex >= 1 ? levelTicks[upperLevelIndex - 1] : 1,
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
