import "dart:math";

final _kanaOrder = [
  "ア","イ","ウ","ヴ","エ","オ",
  "カ","ガ","キ","ギ","ク","グ","ケ","ゲ","コ","ゴ",
  "サ","ザ","シ","ジ","ス","ズ","セ","ゼ","ソ","ゾ",
  "タ","ダ","チ","ヂ","ツ","ヅ","テ","デ","ト","ド",
  "ナ","ニ","ヌ","ネ","ノ",
  "ハ","バ","パ","ヒ","ビ","ピ","フ","ブ","プ","ヘ","ベ","ペ","ホ","ボ","ポ",
  "マ","ミ","ム","メ","モ",
  "ヤ","ユ","ヨ",
  "ラ","リ","ル","レ","ロ",
  "ワ","ヲ","ン",
];

final Map<String, int> _kanaToNum = {
  for (var i = 0; i < _kanaOrder.length; i++) _kanaOrder[i]: i,
};

List<int> _toKanaKey(String text) {
  return text.split("").map((c) => _kanaToNum[c] ?? 999).toList();
}

int katakanaCompare(String a, String b) {
  final ak = _toKanaKey(a);
  final bk = _toKanaKey(b);
  final len = min(ak.length, bk.length);

  for (var i = 0; i < len; i++) {
    if (ak[i] != bk[i]) return ak[i].compareTo(bk[i]);
  }
  return ak.length.compareTo(bk.length);
}
