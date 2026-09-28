import "package:drift/drift.dart" hide isNull;
import "package:drift_dev/api/migrations_native.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";

import "generated/schema.dart";
import "generated/schema_v4.dart" as v4;
import "generated/schema_v5.dart" as v5;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test("migration from v4 to v5 discards in-game states, drops the weapon state table and keeps other tables", () {
    return verifier.testWithDataIntegrity(
      oldVersion: 4,
      newVersion: 5,
      createOld: v4.DatabaseAtV4.new,
      createNew: v5.DatabaseAtV5.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insert(
          oldDb.inGameCharacterStateTable,
          v4.InGameCharacterStateTableDataCompanion.insert(
            uid: "uid_01",
            characterId: "chara_01",
            purposes: "{}",
            equippedWeaponId: const Value("weapon_01"),
          ),
        );
        batch.insert(
          oldDb.inGameWeaponStateTable,
          v4.InGameWeaponStateTableDataCompanion.insert(
            uid: "uid_01",
            characterId: "chara_01",
            weaponId: "weapon_01",
            purposes: "{}",
          ),
        );
        batch.insert(
          oldDb.materialBagCountTable,
          v4.MaterialBagCountTableDataCompanion.insert(
            uid: "uid_01",
            hyvId: 1,
            count: 10,
          ),
        );
      },
      validateItems: (newDb) async {
        expect(await newDb.select(newDb.inGameCharacterStateTable).get(), isEmpty);
        expect(await newDb.select(newDb.materialBagCountTable).get(), hasLength(1));

        // Weapon states were merged into the character state table in v5.
        final weaponTables = await newDb.customSelect(
          "SELECT name FROM sqlite_master WHERE type = 'table' AND name = ?",
          variables: [Variable.withString(v4.InGameWeaponStateTable.$name)],
        ).get();
        expect(weaponTables, isEmpty);
      },
    );
  });
}
