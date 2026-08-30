import "package:drift/drift.dart" show Value;
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/utils/hash.dart";

// The exhaustive coverage of the hash functions themselves lives in
// test/unit/utils/hash_test.dart. This file only checks what the insertable
// feeds into them and how the results are carried into the companions.
void main() {
  MaterialBookmarkInsertable buildInsertable({
    CharacterId characterId = "char_1",
    WeaponId? weaponId,
    MaterialId? materialId = "iron_chunk",
    int quantity = 3,
    int upperLevel = 40,
    Purpose purposeType = Purpose.ascension,
  }) {
    return MaterialBookmarkInsertable(
      characterId: characterId,
      weaponId: weaponId,
      materialId: materialId,
      quantity: quantity,
      upperLevel: upperLevel,
      purposeType: purposeType,
    );
  }

  group("groupHash", () {
    test("Forwards the character, purpose and weapon of a weapon bookmark", () {
      final insertable = buildInsertable(weaponId: "weapon_1");

      expect(
        insertable.groupHash,
        generateBookmarkGroupHash(
          characterId: "char_1",
          type: BookmarkType.material,
          purposeType: Purpose.ascension,
          weaponId: "weapon_1",
        ),
      );
    });

    test("Forwards a null weapon id for a character bookmark", () {
      final insertable = buildInsertable(purposeType: Purpose.elementalSkill);

      expect(
        insertable.groupHash,
        generateBookmarkGroupHash(
          characterId: "char_1",
          type: BookmarkType.material,
          purposeType: Purpose.elementalSkill,
          weaponId: null,
        ),
      );
    });

    test("Never passes a bookmark id, so the last segment stays empty", () {
      expect(buildInsertable().groupHash, endsWith(":"));
    });

    test("Ignores the material id and the upper level", () {
      // Every item of one group shares the same group hash.
      expect(
        buildInsertable(materialId: "iron_chunk", upperLevel: 40).groupHash,
        buildInsertable(materialId: "mora", upperLevel: 90).groupHash,
      );
    });

    test("Memoizes the generated hash and returns the same instance", () {
      final insertable = buildInsertable();

      expect(identical(insertable.groupHash, insertable.groupHash), isTrue);
    });
  });

  group("hash", () {
    test("Forwards every element of the bookmark", () {
      final insertable = buildInsertable(
        weaponId: "weapon_1",
        materialId: "iron_chunk",
        upperLevel: 60,
        purposeType: Purpose.elementalBurst,
      );

      expect(
        insertable.hash,
        combineMaterialBookmarkElements(
          "char_1",
          Purpose.elementalBurst,
          "weapon_1",
          "iron_chunk",
          60,
        ),
      );
    });

    test("Forwards null for an exp bookmark with no material id", () {
      final insertable = buildInsertable(materialId: null);

      expect(
        insertable.hash,
        combineMaterialBookmarkElements(
          "char_1",
          Purpose.ascension,
          null,
          null,
          40,
        ),
      );
    });

    test("Differs between two upper levels of the same group", () {
      expect(
        buildInsertable(upperLevel: 40).hash,
        isNot(buildInsertable(upperLevel: 60).hash),
      );
    });

    test("Ignores the quantity", () {
      expect(
        buildInsertable(quantity: 1).hash,
        buildInsertable(quantity: 99).hash,
      );
    });
  });

  group("toGroupCompanion", () {
    test("Carries the group hash, the character and the order index", () {
      final insertable = buildInsertable(weaponId: "weapon_1");
      final companion = insertable.toGroupCompanion("a0");

      expect(companion.groupHash, Value(insertable.groupHash));
      expect(companion.characterId, const Value("char_1"));
      expect(companion.weaponId, const Value("weapon_1"));
      expect(companion.purposeType, const Value(Purpose.ascension));
      expect(companion.orderIndex, const Value("a0"));
    });

    test("Leaves the weapon id absent when it is null", () {
      final companion = buildInsertable().toGroupCompanion("a0");

      expect(companion.weaponId, const Value<WeaponId>.absent());
    });
  });

  group("toItemCompanion", () {
    test("Carries the item hash, the group hash and the quantities", () {
      final insertable = buildInsertable(quantity: 7, upperLevel: 60);
      final companion = insertable.toItemCompanion();

      expect(companion.hash, Value(insertable.hash));
      expect(companion.groupHash, Value(insertable.groupHash));
      expect(companion.materialId, const Value("iron_chunk"));
      expect(companion.quantity, const Value(7));
      expect(companion.upperLevel, const Value(60));
    });

    test("Leaves the material id absent for an exp bookmark", () {
      final companion = buildInsertable(materialId: null).toItemCompanion();

      expect(companion.materialId, const Value<MaterialId>.absent());
    });
  });

  group("ArtifactSetBookmarkInsertable", () {
    final insertable = ArtifactSetBookmarkInsertable(
      characterId: "char_1",
      sets: const ["gladiator", "shimenawa"],
      mainStats: const {"sands": "atk_percent", "circlet": null},
      subStats: const ["crit_rate", "crit_dmg"],
    );

    test("Carries the character, the sub stats and the order index", () {
      final companion = insertable.toArtifactCompanion("a0");

      expect(companion.characterId, const Value("char_1"));
      expect(companion.subStats, const Value(["crit_rate", "crit_dmg"]));
      expect(companion.orderIndex, const Value("a0"));
      // The row id is assigned by the database.
      expect(companion.id, const Value<int>.absent());
    });

    test("Carries the sets and the main stats under the given row id", () {
      final companion = insertable.toSetCompanion(12);

      expect(companion.id, const Value(12));
      expect(companion.sets, const Value(["gladiator", "shimenawa"]));
      expect(
        companion.mainStats,
        const Value({"sands": "atk_percent", "circlet": null}),
      );
    });
  });

  group("ArtifactPieceBookmarkInsertable", () {
    final insertable = ArtifactPieceBookmarkInsertable(
      characterId: "char_1",
      piece: "flower_of_life",
      mainStat: "hp",
      subStats: const ["crit_rate"],
    );

    test("Carries the character, the sub stats and the order index", () {
      final companion = insertable.toArtifactCompanion("a0");

      expect(companion.characterId, const Value("char_1"));
      expect(companion.subStats, const Value(["crit_rate"]));
      expect(companion.orderIndex, const Value("a0"));
      expect(companion.id, const Value<int>.absent());
    });

    test("Carries the piece and the main stat under the given row id", () {
      final companion = insertable.toPieceCompanion(34);

      expect(companion.id, const Value(34));
      expect(companion.piece, const Value("flower_of_life"));
      expect(companion.mainStat, const Value("hp"));
    });

    test("Leaves the main stat absent when it is null", () {
      final companion = ArtifactPieceBookmarkInsertable(
        characterId: "char_1",
        piece: "flower_of_life",
        mainStat: null,
        subStats: const [],
      ).toPieceCompanion(34);

      expect(companion.mainStat, const Value<StatId>.absent());
    });
  });
}
