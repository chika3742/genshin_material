import "dart:convert";

import "package:clock/clock.dart";
import "package:drift/drift.dart";
import "package:drift_flutter/drift_flutter.dart";
import "package:fractional_indexing/fractional_indexing.dart";

import "database.steps.dart";
import "models/common.dart";

part "database.drift.dart";

// tables

@DataClassName("BookmarkMaterialGroup")
class BookmarkMaterialGroupTable extends Table {
  TextColumn get groupHash => text()();
  TextColumn get characterId => text()();
  TextColumn get weaponId => text().nullable()();
  TextColumn get purposeType => textEnum<Purpose>()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  /// Fractional-indexing order index in material bookmark list.
  TextColumn get orderIndex => text().unique()();

  @override
  Set<Column<Object>>? get primaryKey => {groupHash};
}

@DataClassName("BookmarkMaterialItem")
class BookmarkMaterialItemTable extends Table {
  TextColumn get hash => text()();
  TextColumn get groupHash => text().references(BookmarkMaterialGroupTable, #groupHash, onDelete: KeyAction.cascade)();
  /// If null, this bookmark will be regarded as EXP items.
  TextColumn get materialId => text().nullable()();
  /// If [materialId] is null, this represents the amount of EXP.
  IntColumn get quantity => integer()();
  /// target level.
  IntColumn get upperLevel => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {hash};
}

@DataClassName("BookmarkArtifact")
class BookmarkArtifactTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get characterId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get subStats => text().map(const ListConverter<StatId>())();
  /// Fractional-indexing order index in artifact bookmark list.
  TextColumn get orderIndex => text().unique()();
}

@DataClassName("BookmarkArtifactSet")
class BookmarkArtifactSetTable extends Table {
  IntColumn get id => integer().references(BookmarkArtifactTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get sets => text().map(const ListConverter<ArtifactSetId>())();
  /// key = [ArtifactPieceTypeId]
  TextColumn get mainStats => text().map(const MapConverter<StatId?>())();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName("BookmarkArtifactPiece")
class BookmarkArtifactPieceTable extends Table {
  IntColumn get id => integer().references(BookmarkArtifactTable, #id, onDelete: KeyAction.cascade)();
  /// [ArtifactPieceId]
  TextColumn get piece => text()();
  /// [ArtifactPieceTypeId]?
  TextColumn get mainStat => text().nullable()();

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
  BookmarkMaterialGroupTable,
  BookmarkMaterialItemTable,
  BookmarkArtifactTable,
  BookmarkArtifactSetTable,
  BookmarkArtifactPieceTable,
  InGameCharacterStateTable,
  InGameWeaponStateTable,
  MaterialBagCountTable,
  FurnishingCraftCountTable,
  FurnishingSetBookmarkTable,
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
          // ignore: experimental_member_use
          await m.alterTable(TableMigration(
            schema.inGameCharacterStateTable,
            columnTransformer: {
              schema.inGameCharacterStateTable.lastUpdated:
                  Variable.withDateTime(clock.now())
                      .modify(DateTimeModifier.minutes(-5)),
            },
          ));
          // ignore: experimental_member_use
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
        from3To4: (m, v4) async {
          // Free up the "bookmark_material_details_table" name for the new schema
          await customStatement(
            "ALTER TABLE bookmark_material_details_table RENAME TO bookmark_material_details_table_v3",
          );

          // Create new tables
          await m.createTable(v4.bookmarkMaterialGroupTable);
          await m.createTable(v4.bookmarkMaterialItemTable);
          await m.createTable(v4.bookmarkArtifactTable);
          await m.createTable(v4.bookmarkArtifactSetTable);
          await m.createTable(v4.bookmarkArtifactPieceTable);

          // Read existing order from registry (list of groupHashes in user-defined order)
          final orderRow = await customSelect(
            'SELECT "order" FROM bookmark_order_registry_table',
          ).getSingleOrNull();
          final orderedHashes = orderRow != null
              ? (jsonDecode(orderRow.read<String>("order")) as List).cast<String>()
              : <String>[];

          // Migrate material groups: one row per unique groupHash
          await customStatement("""
            INSERT INTO bookmark_material_group_table
              (group_hash, character_id, weapon_id, purpose_type, created_at, order_index)
            SELECT bt.group_hash, bt.character_id, bmd.weapon_id, bmd.purpose_type,
                   MIN(bt.created_at), ''
            FROM bookmark_material_details_table_v3 bmd
            INNER JOIN bookmark_table bt ON bt.id = bmd.parent_id
            GROUP BY bt.group_hash
          """);

          // Migrate material items: one row per unique hash
          await customStatement("""
            INSERT INTO bookmark_material_item_table
              (hash, group_hash, material_id, quantity, upper_level)
            SELECT bmd.hash, bt.group_hash, bmd.material_id, bmd.quantity, bmd.upper_level
            FROM bookmark_material_details_table_v3 bmd
            INNER JOIN bookmark_table bt ON bt.id = bmd.parent_id
          """);

          // Migrate artifact set bookmarks using Schema3 to read old typed tables.
          // New IDs are assigned by BookmarkArtifactTable autoincrement.
          final v3 = Schema3(database: this);

          // VersionedTable join results have keys in "tableName.columnName" form.
          String k(GeneratedColumn col) => "${col.tableName}.${col.name}";

          final artifactGroupHashToId = <String, int>{};

          final artifactSetRows = await (select(v3.bookmarkArtifactSetDetailsTable).join([
            innerJoin(v3.bookmarkTable, v3.bookmarkTable.id.equalsExp(v3.bookmarkArtifactSetDetailsTable.parentId)),
          ])).get();

          for (final row in artifactSetRows) {
            final rawRow = row.readTable(v3.bookmarkTable);
            final newId = await into(v4.bookmarkArtifactTable).insert(RawValuesInsertable({
              "character_id": Variable(rawRow.read<String>(k(v3.bookmarkTable.characterId))),
              "created_at": Variable(rawRow.read<DateTime>(k(v3.bookmarkTable.createdAt))),
              "sub_stats": Variable(rawRow.read<String>(k(v3.bookmarkArtifactSetDetailsTable.subStats))),
              "order_index": Variable(""),
            }));
            await into(v4.bookmarkArtifactSetTable).insert(RawValuesInsertable({
              "id": Variable(newId),
              "sets": Variable(rawRow.read<String>(k(v3.bookmarkArtifactSetDetailsTable.sets))),
              "main_stats": Variable(rawRow.read<String>(k(v3.bookmarkArtifactSetDetailsTable.mainStats))),
            }));
            artifactGroupHashToId[rawRow.read<String>(k(v3.bookmarkTable.groupHash))] = newId;
          }

          // Migrate artifact piece bookmarks
          final artifactPieceRows = await (select(v3.bookmarkArtifactPieceDetailsTable).join([
            innerJoin(v3.bookmarkTable, v3.bookmarkTable.id.equalsExp(v3.bookmarkArtifactPieceDetailsTable.parentId)),
          ])).get();

          for (final row in artifactPieceRows) {
            final rawRow = row.readTable(v3.bookmarkTable);
            final newId = await into(v4.bookmarkArtifactTable).insert(RawValuesInsertable({
              "character_id": Variable(rawRow.read<String>(k(v3.bookmarkTable.characterId))),
              "created_at": Variable(rawRow.read<DateTime>(k(v3.bookmarkTable.createdAt))),
              "sub_stats": Variable(rawRow.read<String>(k(v3.bookmarkArtifactPieceDetailsTable.subStats))),
              "order_index": Variable(""),
            }));
            await into(v4.bookmarkArtifactPieceTable).insert(RawValuesInsertable({
              "id": Variable(newId),
              "piece": Variable(rawRow.read<String>(k(v3.bookmarkArtifactPieceDetailsTable.piece))),
              "main_stat": Variable(rawRow.readNullable<String>(k(v3.bookmarkArtifactPieceDetailsTable.mainStat))),
            }));
            artifactGroupHashToId[rawRow.read<String>(k(v3.bookmarkTable.groupHash))] = newId;
          }

          // Assign orderIndex values preserving the existing registry order
          final allMaterialGroupHashes = (await customSelect(
            "SELECT group_hash FROM bookmark_material_group_table",
          ).get()).map((r) => r.read<String>("group_hash")).toSet();

          final orderedMaterialHashes = [
            ...orderedHashes.where(allMaterialGroupHashes.contains),
            ...allMaterialGroupHashes.where((h) => !orderedHashes.contains(h)),
          ];
          if (orderedMaterialHashes.isNotEmpty) {
            final indices = FractionalIndexer.generateNKeysBetween(null, null, orderedMaterialHashes.length);
            for (var i = 0; i < orderedMaterialHashes.length; i++) {
              await customUpdate(
                "UPDATE bookmark_material_group_table SET order_index = ? WHERE group_hash = ?",
                variables: [Variable(indices[i]), Variable(orderedMaterialHashes[i])],
                updates: {bookmarkMaterialGroupTable},
              );
            }
          }

          final orderedArtifactHashes = [
            ...orderedHashes.where(artifactGroupHashToId.containsKey),
            ...artifactGroupHashToId.keys.where((h) => !orderedHashes.contains(h)),
          ];
          if (orderedArtifactHashes.isNotEmpty) {
            final indices = FractionalIndexer.generateNKeysBetween(null, null, orderedArtifactHashes.length);
            for (var i = 0; i < orderedArtifactHashes.length; i++) {
              await customUpdate(
                "UPDATE bookmark_artifact_table SET order_index = ? WHERE id = ?",
                variables: [
                  Variable(indices[i]),
                  Variable(artifactGroupHashToId[orderedArtifactHashes[i]]!),
                ],
                updates: {bookmarkArtifactTable},
              );
            }
          }

          // Drop old tables
          await customStatement("DROP TABLE bookmark_material_details_table_v3");
          await customStatement("DROP TABLE bookmark_artifact_set_details_table");
          await customStatement("DROP TABLE bookmark_artifact_piece_details_table");
          await customStatement("DROP TABLE bookmark_order_registry_table");
          await customStatement("DROP TABLE bookmark_table");
        },
      ),
      beforeOpen: (details) async {
        await customStatement("PRAGMA foreign_keys = ON");
      },
    );
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: AppDatabase.dbName,
  );
}
