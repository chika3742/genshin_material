
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

  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarksByHashes(List<String> hashes) {
    final query = select(bookmarkTable).join([
      leftOuterJoin(bookmarkMaterialDetailsTable, bookmarkMaterialDetailsTable.parentId.equalsExp(bookmarkTable.id)),
    ]);
    query.where(
      bookmarkMaterialDetailsTable.hash.isIn(hashes),
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

  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarksByGroupHash(String groupHash) {
    final query = select(bookmarkTable).join([
      leftOuterJoin(bookmarkMaterialDetailsTable, bookmarkMaterialDetailsTable.parentId.equalsExp(bookmarkTable.id)),
    ]);
    query.where(
      bookmarkTable.groupHash.equals(groupHash),
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

  Stream<List<BookmarkWithMaterialDetails>> watchMaterialBookmarksByMaterial(String? materialId, bool hasWeapon) {
    final query = select(bookmarkTable).join([
      leftOuterJoin(bookmarkMaterialDetailsTable, bookmarkMaterialDetailsTable.parentId.equalsExp(bookmarkTable.id)),
    ]);
    query.where(
      bookmarkMaterialDetailsTable.materialId.equalsNullable(materialId) &
      bookmarkMaterialDetailsTable.weaponId.isNotNull().equals(hasWeapon),
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

  Future<void> _addBookmarks(List<BookmarkInsertable> insertables) async {
    final groupHashes = <String>{};
    await transaction(() async {
      for (final companion in insertables) {
        if (companion is MaterialBookmarkInsertable) {
          final existing = await (select(bookmarkMaterialDetailsTable)
            ..where((tbl) => tbl.hash.equals(companion.hash))).getSingleOrNull();
          if (existing != null) {
            continue;
          }
        }
        final bookmarkId = await into(bookmarkTable).insert(companion.toMetadata());
        final inserter = switch (companion) {
          MaterialBookmarkInsertable() => into(bookmarkMaterialDetailsTable),
          ArtifactSetBookmarkInsertable() => into(bookmarkArtifactSetDetailsTable),
          ArtifactPieceBookmarkInsertable() => into(bookmarkArtifactPieceDetailsTable),
        };
        await inserter.insert(companion.toDetails(parentId: bookmarkId));
        groupHashes.add(companion.groupHash);
      }
      await registerBookmarkOrderHashes(groupHashes.toList());
    });
  }

  Future<void> addMaterialBookmarks(List<MaterialBookmarkInsertable> companions) {
    return _addBookmarks(companions);
  }

  Future<void> addArtifactSetBookmark(ArtifactSetBookmarkInsertable companion) {
    return _addBookmarks([companion]);
  }

  Future<void> addArtifactPieceBookmark(ArtifactPieceBookmarkInsertable companion) {
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

  /// Deletes obsolete bookmarks based on the provided character ID, weapon ID,
  /// and levels. Returns true if any bookmarks were deleted.
  Future<bool> deleteObsoleteBookmarks({
    required String characterId,
    String? weaponId,
    required Map<Purpose, int> levels,
  }) async {
    if (levels.isEmpty) {
      return false;
    }
    final query = select(bookmarkTable).join([
      leftOuterJoin(bookmarkMaterialDetailsTable, bookmarkMaterialDetailsTable.parentId.equalsExp(bookmarkTable.id)),
    ]);
    final baseExpr = bookmarkTable.characterId.equals(characterId)
        & bookmarkTable.type.equalsValue(BookmarkType.material)
        & bookmarkMaterialDetailsTable.weaponId.equalsNullable(weaponId);
    final expressions = levels.entries.map((e) {
      return bookmarkMaterialDetailsTable.purposeType.equalsValue(e.key)
          & bookmarkMaterialDetailsTable.upperLevel.isSmallerOrEqualValue(e.value);
    });
    query.where(baseExpr & Expression.or(expressions));

    final toDelete = await query.get();
    if (toDelete.isEmpty) {
      return false;
    }
    await removeBookmarks(toDelete.map((e) => e.readTable(bookmarkTable).id).toList());
    return true;
  }
}
