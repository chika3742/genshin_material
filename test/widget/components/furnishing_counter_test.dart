import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/furnishing_counter.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../utils.dart";

void main() {
  late List<int> changes;

  setUp(() {
    changes = [];
  });

  Future<void> pumpCounter(
    WidgetTester tester, {
    required int requiredCount,
    required int currentCount,
  }) async {
    await tester.pumpWidget(
      createScreenWithApp(
        Scaffold(
          body: Center(
            child: FurnishingCounter(
              requiredCount: requiredCount,
              currentCount: currentCount,
              onChanged: changes.add,
            ),
          ),
        ),
      ),
    );
  }

  Finder decrementButton() => find.widgetWithIcon(IconButton, Symbols.remove);

  Finder incrementButton() => find.widgetWithIcon(IconButton, Symbols.add);

  testWidgets("increments the count by one", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 2);

    await tester.tap(incrementButton());
    await tester.pumpAndSettle();

    expect(changes, [3]);
  });

  testWidgets("decrements the count by one", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 2);

    await tester.tap(decrementButton());
    await tester.pumpAndSettle();

    expect(changes, [1]);
  });

  testWidgets("disables the decrement button at zero", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 0);

    expect(tester.widget<IconButton>(decrementButton()).onPressed, isNull);

    await tester.tap(decrementButton());
    await tester.pumpAndSettle();

    expect(changes, isEmpty);
  });

  testWidgets("resets the count to zero on a long press of the decrement button", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 3);

    await tester.longPress(decrementButton());
    await tester.pumpAndSettle();

    expect(changes, [0]);
  });

  testWidgets("fills the count up to the required one on a long press of the increment button", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 1);

    await tester.longPress(incrementButton());
    await tester.pumpAndSettle();

    expect(changes, [5]);
  });

  testWidgets("replaces the increment button with a check once the count is met", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 5);

    expect(incrementButton(), findsNothing);
    expect(find.byIcon(Symbols.check), findsOne);
  });

  testWidgets("keeps the check when the count exceeds the required one", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 7);

    expect(incrementButton(), findsNothing);
    expect(find.byIcon(Symbols.check), findsOne);
  });

  testWidgets("shows the missing count while the required one is not met", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 2);

    expect(find.text("2/5(-3)", findRichText: true), findsOne);
  });

  testWidgets("drops the missing count once the required one is met", (tester) async {
    await pumpCounter(tester, requiredCount: 5, currentCount: 5);

    expect(find.text("5/5", findRichText: true), findsOne);
  });

  testWidgets("marks the count as satisfied only once the required one is met", (tester) async {
    // The counter holds the only [Text] of the component, so its closest
    // [AnimatedDefaultTextStyle] ancestor is the one under test.
    Color? counterColor() {
      return tester
          .widget<AnimatedDefaultTextStyle>(
            find
                .ancestor(
                  of: find.byType(Text),
                  matching: find.byType(AnimatedDefaultTextStyle),
                )
                .first,
          )
          .style
          .color;
    }

    await pumpCounter(tester, requiredCount: 5, currentCount: 4);
    final lackingColor = counterColor();

    await pumpCounter(tester, requiredCount: 5, currentCount: 5);
    await tester.pumpAndSettle();
    final satisfiedColor = counterColor();

    final colorScheme = Theme.of(tester.element(find.byType(FurnishingCounter))).colorScheme;
    expect(lackingColor, colorScheme.error);
    expect(satisfiedColor, colorScheme.tertiary);
  });

  testWidgets("shows a satisfied counter when nothing is required", (tester) async {
    await pumpCounter(tester, requiredCount: 0, currentCount: 0);

    expect(find.text("0/0", findRichText: true), findsOne);
    expect(find.byIcon(Symbols.check), findsOne);
    expect(tester.widget<IconButton>(decrementButton()).onPressed, isNull);
  });
}
