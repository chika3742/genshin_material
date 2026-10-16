import "package:collection/collection.dart";
import "package:drift/drift.dart" show Value;
import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "../db/database.dart";
import "../utils/hash.dart";
import "character.dart";
import "common.dart";
import "level_range_values.dart";

part "bookmark.freezed.dart";

class MaterialBookmarkInsertable {
  final CharacterOrVariantId characterId;
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
  final VariantId characterId;
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
  final VariantId characterId;
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
sealed class MaterialBookmark with _$MaterialBookmark {
  const factory MaterialBookmark({
    required BookmarkMaterialGroup group,
    required BookmarkMaterialItem item,
  }) = _MaterialBookmark;
}

@freezed
sealed class BookmarkGroup with _$BookmarkGroup {
  const BookmarkGroup._();

  const factory BookmarkGroup({
    required String hash,
    required BookmarkType type,
    required CharacterOrVariantId characterId,
    required String orderIndex,
    LevelRangeValues? levelRange,
    required List<MaterialBookmark> bookmarks,
  }) = _BookmarkGroup;

  factory BookmarkGroup.fromBookmarks(List<MaterialBookmark> bookmarks, AssetData assetData) {
    assert(bookmarks.isNotEmpty);

    LevelRangeValues? levelRange;
    final sample = bookmarks.first;

    final levels = bookmarks
        .sorted((a, b) => a.item.upperLevel - b.item.upperLevel);
    final ingredients = switch (sample.group.weaponId) {
      null => assetData.characterIngredients.getLevels(
        rarity: assetData.findCharacterOrVariant(sample.group.characterId)!.rarity,
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

    return BookmarkGroup(
      hash: sample.group.groupHash,
      type: .material,
      characterId: CharacterOrVariantId(sample.group.characterId),
      levelRange: levelRange,
      bookmarks: bookmarks,
      orderIndex: sample.group.orderIndex,
    );
  }
}
