import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/debouncer.dart";

// Uses testWidgets rather than package:fake_async so no extra dependency is
// needed: widget tests already run under a fake async zone, so tester.pump
// advances the Debouncer's Timer.
void main() {
  const duration = Duration(milliseconds: 50);
  const past = Duration(milliseconds: 60);

  testWidgets("runs only the last action for rapid successive calls", (tester) async {
    final debouncer = Debouncer(duration);
    addTearDown(debouncer.dispose);
    final calls = <int>[];

    debouncer(() => calls.add(1));
    await tester.pump(const Duration(milliseconds: 10));
    debouncer(() => calls.add(2));
    await tester.pump(const Duration(milliseconds: 10));
    debouncer(() => calls.add(3));
    await tester.pump(past);

    expect(calls, [3]);
  });

  testWidgets("does not fire after dispose", (tester) async {
    final debouncer = Debouncer(duration);
    var called = false;

    debouncer(() => called = true);
    debouncer.dispose();
    await tester.pump(past);

    expect(called, isFalse);
  });
}
