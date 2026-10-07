import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/utils/filtering.dart";

import "../../utils/asset_data.dart";

void main() {
  group("normalizeForSearch", () {
    test("lowercases the input", () {
      expect(normalizeForSearch("AbCd"), "abcd");
    });

    test("converts hiragana to katakana", () {
      expect(normalizeForSearch("あいうえお"), "アイウエオ");
    });

    test("leaves katakana and symbols untouched", () {
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

    test("returns an empty list for an empty query", () {
      expect(filterBySearchQuery(items, ""), isEmpty);
    });

    test("matches a katakana name with a hiragana query", () {
      expect(
        filterBySearchQuery(items, "あいあん").map((e) => e.id),
        ["iron_chunk"],
      );
    });

    test("matches case insensitively", () {
      expect(
        filterBySearchQuery(items, "MORA").map((e) => e.id),
        ["mora"],
      );
    });

    test("matches on jaPronunciation when the name does not match", () {
      expect(
        filterBySearchQuery(items, "モラ").map((e) => e.id),
        ["mora"],
      );
    });

    test("returns an empty list when nothing matches", () {
      expect(filterBySearchQuery(items, "存在しない名前"), isEmpty);
    });

    test("puts prefix matches first", () {
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
}
