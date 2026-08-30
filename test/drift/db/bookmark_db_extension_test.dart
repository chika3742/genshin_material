import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/models/bookmark.dart";
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

  group("watchMaterialBookmarksPartially", () {
    test("filters by character", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
        buildMaterialBookmark(characterId: "char_2", materialId: "mat_a"),
      ]);

      final rows = await db.watchMaterialBookmarksPartially(
        characterId: "char_1",
        weaponId: null,
        materialId: "mat_a",
        purposeTypes: Purpose.values,
      ).first;

      expect(rows, hasLength(1));
      expect(rows.single.group.characterId, "char_1");
    });

    test("matches only character bookmarks when the weapon id is null",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          materialId: "mat_a",
        ),
      ]);

      final rows = await db.watchMaterialBookmarksPartially(
        characterId: "char_1",
        weaponId: null,
        materialId: "mat_a",
        purposeTypes: Purpose.values,
      ).first;

      expect(rows, hasLength(1));
      expect(rows.single.group.weaponId, isNull);
    });

    test("filters by weapon", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          materialId: "mat_a",
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_2",
          materialId: "mat_a",
        ),
      ]);

      final rows = await db.watchMaterialBookmarksPartially(
        characterId: "char_1",
        weaponId: "weapon_1",
        materialId: "mat_a",
        purposeTypes: Purpose.values,
      ).first;

      expect(rows, hasLength(1));
      expect(rows.single.group.weaponId, "weapon_1");
    });

    test("filters by material", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_b"),
      ]);

      final rows = await db.watchMaterialBookmarksPartially(
        characterId: "char_1",
        weaponId: null,
        materialId: "mat_a",
        purposeTypes: Purpose.values,
      ).first;

      expect(rows, hasLength(1));
      expect(rows.single.item.materialId, "mat_a");
    });

    test("matches only exp bookmarks when the material id is null", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
        buildMaterialBookmark(characterId: "char_1", materialId: null),
      ]);

      final rows = await db.watchMaterialBookmarksPartially(
        characterId: "char_1",
        weaponId: null,
        materialId: null,
        purposeTypes: Purpose.values,
      ).first;

      expect(rows, hasLength(1));
      expect(rows.single.item.materialId, isNull);
    });

    test("filters by purpose", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_a",
          purposeType: Purpose.ascension,
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_a",
          purposeType: Purpose.normalAttack,
        ),
      ]);

      final rows = await db.watchMaterialBookmarksPartially(
        characterId: "char_1",
        weaponId: null,
        materialId: "mat_a",
        purposeTypes: [Purpose.normalAttack],
      ).first;

      expect(rows, hasLength(1));
      expect(rows.single.group.purposeType, Purpose.normalAttack);
    });

    test("returns nothing when no purpose is given", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
      ]);

      final rows = await db.watchMaterialBookmarksPartially(
        characterId: "char_1",
        weaponId: null,
        materialId: "mat_a",
        purposeTypes: [],
      ).first;

      expect(rows, isEmpty);
    });
  });

  group("watchMaterialBookmarksByGroupHash", () {
    test("returns every item of the given group only", () async {
      final target = buildMaterialBookmark(
        characterId: "char_1",
        materialId: "mat_a",
        upperLevel: 40,
      );
      await db.addMaterialBookmarks([
        target,
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_b",
          upperLevel: 50,
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_c",
          purposeType: Purpose.normalAttack,
        ),
        buildMaterialBookmark(characterId: "char_2", materialId: "mat_d"),
      ]);

      final rows =
          await db.watchMaterialBookmarksByGroupHash(target.groupHash).first;

      expect(rows, hasLength(2));
      expect(rows.every((e) => e.group.groupHash == target.groupHash), isTrue);
      expect(
        rows.map((e) => e.item.materialId),
        containsAll(["mat_a", "mat_b"]),
      );
    });

    test("returns an empty list for an unknown group", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
      ]);

      expect(await db.watchMaterialBookmarksByGroupHash("unknown").first, isEmpty);
    });
  });

  group("watchMaterialBookmarksByMaterial", () {
    test("returns the character bookmarks of the material when hasWeapon is false",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          materialId: "mat_a",
        ),
      ]);

      final rows = await db.watchMaterialBookmarksByMaterial("mat_a", false).first;

      expect(rows, hasLength(1));
      expect(rows.single.group.weaponId, isNull);
    });

    test("returns the weapon bookmarks of the material when hasWeapon is true",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          materialId: "mat_a",
        ),
      ]);

      final rows = await db.watchMaterialBookmarksByMaterial("mat_a", true).first;

      expect(rows, hasLength(1));
      expect(rows.single.group.weaponId, "weapon_1");
    });

    test("returns the exp bookmarks when the material id is null", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
        buildMaterialBookmark(characterId: "char_1", materialId: null),
      ]);

      final rows = await db.watchMaterialBookmarksByMaterial(null, false).first;

      expect(rows, hasLength(1));
      expect(rows.single.item.materialId, isNull);
    });

    test("does not return the bookmarks of another material", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_b"),
      ]);

      expect(await db.watchMaterialBookmarksByMaterial("mat_a", false).first, isEmpty);
    });
  });

  group("addArtifactSetBookmark", () {
    ArtifactSetBookmarkInsertable buildSetInsertable({
      String characterId = "char_1",
    }) {
      return ArtifactSetBookmarkInsertable(
        characterId: characterId,
        sets: const ["set_1", "set_2"],
        mainStats: const {"flower": null, "sands": "atk_percent"},
        subStats: const ["crit_rate"],
      );
    }

    test("inserts a row into both the common and the set table", () async {
      await db.addArtifactSetBookmark(buildSetInsertable());

      final artifacts = await db.select(db.bookmarkArtifactTable).get();
      final sets = await db.select(db.bookmarkArtifactSetTable).get();

      expect(artifacts, hasLength(1));
      expect(artifacts.single.characterId, "char_1");
      expect(artifacts.single.subStats, ["crit_rate"]);
      expect(artifacts.single.orderIndex, isNotEmpty);

      expect(sets, hasLength(1));
      expect(sets.single.id, artifacts.single.id);
      expect(sets.single.sets, ["set_1", "set_2"]);
      expect(sets.single.mainStats, {"flower": null, "sands": "atk_percent"});
    });

    test("appends the next bookmark after the existing one", () async {
      await db.addArtifactSetBookmark(buildSetInsertable());
      await db.addArtifactSetBookmark(buildSetInsertable(characterId: "char_2"));

      final artifacts = await db.select(db.bookmarkArtifactTable).get();

      expect(artifacts, hasLength(2));
      expect(
        artifacts.first.orderIndex.compareTo(artifacts.last.orderIndex),
        lessThan(0),
      );
    });

    test("is read back as an artifact set bookmark", () async {
      await db.addArtifactSetBookmark(buildSetInsertable());

      final rows = await db.watchArtifactBookmarks().first;

      expect(rows, hasLength(1));
      expect(rows.single, isA<BookmarkWithArtifactSetDetails>());
    });
  });

  group("addArtifactPieceBookmark", () {
    ArtifactPieceBookmarkInsertable buildPieceInsertable({
      String? mainStat = "atk_percent",
    }) {
      return ArtifactPieceBookmarkInsertable(
        characterId: "char_1",
        piece: "piece_1",
        mainStat: mainStat,
        subStats: const ["crit_dmg"],
      );
    }

    test("inserts a row into both the common and the piece table", () async {
      await db.addArtifactPieceBookmark(buildPieceInsertable());

      final artifacts = await db.select(db.bookmarkArtifactTable).get();
      final pieces = await db.select(db.bookmarkArtifactPieceTable).get();

      expect(artifacts, hasLength(1));
      expect(artifacts.single.subStats, ["crit_dmg"]);
      expect(artifacts.single.orderIndex, isNotEmpty);

      expect(pieces, hasLength(1));
      expect(pieces.single.id, artifacts.single.id);
      expect(pieces.single.piece, "piece_1");
      expect(pieces.single.mainStat, "atk_percent");
    });

    test("keeps the main stat null when it is not given", () async {
      await db.addArtifactPieceBookmark(buildPieceInsertable(mainStat: null));

      final pieces = await db.select(db.bookmarkArtifactPieceTable).get();

      expect(pieces.single.mainStat, isNull);
    });

    test("is read back as an artifact piece bookmark", () async {
      await db.addArtifactPieceBookmark(buildPieceInsertable());

      final rows = await db.watchArtifactBookmarks().first;

      expect(rows, hasLength(1));
      expect(rows.single, isA<BookmarkWithArtifactPieceDetails>());
    });
  });

  group("updateMaterialGroupOrderIndex", () {
    test("updates the order index of the given group only", () async {
      final first = buildMaterialBookmark(
        characterId: "char_1",
        materialId: "mat_a",
      );
      final second = buildMaterialBookmark(
        characterId: "char_2",
        materialId: "mat_a",
      );
      await db.addMaterialBookmarks([first, second]);
      final before = await db.select(db.bookmarkMaterialGroupTable).get();
      final untouched = before.firstWhere((e) => e.groupHash == second.groupHash);

      await db.updateMaterialGroupOrderIndex(first.groupHash, "a5");

      final after = await db.select(db.bookmarkMaterialGroupTable).get();
      expect(
        after.firstWhere((e) => e.groupHash == first.groupHash).orderIndex,
        "a5",
      );
      expect(
        after.firstWhere((e) => e.groupHash == second.groupHash).orderIndex,
        untouched.orderIndex,
      );
    });
  });

  group("updateArtifactOrderIndex", () {
    test("updates the order index of the given artifact only", () async {
      await db.addArtifactPieceBookmark(ArtifactPieceBookmarkInsertable(
        characterId: "char_1",
        piece: "piece_1",
        mainStat: null,
        subStats: const [],
      ));
      await db.addArtifactPieceBookmark(ArtifactPieceBookmarkInsertable(
        characterId: "char_2",
        piece: "piece_2",
        mainStat: null,
        subStats: const [],
      ));
      final before = await db.select(db.bookmarkArtifactTable).get();

      await db.updateArtifactOrderIndex(before.first.id, "a5");

      final after = await db.select(db.bookmarkArtifactTable).get();
      expect(after.firstWhere((e) => e.id == before.first.id).orderIndex, "a5");
      expect(
        after.firstWhere((e) => e.id == before.last.id).orderIndex,
        before.last.orderIndex,
      );
    });
  });

  group("deleteObsoleteBookmarks", () {
    test("returns false when no level is given", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
      ]);

      final deleted = await db.deleteObsoleteBookmarks(
        characterId: "char_1",
        levels: {},
      );

      expect(deleted, isFalse);
      expect(await db.select(db.bookmarkMaterialItemTable).get(), hasLength(1));
    });

    test("returns false when every bookmark is above the given level", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_a",
          upperLevel: 60,
        ),
      ]);

      final deleted = await db.deleteObsoleteBookmarks(
        characterId: "char_1",
        levels: {Purpose.ascension: 40},
      );

      expect(deleted, isFalse);
      expect(await db.select(db.bookmarkMaterialItemTable).get(), hasLength(1));
    });

    test("returns true and deletes the bookmarks up to the given level",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_a",
          upperLevel: 40,
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_b",
          upperLevel: 60,
        ),
      ]);

      final deleted = await db.deleteObsoleteBookmarks(
        characterId: "char_1",
        levels: {Purpose.ascension: 40},
      );

      expect(deleted, isTrue);
      final remaining = await db.select(db.bookmarkMaterialItemTable).get();
      expect(remaining, hasLength(1));
      expect(remaining.single.materialId, "mat_b");
    });

    test("deletes the group once its last item is gone", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_a",
          upperLevel: 40,
        ),
      ]);

      await db.deleteObsoleteBookmarks(
        characterId: "char_1",
        levels: {Purpose.ascension: 40},
      );

      expect(await db.select(db.bookmarkMaterialGroupTable).get(), isEmpty);
    });

    test("only deletes the purposes that are given", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_a",
          purposeType: Purpose.ascension,
          upperLevel: 40,
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_b",
          purposeType: Purpose.normalAttack,
          upperLevel: 6,
        ),
      ]);

      final deleted = await db.deleteObsoleteBookmarks(
        characterId: "char_1",
        levels: {Purpose.ascension: 40},
      );

      expect(deleted, isTrue);
      final remaining = await db.select(db.bookmarkMaterialItemTable).get();
      expect(remaining, hasLength(1));
      expect(remaining.single.materialId, "mat_b");
    });

    test("does not delete the bookmarks of another character", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_2",
          materialId: "mat_a",
          upperLevel: 40,
        ),
      ]);

      final deleted = await db.deleteObsoleteBookmarks(
        characterId: "char_1",
        levels: {Purpose.ascension: 40},
      );

      expect(deleted, isFalse);
      expect(await db.select(db.bookmarkMaterialItemTable).get(), hasLength(1));
    });

    test("only deletes the character bookmarks when no weapon is given",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_a",
          upperLevel: 40,
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          materialId: "mat_a",
          upperLevel: 40,
        ),
      ]);

      final deleted = await db.deleteObsoleteBookmarks(
        characterId: "char_1",
        levels: {Purpose.ascension: 40},
      );

      expect(deleted, isTrue);
      final remaining = await db.select(db.bookmarkMaterialItemTable).get();
      expect(remaining, hasLength(1));
    });

    test("deletes the weapon bookmarks when a weapon is given", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_1",
          materialId: "mat_a",
          upperLevel: 40,
        ),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          materialId: "mat_a",
          upperLevel: 40,
        ),
      ]);

      final deleted = await db.deleteObsoleteBookmarks(
        characterId: "char_1",
        weaponId: "weapon_1",
        levels: {Purpose.ascension: 40},
      );

      expect(deleted, isTrue);
      final remaining = await db.select(db.bookmarkMaterialItemTable).get();
      expect(remaining, hasLength(1));
      expect(
        (await db.select(db.bookmarkMaterialGroupTable).get()).single.weaponId,
        isNull,
      );
    });
  });

  group("watchMaterialBookmarks", () {
    test("returns an empty list when nothing is bookmarked", () async {
      expect(await db.watchMaterialBookmarks().first, isEmpty);
    });

    test("returns the character and the weapon bookmarks together", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
        buildMaterialBookmark(
          characterId: "char_1",
          weaponId: "weapon_1",
          materialId: "mat_b",
        ),
      ]);

      final rows = await db.watchMaterialBookmarks().first;

      expect(rows, hasLength(2));
      expect(
        rows.map((e) => e.item.materialId),
        containsAll(["mat_a", "mat_b"]),
      );
    });
  });

  group("watchMaterialBookmarksByHashes", () {
    test("returns only the items of the given hashes", () async {
      final target = buildMaterialBookmark(
        characterId: "char_1",
        materialId: "mat_a",
      );
      await db.addMaterialBookmarks([
        target,
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_b"),
      ]);

      final rows = await db.watchMaterialBookmarksByHashes([target.hash]).first;

      expect(rows, hasLength(1));
      expect(rows.single.item.hash, target.hash);
    });

    test("returns an empty list when no hash is given", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: "char_1", materialId: "mat_a"),
      ]);

      expect(await db.watchMaterialBookmarksByHashes([]).first, isEmpty);
    });
  });

  group("removeArtifactBookmarkById", () {
    test("deletes the artifact and cascades into the piece table", () async {
      await db.addArtifactPieceBookmark(ArtifactPieceBookmarkInsertable(
        characterId: "char_1",
        piece: "piece_1",
        mainStat: null,
        subStats: const [],
      ));
      final artifact = (await db.select(db.bookmarkArtifactTable).get()).single;

      await db.removeArtifactBookmarkById(artifact.id);

      expect(await db.select(db.bookmarkArtifactTable).get(), isEmpty);
      expect(await db.select(db.bookmarkArtifactPieceTable).get(), isEmpty);
    });

    test("keeps the other artifact bookmarks", () async {
      await db.addArtifactPieceBookmark(ArtifactPieceBookmarkInsertable(
        characterId: "char_1",
        piece: "piece_1",
        mainStat: null,
        subStats: const [],
      ));
      await db.addArtifactPieceBookmark(ArtifactPieceBookmarkInsertable(
        characterId: "char_2",
        piece: "piece_2",
        mainStat: null,
        subStats: const [],
      ));
      final artifacts = await db.select(db.bookmarkArtifactTable).get();

      await db.removeArtifactBookmarkById(artifacts.first.id);

      final remaining = await db.select(db.bookmarkArtifactTable).get();
      expect(remaining, hasLength(1));
      expect(remaining.single.id, artifacts.last.id);
    });
  });
}
