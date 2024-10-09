import "dart:convert";
import "dart:io";

import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:path/path.dart" as p;
import "package:path_provider/path_provider.dart";
import "package:sqlite3/sqlite3.dart";
import "package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart";

import "models/common.dart";

part "database.freezed.dart";
part "database.g.dart";

// tables

@freezed
class Bookmark with _$Bookmark {
  const factory Bookmark({
    required int id,
    required BookmarkType type,
    required String characterId,
    required DateTime createdAt,
    required String groupHash,
  }) = _Bookmark;
}

@UseRowClass(Bookmark)
class BookmarkTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => textEnum<BookmarkType>()();
  TextColumn get characterId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get groupHash => text()();
}

@DataClassName("BookmarkMaterialDetails")
class BookmarkMaterialDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId => integer().references(BookmarkTable, #id, onDelete: KeyAction.cascade)();
  /// If null, this is a character material bookmark.
  TextColumn get weaponId => text().nullable()();
  /// If null, this bookmark will be regarded as EXP items.
  TextColumn get materialId => text().nullable()();
  /// If [materialId] is null, this represents the amount of EXP.
  IntColumn get quantity => integer()();
  /// target level.
  IntColumn get upperLevel => integer()();
  TextColumn get purposeType => textEnum<Purpose>()();
  TextColumn get hash => text()();
}

@DataClassName("BookmarkArtifactSetDetails")
class BookmarkArtifactSetDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId => integer().references(BookmarkTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get sets => text().map(const ListConverter<ArtifactSetId>())();
  /// key = [ArtifactPieceTypeId]
  TextColumn get mainStats => text().map(const MapConverter<StatId?>())();
  TextColumn get subStats => text().map(const ListConverter<StatId>())();
}

@DataClassName("BookmarkArtifactPieceDetails")
class BookmarkArtifactPieceDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId => integer().references(BookmarkTable, #id, onDelete: KeyAction.cascade)();
  /// [ArtifactPieceId]
  TextColumn get piece => text()();
  /// [ArtifactPieceTypeId]?
  TextColumn get mainStat => text().nullable()();
  TextColumn get subStats => text().map(const ListConverter<StatId>())();
}

@DataClassName("BookmarkOrderRegistry")
class BookmarkOrderRegistryTable extends Table {
  TextColumn get id => text().withDefault(const Constant("main"))();
  TextColumn get order => text().map(const ListConverter<String>())();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName("CharacterLevelInfo")
class CharacterLevelInfoTable extends Table {
  TextColumn get uid => text()();
  TextColumn get characterId => text()();
  TextColumn get purposes => text().map(const PurposeMapConverter())();

  @override
  Set<Column> get primaryKey => {uid, characterId};
}

@DataClassName("MaterialBagCount")
class MaterialBagCountTable extends Table {
  TextColumn get uid => text()();
  IntColumn get hyvId => integer()();
  IntColumn get count => integer()();
  DateTimeColumn get lastUpdated => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {uid, hyvId};
}


// converters

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

class BookmarkTypeListConverter extends TypeConverter<List<BookmarkType>, String> {
  const BookmarkTypeListConverter();

  @override
  List<BookmarkType> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<dynamic>).map((e) => BookmarkType.values.firstWhere((f) => f.name == e)).toList();
  }

  @override
  String toSql(List<BookmarkType> value) {
    return jsonEncode(value.map((e) => e.name).toList());
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
  BookmarkTable,
  BookmarkMaterialDetailsTable,
  BookmarkArtifactSetDetailsTable,
  BookmarkArtifactPieceDetailsTable,
  CharacterLevelInfoTable,
  BookmarkOrderRegistryTable,
  MaterialBagCountTable,
],)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static Future<File> getDbFile() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return File(p.join(dbFolder.path, "db.sqlite"));
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        // enable foreign keys
        await customStatement("PRAGMA foreign_keys = ON");

        // initialize bookmark order registry
        await into(bookmarkOrderRegistryTable).insert(
          BookmarkOrderRegistryCompanion.insert(
            order: [],
          ),
          mode: InsertMode.insertOrIgnore,
        );
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = await AppDatabase.getDbFile();

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cacheBase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}
