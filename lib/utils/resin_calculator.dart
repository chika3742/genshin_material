import "dart:math" as math;

import "package:clock/clock.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "resin_calculator.freezed.dart";

ResinCalculationResult calculateResinRecovery({
  required int currentResin,
  required DateTime baseTime,
  required int maxResin,
  required int minutesPerResin,
}) {
  final fullyReplenishedBy = Clock.fixed(baseTime).fromNowBy(
    _timeToFullFromResinCount(currentResin, maxResin, minutesPerResin),
  );
  final timeToFull = fullyReplenishedBy.difference(const Clock().now());
  final resinDelta = const Clock().now().difference(baseTime).inMinutes ~/ minutesPerResin;

  return ResinCalculationResult(
    fullyReplenishedBy: fullyReplenishedBy,
    timeToFull: timeToFull,
    currentResin: math.min(currentResin + resinDelta, maxResin),
    wastedResin: currentResin + resinDelta - maxResin,
  );
}

Duration _timeToFullFromResinCount(int currentResin, int maxResin, int minutesPerResin) {
  final diff = maxResin - currentResin;
  final minutes = diff * minutesPerResin;
  return Duration(minutes: minutes);
}

@freezed
class ResinCalculationResult with _$ResinCalculationResult {
  const factory ResinCalculationResult({
    required DateTime fullyReplenishedBy,
    required Duration timeToFull,
    required int currentResin,
    required int wastedResin,
  }) = _ResinCalculationResult;
}
