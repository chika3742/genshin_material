import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/material_calculator.dart";

import "../../utils/asset_data.dart";

void main() {
  group("applyCrafting", () {
    // Listed out of rank order, so that the ranks have to be sorted by their
    // craft levels.
    final assetData = buildTestAssetData(
      materials: {
        for (final material in [
          buildTestMaterial(id: "book_3", groupId: "book", craftLevel: 3),
          buildTestMaterial(id: "book_1", groupId: "book", craftLevel: 1),
          buildTestMaterial(id: "book_2", groupId: "book", craftLevel: 2),
          buildTestMaterial(id: "gem_1", groupId: "gem", craftLevel: 1),
          buildTestMaterial(id: "gem_2", groupId: "gem", craftLevel: 2),
          buildTestMaterial(id: "boss"),
          buildTestMaterial(id: "levelless", groupId: "levelless"),
        ]) material.id: material,
      },
    );

    test("subtracts the needs from materials that cannot be crafted", () {
      final result = applyCrafting({"boss": 5, "levelless": 5}, {"boss": 2, "levelless": 7}, assetData);

      expect(result.effective, {"boss": 5, "levelless": 5});
      expect(result.remaining, {"boss": 3, "levelless": -2});
    });

    test("adds nothing for materials and groups missing from the bag counts", () {
      final result = applyCrafting({}, {"boss": 2, "book_1": 2}, assetData);

      expect(result.effective, isEmpty);
      expect(result.remaining, isEmpty);
    });

    test("treats a rank missing from the bag counts as zero", () {
      final result = applyCrafting({"book_1": 9, "book_3": 0}, {}, assetData);

      expect(result.effective, {"book_1": 9, "book_2": 3, "book_3": 1});
      expect(result.remaining, {"book_1": 9, "book_2": 0, "book_3": 0});
    });

    test("crafts nothing from a negative bag count", () {
      final result = applyCrafting({"book_1": -6, "book_2": 1, "book_3": 0}, {"book_2": 2}, assetData);

      expect(result.effective, {"book_1": -6, "book_2": 1, "book_3": 0});
      expect(result.remaining, {"book_1": -6, "book_2": -1, "book_3": 0});
    });

    group("effective", () {
      test("crafts the surplus over the own need up at 3:1, rounding down", () {
        final result = applyCrafting({"book_1": 10, "book_2": 0, "book_3": 0}, {"book_1": 2}, assetData);

        expect(result.effective, {"book_1": 10, "book_2": 2, "book_3": 0});
      });

      test("carries the surplus up through every rank above", () {
        final result = applyCrafting({"book_1": 9, "book_2": 2, "book_3": 0}, {"book_2": 2}, assetData);

        expect(result.effective, {"book_1": 9, "book_2": 5, "book_3": 1});
      });

      test("keeps the groups apart", () {
        final result = applyCrafting(
          {"book_1": 9, "book_2": 0, "book_3": 0, "gem_1": 0, "gem_2": 0},
          {},
          assetData,
        );

        expect(result.effective, {"book_1": 9, "book_2": 3, "book_3": 1, "gem_1": 0, "gem_2": 0});
      });
    });

    group("remaining", () {
      test("spends three of the rank below for each one crafted for a deficit", () {
        final result = applyCrafting({"book_1": 9, "book_2": 0, "book_3": 0}, {"book_2": 2}, assetData);

        expect(result.remaining, {"book_1": 3, "book_2": 0, "book_3": 0});
      });

      test("spends nothing below a rank that has enough", () {
        final result = applyCrafting({"book_1": 9, "book_2": 5, "book_3": 0}, {"book_2": 2}, assetData);

        expect(result.remaining, {"book_1": 9, "book_2": 3, "book_3": 0});
      });

      test("spends every rank below for a deficit higher up", () {
        final result = applyCrafting({"book_1": 27, "book_2": 0, "book_3": 0}, {"book_3": 1}, assetData);

        expect(result.remaining, {"book_1": 18, "book_2": 0, "book_3": 0});
      });

      test("keeps the own need of the rank below and leaves the uncovered deficit negative", () {
        final result = applyCrafting({"book_1": 9, "book_2": 0, "book_3": 0}, {"book_1": 3, "book_2": 3}, assetData);

        expect(result.remaining, {"book_1": 0, "book_2": -1, "book_3": 0});
      });
    });
  });
}
