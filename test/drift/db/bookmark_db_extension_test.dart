import "package:drift/native.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  MaterialBookmarkInsertable makeCharacterBookmark({
    required String characterId,
    required Purpose purpose,
    required int upperLevel,
    String? materialId,
  }) {
    return MaterialBookmarkInsertable(
      characterId: characterId,
      weaponId: null,
      materialId: materialId,
      quantity: 1,
      upperLevel: upperLevel,
      purposeType: purpose,
    );
  }

  MaterialBookmarkInsertable makeWeaponBookmark({
    required String characterId,
    required String weaponId,
    required int upperLevel,
    String? materialId,
  }) {
    return MaterialBookmarkInsertable(
      characterId: characterId,
      weaponId: weaponId,
      materialId: materialId,
      quantity: 1,
      upperLevel: upperLevel,
      purposeType: Purpose.ascension,
    );
  }

  group("getCharacterMaterialBookmarkLevelRanges", () {
    test("returns empty map when no bookmarks", () async {
      final result = await db.getCharacterMaterialBookmarkLevelRanges("char_1");
      expect(result, isEmpty);
    });

    test("returns single bookmark range correctly", () async {
      await db.addMaterialBookmarks([
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.ascension,
          upperLevel: 40,
        ),
      ]);

      final result = await db.getCharacterMaterialBookmarkLevelRanges("char_1");

      expect(result, hasLength(1));
      expect(result[Purpose.ascension]!.minUpperLevel, 40);
      expect(result[Purpose.ascension]!.maxUpperLevel, 40);
    });

    test("aggregates min/max across multiple bookmarks for same purpose",
        () async {
      await db.addMaterialBookmarks([
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.ascension,
          upperLevel: 20,
          materialId: "mat_a",
        ),
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.ascension,
          upperLevel: 40,
          materialId: "mat_b",
        ),
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.ascension,
          upperLevel: 60,
          materialId: "mat_c",
        ),
      ]);

      final result = await db.getCharacterMaterialBookmarkLevelRanges("char_1");

      expect(result[Purpose.ascension]!.minUpperLevel, 20);
      expect(result[Purpose.ascension]!.maxUpperLevel, 60);
    });

    test("returns separate ranges per purpose", () async {
      await db.addMaterialBookmarks([
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.ascension,
          upperLevel: 40,
          materialId: "mat_asc",
        ),
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.normalAttack,
          upperLevel: 6,
          materialId: "mat_na",
        ),
      ]);

      final result = await db.getCharacterMaterialBookmarkLevelRanges("char_1");

      expect(result, hasLength(2));
      expect(result[Purpose.ascension], (minUpperLevel: 40, maxUpperLevel: 40));
      expect(result[Purpose.normalAttack], (minUpperLevel: 6, maxUpperLevel: 6));
    });

    test("does not include weapon bookmarks", () async {
      await db.addMaterialBookmarks([
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.ascension,
          upperLevel: 40,
          materialId: "char_mat",
        ),
        makeWeaponBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          upperLevel: 70,
          materialId: "weapon_mat",
        ),
      ]);

      final result = await db.getCharacterMaterialBookmarkLevelRanges("char_1");

      expect(result, hasLength(1));
      expect(result[Purpose.ascension]!.maxUpperLevel, 40);
    });

    test("does not include bookmarks for other characters", () async {
      await db.addMaterialBookmarks([
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.ascension,
          upperLevel: 40,
          materialId: "mat_c1",
        ),
        makeCharacterBookmark(
          characterId: "char_2",
          purpose: Purpose.ascension,
          upperLevel: 80,
          materialId: "mat_c2",
        ),
      ]);

      final result = await db.getCharacterMaterialBookmarkLevelRanges("char_1");

      expect(result[Purpose.ascension]!.maxUpperLevel, 40);
    });
  });

  group("getWeaponMaterialBookmarkLevelRanges", () {
    test("returns empty map when no bookmarks", () async {
      final result = await db.getWeaponMaterialBookmarkLevelRanges("weapon_1");
      expect(result, isEmpty);
    });

    test("returns single weapon bookmark range correctly", () async {
      await db.addMaterialBookmarks([
        makeWeaponBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          upperLevel: 50,
        ),
      ]);

      final result = await db.getWeaponMaterialBookmarkLevelRanges("weapon_1");

      expect(result, hasLength(1));
      expect(result[Purpose.ascension]!.minUpperLevel, 50);
      expect(result[Purpose.ascension]!.maxUpperLevel, 50);
    });

    test("aggregates across multiple characters sharing the same weapon",
        () async {
      await db.addMaterialBookmarks([
        makeWeaponBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          upperLevel: 40,
          materialId: "wmat_a",
        ),
        makeWeaponBookmark(
          characterId: "char_2",
          weaponId: "weapon_1",
          upperLevel: 70,
          materialId: "wmat_b",
        ),
      ]);

      final result = await db.getWeaponMaterialBookmarkLevelRanges("weapon_1");

      expect(result[Purpose.ascension]!.minUpperLevel, 40);
      expect(result[Purpose.ascension]!.maxUpperLevel, 70);
    });

    test("does not include character bookmarks", () async {
      await db.addMaterialBookmarks([
        makeCharacterBookmark(
          characterId: "char_1",
          purpose: Purpose.ascension,
          upperLevel: 80,
          materialId: "char_mat",
        ),
        makeWeaponBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          upperLevel: 50,
          materialId: "weapon_mat",
        ),
      ]);

      final result = await db.getWeaponMaterialBookmarkLevelRanges("weapon_1");

      expect(result, hasLength(1));
      expect(result[Purpose.ascension]!.maxUpperLevel, 50);
    });

    test("does not include bookmarks for other weapons", () async {
      await db.addMaterialBookmarks([
        makeWeaponBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          upperLevel: 50,
          materialId: "wmat_1",
        ),
        makeWeaponBookmark(
          characterId: "char_1",
          weaponId: "weapon_2",
          upperLevel: 80,
          materialId: "wmat_2",
        ),
      ]);

      final result = await db.getWeaponMaterialBookmarkLevelRanges("weapon_1");

      expect(result[Purpose.ascension]!.maxUpperLevel, 50);
    });
  });
}
