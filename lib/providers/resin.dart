import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/pref_keys.dart";
import "../utils/resin_calculator.dart";
import "pref_notifier.dart";

part "resin.g.dart";

typedef ResinSnapshot = ({int? resin, DateTime? baseTime});

@riverpod
class ResinNotifier extends _$ResinNotifier {
  @override
  ResinSnapshot build() {
    final resin = ref.watch(prefProvider(PrefKeys.resin));
    final baseTime = ref.watch(prefProvider(PrefKeys.resinBaseTime));
    return (resin: resin, baseTime: baseTime);
  }

  Future<void> setResin(int? resin) async {
    final baseTime = DateTime.now();
    await ref.read(prefProvider(PrefKeys.resin).notifier).set(resin);
    await ref.read(prefProvider(PrefKeys.resinBaseTime).notifier).set(baseTime);
  }

  Future<void> setResinWithRecoveryTime(int resin, int recoveryTime) async {
    // When the synced resin is already at max and the locally calculated resin
    // is also at max, skip the update entirely. Updating only the stored resin
    // count (without adjusting the base time) would cause the wasted resin
    // calculation to produce an incorrect result.
    if (resin >= maxResin && state.baseTime != null) {
      final calculatedCurrent = calculateCurrentResin(
        currentResin: state.resin,
        baseTime: state.baseTime,
        maxResin: maxResin,
        minutesPerResin: minutesPerResinRecovery,
      );
      if (calculatedCurrent != null && calculatedCurrent >= maxResin) {
        return;
      }
    }

    await ref.read(prefProvider(PrefKeys.resin).notifier).set(resin);
    if (state.baseTime == null || resin < maxResin) {
      final offset = (maxResin - resin) * minutesPerResinRecovery * 60 - recoveryTime;
      final baseTime = DateTime.now().subtract(Duration(seconds: offset));
      await ref.read(prefProvider(PrefKeys.resinBaseTime).notifier).set(baseTime);
    }
  }
}
