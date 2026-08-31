import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/hoyolab_api.dart";

const _interval = Duration(milliseconds: 500);

/// Slightly past [_interval]: the queue subtracts the wall-clock time already
/// spent from the delay it schedules, so the pending timer is never longer than
/// the interval itself.
const _pastInterval = Duration(milliseconds: 600);

void main() {
  late ApiRequestQueue queue;

  setUp(() {
    queue = ApiRequestQueue(interval: _interval);
  });

  testWidgets("runs the first action without waiting", (tester) async {
    final ran = <int>[];

    final first = queue.run(() => ran.add(1));
    await tester.pump();

    expect(ran, [1]);
    await first;
  });

  testWidgets("keeps the minimum interval between two actions", (tester) async {
    final ran = <int>[];

    final first = queue.run(() => ran.add(1));
    final second = queue.run(() => ran.add(2));

    await tester.pump();
    expect(ran, [1], reason: "the second action must not run immediately");

    await tester.pump(const Duration(milliseconds: 400));
    expect(ran, [1], reason: "the interval has not elapsed yet");

    await tester.pump(const Duration(milliseconds: 200));
    expect(ran, [1, 2]);

    await first;
    await second;
  });

  testWidgets("spaces out every action of a longer queue", (tester) async {
    final ran = <int>[];
    final pending = [
      queue.run(() => ran.add(1)),
      queue.run(() => ran.add(2)),
      queue.run(() => ran.add(3)),
    ];

    await tester.pump();
    expect(ran, [1]);

    await tester.pump(_pastInterval);
    expect(ran, [1, 2]);

    await tester.pump(_pastInterval);
    expect(ran, [1, 2, 3]);

    await Future.wait(pending);
  });

  testWidgets("runs the actions in the order they were submitted",
      (tester) async {
    final ran = <int>[];
    final pending = [
      for (var i = 0; i < 4; i++)
        queue.run(() async {
          await Future<void>.delayed(const Duration(milliseconds: 100));
          ran.add(i);
        }),
    ];

    await tester.pump();
    await tester.pump(const Duration(seconds: 5));

    expect(ran, [0, 1, 2, 3]);
    await Future.wait(pending);
  });

  testWidgets("measures the interval from the end of the previous action",
      (tester) async {
    final ran = <int>[];

    final first = queue.run(() async {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      ran.add(1);
    });
    final second = queue.run(() => ran.add(2));

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(ran, [1], reason: "the first action has just finished");

    await tester.pump(const Duration(milliseconds: 400));
    expect(ran, [1], reason: "the wait starts after the first action ends");

    await tester.pump(const Duration(milliseconds: 200));
    expect(ran, [1, 2]);

    await first;
    await second;
  });

  testWidgets("returns the value produced by the action", (tester) async {
    final result = queue.run(() => "value");
    final asyncResult = queue.run(() async => 42);

    await tester.pump();
    await tester.pump(_pastInterval);

    expect(await result, "value");
    expect(await asyncResult, 42);
  });

  testWidgets("forwards the error thrown by an action", (tester) async {
    final failure = queue.run<void>(() => throw StateError("boom"));
    final matched = expectLater(failure, throwsStateError);

    await tester.pump();

    await matched;
  });

  testWidgets("keeps draining the queue after an action throws",
      (tester) async {
    final ran = <int>[];
    final failure = queue.run<void>(() => throw StateError("boom"));
    final matched = expectLater(failure, throwsStateError);
    final second = queue.run(() => ran.add(2));
    final third = queue.run(() => ran.add(3));

    await tester.pump();
    expect(ran, isEmpty);

    await tester.pump(_pastInterval);
    expect(ran, [2]);

    await tester.pump(_pastInterval);
    expect(ran, [2, 3]);

    await matched;
    await second;
    await third;
  });

  testWidgets("restarts the queue for an action submitted after it drained",
      (tester) async {
    final ran = <int>[];

    final first = queue.run(() => ran.add(1));
    await tester.pump();
    expect(ran, [1]);
    await first;

    final second = queue.run(() => ran.add(2));
    await tester.pump();
    expect(ran, [1], reason: "the interval applies to a restarted queue too");

    await tester.pump(_pastInterval);
    expect(ran, [1, 2]);
    await second;
  });
}
