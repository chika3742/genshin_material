import "package:clock/clock.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/utils/daily_material_weekday.dart";

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
}
