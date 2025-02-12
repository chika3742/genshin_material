import "dart:math" as math;

import "package:clock/clock.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "resin_calculator.freezed.dart";

const maxResin = 200;
const minutesPerResinRecovery = 8;
const breakpoints = [40, 80, 120, 160];

ResinCalculationResult calculateResinRecovery({
  required int currentResin,
  required DateTime baseTime,
  required int maxResin,
  required int minutesPerResin,
}) {
  final fullyReplenishedBy = Clock.fixed(baseTime).fromNowBy(
    _timeToFullFromResinCount(currentResin, maxResin, minutesPerResin),
  );
  final timeToFull = fullyReplenishedBy.difference(clock.now());
  final resinDelta = clock.now().difference(baseTime).inMinutes ~/ minutesPerResin;

  final breakpointsResult = <ResinBreakpoint>[];
  for (final bp in breakpoints) {
    final fullyReplenishedBy = Clock.fixed(baseTime).fromNowBy(
      _timeToFullFromResinCount(currentResin, bp, minutesPerResin),
    );
    final timeToFull = fullyReplenishedBy.difference(clock.now());
    if (!timeToFull.isNegative) {
      breakpointsResult.add(ResinBreakpoint(
        resin: bp,
        fullyReplenishedBy: fullyReplenishedBy,
        timeToFull: timeToFull,
      ),);
    }
  }

  return ResinCalculationResult(
    fullyReplenishedBy: fullyReplenishedBy,
    timeToFull: timeToFull,
    currentResin: math.min(currentResin + resinDelta, maxResin),
    wastedResin: math.min(currentResin, maxResin) + resinDelta - maxResin,
    breakpoints: breakpointsResult,
  );
}

int? calculateCurrentResin({
  required int? currentResin,
  required DateTime? baseTime,
  required int maxResin,
  required int minutesPerResin,
}) {
  if (currentResin == null || baseTime == null) {
    return null;
  }

  final resinDelta = const Clock().now().difference(baseTime).inMinutes ~/ minutesPerResin;
  return math.min(currentResin + resinDelta, maxResin);
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
    required List<ResinBreakpoint> breakpoints,
  }) = _ResinCalculationResult;
}

@freezed
class ResinBreakpoint with _$ResinBreakpoint {
  const factory ResinBreakpoint({
    required int resin,
    required DateTime fullyReplenishedBy,
    required Duration timeToFull,
  }) = _ResinBreakpoint;
}
