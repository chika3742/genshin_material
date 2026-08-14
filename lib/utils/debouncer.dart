import "dart:async";

import "package:flutter/foundation.dart";

class Debouncer {
  final Duration duration;

  Debouncer(this.duration);

  Timer? _timer;

  void call(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
