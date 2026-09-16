import "dart:async";
import "dart:collection";

import "package:clock/clock.dart";

/// Serializes API calls so that at least [interval] passes between the end of
/// one request and the start of the next one.
class ApiRequestQueue {
  ApiRequestQueue({required this.interval});

  final Duration interval;
  final Queue<Future<void> Function()> _queue = Queue();
  bool _isProcessing = false;
  DateTime? _lastRun;

  Future<T> run<T>(FutureOr<T> Function() action) async {
    final completer = Completer<T>();
    _queue.add(() async {
      try {
        final result = await action();
        completer.complete(result);
      } catch (e, st) {
        completer.completeError(e, st);
      }
    });

    if (!_isProcessing) {
      _processQueue();
    }

    return completer.future;
  }

  Future<void> _processQueue() async {
    _isProcessing = true;
    while (_queue.isNotEmpty) {
      final now = clock.now();
      if (_lastRun != null && now.difference(_lastRun!) < interval) {
        await Future.delayed(interval - now.difference(_lastRun!));
      }
      final task = _queue.removeFirst();
      await task();
      _lastRun = clock.now();
    }
    _isProcessing = false;
  }
}
