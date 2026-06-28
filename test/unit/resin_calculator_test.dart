import "package:clock/clock.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/resin_calculator.dart";

void main() {
  group("calculateCurrentResin", () {
    test("returns null when currentResin is null", () {
      final result = calculateCurrentResin(
        currentResin: null,
        baseTime: DateTime(2024, 1, 1),
        maxResin: maxResin,
        minutesPerResin: minutesPerResinRecovery,
      );
      expect(result, isNull);
    });

    test("returns null when baseTime is null", () {
      final result = calculateCurrentResin(
        currentResin: 100,
        baseTime: null,
        maxResin: maxResin,
        minutesPerResin: minutesPerResinRecovery,
      );
      expect(result, isNull);
    });

    test("returns currentResin plus accumulated delta", () {
      final baseTime = DateTime(2024, 1, 1, 12, 0, 0);
      // 80 minutes later → 80 ~/ 8 = 10 resin gained
      final now = DateTime(2024, 1, 1, 13, 20, 0);

      final result = withClock(Clock.fixed(now), () {
        return calculateCurrentResin(
          currentResin: 100,
          baseTime: baseTime,
          maxResin: maxResin,
          minutesPerResin: minutesPerResinRecovery,
        );
      });

      expect(result, 110);
    });

    test("caps result at maxResin", () {
      final baseTime = DateTime(2024, 1, 1, 0, 0, 0);
      // 960 minutes later → 960 ~/ 8 = 120 resin gained; 150 + 120 = 270, capped at 200
      final now = DateTime(2024, 1, 1, 16, 0, 0);

      final result = withClock(Clock.fixed(now), () {
        return calculateCurrentResin(
          currentResin: 150,
          baseTime: baseTime,
          maxResin: maxResin,
          minutesPerResin: minutesPerResinRecovery,
        );
      });

      expect(result, maxResin);
    });

    test("returns maxResin when resin is already at max regardless of elapsed time", () {
      final baseTime = DateTime(2024, 1, 1, 12, 0, 0);
      final now = DateTime(2024, 1, 1, 12, 30, 0); // 30 minutes later

      final result = withClock(Clock.fixed(now), () {
        return calculateCurrentResin(
          currentResin: maxResin,
          baseTime: baseTime,
          maxResin: maxResin,
          minutesPerResin: minutesPerResinRecovery,
        );
      });

      expect(result, maxResin);
    });

    test("does not gain resin when elapsed time is less than minutesPerResin", () {
      final baseTime = DateTime(2024, 1, 1, 12, 0, 0);
      // 7 minutes later → 7 ~/ 8 = 0 resin gained
      final now = DateTime(2024, 1, 1, 12, 7, 0);

      final result = withClock(Clock.fixed(now), () {
        return calculateCurrentResin(
          currentResin: 100,
          baseTime: baseTime,
          maxResin: maxResin,
          minutesPerResin: minutesPerResinRecovery,
        );
      });

      expect(result, 100);
    });
  });
}
