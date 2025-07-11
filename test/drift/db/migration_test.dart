// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import "package:drift/drift.dart";
import "package:drift_dev/api/migrations_native.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";

import "../../utils.dart";
import "generated/schema.dart";
import "generated/schema_v1.dart" as v1;
import "generated/schema_v2.dart" as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group("simple database migrations", () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group("from $fromVersion", () {
        for (final toVersion in versions.skip(i + 1)) {
          test("to $toVersion", () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  test("migration from v1 to v2 does not corrupt data", () async {
    final oldInGameCharacterStateTableData =
        <v1.InGameCharacterStateTableData>[
          v1.InGameCharacterStateTableData(
            uid: "foo",
            characterId: "bar",
            purposes: "{}",
          ),
        ];
    final expectedNewInGameCharacterStateTableData =
        <v2.InGameCharacterStateTableData>[
          v2.InGameCharacterStateTableData(
            uid: "foo",
            characterId: "bar",
            purposes: "{}",
            lastUpdated: DateTime.now().subtract(Duration(minutes: 5)),
          ),
        ];

    final oldInGameWeaponStateTableData = <v1.InGameWeaponStateTableData>[
      v1.InGameWeaponStateTableData(
        uid: "foo",
        characterId: "bar",
        weaponId: "baz",
        level: 0,
      ),
    ];
    final expectedNewInGameWeaponStateTableData =
        <v2.InGameWeaponStateTableData>[
          v2.InGameWeaponStateTableData(
            uid: "foo",
            characterId: "bar",
            weaponId: "baz",
            level: 0,
            lastUpdated: DateTime.now().subtract(Duration(minutes: 5)),
          )
        ];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(
            oldDb.inGameCharacterStateTable, oldInGameCharacterStateTableData);
        batch.insertAll(
            oldDb.inGameWeaponStateTable, oldInGameWeaponStateTableData);
      },
      validateItems: (newDb) async {
        expect((await newDb.select(newDb.inGameCharacterStateTable).get())[0].lastUpdated,
            closeToDateTime(expectedNewInGameCharacterStateTableData[0].lastUpdated, Duration(seconds: 1)));
        expect((await newDb.select(newDb.inGameWeaponStateTable).get())[0].lastUpdated,
            closeToDateTime(expectedNewInGameWeaponStateTableData[0].lastUpdated, Duration(seconds: 1)));
      },
    );
  });
}
