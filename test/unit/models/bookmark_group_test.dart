import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/utils/hash.dart";

import "../../utils/asset_data.dart";

void main() {
  const characterId = "char_1";
  const weaponId = "weapon_1";
  const characterRarity = 5;
  const weaponRarity = 4;

  // Character and weapon tables deliberately carry different ticks so that a
  // level range makes it obvious which of the two was consulted.
  const characterTicks = [1, 20, 40, 50, 60];
  const weaponTicks = [1, 25, 50, 70];

  Map<int, List<Ingredient>> levelsOf(List<int> ticks) {
    return {for (final tick in ticks) tick: const []};
  }

  final assetData = buildTestAssetData(
    characters: {
      characterId: buildTestCharacter(id: characterId, rarity: characterRarity),
    },
    weapons: {
      weaponId: buildTestWeapon(id: weaponId, rarity: weaponRarity),
    },
    characterIngredients: buildIngredientConfigurations(
      rarity: characterRarity,
      purpose: Purpose.ascension,
      levels: levelsOf(characterTicks),
    ),
    weaponIngredients: buildIngredientConfigurations(
      rarity: weaponRarity,
      purpose: Purpose.ascension,
      levels: levelsOf(weaponTicks),
    ),
  );

  BookmarkWithDetails buildMaterialBookmark({
    required int upperLevel,
    WeaponId? weaponId,
    String orderIndex = "a0",
    MaterialId? materialId = "iron_chunk",
  }) {
    final groupHash = generateBookmarkGroupHash(
      characterId: characterId,
      type: BookmarkType.material,
      purposeType: Purpose.ascension,
      weaponId: weaponId,
    );

    return BookmarkWithDetails.material(
      group: BookmarkMaterialGroup(
        groupHash: groupHash,
        characterId: characterId,
        weaponId: weaponId,
        purposeType: Purpose.ascension,
        createdAt: DateTime.utc(2024),
        orderIndex: orderIndex,
      ),
      item: BookmarkMaterialItem(
        hash: combineMaterialBookmarkElements(
          characterId,
          Purpose.ascension,
          weaponId,
          materialId,
          upperLevel,
        ),
        groupHash: groupHash,
        materialId: materialId,
        quantity: 1,
        upperLevel: upperLevel,
      ),
    );
  }

  BookmarkArtifact buildArtifact({
    int id = 7,
    String orderIndex = "b0",
  }) {
    return BookmarkArtifact(
      id: id,
      characterId: characterId,
      createdAt: DateTime.utc(2024),
      subStats: const ["crit_rate"],
      orderIndex: orderIndex,
    );
  }

  group("fromBookmarks with material bookmarks", () {
    test("Starts the level range at the tick before the lowest bookmark", () {
      final group = BookmarkGroup.fromBookmarks(
        [
          buildMaterialBookmark(upperLevel: 40),
          buildMaterialBookmark(upperLevel: 60),
        ],
        assetData,
      );

      // 40 sits at index 2 of the character ticks, so the range starts at 20.
      expect(group.levelRange!.start, 20);
      expect(group.levelRange!.end, 60);
    });

    test("Starts at 1 when the lowest bookmark is the first tick", () {
      final group = BookmarkGroup.fromBookmarks(
        [
          buildMaterialBookmark(upperLevel: 1),
          buildMaterialBookmark(upperLevel: 40),
        ],
        assetData,
      );

      expect(group.levelRange!.start, 1);
      expect(group.levelRange!.end, 40);
    });

    test("Starts at 1 when the lowest bookmark is the second tick", () {
      final group = BookmarkGroup.fromBookmarks(
        [buildMaterialBookmark(upperLevel: 20)],
        assetData,
      );

      expect(group.levelRange!.start, 1);
      expect(group.levelRange!.end, 20);
    });

    test("Starts at 1 when the lowest bookmark is absent from the table", () {
      // indexOf returns -1, which falls into the same branch as index 0.
      final group = BookmarkGroup.fromBookmarks(
        [buildMaterialBookmark(upperLevel: 45)],
        assetData,
      );

      expect(group.levelRange!.start, 1);
      expect(group.levelRange!.end, 45);
    });

    test("Sorts the bookmarks before picking the ends of the range", () {
      final group = BookmarkGroup.fromBookmarks(
        [
          buildMaterialBookmark(upperLevel: 60),
          buildMaterialBookmark(upperLevel: 40),
          buildMaterialBookmark(upperLevel: 50),
        ],
        assetData,
      );

      expect(group.levelRange!.start, 20);
      expect(group.levelRange!.end, 60);
    });

    test("Collapses a single bookmark into a one-step range", () {
      final group = BookmarkGroup.fromBookmarks(
        [buildMaterialBookmark(upperLevel: 50)],
        assetData,
      );

      expect(group.levelRange!.start, 40);
      expect(group.levelRange!.end, 50);
    });

    test("Reads the weapon table when the group carries a weapon id", () {
      final group = BookmarkGroup.fromBookmarks(
        [buildMaterialBookmark(upperLevel: 50, weaponId: weaponId)],
        assetData,
      );

      // 50 sits at index 2 of the weapon ticks, so the range starts at 25.
      // The character table would have produced 40 instead.
      expect(group.levelRange!.start, 25);
      expect(group.levelRange!.end, 50);
    });

    test("Takes the hash, the type and the character from the group row", () {
      final bookmarks = [buildMaterialBookmark(upperLevel: 40)];
      final group = BookmarkGroup.fromBookmarks(bookmarks, assetData);

      expect(
        group.hash,
        (bookmarks.first as BookmarkWithMaterialDetails).group.groupHash,
      );
      expect(group.type, BookmarkType.material);
      expect(group.characterId, characterId);
      expect(group.bookmarks, bookmarks);
    });

    test("Takes the order index from the group row", () {
      final group = BookmarkGroup.fromBookmarks(
        [buildMaterialBookmark(upperLevel: 40, orderIndex: "a5")],
        assetData,
      );

      expect(group.orderIndex, "a5");
    });

    test("Keeps working for an exp bookmark with no material id", () {
      final group = BookmarkGroup.fromBookmarks(
        [buildMaterialBookmark(upperLevel: 40, materialId: null)],
        assetData,
      );

      expect(group.levelRange!.start, 20);
      expect(group.levelRange!.end, 40);
    });

    test("Throws when the character is missing from the asset data", () {
      // assetData.characters[...] is force-unwrapped, so a character dropped by
      // an asset update takes the whole bookmark list down with it.
      expect(
        () => BookmarkGroup.fromBookmarks(
          [buildMaterialBookmark(upperLevel: 40)],
          buildTestAssetData(
            characterIngredients: assetData.characterIngredients,
          ),
        ),
        throwsA(isA<TypeError>()),
      );
    });

    test("Throws when the weapon is missing from the asset data", () {
      expect(
        () => BookmarkGroup.fromBookmarks(
          [buildMaterialBookmark(upperLevel: 50, weaponId: weaponId)],
          buildTestAssetData(
            characters: assetData.characters,
            weaponIngredients: assetData.weaponIngredients,
          ),
        ),
        throwsA(isA<TypeError>()),
      );
    });
  });

  group("fromBookmarks with artifact bookmarks", () {
    test("Uses the artifact row id as the hash of an artifact set", () {
      final artifact = buildArtifact(id: 12, orderIndex: "b3");
      final group = BookmarkGroup.fromBookmarks(
        [
          BookmarkWithDetails.artifactSet(
            artifact: artifact,
            artifactSet: const BookmarkArtifactSet(
              id: 12,
              sets: ["gladiator"],
              mainStats: {},
            ),
          ),
        ],
        assetData,
      );

      expect(group.hash, "12");
      expect(group.type, BookmarkType.artifactSet);
      expect(group.characterId, characterId);
      expect(group.orderIndex, "b3");
      expect(group.levelRange, isNull);
    });

    test("Uses the artifact row id as the hash of an artifact piece", () {
      final artifact = buildArtifact(id: 34, orderIndex: "b4");
      final group = BookmarkGroup.fromBookmarks(
        [
          BookmarkWithDetails.artifactPiece(
            artifact: artifact,
            artifactPiece: const BookmarkArtifactPiece(
              id: 34,
              piece: "flower_of_life",
            ),
          ),
        ],
        assetData,
      );

      expect(group.hash, "34");
      expect(group.type, BookmarkType.artifactPiece);
      expect(group.characterId, characterId);
      expect(group.orderIndex, "b4");
      expect(group.levelRange, isNull);
    });

    test("Never touches the asset data for artifact bookmarks", () {
      // Empty asset data would break the material branch, but not this one.
      final group = BookmarkGroup.fromBookmarks(
        [
          BookmarkWithDetails.artifactPiece(
            artifact: buildArtifact(),
            artifactPiece: const BookmarkArtifactPiece(
              id: 7,
              piece: "flower_of_life",
            ),
          ),
        ],
        buildTestAssetData(),
      );

      expect(group.hash, "7");
    });
  });

  group("asArtifactSet / asArtifactPiece", () {
    test("Returns the first bookmark cast to the artifact set variant", () {
      final bookmark = BookmarkWithDetails.artifactSet(
        artifact: buildArtifact(),
        artifactSet: const BookmarkArtifactSet(
          id: 7,
          sets: ["gladiator"],
          mainStats: {},
        ),
      );
      final group = BookmarkGroup.fromBookmarks([bookmark], assetData);

      expect(group.asArtifactSet(), bookmark);
    });

    test("Returns the first bookmark cast to the artifact piece variant", () {
      final bookmark = BookmarkWithDetails.artifactPiece(
        artifact: buildArtifact(),
        artifactPiece: const BookmarkArtifactPiece(
          id: 7,
          piece: "flower_of_life",
        ),
      );
      final group = BookmarkGroup.fromBookmarks([bookmark], assetData);

      expect(group.asArtifactPiece(), bookmark);
    });

    test("Throws when the group does not hold the expected variant", () {
      final group = BookmarkGroup.fromBookmarks(
        [buildMaterialBookmark(upperLevel: 40)],
        assetData,
      );

      expect(group.asArtifactSet, throwsA(isA<TypeError>()));
      expect(group.asArtifactPiece, throwsA(isA<TypeError>()));
    });
  });

  group("fromBookmarks with no bookmark", () {
    test("Fails the non-empty assertion", () {
      expect(
        () => BookmarkGroup.fromBookmarks([], assetData),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
