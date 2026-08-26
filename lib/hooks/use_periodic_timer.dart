import "dart:async";

import "package:flutter/cupertino.dart";
import "package:flutter_hooks/flutter_hooks.dart";

void usePeriodicTimer(Duration duration, void Function(Timer timer) callback) {
  use(_PeriodicTimerHook(duration, callback));
}

class _PeriodicTimerHook extends Hook<void> {
  final Duration duration;
  final void Function(Timer timer) callback;

  const _PeriodicTimerHook(this.duration, this.callback);

  @override
  HookState<void, _PeriodicTimerHook> createState() => _PeriodicTimerHookState();
}

class _PeriodicTimerHookState extends HookState<void, _PeriodicTimerHook> {
  late Timer _timer;

  @override
  void initHook() {
    _timer = Timer.periodic(hook.duration, hook.callback);
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    _timer.cancel();
  }
}
