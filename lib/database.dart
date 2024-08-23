import "dart:convert";
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
  /// If null, this bookmark will be regarded as EXP items.
  TextColumn get materialId => text().nullable()();
  TextColumn get characterId => text()();
  TextColumn get weaponId => text().nullable()();
  /// If [materialId] is null, this represents the amount of EXP.
  IntColumn get quantity => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get upperLevel => integer()();
  TextColumn get purposeType => textEnum<Purpose>()();
  /// Can be generated with [combineMaterialBookmarkElements].
  TextColumn get hash => text()();
}

class CharacterLevelInfo extends Table {
  TextColumn get uid => text()();
  TextColumn get characterId => text()();
  TextColumn get purposes => text().map(const PurposeMapConverter())();

  @override
  Set<Column> get primaryKey => {uid, characterId};
}

class ArtifactBookmark extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get characterId => text()();
  TextColumn get setId1 => text().nullable()();
  TextColumn get setId2 => text().nullable()();
  TextColumn get pieceId => text().nullable()();
  /// key = [ArtifactPieceTypeId]
  TextColumn get mainStatIds => text().map(const MapConverter<String?>())();
  TextColumn get subStatIds => text().map(const ListConverter<String>())();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PurposeMapConverter extends TypeConverter<Map<Purpose, int>, String> {
  const PurposeMapConverter();

  @override
  Map<Purpose, int> fromSql(String fromDb) {
    final decoded = jsonDecode(fromDb) as Map<String, dynamic>;
    return decoded.map((key, value) => MapEntry(Purpose.values.firstWhere((e) => e.name == key), value));
  }

  @override
  String toSql(Map<Purpose, int> value) {
    return jsonEncode(value.map((key, value) => MapEntry(key.name, value)));
  }
}

class ListConverter<T> extends TypeConverter<List<T>, String> {
  const ListConverter();

  @override
  List<T> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<dynamic>).cast<T>();
  }

  @override
  String toSql(List<T> value) {
    return jsonEncode(value);
  }
}

class MapConverter<T> extends TypeConverter<Map<String, T>, String> {
  const MapConverter();

  @override
  Map<String, T> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as Map<String, dynamic>).cast<String, T>();
  }

  @override
  String toSql(Map<String, T> value) {
    return jsonEncode(value);
  }
}

@DriftDatabase(tables: [
  MaterialBookmark,
  CharacterLevelInfo,
  ArtifactBookmark,
],)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement("PRAGMA foreign_keys = ON");
      },
    );
  }

  Stream<List<MaterialBookmarkData>> watchMaterialBookmarks() {
    return select(materialBookmark).watch();
  }

  Stream<List<MaterialBookmarkData>> watchMaterialBookmarkByPartial({
    required String characterId,
    required String? weaponId,
    required String? materialId,
    required List<Purpose> purposeTypes,
  }) {
    return (select(materialBookmark)
          ..where(
            (tbl) =>
                tbl.characterId.equals(characterId) &
                tbl.materialId.equalsNullable(materialId) &
                tbl.purposeType.isInValues(purposeTypes) &
                tbl.weaponId.equalsNullable(weaponId),
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

  Future<int> setCharacterLevels(String uid, String characterId, Map<Purpose, int> purposes) async {
    return await into(characterLevelInfo).insertOnConflictUpdate(
      CharacterLevelInfoCompanion.insert(
        uid: uid,
        characterId: characterId,
        purposes: purposes,
      ),
    );
  }

  Future<Map<Purpose, int>?> getCharacterLevels(String uid, String characterId) async {
    final query = select(characterLevelInfo)
      ..where((tbl) => tbl.uid.equals(uid) & tbl.characterId.equals(characterId));
    final info = await query.getSingleOrNull();
    return info?.purposes;
  }

  Future<int> addArtifactBookmark(ArtifactBookmarkCompanion companion) {
    return into(artifactBookmark).insert(companion);
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
