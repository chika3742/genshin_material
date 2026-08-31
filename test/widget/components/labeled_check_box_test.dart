import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/labeled_check_box.dart";

import "../../utils.dart";

void main() {
  // The label is supplied by the caller, so a placeholder keeps the test free
  // of locale-dependent text.
  const labelKey = Key("label");
  const label = Text("label", key: labelKey);

  group("LabeledCheckBox", () {
    Future<void> pumpCheckBox(
      WidgetTester tester, {
      required bool value,
      required ValueChanged<bool?>? onChanged,
    }) async {
      await tester.pumpWidget(
        createScreenWithApp(
          Scaffold(
            body: Center(
              child: LabeledCheckBox(
                value: value,
                onChanged: onChanged,
                child: label,
              ),
            ),
          ),
        ),
      );
    }

    TextStyle labelStyle(WidgetTester tester) {
      return tester
          .widget<AnimatedDefaultTextStyle>(
            find
                .ancestor(
                  of: find.byKey(labelKey),
                  matching: find.byType(AnimatedDefaultTextStyle),
                )
                .first,
          )
          .style;
    }

    testWidgets("toggles when the label is tapped", (tester) async {
      final changes = <bool?>[];
      await pumpCheckBox(tester, value: false, onChanged: changes.add);

      await tester.tap(find.byKey(labelKey));
      await tester.pumpAndSettle();

      expect(changes, [true]);
    });

    testWidgets("reports the inverted value when the label of a checked box is tapped", (tester) async {
      final changes = <bool?>[];
      await pumpCheckBox(tester, value: true, onChanged: changes.add);

      await tester.tap(find.byKey(labelKey));
      await tester.pumpAndSettle();

      expect(changes, [false]);
    });

    testWidgets("toggles when the check box itself is tapped", (tester) async {
      final changes = <bool?>[];
      await pumpCheckBox(tester, value: false, onChanged: changes.add);

      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      expect(changes, [true]);
    });

    testWidgets("does not react to a label tap while disabled", (tester) async {
      final changes = <bool?>[];
      await pumpCheckBox(tester, value: false, onChanged: null);

      await tester.tap(find.byKey(labelKey));
      await tester.pumpAndSettle();

      expect(changes, isEmpty);
      expect(tester.widget<Checkbox>(find.byType(Checkbox)).onChanged, isNull);
    });

    testWidgets("dims the label while disabled", (tester) async {
      await pumpCheckBox(tester, value: false, onChanged: (_) {});
      final enabledColor = labelStyle(tester).color;

      await pumpCheckBox(tester, value: false, onChanged: null);
      await tester.pumpAndSettle();

      expect(labelStyle(tester).color, isNotNull);
      expect(labelStyle(tester).color, isNot(enabledColor));
    });
  });

  group("LabeledRadio", () {
    Future<void> pumpRadioGroup(
      WidgetTester tester, {
      required String? groupValue,
      required ValueChanged<String?> onChanged,
    }) async {
      await tester.pumpWidget(
        createScreenWithApp(
          Scaffold(
            body: RadioGroup<String>(
              groupValue: groupValue,
              onChanged: onChanged,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LabeledRadio(
                    value: "a",
                    label: Text("a", key: Key("label-a")),
                  ),
                  LabeledRadio(
                    value: "b",
                    label: Text("b", key: Key("label-b")),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    testWidgets("selects the value when the label is tapped", (tester) async {
      final changes = <String?>[];
      await pumpRadioGroup(tester, groupValue: "a", onChanged: changes.add);

      await tester.tap(find.byKey(const Key("label-b")));
      await tester.pumpAndSettle();

      expect(changes, ["b"]);
    });

    testWidgets("renders one radio per value", (tester) async {
      await pumpRadioGroup(tester, groupValue: null, onChanged: (_) {});

      expect(find.byType(Radio<String>), findsNWidgets(2));
    });
  });
}
