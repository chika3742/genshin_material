import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
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

  group("getCharacterMaterialBookmarkLevelRanges", () {
    test("returns empty map when no bookmarks", () async {
      final result = await db.getCharacterMaterialBookmarkLevelRanges("char_1");
      expect(result, isEmpty);
    });

    test("returns single bookmark range correctly", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.ascension,
          upperLevel: 40,
          materialId: null,
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
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.ascension,
          upperLevel: 20,
          materialId: "mat_a",
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.ascension,
          upperLevel: 40,
          materialId: "mat_b",
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.ascension,
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
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.ascension,
          upperLevel: 40,
          materialId: "mat_asc",
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.normalAttack,
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
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.ascension,
          upperLevel: 40,
          materialId: "char_mat",
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          purposeType: Purpose.ascension,
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
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.ascension,
          upperLevel: 40,
          materialId: "mat_c1",
        ),
        buildMaterialBookmark(
          characterId: "char_2",
          purposeType: Purpose.ascension,
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
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          purposeType: Purpose.ascension,
          upperLevel: 50,
          materialId: null,
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
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          purposeType: Purpose.ascension,
          upperLevel: 40,
          materialId: "wmat_a",
        ),
        buildMaterialBookmark(
          characterId: "char_2",
          weaponId: "weapon_1",
          purposeType: Purpose.ascension,
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
        buildMaterialBookmark(
          characterId: "char_1",
          purposeType: Purpose.ascension,
          upperLevel: 80,
          materialId: "char_mat",
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          purposeType: Purpose.ascension,
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
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          purposeType: Purpose.ascension,
          upperLevel: 50,
          materialId: "wmat_1",
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_2",
          purposeType: Purpose.ascension,
          upperLevel: 80,
          materialId: "wmat_2",
        ),
      ]);

      final result = await db.getWeaponMaterialBookmarkLevelRanges("weapon_1");

      expect(result[Purpose.ascension]!.maxUpperLevel, 50);
    });
  });
}
