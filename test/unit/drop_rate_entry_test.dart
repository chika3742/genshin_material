import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/drop_rates.dart";
import "package:genshin_material/models/localized_text.dart";

void main() {
  test("DropRateEntry.getDropRateForAR", () {
    final data = DropRateEntry(
      description: LocalizedText(locales: {}),
      target: DropRateTarget(),
      originalRate: [
        DropRate(lowerAR: 20, rate: 1.0),
        DropRate(lowerAR: 30, rate: 2.0),
        DropRate(lowerAR: 40, rate: 3.0),
      ],
      condensedAvailable: false,
    );

    expect(data.getDropRateForAR(20), 1.0);
    expect(data.getDropRateForAR(25), 1.0);
    expect(data.getDropRateForAR(35), 2.0);
    expect(data.getDropRateForAR(15), null);
    expect(data.getDropRateForAR(45), 3.0);
  });

  group("DropRateEntry.getDropRateForAR boundaries", () {
    DropRateEntry buildEntry(List<DropRate> originalRate) {
      return DropRateEntry(
        description: LocalizedText(locales: {}),
        target: DropRateTarget(),
        originalRate: originalRate,
        condensedAvailable: false,
      );
    }

    final entry = buildEntry([
      DropRate(lowerAR: 20, rate: 1.0),
      DropRate(lowerAR: 30, rate: 2.0),
      DropRate(lowerAR: 40, rate: 3.0),
    ]);

    test("returns null below the lowest AR of the table", () {
      expect(entry.getDropRateForAR(19), null);
      expect(entry.getDropRateForAR(0), null);
    });

    test("returns the rate of each exact boundary", () {
      expect(entry.getDropRateForAR(20), 1.0);
      expect(entry.getDropRateForAR(30), 2.0);
      expect(entry.getDropRateForAR(40), 3.0);
    });

    test("returns the previous rate just below a boundary", () {
      expect(entry.getDropRateForAR(29), 1.0);
      expect(entry.getDropRateForAR(39), 2.0);
    });

    test("keeps the last rate above the highest AR of the table", () {
      expect(entry.getDropRateForAR(41), 3.0);
      expect(entry.getDropRateForAR(60), 3.0);
    });

    test("returns null for an empty table", () {
      expect(buildEntry([]).getDropRateForAR(60), null);
    });

    test("handles a table with a single entry", () {
      final single = buildEntry([DropRate(lowerAR: 35, rate: 5.0)]);

      expect(single.getDropRateForAR(34), null);
      expect(single.getDropRateForAR(35), 5.0);
      expect(single.getDropRateForAR(99), 5.0);
    });

    test("returns the last matching entry when a boundary is duplicated", () {
      // lastWhereOrNull scans from the end, so the later row wins.
      final duplicated = buildEntry([
        DropRate(lowerAR: 20, rate: 1.0),
        DropRate(lowerAR: 20, rate: 9.0),
      ]);

      expect(duplicated.getDropRateForAR(20), 9.0);
    });
  });
}
