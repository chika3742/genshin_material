import "dart:convert";

import "package:clock/clock.dart";
import "package:drift/drift.dart";
import "package:drift_flutter/drift_flutter.dart";
import "package:freezed_annotation/freezed_annotation.dart";

import "database.steps.dart";
import "models/common.dart";

part "database.freezed.dart";
part "database.g.dart";

// tables

@freezed
sealed class Bookmark with _$Bookmark {
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

  @override
  Set<Column<Object>>? get primaryKey => {hash};
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

sealed class InGameState extends DataClass {
  const InGameState({
    required this.uid,
    required this.characterId,
    required this.purposes,
    required this.lastUpdated,
  });

  final String uid;
  final String characterId;
  final Map<Purpose, int> purposes;
  final DateTime lastUpdated;
}

@DataClassName.custom(name: "InGameCharacterState", implementing: [InGameState])
class InGameCharacterStateTable extends Table {
  TextColumn get uid => text()();
  TextColumn get characterId => text()();
  TextColumn get purposes => text().map(const PurposeMapConverter())();
  TextColumn get equippedWeaponId => text().nullable()();
  DateTimeColumn get lastUpdated => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {uid, characterId};
}

@DataClassName.custom(name: "InGameWeaponState", implementing: [InGameState])
class InGameWeaponStateTable extends Table {
  TextColumn get uid => text()();
  TextColumn get characterId => text()();
  TextColumn get weaponId => text()();
  TextColumn get purposes => text().map(const PurposeMapConverter())();
  DateTimeColumn get lastUpdated => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {uid, characterId, weaponId};
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

@DataClassName("FurnishingCraftCount")
class FurnishingCraftCountTable extends Table {
  TextColumn get furnishingId => text()();
  TextColumn get setId => text()();
  IntColumn get count => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {furnishingId, setId};
}

@DataClassName("FurnishingSetBookmark")
class FurnishingSetBookmarkTable extends Table {
  TextColumn get setId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {setId};
}

@DataClassName("WishHistoryEntry")
class WishHistoryTable extends Table {
  TextColumn get id => text()();
  TextColumn get itemType => textEnum<WishItemType>()();
  TextColumn get characterId => text().nullable()();
  TextColumn get weaponId => text().nullable()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get serial => integer().autoIncrement()();
}

enum WishItemType {
  character,
  weapon;

  static WishItemType fromItemType(String itemType) => switch (itemType) {
    "Character" => WishItemType.character,
    "Weapon" => WishItemType.weapon,
    _ => throw ArgumentError("Unknown item type: $itemType"),
  };
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
  InGameCharacterStateTable,
  InGameWeaponStateTable,
  BookmarkOrderRegistryTable,
  MaterialBagCountTable,
  FurnishingCraftCountTable,
  FurnishingSetBookmarkTable,
  WishHistoryTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 4;

  static const dbName = "db";

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          await m.alterTable(TableMigration(
            schema.inGameCharacterStateTable,
            columnTransformer: {
              schema.inGameCharacterStateTable.lastUpdated:
                  Variable.withDateTime(clock.now())
                      .modify(DateTimeModifier.minutes(-5)),
            },
          ));
          await m.alterTable(TableMigration(
            schema.inGameWeaponStateTable,
            columnTransformer: {
              schema.inGameWeaponStateTable.purposes:
                  Variable.withString('{"ascension": ') +
                      const CustomExpression("level") +
                      Variable.withString("}"),
              schema.inGameWeaponStateTable.lastUpdated:
                  Variable.withDateTime(clock.now())
                      .modify(DateTimeModifier.minutes(-5)),
            },
          ));
        },
        from2To3: (m, schema) async {
          await m.createAll();
        },
        from3To4: (m, schema) async {
          await m.createAll();
        },
      ),
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

QueryExecutor _openConnection() {
  return driftDatabase(
    name: AppDatabase.dbName,
  );
}
