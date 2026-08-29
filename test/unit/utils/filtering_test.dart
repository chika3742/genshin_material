import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/utils/filtering.dart";

import "../../utils/asset_data.dart";

Character _buildTestCharacterGroup({
  required String id,
  String weaponType = "",
}) {
  return Character.group(
    id: id,
    hyvIds: const [],
    name: const LocalizedText.untranslatable(text: ""),
    jaPronunciation: "",
    imageUrl: "",
    smallImageUrl: "",
    rarity: 5,
    weaponType: weaponType,
    variantIds: const [],
    materials: const {},
  );
}

Character _buildTestCharacterVariant({
  required String id,
  String weaponType = "",
}) {
  return Character.variant(
    id: id,
    parentId: "parent",
    name: const LocalizedText.untranslatable(text: ""),
    jaPronunciation: "",
    smallImageUrl: "",
    rarity: 5,
    element: "",
    weaponType: weaponType,
    talents: const {},
    materials: const {},
  );
}

void main() {
  group("normalizeForSearch", () {
    test("小文字化する", () {
      expect(normalizeForSearch("AbCd"), "abcd");
    });

    test("ひらがなをカタカナに変換する", () {
      expect(normalizeForSearch("あいうえお"), "アイウエオ");
    });

    test("カタカナと記号はそのまま残す", () {
      expect(normalizeForSearch("アイウ・エオ"), "アイウ・エオ");
    });
  });

  group("filterBySearchQuery", () {
    final items = [
      buildTestMaterial(
        id: "mora",
        name: const LocalizedText.untranslatable(text: "Mora"),
        jaPronunciation: "モラ",
      ),
      buildTestMaterial(
        id: "iron_chunk",
        name: const LocalizedText.untranslatable(text: "アイアンチャンク"),
        jaPronunciation: "アイアンチャンク",
      ),
    ];

    test("クエリが空なら空配列を返す", () {
      expect(filterBySearchQuery(items, ""), isEmpty);
    });

    test("ひらがなのクエリでカタカナの名前に一致する", () {
      expect(
        filterBySearchQuery(items, "あいあん").map((e) => e.id),
        ["iron_chunk"],
      );
    });

    test("大文字小文字を無視して一致する", () {
      expect(
        filterBySearchQuery(items, "MORA").map((e) => e.id),
        ["mora"],
      );
    });

    test("名前に無くても jaPronunciation で一致する", () {
      expect(
        filterBySearchQuery(items, "モラ").map((e) => e.id),
        ["mora"],
      );
    });

    test("どこにも一致しなければ空配列を返す", () {
      expect(filterBySearchQuery(items, "存在しない名前"), isEmpty);
    });

    test("前方一致した項目が先頭に来る", () {
      final sortTargets = [
        buildTestMaterial(
          id: "partial",
          name: const LocalizedText.untranslatable(text: "スーパーテスト"),
        ),
        buildTestMaterial(
          id: "prefix",
          name: const LocalizedText.untranslatable(text: "テストアイテム"),
        ),
      ];

      expect(
        filterBySearchQuery(sortTargets, "テスト").map((e) => e.id),
        ["prefix", "partial"],
      );
    });
  });

  group("filterCharactersByWeaponType", () {
    final characters = [
      buildTestCharacter(id: "sword_char", weaponType: "sword"),
      buildTestCharacter(id: "bow_char", weaponType: "bow"),
      _buildTestCharacterVariant(id: "sword_variant", weaponType: "sword"),
      _buildTestCharacterGroup(id: "group", weaponType: "sword"),
    ];

    test("weaponType が null なら CharacterOrVariant を全件返す", () {
      expect(
        filterCharactersByWeaponType(characters, null).map((e) => e.id),
        ["sword_char", "bow_char", "sword_variant"],
      );
    });

    test("weaponType が一致する CharacterOrVariant だけを返す", () {
      expect(
        filterCharactersByWeaponType(characters, "sword").map((e) => e.id),
        ["sword_char", "sword_variant"],
      );
    });

    test("CharacterOrVariant でない要素は weaponType が一致しても除外される", () {
      expect(
        filterCharactersByWeaponType(characters, "sword").map((e) => e.id),
        isNot(contains("group")),
      );
    });
  });
}
