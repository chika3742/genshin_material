import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/utils/hash.dart";

// These strings are stored as database primary keys, so the expected values
// are pinned as literals to catch any change to their format.
void main() {
  group("combineMaterialBookmarkElements", () {
    test("joins every element when all of them are present", () {
      expect(
        combineMaterialBookmarkElements(
          "char_1",
          Purpose.ascension,
          "weapon_1",
          "gem_lv1",
          40,
        ),
        "gem_lv1:char_1:Purpose.ascension:weapon_1:40",
      );
    });

    test("writes an empty segment for a null weaponId", () {
      expect(
        combineMaterialBookmarkElements(
          "char_1",
          Purpose.normalAttack,
          null,
          "gem_lv1",
          40,
        ),
        "gem_lv1:char_1:Purpose.normalAttack::40",
      );
    });

    test("writes an empty segment for a null materialId", () {
      expect(
        combineMaterialBookmarkElements(
          "char_1",
          Purpose.elementalSkill,
          "weapon_1",
          null,
          40,
        ),
        ":char_1:Purpose.elementalSkill:weapon_1:40",
      );
    });

    test("writes empty segments when both materialId and weaponId are null", () {
      expect(
        combineMaterialBookmarkElements(
          "char_1",
          Purpose.elementalBurst,
          null,
          null,
          90,
        ),
        ":char_1:Purpose.elementalBurst::90",
      );
    });
  });

  group("generateBookmarkGroupHash", () {
    test("joins every element when all of them are present", () {
      expect(
        generateBookmarkGroupHash(
          characterId: "char_1",
          type: BookmarkType.material,
          purposeType: Purpose.ascension,
          weaponId: "weapon_1",
          bookmarkId: 3,
        ),
        "char_1:material:ascension:weapon_1:3",
      );
    });

    test("writes empty segments for the omitted optional elements", () {
      expect(
        generateBookmarkGroupHash(
          characterId: "char_1",
          type: BookmarkType.material,
        ),
        "char_1:material:::",
      );
    });

    test("writes only the bookmarkId for the artifact types", () {
      expect(
        generateBookmarkGroupHash(
          characterId: "char_1",
          type: BookmarkType.artifactSet,
          bookmarkId: 12,
        ),
        "char_1:artifactSet:::12",
      );
      expect(
        generateBookmarkGroupHash(
          characterId: "char_1",
          type: BookmarkType.artifactPiece,
          bookmarkId: 12,
        ),
        "char_1:artifactPiece:::12",
      );
    });
  });
}
