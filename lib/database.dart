import "dart:io";

import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:flutter/foundation.dart";
import "package:path/path.dart" as p;
import "package:path_provider/path_provider.dart";
import "package:sqlite3/sqlite3.dart";
import "package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart";

import "models/common.dart";
import "utils/hash.dart";

part "database.g.dart";

class MaterialBookmark extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => textEnum<MaterialBookmarkType>()();
  /// If null, this bookmark will be regarded as EXP items.
  TextColumn get materialId => text().nullable()();
  TextColumn get characterId => text()();
  /// If [materialId] is null, this represents the amount of EXP.
  IntColumn get quantity => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get upperLevel => integer()();
  TextColumn get purposeType => textEnum<Purpose>()();
  /// Can be generated with [combineMaterialBookmarkElements].
  TextColumn get hash => text()();
}

enum MaterialBookmarkType {
  character,
  weapon,
}

@DriftDatabase(tables: [MaterialBookmark])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<MaterialBookmarkData>> watchMaterialBookmarks() {
    return select(materialBookmark).watch();
  }

  Stream<List<MaterialBookmarkData>> watchMaterialBookmarkByPartial({
    required String characterId,
    required String? materialId,
    required List<Purpose> purposeTypes,
    required MaterialBookmarkType bookmarkType,
  }) {
    return (select(materialBookmark)
          ..where(
            (tbl) =>
                tbl.characterId.equals(characterId) &
                tbl.materialId.equalsNullable(materialId) &
                tbl.purposeType.isInValues(purposeTypes) &
                tbl.type.equalsValue(bookmarkType),
          ))
        .watch();
  }

  Future<void> addMaterialBookmarks(List<MaterialBookmarkCompanion> companions) {
    return batch((batch) {
      batch.insertAll(materialBookmark, companions);
    });
  }

  Future<void> removeMaterialBookmarks(List<int> ids) {
    return batch((batch) {
      batch.deleteWhere(materialBookmark, (tbl) => tbl.id.isIn(ids));
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));

    if (kDebugMode) {
      try {
        await file.delete();
      } catch (e) {
        // db file not exist
      }
    }

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cacheBase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}
