import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/custom_range_slider.dart";
import "package:genshin_material/components/labeled_check_box.dart";
import "package:genshin_material/components/level_slider.dart";
import "package:genshin_material/models/level_range_values.dart";
import "package:material_ui/material_ui.dart";

import "../utils.dart";

void main() {
  // `1` only exists as a tick and `90` only as a level, so both halves of the
  // level validation are exercised.
  const ticks = [1, 20, 40, 50, 60, 70, 80, 90];
  const levels = [20, 40, 50, 60, 70, 80, 90];
  const initialValues = LevelRangeValues(20, 80);

  late List<LevelRangeValues> changes;
  late List<bool> activeChanges;

  setUp(() {
    changes = [];
    activeChanges = [];
  });

  Future<void> pumpSlider(
    WidgetTester tester, {
    LevelRangeValues values = initialValues,
    bool enabled = true,
    Widget? label,
    bool active = true,
    bool activatable = true,
    int? syncedLevel,
    bool reserveSyncedLevelSpace = false,
    bool settle = true,
    double width = 400,
  }) async {
    await tester.pumpWidget(
      createScreenWithApp(
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: width,
              child: LevelSlider(
                levels: levels,
                ticks: ticks,
                values: values,
                active: active,
                label: label,
                onActiveChanged: activatable ? activeChanges.add : null,
                onChanged: enabled ? changes.add : null,
                syncedLevel: syncedLevel,
                reserveSyncedLevelSpace: reserveSyncedLevelSpace,
              ),
            ),
          ),
        ),
      ),
    );
    if (settle) await tester.pumpAndSettle();
  }

  CustomRangeSlider rangeSlider(WidgetTester tester) =>
      tester.widget<CustomRangeSlider>(find.byType(CustomRangeSlider));

  Finder currentLevelField() => find.byType(TextField).first;

  Finder targetLevelField() => find.byType(TextField).last;

  String textOf(WidgetTester tester, Finder field) =>
      tester.widget<TextField>(field).controller!.text;

  Future<void> blur(WidgetTester tester, Finder field) async {
    tester.widget<TextField>(field).focusNode!.unfocus();
    await tester.pumpAndSettle();
  }

  /// Reports [values] from the slider as a pointer would, which rounds them.
  Future<void> dragTo(WidgetTester tester, RangeValues values) async {
    final slider = rangeSlider(tester);
    slider.onChangeStart!(slider.values);
    // the touch down on the thumb, which the slider reports first
    slider.onChanged!(slider.values);
    slider.onChanged!(values);
    slider.onChangeEnd!(values);
    await tester.pumpAndSettle();
  }

  /// The x where the RangeSlider centers a thumb at [index]: the track is
  /// inset by the overlay radius.
  double xOfTickIndex(WidgetTester tester, double index) {
    const inset = 24.0;
    final rect = tester.getRect(find.byType(CustomRangeSlider));
    return rect.left + inset + index / (ticks.length - 1) * (rect.width - inset * 2);
  }

  Offset thumbOffset(WidgetTester tester, double index) =>
      Offset(xOfTickIndex(tester, index), tester.getCenter(find.byType(CustomRangeSlider)).dy);

  group("slider wiring", () {
    testWidgets("spans one index per tick without divisions", (tester) async {
      await pumpSlider(tester);

      final slider = rangeSlider(tester);
      expect(slider.min, 0);
      expect(slider.max, ticks.length - 1);
      // a discrete slider would round the thumbs onto the ticks
      expect(slider.divisions, isNull);
    });

    testWidgets("places the thumbs on the indices of the current levels", (tester) async {
      await pumpSlider(tester);

      expect(rangeSlider(tester).values, const RangeValues(1, 6));
    });

    testWidgets("interpolates the thumbs of levels between ticks", (tester) async {
      await pumpSlider(tester, values: const LevelRangeValues(30, 85));

      expect(rangeSlider(tester).values, const RangeValues(1.5, 6.5));
    });

    testWidgets("slides the thumbs to new levels", (tester) async {
      await pumpSlider(tester);
      await pumpSlider(tester, values: const LevelRangeValues(20, 90), settle: false);
      await tester.pump(const Duration(milliseconds: 30));

      expect(rangeSlider(tester).values.end, inExclusiveRange(6, 7));

      await tester.pumpAndSettle();

      expect(rangeSlider(tester).values, const RangeValues(1, 7));
    });

    testWidgets("snaps a dragged thumb to the nearest tick", (tester) async {
      await pumpSlider(tester);

      await dragTo(tester, const RangeValues(2.4, 4.6));

      expect(changes, hasLength(1));
      expect(changes.single.start, 40);
      expect(changes.single.end, 70);
    });

    testWidgets("keeps the level of the thumb left between ticks", (tester) async {
      await pumpSlider(tester, values: const LevelRangeValues(20, 75));

      await dragTo(tester, const RangeValues(2.2, 5.5));

      expect(changes.single.start, 40);
      expect(changes.single.end, 75);
    });

    testWidgets("snaps a dragged thumb that was between ticks", (tester) async {
      await pumpSlider(tester, values: const LevelRangeValues(20, 75));

      await dragTo(tester, const RangeValues(1, 5.8));

      expect(changes.single.start, 20);
      expect(changes.single.end, 80);
    });

    testWidgets("ignores a collapsed range", (tester) async {
      await pumpSlider(tester);

      await dragTo(tester, const RangeValues(2.8, 3.2));

      expect(changes, isEmpty);
    });

    testWidgets("keeps a thumb between ticks that is only touched", (tester) async {
      await pumpSlider(tester, values: const LevelRangeValues(20, 75));

      // off its center, nearer to the next tick
      await tester.tapAt(thumbOffset(tester, 5.6));
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
    });

    testWidgets("snaps a touched thumb between ticks once it is dragged", (tester) async {
      await pumpSlider(tester, values: const LevelRangeValues(20, 75));

      final gesture = await tester.startGesture(thumbOffset(tester, 5.5));
      // past the drag slop, yet short of the pan slop of the range drag
      await gesture.moveBy(const Offset(30, 0));
      await gesture.up();
      await tester.pumpAndSettle();

      expect(changes.last.start, 20);
      expect(changes.last.end, 80);
    });

    testWidgets("moves the nearest thumb to a tick tapped off the thumbs", (tester) async {
      await pumpSlider(tester, values: const LevelRangeValues(20, 75));

      await tester.tapAt(thumbOffset(tester, 4.1));
      await tester.pumpAndSettle();

      expect(changes.single.start, 20);
      expect(changes.single.end, 60);
    });

    testWidgets("moves a thumb on a tick to the next tick tapped nearer to it", (tester) async {
      // narrow enough for a tick spacing below the minimum interactive dimension
      await pumpSlider(tester, width: 300);

      // within half the minimum interactive dimension of the start thumb
      await tester.tapAt(thumbOffset(tester, 1.6));
      await tester.pumpAndSettle();

      expect(changes.single.start, 40);
      expect(changes.single.end, initialValues.end);
    });

    // Without divisions, a semantic action moves a thumb by a fraction of the
    // range that rounding would undo.
    testWidgets("steps a thumb to the next tick on a semantic action", (tester) async {
      await pumpSlider(tester);

      rangeSlider(tester).onChanged!(const RangeValues(1.35, 6));
      await tester.pumpAndSettle();

      expect(changes.single.start, 40);
      expect(changes.single.end, 80);
    });

    testWidgets("steps a thumb between ticks to the previous tick on a semantic action", (tester) async {
      await pumpSlider(tester, values: const LevelRangeValues(20, 75));

      rangeSlider(tester).onChanged!(const RangeValues(1, 5.15));
      await tester.pumpAndSettle();

      expect(changes.single.start, 20);
      expect(changes.single.end, 70);
    });

    /// Pumps the end thumb sliding from [from] to [to] and stops it halfway.
    Future<RangeValues> pumpSliding(WidgetTester tester, int from, int to) async {
      await pumpSlider(tester, values: LevelRangeValues(20, from));
      await pumpSlider(tester, values: LevelRangeValues(20, to), settle: false);
      await tester.pump(const Duration(milliseconds: 30));
      return rangeSlider(tester).values;
    }

    testWidgets("steps a sliding thumb on from where it is headed on a semantic action", (tester) async {
      final shown = await pumpSliding(tester, 70, 80);

      rangeSlider(tester).onChanged!(RangeValues(shown.start, shown.end + 0.35));
      await tester.pumpAndSettle();

      expect(changes.single.start, 20);
      expect(changes.single.end, 90);
    });

    testWidgets("keeps a thumb sliding to the last tick on a semantic action past it", (tester) async {
      final shown = await pumpSliding(tester, 80, 90);

      rangeSlider(tester).onChanged!(RangeValues(shown.start, shown.end + 0.35));
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
    });

    testWidgets("paints the tick labels", (tester) async {
      await pumpSlider(tester);

      // The card border, the two field borders and the debug banner are
      // CustomPaints as well, so only the painter type identifies the labels.
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomPaint &&
              widget.painter?.runtimeType.toString() == "_SliderLabelPainter",
        ),
        findsOne,
      );
    });

    testWidgets("paints a tick mark on the track at every tick", (tester) async {
      await pumpSlider(tester);

      final slider = find.byType(RangeSlider);
      final circleXs = <double>[];
      expect(
        slider,
        paints..everything((method, arguments) {
          if (method == #drawCircle) circleXs.add((arguments[0] as Offset).dx);
          return true;
        }),
      );

      // the track is inset by the overlay radius
      const inset = 24.0;
      final trackWidth = tester.getSize(slider).width - inset * 2;
      for (var i = 0; i < ticks.length; i++) {
        final x = inset + i / (ticks.length - 1) * trackWidth;
        expect(circleXs, contains(moreOrLessEquals(x)), reason: "tick $i");
      }
    });

    testWidgets("reports nothing when no callback is given", (tester) async {
      await pumpSlider(tester, enabled: false);

      // The component always hands a closure to the range slider, so the
      // slider stays interactive and simply swallows the change.
      rangeSlider(tester).onChanged!(const RangeValues(2, 5));
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
      expect(tester.takeException(), isNull);
    });
  });

  group("level fields", () {
    testWidgets("shows the current and the target level", (tester) async {
      await pumpSlider(tester);

      expect(textOf(tester, currentLevelField()), "20");
      expect(textOf(tester, targetLevelField()), "80");
    });

    testWidgets("reports a valid current level", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(currentLevelField(), "40");
      await tester.pumpAndSettle();

      expect(changes, hasLength(1));
      expect(changes.single.start, 40);
      expect(changes.single.end, 80);
    });

    testWidgets("reports a valid target level", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(targetLevelField(), "90");
      await tester.pumpAndSettle();

      expect(changes, hasLength(1));
      expect(changes.single.start, 20);
      expect(changes.single.end, 90);
    });

    testWidgets("accepts a level that only exists as a tick", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(currentLevelField(), "1");
      await tester.pumpAndSettle();

      expect(changes.single.start, 1);
    });

    testWidgets("rejects a current level that is not a valid level", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(currentLevelField(), "45");
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
      expect(tester.widget<TextField>(currentLevelField()).decoration!.error, isNotNull);
    });

    testWidgets("rejects a current level that reaches the target level", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(currentLevelField(), "80");
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
      expect(tester.widget<TextField>(currentLevelField()).decoration!.error, isNotNull);
    });

    testWidgets("rejects a target level that is not above the current level", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(targetLevelField(), "20");
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
      expect(tester.widget<TextField>(targetLevelField()).decoration!.error, isNotNull);
    });

    testWidgets("rejects an empty current level", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(currentLevelField(), "");
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
      expect(tester.widget<TextField>(currentLevelField()).decoration!.error, isNotNull);
    });

    testWidgets("restores the last valid current level on blur", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(currentLevelField(), "45");
      await tester.pumpAndSettle();
      await blur(tester, currentLevelField());

      expect(textOf(tester, currentLevelField()), "20");
      expect(tester.widget<TextField>(currentLevelField()).decoration!.error, isNull);
    });

    testWidgets("restores the last valid target level on blur", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(targetLevelField(), "20");
      await tester.pumpAndSettle();
      await blur(tester, targetLevelField());

      expect(textOf(tester, targetLevelField()), "80");
    });

    testWidgets("keeps a valid level on blur", (tester) async {
      await pumpSlider(tester);

      await tester.enterText(currentLevelField(), "40");
      await tester.pumpAndSettle();
      await blur(tester, currentLevelField());

      expect(textOf(tester, currentLevelField()), "40");
    });

    testWidgets("does nothing when no callback is given", (tester) async {
      await pumpSlider(tester, enabled: false);

      await tester.enterText(currentLevelField(), "40");
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
      expect(tester.takeException(), isNull);
    });
  });

  group("with a label", () {
    const labelKey = Key("label");
    const label = Text("label", key: labelKey);

    testWidgets("toggles the active state from the label", (tester) async {
      await pumpSlider(tester, label: label);

      expect(find.byType(LabeledCheckBox), findsOne);

      await tester.tap(find.byKey(labelKey));
      await tester.pumpAndSettle();

      expect(activeChanges, [false]);
    });

    testWidgets("hides the slider while inactive", (tester) async {
      await pumpSlider(tester, label: label, active: false);

      expect(find.byType(AnimatedCrossFade), findsOne);
      expect(
        tester.widget<AnimatedCrossFade>(find.byType(AnimatedCrossFade)).crossFadeState,
        CrossFadeState.showFirst,
      );
    });

    testWidgets("shows the slider while active", (tester) async {
      await pumpSlider(tester, label: label);

      expect(
        tester.widget<AnimatedCrossFade>(find.byType(AnimatedCrossFade)).crossFadeState,
        CrossFadeState.showSecond,
      );
    });

    testWidgets("disables the check box when the active state is fixed", (tester) async {
      await pumpSlider(tester, label: label, activatable: false);

      await tester.tap(find.byKey(labelKey));
      await tester.pumpAndSettle();

      expect(activeChanges, isEmpty);
      expect(tester.widget<Checkbox>(find.byType(Checkbox)).onChanged, isNull);
    });

    testWidgets("omits the check box when no label is given", (tester) async {
      await pumpSlider(tester);

      expect(find.byType(LabeledCheckBox), findsNothing);
      expect(find.byType(AnimatedCrossFade), findsNothing);
    });
  });

  group("synced level indicator", () {
    Finder indicator() => find.byKey(LevelSlider.syncedLevelIndicatorKey);

    testWidgets("is absent without a synced level", (tester) async {
      await pumpSlider(tester);

      expect(indicator(), findsNothing);
    });

    testWidgets("marks a level on a tick", (tester) async {
      await pumpSlider(tester, syncedLevel: 50);

      expect(find.text("Lv.50"), findsOne);
      expect(tester.getCenter(indicator()).dx, moreOrLessEquals(xOfTickIndex(tester, 3)));
      // the diamond sits on the track
      expect(
        tester.getCenter(find.descendant(of: indicator(), matching: find.byType(Transform))).dy,
        moreOrLessEquals(tester.getCenter(find.byType(CustomRangeSlider)).dy),
      );
    });

    testWidgets("interpolates a level between ticks", (tester) async {
      await pumpSlider(tester, syncedLevel: 45);

      expect(tester.getCenter(indicator()).dx, moreOrLessEquals(xOfTickIndex(tester, 2.5)));
    });

    testWidgets("keeps its space reserved until the level arrives", (tester) async {
      // The space is above the slider, so it pushes the slider down.
      double sliderTop() => tester.getTopLeft(find.byType(CustomRangeSlider)).dy;

      await pumpSlider(tester, syncedLevel: 50);
      final withLevel = sliderTop();
      await pumpSlider(tester, reserveSyncedLevelSpace: true);
      final reserved = sliderTop();
      await pumpSlider(tester);
      final withoutSync = sliderTop();

      expect(indicator(), findsNothing);
      expect(reserved, withLevel);
      expect(withoutSync, lessThan(withLevel));
    });

    testWidgets("is absent for a level above the last tick", (tester) async {
      await pumpSlider(tester, syncedLevel: 95);

      expect(indicator(), findsNothing);
    });

    testWidgets("lets a tap on it through to the slider", (tester) async {
      await pumpSlider(tester, syncedLevel: 40);

      await tester.tapAt(Offset(
        tester.getCenter(indicator()).dx,
        tester.getCenter(find.byType(CustomRangeSlider)).dy,
      ));
      await tester.pumpAndSettle();

      // the start thumb, the nearest one, moves to the tapped tick
      expect(changes, hasLength(1));
      expect(changes.single.start, 40);
      expect(changes.single.end, initialValues.end);
    });
  });
}
