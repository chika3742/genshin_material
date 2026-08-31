import "package:drift/drift.dart" show Value;
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/in_game_character_state_db_extension.dart";
import "package:genshin_material/db/in_game_weapon_state_db_extension.dart";
import "package:genshin_material/models/common.dart";

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
    String characterId = "char_1",
    Map<Purpose, int> purposes = const {Purpose.ascension: 40},
    String? equippedWeaponId,
  }) {
    return InGameCharacterStateCompanion.insert(
      uid: uid,
      characterId: characterId,
      purposes: purposes,
      equippedWeaponId: Value.absentIfNull(equippedWeaponId),
    );
  }

  Future<List<InGameCharacterState>> readCharacterStates() =>
      db.select(db.inGameCharacterStateTable).get();

  Future<List<InGameWeaponState>> readWeaponStates() =>
      db.select(db.inGameWeaponStateTable).get();

  group("setCharacterState", () {
    test("Inserts a new row", () async {
      await db.setCharacterState(buildCharacterState(
        purposes: {Purpose.ascension: 40, Purpose.normalAttack: 6},
        equippedWeaponId: "weapon_1",
      ));

      final rows = await readCharacterStates();
      expect(rows, hasLength(1));
      expect(rows.single.uid, "uid_1");
      expect(rows.single.characterId, "char_1");
      expect(rows.single.purposes, {Purpose.ascension: 40, Purpose.normalAttack: 6});
      expect(rows.single.equippedWeaponId, "weapon_1");
    });

    test("Updates the existing row of the same uid and character", () async {
      await db.setCharacterState(buildCharacterState(
        purposes: {Purpose.ascension: 40},
        equippedWeaponId: "weapon_1",
      ));
      await db.setCharacterState(buildCharacterState(
        purposes: {Purpose.ascension: 80},
        equippedWeaponId: "weapon_2",
      ));

      final rows = await readCharacterStates();
      expect(rows, hasLength(1));
      expect(rows.single.purposes, {Purpose.ascension: 80});
      expect(rows.single.equippedWeaponId, "weapon_2");
    });

    // This looks like a bug, and the test pins today's behaviour rather than
    // the desired one. `insertOnConflictUpdate` writes only the columns the
    // companion carries, so an absent `equippedWeaponId` leaves the stored one
    // untouched. The sync path passes `Value.absentIfNull(...)`
    // (`lib/providers/game_data_sync.dart:124`), so once a character has been
    // synced with a weapon, unequipping it in game can never clear the stored
    // weapon: the state keeps pointing at the weapon the character no longer
    // holds.
    test("Keeps the previously equipped weapon when it is not given", () async {
      await db.setCharacterState(
        buildCharacterState(equippedWeaponId: "weapon_1"),
      );
      await db.setCharacterState(buildCharacterState());

      final rows = await readCharacterStates();
      expect(rows, hasLength(1));
      expect(rows.single.equippedWeaponId, "weapon_1");
    });

    test("Keeps the same character of another uid as a separate row", () async {
      await db.setCharacterState(buildCharacterState(uid: "uid_1"));
      await db.setCharacterState(buildCharacterState(uid: "uid_2"));

      expect(await readCharacterStates(), hasLength(2));
    });

    test("Keeps another character of the same uid as a separate row", () async {
      await db.setCharacterState(buildCharacterState(characterId: "char_1"));
      await db.setCharacterState(buildCharacterState(characterId: "char_2"));

      expect(await readCharacterStates(), hasLength(2));
    });
  });

  group("getCharacterState", () {
    test("Returns null when the character has no state", () async {
      expect(await db.getCharacterState("uid_1", "char_1"), isNull);
    });

    test("Returns the state of the given uid and character", () async {
      await db.setCharacterState(buildCharacterState(
        purposes: {Purpose.elementalBurst: 8},
      ));

      final state = await db.getCharacterState("uid_1", "char_1");

      expect(state, isNotNull);
      expect(state!.purposes, {Purpose.elementalBurst: 8});
    });

    test("Does not return the state of another uid", () async {
      await db.setCharacterState(buildCharacterState(uid: "uid_2"));

      expect(await db.getCharacterState("uid_1", "char_1"), isNull);
    });
  });

  group("getSyncedCharacters", () {
    test("Returns an empty list when nothing is synced", () async {
      expect(await db.getSyncedCharacters("uid_1"), isEmpty);
    });

    test("Returns only the characters of the given uid", () async {
      await db.setCharacterState(
        buildCharacterState(uid: "uid_1", characterId: "char_1"),
      );
      await db.setCharacterState(
        buildCharacterState(uid: "uid_1", characterId: "char_2"),
      );
      await db.setCharacterState(
        buildCharacterState(uid: "uid_2", characterId: "char_3"),
      );

      final characters = await db.getSyncedCharacters("uid_1");

      expect(characters, hasLength(2));
      expect(characters, containsAll(["char_1", "char_2"]));
    });
  });

  group("setWeaponLevels", () {
    test("Stores the level as the ascension purpose only", () async {
      await db.setWeaponLevels("uid_1", "char_1", "weapon_1", 60);

      final rows = await readWeaponStates();
      expect(rows, hasLength(1));
      expect(rows.single.purposes, {Purpose.ascension: 60});
    });

    test("Updates the existing row of the same uid, character and weapon",
        () async {
      await db.setWeaponLevels("uid_1", "char_1", "weapon_1", 60);
      await db.setWeaponLevels("uid_1", "char_1", "weapon_1", 90);

      final rows = await readWeaponStates();
      expect(rows, hasLength(1));
      expect(rows.single.purposes, {Purpose.ascension: 90});
    });

    test("Keeps another weapon of the same character as a separate row",
        () async {
      await db.setWeaponLevels("uid_1", "char_1", "weapon_1", 60);
      await db.setWeaponLevels("uid_1", "char_1", "weapon_2", 70);

      expect(await readWeaponStates(), hasLength(2));
    });

    test("Keeps the same weapon of another character as a separate row",
        () async {
      await db.setWeaponLevels("uid_1", "char_1", "weapon_1", 60);
      await db.setWeaponLevels("uid_1", "char_2", "weapon_1", 70);

      expect(await readWeaponStates(), hasLength(2));
    });

    test("Keeps the same weapon of another uid as a separate row", () async {
      await db.setWeaponLevels("uid_1", "char_1", "weapon_1", 60);
      await db.setWeaponLevels("uid_2", "char_1", "weapon_1", 70);

      expect(await readWeaponStates(), hasLength(2));
    });
  });

  group("getWeaponState", () {
    test("Returns null when the weapon has no state", () async {
      expect(await db.getWeaponState("uid_1", "char_1", "weapon_1"), isNull);
    });

    test("Returns the state of the given uid, character and weapon", () async {
      await db.setWeaponLevels("uid_1", "char_1", "weapon_1", 60);

      final state = await db.getWeaponState("uid_1", "char_1", "weapon_1");

      expect(state, isNotNull);
      expect(state!.weaponId, "weapon_1");
      expect(state.purposes, {Purpose.ascension: 60});
    });

    test("Does not return the state of another character", () async {
      await db.setWeaponLevels("uid_1", "char_2", "weapon_1", 60);

      expect(await db.getWeaponState("uid_1", "char_1", "weapon_1"), isNull);
    });
  });
}
