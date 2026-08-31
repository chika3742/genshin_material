import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/custom_range_slider.dart";

import "../../utils.dart";

void main() {
  // The component maps a horizontal position to a value by reserving a
  // thumb-sized padding on both ends, so the test mirrors that mapping to know
  // where a given value sits on screen.
  const sliderWidth = 300.0;
  const thumbRadius = 10.0;
  const effectiveWidth = sliderWidth - thumbRadius * 2;
  const min = 0.0;
  const max = 100.0;
  const initialValues = RangeValues(20, 80);

  double pixelsPerValue(double value) => value / (max - min) * effectiveWidth;

  double xForValue(double value) => thumbRadius + pixelsPerValue(value - min);

  // The pan recognizer of the component and the horizontal drag recognizer of
  // the underlying RangeSlider share the gesture arena. The pan only wins when
  // a single pointer move exceeds kPanSlop, and it then anchors the range drag
  // where it was recognized -- not where the finger went down.
  final panSlopInValue = (kPanSlop + 1) / effectiveWidth * (max - min);

  late List<RangeValues> changes;
  late List<RangeValues> starts;
  late List<RangeValues> ends;

  setUp(() {
    changes = [];
    starts = [];
    ends = [];
  });

  Future<void> pumpSlider(
    WidgetTester tester, {
    RangeValues values = initialValues,
    int? divisions,
    bool enabled = true,
  }) async {
    await tester.pumpWidget(
      createScreenWithApp(
        Scaffold(
          body: Center(
            child: SizedBox(
              width: sliderWidth,
              child: CustomRangeSlider(
                values: values,
                min: min,
                max: max,
                divisions: divisions,
                onChanged: enabled ? changes.add : null,
                onChangeStart: starts.add,
                onChangeEnd: ends.add,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Offset offsetForValue(WidgetTester tester, double value) {
    final box = tester.getRect(find.byType(CustomRangeSlider));
    return Offset(box.left + xForValue(value), box.center.dy);
  }

  /// Starts a pan that the component wins, anchored at [atValue], and drags the
  /// pointer [byValue] further.
  ///
  /// The pointer goes down [panSlopInValue] before [atValue] so that the single
  /// move that makes the pan win the arena lands exactly on [atValue].
  Future<TestGesture> startRangeDrag(
    WidgetTester tester, {
    required double atValue,
    required double byValue,
  }) async {
    final approach = byValue.isNegative ? panSlopInValue : -panSlopInValue;
    final gesture = await tester.startGesture(
      offsetForValue(tester, atValue + approach),
    );
    await gesture.moveTo(offsetForValue(tester, atValue));
    await tester.pump();
    await gesture.moveTo(offsetForValue(tester, atValue + byValue));
    await tester.pump();
    return gesture;
  }

  Future<void> dragRange(
    WidgetTester tester, {
    required double atValue,
    required double byValue,
  }) async {
    final gesture = await startRangeDrag(tester, atValue: atValue, byValue: byValue);
    await gesture.up();
    await tester.pumpAndSettle();
  }

  group("dragging inside the selected range", () {
    testWidgets("shifts both ends by the same amount", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 50, byValue: 10);

      expect(changes, isNotEmpty);
      final result = changes.last;
      expect(result.start, closeTo(30, 0.001));
      expect(result.end, closeTo(90, 0.001));
    });

    testWidgets("shifts both ends when dragged backwards", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 50, byValue: -15);

      expect(changes, isNotEmpty);
      final result = changes.last;
      expect(result.start, closeTo(5, 0.001));
      expect(result.end, closeTo(65, 0.001));
    });

    testWidgets("keeps the range width on every update", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 50, byValue: 15);

      expect(changes, isNotEmpty);
      for (final values in changes) {
        expect(values.end - values.start, closeTo(60, 0.001));
      }
    });

    testWidgets("clamps at the maximum without shrinking the range", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 50, byValue: 45);

      expect(changes, isNotEmpty);
      final result = changes.last;
      expect(result.end, max);
      expect(result.start, closeTo(40, 0.001));
    });

    testWidgets("clamps at the minimum without shrinking the range", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 50, byValue: -45);

      expect(changes, isNotEmpty);
      final result = changes.last;
      expect(result.start, min);
      expect(result.end, closeTo(60, 0.001));
    });

    testWidgets("reports the drag start and end exactly once", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 50, byValue: 10);

      expect(starts, [initialValues]);
      expect(ends, [initialValues]);
    });

    testWidgets("disables the inner RangeSlider while the range is being dragged", (tester) async {
      await pumpSlider(tester);

      final gesture = await startRangeDrag(tester, atValue: 50, byValue: 10);
      expect(tester.widget<RangeSlider>(find.byType(RangeSlider)).onChanged, isNull);

      await gesture.up();
      await tester.pumpAndSettle();
      expect(tester.widget<RangeSlider>(find.byType(RangeSlider)).onChanged, isNotNull);
    });

    testWidgets("re-enables the inner RangeSlider when the gesture is cancelled", (tester) async {
      await pumpSlider(tester);

      final gesture = await startRangeDrag(tester, atValue: 50, byValue: 10);
      await gesture.cancel();
      await tester.pumpAndSettle();

      // A cancelled pan ends the drag rather than cancelling it, so the drag
      // end is still reported.
      expect(starts, hasLength(1));
      expect(ends, hasLength(1));
      expect(tester.widget<RangeSlider>(find.byType(RangeSlider)).onChanged, isNotNull);
    });

    testWidgets("snaps to the divisions", (tester) async {
      await pumpSlider(tester, divisions: 10);

      await dragRange(tester, atValue: 50, byValue: 13);

      expect(changes, isNotEmpty);
      final result = changes.last;
      expect(result.start, closeTo(30, 0.001));
      expect(result.end, closeTo(90, 0.001));
    });

    testWidgets("snaps within the bounds at the maximum", (tester) async {
      await pumpSlider(tester, divisions: 10);

      await dragRange(tester, atValue: 50, byValue: 45);

      expect(changes, isNotEmpty);
      for (final values in changes) {
        expect(values.start, greaterThanOrEqualTo(min));
        expect(values.end, lessThanOrEqualTo(max));
      }
    });
  });

  group("dragging outside the selected range", () {
    // The pan wins the arena before the component decides not to move the
    // range, so the underlying RangeSlider never sees the gesture either.
    testWidgets("ignores a drag anchored before the range", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 10, byValue: 10);

      expect(changes, isEmpty);
      expect(starts, isEmpty);
      expect(ends, isEmpty);
    });

    testWidgets("ignores a drag anchored after the range", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 90, byValue: -10);

      expect(changes, isEmpty);
      expect(starts, isEmpty);
    });

    testWidgets("ignores a drag anchored near the start thumb", (tester) async {
      await pumpSlider(tester);

      // Touches within 8% of the range around a thumb are left to the thumb.
      await dragRange(tester, atValue: 25, byValue: 10);

      expect(changes, isEmpty);
      expect(starts, isEmpty);
    });

    testWidgets("ignores a drag anchored near the end thumb", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 75, byValue: -10);

      expect(changes, isEmpty);
      expect(starts, isEmpty);
    });

    testWidgets("starts a range drag just past the thumb threshold", (tester) async {
      await pumpSlider(tester);

      await dragRange(tester, atValue: 29, byValue: 5);

      expect(changes, isNotEmpty);
      expect(changes.last.end - changes.last.start, closeTo(60, 0.001));
    });
  });

  group("when the pan does not win the arena", () {
    testWidgets("lets the RangeSlider move a single thumb on a slow drag", (tester) async {
      await pumpSlider(tester);

      // A drag split into slop-sized steps is claimed by the RangeSlider.
      await tester.dragFrom(
        offsetForValue(tester, 20),
        Offset(pixelsPerValue(20), 0),
      );
      await tester.pumpAndSettle();

      expect(changes, isNotEmpty);
      for (final values in changes) {
        expect(values.end, initialValues.end);
      }
      expect(changes.last.start, greaterThan(initialValues.start));
    });
  });

  group("when disabled", () {
    testWidgets("ignores a drag inside the range", (tester) async {
      await pumpSlider(tester, enabled: false);

      await dragRange(tester, atValue: 50, byValue: 10);

      expect(changes, isEmpty);
      expect(starts, isEmpty);
      expect(ends, isEmpty);
    });

    testWidgets("passes the disabled state down to the RangeSlider", (tester) async {
      await pumpSlider(tester, enabled: false);

      expect(tester.widget<RangeSlider>(find.byType(RangeSlider)).onChanged, isNull);
    });
  });

  group("constructor assertions", () {
    void build({
      required RangeValues values,
      double min = 0.0,
      double max = 100.0,
    }) {
      CustomRangeSlider(
        values: values,
        min: min,
        max: max,
        onChanged: (_) {},
      );
    }

    test("rejects a minimum greater than the maximum", () {
      expect(
        () => build(values: const RangeValues(0, 0), min: 10, max: 0),
        throwsAssertionError,
      );
    });

    test("rejects a start below the minimum", () {
      expect(
        () => build(values: const RangeValues(-1, 50)),
        throwsAssertionError,
      );
    });

    test("rejects an end above the maximum", () {
      expect(
        () => build(values: const RangeValues(50, 101)),
        throwsAssertionError,
      );
    });

    test("rejects a start greater than the end", () {
      expect(
        () => build(values: const RangeValues(80, 20)),
        throwsAssertionError,
      );
    });

    test("accepts a degenerate range at the bounds", () {
      expect(() => build(values: const RangeValues(0, 0)), returnsNormally);
      expect(() => build(values: const RangeValues(100, 100)), returnsNormally);
    });
  });
}
