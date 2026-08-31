import "package:clock/clock.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/common.dart";

import "../../utils/asset_data.dart";

void main() {
  group("getSortPriority", () {
    final assetData = buildTestAssetData(
      materialSortOrder: const {
        "id:mora": 100,
        "category:local_specialty": 50,
      },
    );

    test("Prefers the id entry over the category entry", () {
      final material = buildTestMaterial(
        id: "mora",
        category: "local_specialty",
      );

      expect(material.getSortPriority(assetData), 100);
    });

    test("Falls back to the category entry when no id entry exists", () {
      final material = buildTestMaterial(
        id: "calla_lily",
        category: "local_specialty",
      );

      expect(material.getSortPriority(assetData), 50);
    });

    test("Falls back to 0 when neither entry exists", () {
      final material = buildTestMaterial(id: "unknown", category: "unknown");

      expect(material.getSortPriority(assetData), 0);
    });

    test("Falls back to 0 when the sort order table is empty", () {
      final material = buildTestMaterial(id: "mora", category: "currency");

      expect(material.getSortPriority(buildTestAssetData()), 0);
    });
  });

  group("getDailyMaterialAvailable", () {
    // 2026-06-29 is a Monday. At 12:00 UTC every server has already passed its
    // 4:00 daily reset, so all three of them report Monday.
    final mondayForEveryServer = DateTime.utc(2026, 6, 29, 12);

    test("Returns false when the material has no available days", () {
      final material = buildTestMaterial(id: "mora");

      withClock(Clock.fixed(mondayForEveryServer), () {
        for (final server in GameServer.values) {
          expect(material.getDailyMaterialAvailable(server), isFalse);
        }
      });
    });

    test("Returns false when the available days are empty", () {
      final material = buildTestMaterial(
        id: "teachings",
        availableDays: const [],
      );

      withClock(Clock.fixed(mondayForEveryServer), () {
        expect(material.getDailyMaterialAvailable(GameServer.asia), isFalse);
      });
    });

    test("Returns true when today is one of the available days", () {
      final material = buildTestMaterial(
        id: "teachings",
        availableDays: const [DayOfWeek.monday, DayOfWeek.thursday],
      );

      withClock(Clock.fixed(mondayForEveryServer), () {
        expect(material.getDailyMaterialAvailable(GameServer.asia), isTrue);
      });
    });

    test("Returns false when today is not one of the available days", () {
      final material = buildTestMaterial(
        id: "teachings",
        availableDays: const [DayOfWeek.tuesday, DayOfWeek.friday],
      );

      withClock(Clock.fixed(mondayForEveryServer), () {
        expect(material.getDailyMaterialAvailable(GameServer.asia), isFalse);
      });
    });

    test("Differs between servers at the same instant", () {
      // 2026-06-29 20:00 UTC: Asia has just crossed its reset into Tuesday
      // (UTC+8), while Europe and America are still on Monday.
      final acrossTheAsiaReset = DateTime.utc(2026, 6, 29, 20);
      final material = buildTestMaterial(
        id: "teachings",
        availableDays: const [DayOfWeek.monday],
      );

      withClock(Clock.fixed(acrossTheAsiaReset), () {
        expect(material.getDailyMaterialAvailable(GameServer.asia), isFalse);
        expect(material.getDailyMaterialAvailable(GameServer.europe), isTrue);
        expect(material.getDailyMaterialAvailable(GameServer.america), isTrue);
      });
    });
  });
}
