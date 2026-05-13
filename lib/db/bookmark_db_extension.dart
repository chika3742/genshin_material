import "dart:math";

import "package:drift/drift.dart";
import "package:fractional_indexing/fractional_indexing.dart";

import "../database.dart";
import "../models/bookmark.dart";
import "../models/common.dart";

extension BookmarkDbExtension on AppDatabase {
  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarks() {
    return _createMaterialJoin().watch().map((rows) => rows.map(_mapMaterialRow).toList());
  }

  Stream<List<BookmarkWithDetails>> watchArtifactBookmarks() {
    return (select(bookmarkArtifactTable).join([
      leftOuterJoin(bookmarkArtifactSetTable, bookmarkArtifactSetTable.id.equalsExp(bookmarkArtifactTable.id)),
      leftOuterJoin(bookmarkArtifactPieceTable, bookmarkArtifactPieceTable.id.equalsExp(bookmarkArtifactTable.id)),
    ])).watch().map((rows) => rows.map((row) {
      final artifact = row.readTable(bookmarkArtifactTable);
      final set = row.readTableOrNull(bookmarkArtifactSetTable);
      if (set != null) {
        return BookmarkWithDetails.artifactSet(artifact: artifact, artifactSet: set);
      }
      return BookmarkWithDetails.artifactPiece(
        artifact: artifact,
        artifactPiece: row.readTable(bookmarkArtifactPieceTable),
      );
    }).toList());
  }

  BookmarkWithMaterialDetails _mapMaterialRow(TypedResult row) => BookmarkWithMaterialDetails(
    group: row.readTable(bookmarkMaterialGroupTable),
    item: row.readTable(bookmarkMaterialItemTable),
  );

  JoinedSelectStatement<HasResultSet, dynamic> _createMaterialJoin() {
    return select(bookmarkMaterialItemTable).join([
      innerJoin(
        bookmarkMaterialGroupTable,
        bookmarkMaterialGroupTable.groupHash.equalsExp(bookmarkMaterialItemTable.groupHash),
      ),
    ]);
  }

  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarksPartially({
    required String characterId,
    required String? weaponId,
    required String? materialId,
    required List<Purpose> purposeTypes,
  }) {
    final query = _createMaterialJoin();
    query.where(
      bookmarkMaterialGroupTable.characterId.equals(characterId) &
      bookmarkMaterialGroupTable.weaponId.equalsNullable(weaponId) &
      bookmarkMaterialItemTable.materialId.equalsNullable(materialId) &
      bookmarkMaterialGroupTable.purposeType.isInValues(purposeTypes),
    );
    return query.watch().map((rows) => rows.map(_mapMaterialRow).toList());
  }

  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarksByHashes(List<String> hashes) {
    final query = _createMaterialJoin();
    query.where(bookmarkMaterialItemTable.hash.isIn(hashes));
    return query.watch().map((rows) => rows.map(_mapMaterialRow).toList());
  }

  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarksByGroupHash(String groupHash) {
    final query = _createMaterialJoin();
    query.where(bookmarkMaterialGroupTable.groupHash.equals(groupHash));
    return query.watch().map((rows) => rows.map(_mapMaterialRow).toList());
  }

  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarksByMaterial(String? materialId, bool hasWeapon) {
    final query = _createMaterialJoin();
    query.where(
      bookmarkMaterialItemTable.materialId.equalsNullable(materialId) &
      bookmarkMaterialGroupTable.weaponId.isNotNull().equals(hasWeapon),
    );
    return query.watch().map((rows) => rows.map(_mapMaterialRow).toList());
  }

  Future<Map<Purpose, ({int minUpperLevel, int maxUpperLevel})>> getCharacterMaterialBookmarkLevelRanges(String characterId) async {
    final query = _createMaterialJoin()..where(
      bookmarkMaterialGroupTable.characterId.equals(characterId) &
      bookmarkMaterialGroupTable.weaponId.isNull(),
    );
    return _aggregateBookmarkLevelRanges(await query.get());
  }

  Future<Map<Purpose, ({int minUpperLevel, int maxUpperLevel})>> getWeaponMaterialBookmarkLevelRanges(String weaponId) async {
    final query = _createMaterialJoin()..where(
      bookmarkMaterialGroupTable.weaponId.equals(weaponId),
    );
    return _aggregateBookmarkLevelRanges(await query.get());
  }

  Map<Purpose, ({int minUpperLevel, int maxUpperLevel})> _aggregateBookmarkLevelRanges(List<TypedResult> rows) {
    final result = <Purpose, ({int minUpperLevel, int maxUpperLevel})>{};
    for (final row in rows) {
      final purpose = row.readTable(bookmarkMaterialGroupTable).purposeType;
      final upperLevel = row.readTable(bookmarkMaterialItemTable).upperLevel;
      if (result.containsKey(purpose)) {
        final current = result[purpose]!;
        result[purpose] = (
          minUpperLevel: min(current.minUpperLevel, upperLevel),
          maxUpperLevel: max(current.maxUpperLevel, upperLevel),
        );
      } else {
        result[purpose] = (minUpperLevel: upperLevel, maxUpperLevel: upperLevel);
      }
    }
    return result;
  }

  Future<void> addMaterialBookmarks(List<MaterialBookmarkInsertable> companions) async {
    await transaction(() async {
      for (final companion in companions) {
        final existingItem = await (select(bookmarkMaterialItemTable)
          ..where((tbl) => tbl.hash.equals(companion.hash))).getSingleOrNull();
        if (existingItem != null) continue;

        final existingGroup = await (select(bookmarkMaterialGroupTable)
          ..where((tbl) => tbl.groupHash.equals(companion.groupHash))).getSingleOrNull();

        if (existingGroup == null) {
          final lastGroup = await (select(bookmarkMaterialGroupTable)
            ..orderBy([(t) => OrderingTerm.desc(t.orderIndex)])
            ..limit(1)).getSingleOrNull();
          final orderIndex = FractionalIndexer.generateKeyBetween(lastGroup?.orderIndex, null) ?? "";
          await into(bookmarkMaterialGroupTable).insert(companion.toGroupCompanion(orderIndex));
        }

        await into(bookmarkMaterialItemTable).insert(companion.toItemCompanion());
      }
    });
  }

  Future<void> addArtifactSetBookmark(ArtifactSetBookmarkInsertable companion) async {
    await transaction(() async {
      final lastArtifact = await (select(bookmarkArtifactTable)
        ..orderBy([(t) => OrderingTerm.desc(t.orderIndex)])
        ..limit(1)).getSingleOrNull();
      final orderIndex = FractionalIndexer.generateKeyBetween(lastArtifact?.orderIndex, null) ?? "";
      final newId = await into(bookmarkArtifactTable).insert(companion.toArtifactCompanion(orderIndex));
      await into(bookmarkArtifactSetTable).insert(companion.toSetCompanion(newId));
    });
  }

  Future<void> addArtifactPieceBookmark(ArtifactPieceBookmarkInsertable companion) async {
    await transaction(() async {
      final lastArtifact = await (select(bookmarkArtifactTable)
        ..orderBy([(t) => OrderingTerm.desc(t.orderIndex)])
        ..limit(1)).getSingleOrNull();
      final orderIndex = FractionalIndexer.generateKeyBetween(lastArtifact?.orderIndex, null) ?? "";
      final newId = await into(bookmarkArtifactTable).insert(companion.toArtifactCompanion(orderIndex));
      await into(bookmarkArtifactPieceTable).insert(companion.toPieceCompanion(newId));
    });
  }

  Future<void> removeMaterialBookmarksByHashes(List<String> hashes) async {
    await transaction(() async {
      final affected = await (select(bookmarkMaterialItemTable)
        ..where((tbl) => tbl.hash.isIn(hashes))).get();
      final affectedGroupHashes = affected.map((e) => e.groupHash).toSet();

      await (delete(bookmarkMaterialItemTable)
        ..where((tbl) => tbl.hash.isIn(hashes))).go();

      for (final groupHash in affectedGroupHashes) {
        final remaining = await (select(bookmarkMaterialItemTable)
          ..where((tbl) => tbl.groupHash.equals(groupHash))).get();
        if (remaining.isEmpty) {
          await (delete(bookmarkMaterialGroupTable)
            ..where((tbl) => tbl.groupHash.equals(groupHash))).go();
        }
      }
    });
  }

  Future<void> removeArtifactBookmarkById(int id) {
    return (delete(bookmarkArtifactTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updateMaterialGroupOrderIndex(String groupHash, String orderIndex) {
    return (update(bookmarkMaterialGroupTable)..where((tbl) => tbl.groupHash.equals(groupHash)))
        .write(BookmarkMaterialGroupCompanion(orderIndex: Value(orderIndex)));
  }

  Future<void> updateArtifactOrderIndex(int id, String orderIndex) {
    return (update(bookmarkArtifactTable)..where((tbl) => tbl.id.equals(id)))
        .write(BookmarkArtifactCompanion(orderIndex: Value(orderIndex)));
  }

  Future<bool> deleteObsoleteBookmarks({
    required String characterId,
    String? weaponId,
    required Map<Purpose, int> levels,
  }) async {
    if (levels.isEmpty) return false;

    final query = _createMaterialJoin();
    final baseExpr = bookmarkMaterialGroupTable.characterId.equals(characterId)
        & bookmarkMaterialGroupTable.weaponId.equalsNullable(weaponId);
    final expressions = levels.entries.map((e) =>
      bookmarkMaterialGroupTable.purposeType.equalsValue(e.key)
          & bookmarkMaterialItemTable.upperLevel.isSmallerOrEqualValue(e.value),
    );
    query.where(baseExpr & Expression.or(expressions));

    final toDelete = await query.get();
    if (toDelete.isEmpty) return false;

    await removeMaterialBookmarksByHashes(
      toDelete.map((e) => e.readTable(bookmarkMaterialItemTable).hash).toList(),
    );
    return true;
  }
}
