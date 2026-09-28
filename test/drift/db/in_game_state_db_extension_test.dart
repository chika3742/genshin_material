import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/in_game_character_state_db_extension.dart";
import "package:genshin_material/models/common.dart";

import "../../utils/async.dart";
import "../../utils/db.dart";

void main() {
  late AppDatabase db;

  setUp(() {
    db = createTestDatabase();
  });

  tearDown(() async {
    await db.close();
  });

  InGameCharacterStateCompanion buildCharacterState({
    String uid = "uid_1",
    int characterId = 90001,
    int elementId = 90101,
    Map<Purpose, int> purposes = const {Purpose.ascension: 40},
    int equippedWeaponId = 90201,
    Map<Purpose, int> weaponPurposes = const {Purpose.ascension: 50},
  }) {
    return InGameCharacterStateCompanion.insert(
      uid: uid,
      characterId: characterId,
      elementId: elementId,
      purposes: purposes,
      equippedWeaponId: equippedWeaponId,
      weaponPurposes: weaponPurposes,
    );
  }

  Future<List<InGameCharacterState>> readCharacterStates() =>
      db.select(db.inGameCharacterStateTable).get();

  group("setCharacterState", () {
    test("Inserts a new row", () async {
      await db.setCharacterState(buildCharacterState(
        purposes: {Purpose.ascension: 40, Purpose.normalAttack: 6},
        equippedWeaponId: 90201,
        weaponPurposes: {Purpose.ascension: 50},
      ));

      final rows = await readCharacterStates();
      expect(rows, hasLength(1));
      expect(rows.single.uid, "uid_1");
      expect(rows.single.characterId, 90001);
      expect(rows.single.elementId, 90101);
      expect(rows.single.purposes, {Purpose.ascension: 40, Purpose.normalAttack: 6});
      expect(rows.single.equippedWeaponId, 90201);
      expect(rows.single.weaponPurposes, {Purpose.ascension: 50});
    });

    test("Returns the stored row", () async {
      final row = await db.setCharacterState(buildCharacterState(
        purposes: {Purpose.ascension: 40},
      ));

      // The generated row class compares the converted maps by identity, so
      // compare the fields instead of the rows.
      final stored = (await readCharacterStates()).single;
      expect(row.characterId, stored.characterId);
      expect(row.elementId, stored.elementId);
      expect(row.purposes, stored.purposes);
      expect(row.lastUpdated, stored.lastUpdated);
    });

    test("Updates the existing row of the same uid, character and element", () async {
      await db.setCharacterState(buildCharacterState(
        purposes: {Purpose.ascension: 40},
        equippedWeaponId: 90201,
      ));
      await db.setCharacterState(buildCharacterState(
        purposes: {Purpose.ascension: 80},
        equippedWeaponId: 90202,
      ));

      final rows = await readCharacterStates();
      expect(rows, hasLength(1));
      expect(rows.single.purposes, {Purpose.ascension: 80});
      expect(rows.single.equippedWeaponId, 90202);
    });

    test("Keeps the same character of another uid as a separate row", () async {
      await db.setCharacterState(buildCharacterState(uid: "uid_1"));
      await db.setCharacterState(buildCharacterState(uid: "uid_2"));

      expect(await readCharacterStates(), hasLength(2));
    });

    test("Keeps another character of the same uid as a separate row", () async {
      await db.setCharacterState(buildCharacterState(characterId: 90001));
      await db.setCharacterState(buildCharacterState(characterId: 90002));

      expect(await readCharacterStates(), hasLength(2));
    });

    // The Traveler shares one HoYoLAB ID across elements, and each element has
    // its own talents.
    test("Keeps another element of the same character as a separate row", () async {
      await db.setCharacterState(buildCharacterState(elementId: 90101));
      await db.setCharacterState(buildCharacterState(elementId: 90102));

      expect(await readCharacterStates(), hasLength(2));
    });
  });

  group("setCharacterStates", () {
    test("Inserts all the rows and updates existing ones", () async {
      await db.setCharacterState(buildCharacterState(
        characterId: 90001,
        purposes: {Purpose.ascension: 40},
      ));

      await db.setCharacterStates([
        buildCharacterState(characterId: 90001, purposes: {Purpose.ascension: 80}),
        buildCharacterState(characterId: 90002),
      ]);

      final rows = await readCharacterStates();
      expect(rows.map((e) => e.characterId), unorderedEquals([90001, 90002]));
      expect(
        rows.singleWhere((e) => e.characterId == 90001).purposes,
        {Purpose.ascension: 80},
      );
    });
  });

  group("watchCharacterStates", () {
    test("Emits only the rows of the given uid", () async {
      await db.setCharacterState(buildCharacterState(uid: "uid_1", characterId: 90001));
      await db.setCharacterState(buildCharacterState(uid: "uid_2", characterId: 90002));

      final queue = createStreamQueue(db.watchCharacterStates("uid_1"));

      final rows = await queue.next;
      expect(rows.map((e) => e.characterId), [90001]);
    });

    test("Emits again when a row of the uid is written", () async {
      final queue = createStreamQueue(db.watchCharacterStates("uid_1"));
      expect(await queue.next, isEmpty);

      await db.setCharacterState(buildCharacterState(uid: "uid_1"));

      expect(await queue.next, hasLength(1));
    });
  });
}
