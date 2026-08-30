import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/ui_core/katakana_compare.dart";

void main() {
  group("katakanaCompare", () {
    test("orders characters by the gojuon order", () {
      expect(katakanaCompare("ア", "イ"), isNegative);
      expect(katakanaCompare("イ", "ア"), isPositive);
      expect(katakanaCompare("ナ", "ハ"), isNegative);
      expect(katakanaCompare("ヲ", "ン"), isNegative);
    });

    test("returns 0 for equal strings", () {
      expect(katakanaCompare("アイウ", "アイウ"), 0);
    });

    test("puts a voiced kana after its plain form and before the next row", () {
      expect(katakanaCompare("カ", "ガ"), isNegative);
      expect(katakanaCompare("ガ", "キ"), isNegative);
    });

    test("puts a semi-voiced kana after the voiced one and before the next row", () {
      expect(katakanaCompare("ハ", "バ"), isNegative);
      expect(katakanaCompare("バ", "パ"), isNegative);
      expect(katakanaCompare("パ", "ヒ"), isNegative);
    });

    test("puts ヴ between ウ and エ", () {
      expect(katakanaCompare("ウ", "ヴ"), isNegative);
      expect(katakanaCompare("ヴ", "エ"), isNegative);
    });

    test("puts the shorter string first when one is a prefix of the other", () {
      expect(katakanaCompare("アイ", "アイウ"), isNegative);
      expect(katakanaCompare("アイウ", "アイ"), isPositive);
    });

    test("puts unknown characters after every known one", () {
      expect(katakanaCompare("ン", "A"), isNegative);
      expect(katakanaCompare("A", "ン"), isPositive);
    });

    // Small kana (ャ, ッ, ー and so on) are absent from the kana table, so they
    // are currently treated as unknown and sort after every ordinary kana.
    test("treats small kana as unknown characters", () {
      expect(katakanaCompare("キク", "キャ"), isNegative);
      expect(katakanaCompare("キャ", "キン"), isPositive);
    });

    test("sorts a list into the gojuon order when passed to List.sort", () {
      final names = ["ハク", "アオ", "Zzz", "バク", "アカ"];
      names.sort(katakanaCompare);

      expect(names, ["アオ", "アカ", "ハク", "バク", "Zzz"]);
    });
  });
}
