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
}
