import "dart:convert";

import "package:drift/drift.dart" hide isNull;
import "package:drift_dev/api/migrations_native.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";

import "generated/schema.dart";
import "generated/schema_v3.dart" as v3;
import "generated/schema_v4.dart" as v4;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group("migration from v3 to v4", () {
    Future<void> verify({
      required void Function(Batch batch, v3.DatabaseAtV3 oldDb) createItems,
      required Future<void> Function(v4.DatabaseAtV4 newDb) validateItems,
    }) {
      return verifier.testWithDataIntegrity(
        oldVersion: 3,
        newVersion: 4,
        createOld: v3.DatabaseAtV3.new,
        createNew: v4.DatabaseAtV4.new,
        openTestedDatabase: AppDatabase.new,
        createItems: createItems,
        validateItems: validateItems,
      );
    }

    test("migrates material bookmarks correctly", () {
      const groupHash1 = "mat_group_01";
      const groupHash2 = "mat_group_02";
      const charaId1 = "chara_01";
      const charaId2 = "chara_02";
      const weaponId1 = "weapon_01";
      const materialId1 = "material_01";
      const itemHash1 = "hash_01";
      const itemHash2 = "hash_02";
      const itemHash3 = "hash_03";
      const itemHash4 = "hash_04";

      return verify(
        createItems: (batch, oldDb) {
          batch.insertAll(
            oldDb.bookmarkTable, [
            v3.BookmarkTableDataCompanion.insert(
              id: Value(1),
              type: "material",
              characterId: charaId1,
              groupHash: groupHash1,
            ),
            v3.BookmarkTableDataCompanion.insert(
              id: Value(2),
              type: "material",
              characterId: charaId1,
              groupHash: groupHash1,
            ),
            v3.BookmarkTableDataCompanion.insert(
              id: Value(3),
              type: "material",
              characterId: charaId2,
              groupHash: groupHash2,
            ),
            v3.BookmarkTableDataCompanion.insert(
              id: Value(4),
              type: "material",
              characterId: charaId2,
              groupHash: groupHash2,
            ),
          ]);
          batch.insertAll(
            oldDb.bookmarkMaterialDetailsTable, [
            v3.BookmarkMaterialDetailsTableDataCompanion.insert(
              parentId: 1,
              quantity: 5,
              upperLevel: 20,
              purposeType: "ascension",
              materialId: Value(materialId1),
              hash: itemHash1,
            ),
            v3.BookmarkMaterialDetailsTableDataCompanion.insert(
              parentId: 2,
              quantity: 5,
              upperLevel: 40,
              purposeType: "ascension",
              materialId: Value(materialId1),
              hash: itemHash2,
            ),
            v3.BookmarkMaterialDetailsTableDataCompanion.insert(
              parentId: 3,
              quantity: 5,
              weaponId: const Value(weaponId1),
              upperLevel: 20,
              purposeType: "ascension",
              hash: itemHash3,
            ),
            v3.BookmarkMaterialDetailsTableDataCompanion.insert(
              parentId: 4,
              quantity: 5,
              weaponId: const Value(weaponId1),
              upperLevel: 40,
              purposeType: "ascension",
              hash: itemHash4,
            ),
          ]);

          // register ordering
          batch.insert(
            oldDb.bookmarkOrderRegistryTable,
            v3.BookmarkOrderRegistryTableDataCompanion.insert(
              order: jsonEncode([
                groupHash2,
                groupHash1,
              ]),
            ),
          );
        },
        validateItems: (newDb) async {
          final groups = await newDb.select(newDb.bookmarkMaterialGroupTable).get();
          expect(groups, hasLength(2));

          final firstGroup = groups.firstWhere((g) => g.groupHash == groupHash1);
          expect(firstGroup.characterId, charaId1);
          expect(firstGroup.purposeType, "ascension");
          expect(firstGroup.weaponId, isNull);
          expect(firstGroup.orderIndex, "a1");

          final secondGroup = groups.firstWhere((g) => g.groupHash == groupHash2);
          expect(secondGroup.characterId, charaId2);
          expect(secondGroup.purposeType, "ascension");
          expect(secondGroup.weaponId, weaponId1);
          expect(secondGroup.orderIndex, "a0");

          final items = await newDb.select(newDb.bookmarkMaterialItemTable).get();
          final expected = <({
            String groupHash,
            String hash,
            String? materialId,
            int upperLevel,
          })>[
            (
              groupHash: groupHash1,
              hash: itemHash1,
              materialId: materialId1,
              upperLevel: 20,
            ),
            (
              groupHash: groupHash1,
              hash: itemHash2,
              materialId: materialId1,
              upperLevel: 40,
            ),
            (
              groupHash: groupHash2,
              hash: itemHash3,
              materialId: null,
              upperLevel: 20,
            ),
            (
              groupHash: groupHash2,
              hash: itemHash4,
              materialId: null,
              upperLevel: 40,
            ),
          ];
          expect(items, unorderedEquals([
            for (final e in expected)
              isA<v4.BookmarkMaterialItemTableData>()
                  .having((e) => e.groupHash, "groupHash", e.groupHash)
                  .having((e) => e.hash, "hash", e.hash)
                  .having((e) => e.materialId, "materialId", e.materialId)
                  .having((e) => e.quantity, "quantity", 5)
                  .having((e) => e.upperLevel, "upperLevel", e.upperLevel),
          ]));
        },
      );
    });

    test("migrates artifact bookmarks correctly", () {
      const groupHash1 = "art_group_01";
      const groupHash2 = "art_group_02";
      const charaId1 = "chara_01";
      const pieceId = "piece_01";
      const setsString = '["set_01"]';
      const mainStatId = "critRate";
      const mainStatsString = '{"hands": "hpPercent"}';
      const subStatsString1 = '["def", "atk"]';
      const subStatsString2 = '["hpPercent", "em"]';

      return verify(
        createItems: (batch, oldDb) {
          batch.insertAll(
            oldDb.bookmarkTable, [
            v3.BookmarkTableDataCompanion.insert(
              id: Value(1),
              type: "artifactSet",
              characterId: charaId1,
              groupHash: groupHash1,
            ),
            v3.BookmarkTableDataCompanion.insert(
              id: Value(2),
              type: "artifactPiece",
              characterId: charaId1,
              groupHash: groupHash2,
            ),
          ]);

          batch.insert(
            oldDb.bookmarkArtifactSetDetailsTable,
            v3.BookmarkArtifactSetDetailsTableDataCompanion.insert(
              parentId: 1,
              sets: setsString,
              mainStats: mainStatsString,
              subStats: subStatsString1,
            ),
          );
          batch.insert(
            oldDb.bookmarkArtifactPieceDetailsTable,
            v3.BookmarkArtifactPieceDetailsTableDataCompanion.insert(
              parentId: 2,
              piece: pieceId,
              mainStat: Value(mainStatId),
              subStats: subStatsString2,
            ),
          );

          // register ordering
          batch.insert(
            oldDb.bookmarkOrderRegistryTable,
            v3.BookmarkOrderRegistryTableDataCompanion.insert(
              order: jsonEncode([
                groupHash2,
                groupHash1,
              ]),
            ),
          );
        },
        validateItems: (newDb) async {
          final artifacts = await newDb.select(newDb.bookmarkArtifactTable).get();
          expect(artifacts, unorderedEquals([
            isA<v4.BookmarkArtifactTableData>()
                .having((e) => e.characterId, "characterId", charaId1)
                .having((e) => e.subStats, "subStats", subStatsString1)
                .having((e) => e.orderIndex, "orderIndex", "a1"),
            isA<v4.BookmarkArtifactTableData>()
                .having((e) => e.characterId, "characterId", charaId1)
                .having((e) => e.subStats, "subStats", subStatsString2)
                .having((e) => e.orderIndex, "orderIndex", "a0"),
          ]));

          final setDetails = await newDb.select(newDb.bookmarkArtifactSetTable).get();
          expect(setDetails, unorderedEquals([
            isA<v4.BookmarkArtifactSetTableData>()
                .having((e) => e.mainStats, "mainStats", mainStatsString)
                .having((e) => e.sets, "sets", setsString),
          ]));

          final pieceDetails = await newDb.select(newDb.bookmarkArtifactPieceTable).get();
          expect(pieceDetails, unorderedEquals([
            isA<v4.BookmarkArtifactPieceTableData>()
                .having((e) => e.mainStat, "mainStat", mainStatId)
                .having((e) => e.piece, "piece", pieceId),
          ]));
        },
      );
    });

    test("migrates order of mixed list", () {
      const groupHash1 = "group_01";
      const groupHash2 = "group_02";
      const groupHash3 = "group_03";
      const groupHash4 = "group_04";
      const charaId = "chara";
      const setSubStats = '["atk"]';
      const pieceSubStats = '["def"]';
      return verify(
        createItems: (batch, oldDb) {
          batch.insertAll(
            oldDb.bookmarkTable,
            [
              v3.BookmarkTableDataCompanion.insert(
                id: Value(1),
                groupHash: groupHash1,
                type: "material",
                characterId: charaId,
              ),
              v3.BookmarkTableDataCompanion.insert(
                id: Value(2),
                groupHash: groupHash2,
                type: "material",
                characterId: charaId,
              ),
              v3.BookmarkTableDataCompanion.insert(
                id: Value(3),
                groupHash: groupHash3,
                type: "artifactSet",
                characterId: charaId,
              ),
              v3.BookmarkTableDataCompanion.insert(
                id: Value(4),
                groupHash: groupHash4,
                type: "artifactPiece",
                characterId: charaId,
              ),
            ],
          );

          batch.insertAll(
            oldDb.bookmarkMaterialDetailsTable,
            [
              v3.BookmarkMaterialDetailsTableDataCompanion.insert(
                parentId: 1,
                quantity: 5,
                upperLevel: 20,
                purposeType: "ascension",
                hash: "hash01",
              ),
              v3.BookmarkMaterialDetailsTableDataCompanion.insert(
                parentId: 2,
                quantity: 5,
                upperLevel: 2,
                purposeType: "basicAttack",
                hash: "hash02",
              ),
            ],
          );
          batch.insert(
            oldDb.bookmarkArtifactSetDetailsTable,
            v3.BookmarkArtifactSetDetailsTableDataCompanion.insert(
              parentId: 3,
              sets: "",
              mainStats: "",
              subStats: setSubStats,
            ),
          );
          batch.insert(
            oldDb.bookmarkArtifactPieceDetailsTable,
            v3.BookmarkArtifactPieceDetailsTableDataCompanion.insert(
              parentId: 4,
              piece: "",
              subStats: pieceSubStats,
            ),
          );

          // register ordering
          const groupOrder = [
            groupHash2, // material(2)
            groupHash3, // artifact set
            groupHash1, // material(1)
            groupHash4, // artifact piece
          ];
          batch.insert(
            oldDb.bookmarkOrderRegistryTable,
            v3.BookmarkOrderRegistryTableDataCompanion.insert(
              order: jsonEncode(groupOrder),
            ),
          );
        },
        validateItems: (newDb) async {
          final materialGroups = await newDb.select(newDb.bookmarkMaterialGroupTable).get();
          expect(materialGroups, unorderedEquals([
            isA<v4.BookmarkMaterialGroupTableData>()
                .having((e) => e.groupHash, "groupHash", groupHash2)
                .having((e) => e.orderIndex, "orderIndex", "a0"),
            isA<v4.BookmarkMaterialGroupTableData>()
                .having((e) => e.groupHash, "groupHash", groupHash1)
                .having((e) => e.orderIndex, "orderIndex", "a1"),
          ]));

          final artifacts = await newDb.select(newDb.bookmarkArtifactTable).get();
          expect(artifacts, unorderedEquals([
            isA<v4.BookmarkArtifactTableData>()
                .having((e) => e.subStats, "subStats", setSubStats)
                .having((e) => e.orderIndex, "orderIndex", "a0"),
            isA<v4.BookmarkArtifactTableData>()
                .having((e) => e.subStats, "subStats", pieceSubStats)
                .having((e) => e.orderIndex, "orderIndex", "a1"),
          ]));
        },
      );
    });

    test("migration succeeds even if no data exists", () {
      return expectLater(() => verify(
        createItems: (batch, oldDb) {},
        validateItems: (newDb) async {},
      ), returnsNormally);
    });

    test("Item appended to end if no entry exists in order registry", () {
      const groupHash1 = "group_01";
      const groupHash2 = "group_02";

      return verify(
        createItems: (batch, oldDb) {
          batch.insertAll(
            oldDb.bookmarkTable,
            [
              v3.BookmarkTableDataCompanion.insert(
                id: Value(1),
                groupHash: groupHash1,
                type: "material",
                characterId: "chara",
              ),
              v3.BookmarkTableDataCompanion.insert(
                id: Value(2),
                groupHash: groupHash2,
                type: "material",
                characterId: "chara",
              ),
            ],
          );
          batch.insertAll(
            oldDb.bookmarkMaterialDetailsTable,
            [
              v3.BookmarkMaterialDetailsTableDataCompanion.insert(
                parentId: 1,
                quantity: 5,
                upperLevel: 20,
                purposeType: "ascension",
                hash: "hash01",
              ),
              v3.BookmarkMaterialDetailsTableDataCompanion.insert(
                parentId: 2,
                quantity: 5,
                upperLevel: 20,
                purposeType: "ascension",
                hash: "hash02",
              ),
            ],
          );

          batch.insert(
            oldDb.bookmarkOrderRegistryTable,
            v3.BookmarkOrderRegistryTableDataCompanion.insert(
              order: jsonEncode([groupHash2]),
            ),
          );
        },
        validateItems: (newDb) async {
          final materialGroups = await newDb.select(newDb.bookmarkMaterialGroupTable).get();
          expect(materialGroups, unorderedEquals([
            isA<v4.BookmarkMaterialGroupTableData>()
                .having((e) => e.groupHash, "groupHash", groupHash2)
                .having((e) => e.orderIndex, "orderIndex", "a0"),
            isA<v4.BookmarkMaterialGroupTableData>()
                .having((e) => e.groupHash, "groupHash", groupHash1)
                .having((e) => e.orderIndex, "orderIndex", "a1"),
          ]));
        },
      );
    });

    test("Order entry is ignored if no item corresponds to it", () {
      const groupHash1 = "group_01";
      const groupHash2 = "group_02";
      const groupHashFake = "group_fake";

      return verify(
        createItems: (batch, oldDb) {
          batch.insertAll(
            oldDb.bookmarkTable,
            [
              v3.BookmarkTableDataCompanion.insert(
                id: Value(1),
                groupHash: groupHash1,
                type: "material",
                characterId: "chara",
              ),
              v3.BookmarkTableDataCompanion.insert(
                id: Value(2),
                groupHash: groupHash2,
                type: "material",
                characterId: "chara",
              ),
            ],
          );
          batch.insertAll(
            oldDb.bookmarkMaterialDetailsTable,
            [
              v3.BookmarkMaterialDetailsTableDataCompanion.insert(
                parentId: 1,
                quantity: 5,
                upperLevel: 20,
                purposeType: "ascension",
                hash: "hash01",
              ),
              v3.BookmarkMaterialDetailsTableDataCompanion.insert(
                parentId: 2,
                quantity: 5,
                upperLevel: 20,
                purposeType: "ascension",
                hash: "hash02",
              ),
            ],
          );

          batch.insert(
            oldDb.bookmarkOrderRegistryTable,
            v3.BookmarkOrderRegistryTableDataCompanion.insert(
              order: jsonEncode([groupHash1, groupHash2, groupHashFake]),
            ),
          );
        },
        validateItems: (newDb) async {
          final materialGroups = await newDb.select(newDb.bookmarkMaterialGroupTable).get();
          expect(materialGroups, unorderedEquals([
            isA<v4.BookmarkMaterialGroupTableData>()
                .having((e) => e.groupHash, "groupHash", groupHash1)
                .having((e) => e.orderIndex, "orderIndex", "a0"),
            isA<v4.BookmarkMaterialGroupTableData>()
                .having((e) => e.groupHash, "groupHash", groupHash2)
                .having((e) => e.orderIndex, "orderIndex", "a1"),
          ]));
        },
      );
    });
  });
}
