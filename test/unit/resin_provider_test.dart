import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:genshin_material/providers/resin.dart";
import "package:genshin_material/utils/resin_calculator.dart";

import "../utils/in_memory_pref_notifier.dart";

void main() {
  late ProviderContainer container;
  late ResinNotifier notifier;

  setUp(() {
    container = ProviderContainer.test(overrides: [
      prefProvider(PrefKeys.resin).overrideWith(() => InMemoryPrefNotifier(null)),
      prefProvider(PrefKeys.resinBaseTime).overrideWith(() => InMemoryPrefNotifier(null)),
    ]);
    notifier = container.read(resinProvider.notifier);
  });

  group("setResinWithRecoveryTime", () {
    test(
      "does not update state when both synced and local resin are at max",
          () async {
        // Arrange: set local resin to max
        await notifier.setResin(maxResin);
        final baseTimeBefore =
            container.read(resinProvider).baseTime;

        // Act: sync with HoYoLAB reporting max resin (already at max locally)
        await notifier.setResinWithRecoveryTime(maxResin, 0);

        // Assert: state is unchanged because the guard returned early
        final state = container.read(resinProvider);
        expect(state.resin, maxResin);
        expect(state.baseTime, baseTimeBefore);
      },
    );

    test("updates resin when synced value is below max", () async {
      // Arrange: local resin at max
      await notifier.setResin(maxResin);

      // Act: sync with resin below max
      const syncedResin = 150;
      await notifier.setResinWithRecoveryTime(syncedResin, 10 * 60);

      // Assert: resin is updated to the synced value
      expect(container.read(resinProvider).resin, syncedResin);
    });

    test("sets base time when no base time is stored yet", () async {
      // Arrange: fresh state — baseTime is null
      expect(container.read(resinProvider).baseTime, isNull);

      // Act: sync with max resin when there is no prior base time
      await notifier.setResinWithRecoveryTime(maxResin, 0);

      // Assert: resin and base time are both stored
      final state = container.read(resinProvider);
      expect(state.resin, maxResin);
      expect(state.baseTime, isNotNull);
    });

    test(
      "updates resin when synced value is max but local calculated resin is below max",
          () async {
        // Arrange: local resin at 190 with a just-set base time,
        // so calculatedCurrent ≈ 190 which is below maxResin.
        await notifier.setResin(190);

        // Act: sync reports max resin
        await notifier.setResinWithRecoveryTime(maxResin, 0);

        // Assert: resin is updated (guard did not activate)
        expect(container.read(resinProvider).resin, maxResin);
      },
    );
  });
}
