import "package:drift/drift.dart";
import "package:drift_dev/api/migrations_native.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";

import "generated/schema.dart";
import "generated/schema_v5.dart" as v5;
import "generated/schema_v6.dart" as v6;

typedef _MaterialGroup = ({String characterId, String purposeType, String? weaponId});

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test("migration from v5 to v6 drops the ascension bookmarks saved under the Traveler variants", () {
    // The migration targets these exact IDs, so they cannot be replaced with made-up ones.
    final dropped = <_MaterialGroup>[
      for (final variantId in [
        "traveler_anemo",
        "traveler_geo",
        "traveler_electro",
        "traveler_dendro",
        "traveler_hydro",
        "traveler_pyro",
        "traveler_cryo",
      ])
        (characterId: variantId, purposeType: "ascension", weaponId: null),
    ];
    final kept = <_MaterialGroup>[
      // Talents have always been saved under the variant IDs.
      (characterId: "traveler_anemo", purposeType: "normalAttack", weaponId: null),
      // Weapon bookmarks name the variant as the character to equip.
      (characterId: "traveler_anemo", purposeType: "ascension", weaponId: "weapon_1"),
      // Saved under the group ID, as before #375 and after the fix.
      (characterId: "traveler", purposeType: "ascension", weaponId: null),
      (characterId: "chara_1", purposeType: "ascension", weaponId: null),
    ];

    String groupHashOf(_MaterialGroup group) =>
        "${group.characterId}:material:${group.purposeType}:${group.weaponId ?? ""}:";

    return verifier.testWithDataIntegrity(
      oldVersion: 5,
      newVersion: 6,
      createOld: v5.DatabaseAtV5.new,
      createNew: v6.DatabaseAtV6.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        for (final (i, group) in [...dropped, ...kept].indexed) {
          final groupHash = groupHashOf(group);
          batch.insert(
            oldDb.bookmarkMaterialGroupTable,
            v5.BookmarkMaterialGroupTableDataCompanion.insert(
              groupHash: groupHash,
              characterId: group.characterId,
              weaponId: Value(group.weaponId),
              purposeType: group.purposeType,
              orderIndex: "a$i",
            ),
          );
          batch.insert(
            oldDb.bookmarkMaterialItemTable,
            v5.BookmarkMaterialItemTableDataCompanion.insert(
              hash: "mat_1:$groupHash",
              groupHash: groupHash,
              materialId: const Value("mat_1"),
              quantity: 1,
              upperLevel: 20,
            ),
          );
        }
      },
      validateItems: (newDb) async {
        final groups = await newDb.select(newDb.bookmarkMaterialGroupTable).get();
        expect(groups.map((e) => e.groupHash), unorderedEquals(kept.map(groupHashOf)));

        // Foreign keys are off during migrations, so the items of the dropped
        // groups have to go explicitly rather than by the cascade.
        final items = await newDb.select(newDb.bookmarkMaterialItemTable).get();
        expect(items.map((e) => e.groupHash), unorderedEquals(kept.map(groupHashOf)));
      },
    );
  });
}
