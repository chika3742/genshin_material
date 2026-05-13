import "package:collection/collection.dart";
import "package:drift/drift.dart" show Value;
import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "../database.dart";
import "../utils/hash.dart";
import "common.dart";
import "level_range_values.dart";

part "bookmark.freezed.dart";

class MaterialBookmarkInsertable {
  final CharacterId characterId;
  final WeaponId? weaponId;
  final MaterialId? materialId;
  final int quantity;
  final int upperLevel;
  final Purpose purposeType;

  MaterialBookmarkInsertable({
    required this.characterId,
    required this.weaponId,
    required this.materialId,
    required this.quantity,
    required this.upperLevel,
    required this.purposeType,
  });

  String? _groupHash;
  String get groupHash => _groupHash ??= generateBookmarkGroupHash(
    characterId: characterId,
    type: BookmarkType.material,
    purposeType: purposeType,
    weaponId: weaponId,
  );

  String get hash => combineMaterialBookmarkElements(
    characterId,
    purposeType,
    weaponId,
    materialId,
    upperLevel,
  );

  BookmarkMaterialGroupCompanion toGroupCompanion(String orderIndex) {
    return BookmarkMaterialGroupCompanion.insert(
      groupHash: groupHash,
      characterId: characterId,
      weaponId: Value.absentIfNull(weaponId),
      purposeType: purposeType,
      orderIndex: orderIndex,
    );
  }

  BookmarkMaterialItemCompanion toItemCompanion() {
    return BookmarkMaterialItemCompanion.insert(
      hash: hash,
      groupHash: groupHash,
      materialId: Value.absentIfNull(materialId),
      quantity: quantity,
      upperLevel: upperLevel,
    );
  }
}

class ArtifactSetBookmarkInsertable {
  final CharacterId characterId;
  final List<ArtifactSetId> sets;
  final Map<ArtifactPieceTypeId, StatId?> mainStats;
  final List<StatId> subStats;

  ArtifactSetBookmarkInsertable({
    required this.characterId,
    required this.sets,
    required this.mainStats,
    required this.subStats,
  });

  BookmarkArtifactCompanion toArtifactCompanion(String orderIndex) {
    return BookmarkArtifactCompanion.insert(
      characterId: characterId,
      subStats: subStats,
      orderIndex: orderIndex,
    );
  }

  BookmarkArtifactSetCompanion toSetCompanion(int id) {
    return BookmarkArtifactSetCompanion.insert(
      id: Value(id),
      sets: sets,
      mainStats: mainStats,
    );
  }
}

class ArtifactPieceBookmarkInsertable {
  final CharacterId characterId;
  final ArtifactPieceId piece;
  final StatId? mainStat;
  final List<StatId> subStats;

  ArtifactPieceBookmarkInsertable({
    required this.characterId,
    required this.piece,
    required this.mainStat,
    required this.subStats,
  });

  BookmarkArtifactCompanion toArtifactCompanion(String orderIndex) {
    return BookmarkArtifactCompanion.insert(
      characterId: characterId,
      subStats: subStats,
      orderIndex: orderIndex,
    );
  }

  BookmarkArtifactPieceCompanion toPieceCompanion(int id) {
    return BookmarkArtifactPieceCompanion.insert(
      id: Value(id),
      piece: piece,
      mainStat: Value.absentIfNull(mainStat),
    );
  }
}

@freezed
sealed class BookmarkWithDetails with _$BookmarkWithDetails {
  const factory BookmarkWithDetails.material({
    required BookmarkMaterialGroup group,
    required BookmarkMaterialItem item,
  }) = BookmarkWithMaterialDetails;

  const factory BookmarkWithDetails.artifactSet({
    required BookmarkArtifact artifact,
    required BookmarkArtifactSet artifactSet,
  }) = BookmarkWithArtifactSetDetails;

  const factory BookmarkWithDetails.artifactPiece({
    required BookmarkArtifact artifact,
    required BookmarkArtifactPiece artifactPiece,
  }) = BookmarkWithArtifactPieceDetails;
}

@freezed
sealed class BookmarkGroup with _$BookmarkGroup {
  const BookmarkGroup._();

  const factory BookmarkGroup({
    required String hash,
    required BookmarkType type,
    required String characterId,
    required String orderIndex,
    LevelRangeValues? levelRange,
    required List<BookmarkWithDetails> bookmarks,
  }) = _BookmarkGroup;

  factory BookmarkGroup.fromBookmarks(List<BookmarkWithDetails> bookmarks, AssetData assetData) {
    assert(bookmarks.isNotEmpty);

    LevelRangeValues? levelRange;
    final sample = bookmarks.first;

    late final String hash;
    late final BookmarkType type;
    late final String characterId;

    if (sample is BookmarkWithMaterialDetails) {
      hash = sample.group.groupHash;
      type = BookmarkType.material;
      characterId = sample.group.characterId;
      final levels = bookmarks.cast<BookmarkWithMaterialDetails>()
          .sorted((a, b) => a.item.upperLevel - b.item.upperLevel);
      final ingredients = switch (sample.group.weaponId) {
        null => assetData.characterIngredients.getLevels(
          rarity: assetData.characters[sample.group.characterId]!.rarity,
          purpose: sample.group.purposeType,
        ),
        _ => assetData.weaponIngredients.getLevels(
          rarity: assetData.weapons[sample.group.weaponId]!.rarity,
          purpose: sample.group.purposeType,
        ),
      };
      final levelTicks = ingredients.levels.keys.toList();
      final upperLevelIndex = levelTicks.indexOf(levels.first.item.upperLevel);
      levelRange = LevelRangeValues(
        upperLevelIndex >= 1 ? levelTicks[upperLevelIndex - 1] : 1,
        levels.last.item.upperLevel,
      );
    } else if (sample is BookmarkWithArtifactSetDetails) {
      hash = sample.artifact.id.toString();
      type = BookmarkType.artifactSet;
      characterId = sample.artifact.characterId;
    } else if (sample is BookmarkWithArtifactPieceDetails) {
      hash = sample.artifact.id.toString();
      type = BookmarkType.artifactPiece;
      characterId = sample.artifact.characterId;
    } else {
      throw StateError("Unknown bookmark type: $sample");
    }

    return BookmarkGroup(
      hash: hash,
      type: type,
      characterId: characterId,
      levelRange: levelRange,
      bookmarks: bookmarks,
      orderIndex: switch (sample) {
        BookmarkWithMaterialDetails(group: BookmarkMaterialGroup(:final orderIndex)) => orderIndex,
        BookmarkWithArtifactSetDetails(artifact: BookmarkArtifact(:final orderIndex))
          || BookmarkWithArtifactPieceDetails(artifact: BookmarkArtifact(:final orderIndex)) => orderIndex,
      },
    );
  }

  BookmarkWithArtifactSetDetails asArtifactSet() {
    return bookmarks.first as BookmarkWithArtifactSetDetails;
  }

  BookmarkWithArtifactPieceDetails asArtifactPiece() {
    return bookmarks.first as BookmarkWithArtifactPieceDetails;
  }
}
