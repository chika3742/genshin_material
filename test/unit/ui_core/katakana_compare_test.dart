import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/ui_core/katakana_compare.dart";

void main() {
  group("katakanaCompare", () {
    test("五十音順に並ぶ", () {
      expect(katakanaCompare("ア", "イ"), isNegative);
      expect(katakanaCompare("イ", "ア"), isPositive);
      expect(katakanaCompare("ナ", "ハ"), isNegative);
      expect(katakanaCompare("ヲ", "ン"), isNegative);
    });

    test("同じ文字列なら 0 を返す", () {
      expect(katakanaCompare("アイウ", "アイウ"), 0);
    });

    test("濁音は清音の後、次の行の清音の前に来る", () {
      expect(katakanaCompare("カ", "ガ"), isNegative);
      expect(katakanaCompare("ガ", "キ"), isNegative);
    });

    test("半濁音は濁音の後、次の行の清音の前に来る", () {
      expect(katakanaCompare("ハ", "バ"), isNegative);
      expect(katakanaCompare("バ", "パ"), isNegative);
      expect(katakanaCompare("パ", "ヒ"), isNegative);
    });

    test("ヴ は ウ と エ の間に来る", () {
      expect(katakanaCompare("ウ", "ヴ"), isNegative);
      expect(katakanaCompare("ヴ", "エ"), isNegative);
    });

    test("前方が一致する場合は短い方が先に来る", () {
      expect(katakanaCompare("アイ", "アイウ"), isNegative);
      expect(katakanaCompare("アイウ", "アイ"), isPositive);
    });

    test("未知の文字は既知のどの文字よりも後に来る", () {
      expect(katakanaCompare("ン", "A"), isNegative);
      expect(katakanaCompare("A", "ン"), isPositive);
    });

    // 小書き文字（ャ・ッ・ー など）は五十音表に含まれていないため、
    // 現状は未知の文字として扱われ、どの通常のカナよりも後ろに並ぶ。
    test("小書き文字は未知の文字として扱われる", () {
      expect(katakanaCompare("キク", "キャ"), isNegative);
      expect(katakanaCompare("キャ", "キン"), isPositive);
    });

    test("List.sort に渡すと五十音順に並ぶ", () {
      final names = ["ハク", "アオ", "Zzz", "バク", "アカ"];
      names.sort(katakanaCompare);

      expect(names, ["アオ", "アカ", "ハク", "バク", "Zzz"]);
    });
  });
}
