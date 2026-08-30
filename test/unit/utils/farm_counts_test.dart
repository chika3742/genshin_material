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
    test("returns the entry whose target.ids contains the material id", () {
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

    test("checks target.ids instead of target.category when both are set", () {
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

    test("matches on category and rarity together", () {
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

    test("matches on category alone when the target rarity is null", () {
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

    test("returns null when neither ids nor category matches", () {
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

    test("returns the first matching entry", () {
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

    test("returns null when no entry matches", () {
      expect(calculateFarmCount(material, [], 10, 45, 2), isNull);
    });

    test("returns null when no drop rate covers the AR", () {
      final entry = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
        originalRate: const [DropRate(lowerAR: 45, rate: 0.5)],
      );

      expect(calculateFarmCount(material, [entry], 10, 40, 2), isNull);
    });

    test("uses the last covering AR band of an ascending originalRate", () {
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

    // getDropRateForAR uses lastWhereOrNull, so it picks the last covering
    // element in list order rather than the highest lowerAR. An unordered
    // originalRate therefore yields the wrong band. This pins the current
    // behaviour: the production code relies on the asset data being sorted
    // ascending, and does not enforce it.
    test("picks by list order, not by the highest lowerAR", () {
      final entry = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
        originalRate: const [
          DropRate(lowerAR: 45, rate: 0.5),
          DropRate(lowerAR: 35, rate: 0.25),
        ],
      );

      // Both bands cover AR 45, and the last one in the list wins, so the
      // 0.25 band is used even though 45 is the closest match.
      expect(calculateFarmCount(material, [entry], 10, 45, 2), 40);
    });

    test("multiplies the rate by condensedMultiplier when condensedAvailable", () {
      final entry = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
        originalRate: const [DropRate(lowerAR: 45, rate: 0.5)],
        condensedAvailable: true,
      );

      expect(calculateFarmCount(material, [entry], 10, 45, 2), 10);
    });

    test("rounds the result up", () {
      final entry = buildTestDropRateEntry(
        target: const DropRateTarget(category: "gems"),
        originalRate: const [DropRate(lowerAR: 45, rate: 0.3)],
      );

      expect(calculateFarmCount(material, [entry], 10, 45, 2), 34);
    });
  });
}
