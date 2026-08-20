import "package:material_ui/material_ui.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/release_notes_timeline.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/release_note.dart";
import "package:timelines/timelines.dart";

import "../utils.dart";

ReleaseNote _note(String version) => ReleaseNote(
  releasedOn: "2026-01-01",
  version: version,
  contents: LocalizedText.untranslatable(text: "- $version item\n- another line"),
);

void main() {
  // Items are ordered newest first.
  final items = [
    _note("1.3.0"), // minor updated from 1.2.1 -> filled dot
    _note("1.2.1"), // patch updated from 1.2.0 -> outlined dot
    _note("1.2.0"), // oldest -> filled dot
  ];

  testWidgets("indicator is centered on its version header", (tester) async {
    await tester.pumpWidget(
      createScreenWithApp(
        ReleaseNotesTimeline(items: items, versionPrefix: "v"),
      ),
    );

    final indicators = find.byType(DotIndicator);
    expect(indicators, findsNWidgets(items.length)); // one per release note, none for contents

    for (var i = 0; i < items.length; i++) {
      final header = find.ancestor(
        of: find.text("v${items[i].version}"),
        matching: find.byType(Container),
      );
      expect(header, findsOne);

      expect(
        tester.getCenter(indicators.at(i)).dy,
        moreOrLessEquals(tester.getCenter(header).dy),
        reason: "indicator ${items[i].version} is not centered on its header",
      );
    }
  });

  testWidgets("connector line stays on a single vertical axis", (tester) async {
    await tester.pumpWidget(
      createScreenWithApp(
        ReleaseNotesTimeline(items: items, versionPrefix: "v"),
      ),
    );

    final connectors = find.byWidgetPredicate((widget) => widget is Connector);
    expect(connectors.evaluate().length, greaterThan(items.length));

    final expectedDx = tester.getCenter(connectors.first).dx;
    for (var i = 0; i < connectors.evaluate().length; i++) {
      expect(
        tester.getCenter(connectors.at(i)).dx,
        moreOrLessEquals(expectedDx),
        reason: "connector $i is off the vertical axis",
      );
    }
  });

  testWidgets("keeps the safe area insets in the scroll padding", (tester) async {
    await tester.pumpWidget(
      createScreenWithApp(
        MediaQuery(
          data: const MediaQueryData(padding: EdgeInsets.only(bottom: 34)),
          child: ReleaseNotesTimeline(items: items, versionPrefix: "v"),
        ),
      ),
    );

    expect(
      tester.widget<Timeline>(find.byType(Timeline)).padding,
      const EdgeInsets.fromLTRB(16, 0, 16, 34),
    );
  });

  testWidgets("indicator style reflects the version bump", (tester) async {
    await tester.pumpWidget(
      createScreenWithApp(
        ReleaseNotesTimeline(items: items, versionPrefix: "v"),
      ),
    );

    expect(find.byType(OutlinedDotIndicator), findsOne); // only 1.2.1 is a patch update
  });

  testWidgets("renders a single release note", (tester) async {
    await tester.pumpWidget(
      createScreenWithApp(
        ReleaseNotesTimeline(items: [_note("1.0.0")], versionPrefix: "v"),
      ),
    );

    expect(find.byType(DotIndicator), findsOne);
    expect(find.text("v1.0.0"), findsOne);
  });

  testWidgets("renders nothing for an empty list", (tester) async {
    await tester.pumpWidget(
      createScreenWithApp(
        const ReleaseNotesTimeline(items: [], versionPrefix: "v"),
      ),
    );

    expect(find.byType(DotIndicator), findsNothing);
  });
}
