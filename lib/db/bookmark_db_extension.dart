
import "package:drift/drift.dart";

import "../database.dart";
import "../models/bookmark.dart";
import "../models/common.dart";
import "bookmark_order_registry_db_extension.dart";

extension BookmarkDbExtension on AppDatabase {
  Stream<List<BookmarkWithDetails>> watchBookmarks() {
    return select(bookmarkTable).join([
      leftOuterJoin(bookmarkMaterialDetailsTable, bookmarkMaterialDetailsTable.parentId.equalsExp(bookmarkTable.id)),
      leftOuterJoin(bookmarkArtifactSetDetailsTable, bookmarkArtifactSetDetailsTable.parentId.equalsExp(bookmarkTable.id)),
      leftOuterJoin(bookmarkArtifactPieceDetailsTable, bookmarkArtifactPieceDetailsTable.parentId.equalsExp(bookmarkTable.id)),
    ]).watch().map((rows) {
      return rows.map((row) {
        final meta = row.readTable(bookmarkTable);
        switch (meta.type) {
          case BookmarkType.material:
            return BookmarkWithDetails.material(
              metadata: meta,
              materialDetails: row.readTable(bookmarkMaterialDetailsTable),
            );
          case BookmarkType.artifactSet:
            return BookmarkWithDetails.artifactSet(
              metadata: meta,
              artifactSetDetails: row.readTable(bookmarkArtifactSetDetailsTable),
            );
          case BookmarkType.artifactPiece:
            return BookmarkWithDetails.artifactPiece(
              metadata: meta,
              artifactPieceDetails: row.readTable(bookmarkArtifactPieceDetailsTable),
            );
        }
      }).toList();
    });
  }

  Stream<List<Bookmark>> watchMaterialBookmarks() {
    final query = select(bookmarkTable)
      ..where((tbl) => tbl.type.equalsValue(BookmarkType.material));
    return query.watch();
  }

  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarksPartially({
    required String characterId,
    required String? weaponId,
    required String? materialId,
    required List<Purpose> purposeTypes,
  }) {
    final query = select(bookmarkTable).join([
      leftOuterJoin(bookmarkMaterialDetailsTable, bookmarkMaterialDetailsTable.parentId.equalsExp(bookmarkTable.id)),
    ]);
    query.where(
      bookmarkTable.characterId.equals(characterId) &
      bookmarkTable.type.equalsValue(BookmarkType.material) &
      bookmarkMaterialDetailsTable.materialId.equalsNullable(materialId) &
      bookmarkMaterialDetailsTable.purposeType.isInValues(purposeTypes) &
      bookmarkMaterialDetailsTable.weaponId.equalsNullable(weaponId),
    );
    return query.watch().map((rows) {
      return rows.map((row) {
        return BookmarkWithMaterialDetails(
          metadata: row.readTable(bookmarkTable),
          materialDetails: row.readTable(bookmarkMaterialDetailsTable),
        );
      }).toList();
    });
  }

  Future<void> _addBookmarks(List<BookmarkCompanionWithDetails> companions) async {
    final groupHashes = <String>{};
    await transaction(() async {
      for (final companion in companions) {
        final bookmarkId = await into(bookmarkTable).insert(companion.metadata);
        await switch (companion) {
          BookmarkCompanionWithMaterialDetails() => into(bookmarkMaterialDetailsTable).insert(companion.materialDetails.withParentId(bookmarkId)),
          BookmarkCompanionWithArtifactSetDetails() => into(bookmarkArtifactSetDetailsTable).insert(companion.artifactSetDetails.withParentId(bookmarkId)),
          BookmarkCompanionWithArtifactPieceDetails() => into(bookmarkArtifactPieceDetailsTable).insert(companion.artifactPieceDetails.withParentId(bookmarkId)),
        };
        groupHashes.add(companion.metadata.groupHash);
      }
      await registerBookmarkOrderHashes(groupHashes.toList());
    });
  }

  Future<void> addMaterialBookmarks(List<BookmarkCompanionWithMaterialDetails> companions) {
    return _addBookmarks(companions);
  }

  Future<void> addArtifactSetBookmark(BookmarkCompanionWithArtifactSetDetails companion) {
    return _addBookmarks([companion]);
  }

  Future<void> addArtifactPieceBookmark(BookmarkCompanionWithArtifactPieceDetails companion) {
    return _addBookmarks([companion]);
  }

  Future<void> removeBookmarks(List<int> ids) async {
    await transaction(() async {
      await (delete(bookmarkTable)..where((tbl) => tbl.id.isIn(ids))).go();

      final order = await getBookmarkOrder();
      for (var groupHash in order) {
        final bookmarkCount = await bookmarkTable.count(where: (tbl) => tbl.groupHash.equals(groupHash)).getSingle();
        if (bookmarkCount == 0) {
          await unregisterBookmarkOrderHashes([groupHash]);
        }
      }
    });
  }
}
