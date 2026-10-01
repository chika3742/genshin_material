import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../providers/login_bonus_state.dart";
import "use_periodic_timer.dart";

const _recheckInterval = Duration(minutes: 1);

/// Starts fetching the login bonus state at launch, and re-checks it on every
/// resume and every [_recheckInterval] while the app is in the foreground.
///
/// Call this only once, from the app root: each call adds its own triggers.
void useLoginBonusStateRefresher(WidgetRef ref) {
  // Keeps the provider alive without rebuilding the caller.
  ref.listen(loginBonusStateProvider, (_, _) {});

  useOnAppLifecycleStateChange((_, current) {
    if (current == .resumed && !ref.read(loginBonusStateProvider).isLoading) {
      ref.invalidate(loginBonusStateProvider);
    }
  });

  usePeriodicTimer(_recheckInterval, (_) {
    if (WidgetsBinding.instance.lifecycleState case .detached || .hidden || .paused) {
      return;
    }
    // A failed fetch waits for the next resume instead of being retried every
    // tick.
    final state = ref.read(loginBonusStateProvider);
    if (!state.isLoading && !state.hasError) {
      ref.invalidate(loginBonusStateProvider);
    }
  });
}
