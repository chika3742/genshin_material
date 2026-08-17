import "package:clock/clock.dart";
import "package:material_ui/material_ui.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/utils/daily_material_weekday.dart";
import "package:timezone/data/latest_10y.dart" as tz;
import "package:timezone/timezone.dart" as tz;

void main() {
  test("getCurrentDailyMaterialWeekday", () {
    // 2024-08-23 19:00 UTC (Server Time: 2024-08-24 03:00 UTC+8) before daily reset
    withClock(Clock.fixed(DateTime.utc(2024, 8, 23, 19, 0)), () {
      expect(getCurrentDailyMaterialWeekday(GameServer.asia), DateTime.friday);
    });
    // 2024-08-23 20:00 UTC (Server Time: 2024-08-24 04:00 UTC+8) after daily reset
    withClock(Clock.fixed(DateTime.utc(2024, 8, 23, 20, 0)), () {
      expect(getCurrentDailyMaterialWeekday(GameServer.asia), DateTime.saturday);
    });
  });

  group("getDailyMaterialWeekdayAt", () {
    // 2026/6/28 is a Sunday and 2026/6/29 is a Monday, so each pair below
    // straddles that server's 4:00 daily reset.
    test("Switches the weekday at the daily reset on the Asia server", () {
      expect(
        getDailyMaterialWeekdayAt(DateTime.utc(2026, 6, 28, 19, 59), GameServer.asia),
        DateTime.sunday,
      );
      expect(
        getDailyMaterialWeekdayAt(DateTime.utc(2026, 6, 28, 20, 0), GameServer.asia),
        DateTime.monday,
      );
    });

    test("Switches the weekday at the daily reset on the Europe server", () {
      expect(
        getDailyMaterialWeekdayAt(DateTime.utc(2026, 6, 29, 2, 59), GameServer.europe),
        DateTime.sunday,
      );
      expect(
        getDailyMaterialWeekdayAt(DateTime.utc(2026, 6, 29, 3, 0), GameServer.europe),
        DateTime.monday,
      );
    });

    test("Switches the weekday at the daily reset on the America server", () {
      expect(
        getDailyMaterialWeekdayAt(DateTime.utc(2026, 6, 29, 8, 59), GameServer.america),
        DateTime.sunday,
      );
      expect(
        getDailyMaterialWeekdayAt(DateTime.utc(2026, 6, 29, 9, 0), GameServer.america),
        DateTime.monday,
      );
    });
  });

  group("getDailyMaterialUpdateTimeInLocalTime", () {
    setUpAll(tz.initializeTimeZones);

    test("Converts the server reset time into Asia/Tokyo local time", () {
      tz.setLocalLocation(tz.getLocation("Asia/Tokyo"));

      withClock(Clock.fixed(DateTime.utc(2026, 6, 29, 12)), () {
        expect(
          getDailyMaterialUpdateTimeInLocalTime(GameServer.asia),
          const TimeOfDay(hour: 5, minute: 0),
        );
        expect(
          getDailyMaterialUpdateTimeInLocalTime(GameServer.europe),
          const TimeOfDay(hour: 12, minute: 0),
        );
        expect(
          getDailyMaterialUpdateTimeInLocalTime(GameServer.america),
          const TimeOfDay(hour: 18, minute: 0),
        );
      });
    });

    test("Follows the DST offset of the local timezone", () {
      tz.setLocalLocation(tz.getLocation("America/New_York"));

      // Summer: EDT (UTC-4)
      withClock(Clock.fixed(DateTime.utc(2026, 6, 29, 12)), () {
        expect(
          getDailyMaterialUpdateTimeInLocalTime(GameServer.asia),
          const TimeOfDay(hour: 16, minute: 0),
        );
      });
      // Winter: EST (UTC-5)
      withClock(Clock.fixed(DateTime.utc(2026, 1, 15, 12)), () {
        expect(
          getDailyMaterialUpdateTimeInLocalTime(GameServer.asia),
          const TimeOfDay(hour: 15, minute: 0),
        );
      });
    });
  });
}
