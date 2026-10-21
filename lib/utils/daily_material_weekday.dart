import "package:clock/clock.dart";
import "package:material_ui/material_ui.dart";
import "package:timezone/timezone.dart" as tz;

import "../models/common.dart";

const dailyResetTime = TimeOfDay(hour: 4, minute: 0);

int getCurrentDailyMaterialWeekday(GameServer server) {
  return getDailyMaterialWeekdayAt(clock.now(), server);
}

int getDailyMaterialWeekdayAt(DateTime instant, GameServer server) {
  instant = instant.toUtc();
  instant = instant.add(server.serverTimeZoneOffset);
  instant = instant.subtract(Duration(hours: dailyResetTime.hour, minutes: dailyResetTime.minute));

  return instant.weekday;
}

TimeOfDay getDailyMaterialUpdateTimeInLocalTime(GameServer server) {
  final serverTime = clock.now().toUtc().copyWith(
    hour: dailyResetTime.hour,
    minute: dailyResetTime.minute,
  ).subtract(server.serverTimeZoneOffset);
  final localTime = tz.TZDateTime.from(serverTime, tz.local).toLocal();
  return TimeOfDay(hour: localTime.hour, minute: localTime.minute);
}
