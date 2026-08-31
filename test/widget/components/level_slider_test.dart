import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/custom_range_slider.dart";
import "package:genshin_material/components/labeled_check_box.dart";
import "package:genshin_material/components/level_slider.dart";
import "package:genshin_material/models/level_range_values.dart";

import "../../utils.dart";

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
  }) async {
    await tester.pumpWidget(
      createScreenWithApp(
        Scaffold(
          body: Center(
            child: SizedBox(
              width: 400,
              child: LevelSlider(
                levels: levels,
                ticks: ticks,
                values: values,
                active: active,
                label: label,
                onActiveChanged: activatable ? activeChanges.add : null,
                onChanged: enabled ? changes.add : null,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
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

  group("slider wiring", () {
    testWidgets("spans one division per tick", (tester) async {
      await pumpSlider(tester);

      final slider = rangeSlider(tester);
      expect(slider.min, 0);
      expect(slider.max, ticks.length - 1);
      expect(slider.divisions, ticks.length - 1);
    });

    testWidgets("places the thumbs on the indices of the current levels", (tester) async {
      await pumpSlider(tester);

      expect(rangeSlider(tester).values, const RangeValues(1, 6));
    });

    testWidgets("rounds a level that is not a tick up to the next one", (tester) async {
      await pumpSlider(tester, values: const LevelRangeValues(30, 85));

      expect(rangeSlider(tester).values, const RangeValues(2, 7));
    });

    testWidgets("translates the slider indices back into levels", (tester) async {
      await pumpSlider(tester);

      rangeSlider(tester).onChanged!(const RangeValues(2, 5));
      await tester.pumpAndSettle();

      expect(changes, hasLength(1));
      expect(changes.single.start, 40);
      expect(changes.single.end, 70);
    });

    testWidgets("ignores a collapsed range", (tester) async {
      await pumpSlider(tester);

      rangeSlider(tester).onChanged!(const RangeValues(3, 3));
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
    });

    testWidgets("paints the tick labels", (tester) async {
      await pumpSlider(tester);

      expect(find.byType(CustomPaint), findsWidgets);
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
}
