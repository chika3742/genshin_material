import "package:async/async.dart";
import "package:flutter_test/flutter_test.dart";

/// Wraps [stream] in a [StreamQueue] and cancels it in a tear-down.
///
/// Awaiting [StreamQueue.next] waits for the emission itself, so a test never
/// has to guess how long a drift query stream takes to re-run its query. An
/// emission that never arrives fails the test by timing out rather than by
/// racing a fixed delay.
StreamQueue<T> createStreamQueue<T>(Stream<T> stream) {
  final queue = StreamQueue(stream);
  addTearDown(queue.cancel);
  return queue;
}
