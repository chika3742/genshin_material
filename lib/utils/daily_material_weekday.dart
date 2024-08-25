import "package:clock/clock.dart";
import "package:flutter/material.dart";

import "../models/common.dart";

const dailyResetTime = TimeOfDay(hour: 4, minute: 0);

int getCurrentDailyMaterialWeekday(GameServer server) {
  var now = clock.now().toUtc();
  now = now.add(server.serverTimeZoneOffset);
  now = now.subtract(Duration(hours: dailyResetTime.hour, minutes: dailyResetTime.minute));

  return now.weekday;
}
