import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/utils/hash.dart";

// これらの文字列は DB の主キーとして保存されるため、期待値をリテラルで固定して
// 出力形式の変更を回帰として検出する。
void main() {
  group("combineMaterialBookmarkElements", () {
    test("すべての要素が揃っているとき", () {
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

    test("weaponId が null なら空文字になる", () {
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

    test("materialId が null なら空文字になる", () {
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

    test("materialId と weaponId の両方が null のとき", () {
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
    test("すべての要素が揃っているとき", () {
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

    test("任意の要素が null なら空文字になる", () {
      expect(
        generateBookmarkGroupHash(
          characterId: "char_1",
          type: BookmarkType.material,
        ),
        "char_1:material:::",
      );
    });

    test("artifactSet は bookmarkId のみを持つ", () {
      expect(
        generateBookmarkGroupHash(
          characterId: "char_1",
          type: BookmarkType.artifactSet,
          bookmarkId: 12,
        ),
        "char_1:artifactSet:::12",
      );
    });

    test("artifactPiece は bookmarkId のみを持つ", () {
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
