import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/drop_rates.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/utils/farm_counts.dart";

import "../../utils/asset_data.dart";

DropRateEntry buildTestDropRateEntry({
  DropRateTarget target = const DropRateTarget(),
  List<DropRate> originalRate = const [DropRate(lowerAR: 1, rate: 1)],
  bool condensedAvailable = false,
}) {
  return DropRateEntry(
    description: const LocalizedText.untranslatable(text: ""),
    target: target,
    originalRate: originalRate,
    condensedAvailable: condensedAvailable,
  );
}

void main() {
  group("getDropRateEntryForMaterial", () {
    test("target.ids に素材の id が含まれるエントリを返す", () {
      final byIds = buildTestDropRateEntry(
        target: const DropRateTarget(ids: ["gem_lv1"]),
      );

      expect(
        getDropRateEntryForMaterial(
          [byIds],
          buildTestMaterial(id: "gem_lv1", category: "gems", rarity: 3),
        ),
        byIds,
      );
    });

    test("target.ids は target.category より優先される", () {
      final byIds = buildTestDropRateEntry(
        target: const DropRateTarget(ids: ["other"], category: "gems"),
      );

      expect(
        getDropRateEntryForMaterial(
          [byIds],
          buildTestMaterial(id: "gem_lv1", category: "gems"),
        ),
        isNull,
      );
    });

    test("category と rarity の両方が一致すれば返す", () {
      final byCategory = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems", rarity: 3),
      );

      expect(
        getDropRateEntryForMaterial(
          [byCategory],
          buildTestMaterial(id: "gem_lv1", category: "gems", rarity: 3),
        ),
        byCategory,
      );
      expect(
        getDropRateEntryForMaterial(
          [byCategory],
          buildTestMaterial(id: "gem_lv1", category: "gems", rarity: 4),
        ),
        isNull,
      );
    });

    test("rarity が null なら category だけで一致する", () {
      final byCategory = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
      );

      expect(
        getDropRateEntryForMaterial(
          [byCategory],
          buildTestMaterial(id: "gem_lv1", category: "gems", rarity: 4),
        ),
        byCategory,
      );
    });

    test("ids にも category にも当たらなければ null", () {
      expect(
        getDropRateEntryForMaterial(
          [
            buildTestDropRateEntry(target: const DropRateTarget(ids: ["other"])),
            buildTestDropRateEntry(target: const DropRateTarget(category: "other")),
            buildTestDropRateEntry(),
          ],
          buildTestMaterial(id: "gem_lv1", category: "gems"),
        ),
        isNull,
      );
    });

    test("先に一致したエントリを返す", () {
      final first = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
      );
      final second = buildTestDropRateEntry(
        target: const DropRateTarget(ids: ["gem_lv1"]),
      );

      expect(
        getDropRateEntryForMaterial(
          [first, second],
          buildTestMaterial(id: "gem_lv1", category: "gems"),
        ),
        first,
      );
    });
  });

  group("calculateFarmCount", () {
    final material = buildTestMaterial(id: "gem_lv1", category: "gems");

    test("該当するエントリが無ければ null", () {
      expect(calculateFarmCount(material, [], 10, 45, 2), isNull);
    });

    test("AR に対応するドロップ率が無ければ null", () {
      final entry = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
        originalRate: const [DropRate(lowerAR: 45, rate: 0.5)],
      );

      expect(calculateFarmCount(material, [entry], 10, 40, 2), isNull);
    });

    test("AR 以下で最も高い AR 帯のドロップ率を使う", () {
      final entry = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
        originalRate: const [
          DropRate(lowerAR: 35, rate: 0.25),
          DropRate(lowerAR: 45, rate: 0.5),
        ],
      );

      expect(calculateFarmCount(material, [entry], 10, 45, 2), 20);
      expect(calculateFarmCount(material, [entry], 10, 40, 2), 40);
    });

    test("condensedAvailable なら condensedMultiplier が乗算される", () {
      final entry = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
        originalRate: const [DropRate(lowerAR: 45, rate: 0.5)],
        condensedAvailable: true,
      );

      expect(calculateFarmCount(material, [entry], 10, 45, 2), 10);
    });

    test("結果は切り上げられる", () {
      final entry = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
        originalRate: const [DropRate(lowerAR: 45, rate: 0.3)],
      );

      expect(calculateFarmCount(material, [entry], 10, 45, 2), 34);
    });
  });
}
