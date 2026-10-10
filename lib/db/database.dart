import "dart:convert";

import "package:clock/clock.dart";
import "package:drift/drift.dart";
import "package:drift_flutter/drift_flutter.dart";
import "package:fractional_indexing/fractional_indexing.dart";

import "../models/character.dart";
import "../models/common.dart";
import "converters.dart";
import "database.steps.dart";
import "tables.dart";

part "database.drift.dart";

@DriftDatabase(tables: [
  BookmarkMaterialGroupTable,
  BookmarkMaterialItemTable,
  BookmarkArtifactTable,
  BookmarkArtifactSetTable,
  BookmarkArtifactPieceTable,
  InGameCharacterStateTable,
  MaterialBagCountTable,
  FurnishingCraftCountTable,
  FurnishingSetBookmarkTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 6;

  static const dbName = "db";

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) {
        return transaction(() {
          return stepByStep(
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
                       MIN(bt.created_at), ROW_NUMBER() OVER (ORDER BY MIN(bt.created_at))
                FROM bookmark_material_details_table bmd
                INNER JOIN bookmark_table bt ON bt.id = bmd.parent_id
                GROUP BY bt.group_hash
              """);

              // Migrate material items: one row per unique hash
              await customStatement("""
                INSERT INTO bookmark_material_item_table
                  (hash, group_hash, material_id, quantity, upper_level)
                SELECT bmd.hash, bt.group_hash, bmd.material_id, bmd.quantity, bmd.upper_level
                FROM bookmark_material_details_table bmd
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

              int orderIndexCounter = 0;

              for (final row in artifactSetRows) {
                final rawRow = row.readTable(v3.bookmarkTable);
                final newId = await into(v4.bookmarkArtifactTable).insert(RawValuesInsertable({
                  "character_id": Variable(rawRow.read<String>(k(v3.bookmarkTable.characterId))),
                  "created_at": Variable(rawRow.read<DateTime>(k(v3.bookmarkTable.createdAt))),
                  "sub_stats": Variable(rawRow.read<String>(k(v3.bookmarkArtifactSetDetailsTable.subStats))),
                  "order_index": Variable(orderIndexCounter++),
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
                  "order_index": Variable(orderIndexCounter++),
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
              await customStatement("DROP TABLE bookmark_material_details_table");
              await customStatement("DROP TABLE bookmark_artifact_set_details_table");
              await customStatement("DROP TABLE bookmark_artifact_piece_details_table");
              await customStatement("DROP TABLE bookmark_order_registry_table");
              await customStatement("DROP TABLE bookmark_table");
            },
            from4To5: (m, v5) async {
              final v4 = Schema4(database: this);

              await m.drop(v4.inGameCharacterStateTable);
              await m.drop(v4.inGameWeaponStateTable);
              await m.createAll();
            },
            from5To6: (m, schema) async {
              final groups = schema.bookmarkMaterialGroupTable;
              final items = schema.bookmarkMaterialItemTable;

              final query = selectOnly(groups)
                ..addColumns([groups.groupHash])
                ..where(groups.characterId.isIn([
                    "traveler_anemo",
                    "traveler_geo",
                    "traveler_electro",
                    "traveler_dendro",
                    "traveler_hydro",
                    "traveler_pyro",
                    "traveler_cryo",
                  ])
                  & groups.purposeType.equals("ascension")
                  & groups.weaponId.isNull());
              final hashes = await query.map((row) => row.read(groups.groupHash)!)
                  .get();

              await (delete(items)..where((_) => items.groupHash.isIn(hashes))).go();
              await (delete(groups)..where((_) => groups.groupHash.isIn(hashes))).go();
            },
          )(m, from, to);
        });
      },
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
