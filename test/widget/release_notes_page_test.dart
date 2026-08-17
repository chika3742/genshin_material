import "package:material_ui/material_ui.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/release_notes_timeline.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/release_note.dart";
import "package:genshin_material/pages/release_notes.dart";
import "package:genshin_material/providers/versions.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../utils.dart";
import "../utils/asset_data.dart";

void main() {
  // Enough notes to make both tabs scrollable well past the drag distance below.
  List<ReleaseNote> buildNotes(String label) => [
    for (var i = 20; i > 0; i--)
      ReleaseNote(
        version: "1.$i.0",
        releasedOn: "2026-01-01",
        contents: LocalizedText.untranslatable(text: "- $label $i"),
      ),
  ];

  Future<void> pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          assetDataProvider.overrideWith((ref) async => buildTestAssetData()),
          featuresReleaseNotesDataProvider.overrideWith((ref) async => buildNotes("feature")),
          assetsReleaseNotesDataProvider.overrideWith((ref) async => buildNotes("asset")),
        ],
        child: createScreenWithApp(const ReleaseNotesPage()),
      ),
    );
    await tester.pumpAndSettle();
  }

  // Only the visible tab is mounted, so this always resolves to the current one.
  ScrollPosition timelinePosition(WidgetTester tester) {
    return tester.state<ScrollableState>(
      find.descendant(
        of: find.byType(ReleaseNotesTimeline),
        matching: find.byType(Scrollable),
      ),
    ).position;
  }

  Future<void> tapTab(WidgetTester tester, int index) async {
    await tester.tap(find.byType(Tab).at(index));
    await tester.pumpAndSettle();
  }

  Future<double> scrollTimeline(WidgetTester tester, double distance) async {
    await tester.drag(find.byType(ReleaseNotesTimeline), Offset(0, -distance));
    await tester.pumpAndSettle();

    final offset = timelinePosition(tester).pixels;
    expect(offset, greaterThan(0), reason: "the timeline did not scroll");
    return offset;
  }

  testWidgets("restores the scroll position after leaving and re-entering a tab", (tester) async {
    await pumpPage(tester);

    final offset = await scrollTimeline(tester, 300);

    await tapTab(tester, 1);
    await tapTab(tester, 0);

    expect(timelinePosition(tester).pixels, offset);
  });

  testWidgets("keeps the scroll position of each tab separate", (tester) async {
    await pumpPage(tester);

    final featuresOffset = await scrollTimeline(tester, 300);

    await tapTab(tester, 1);
    expect(
      timelinePosition(tester).pixels,
      0,
      reason: "the asset tab inherited the feature tab's scroll position",
    );

    final assetsOffset = await scrollTimeline(tester, 150);
    expect(assetsOffset, lessThan(featuresOffset));

    await tapTab(tester, 0);
    expect(timelinePosition(tester).pixels, featuresOffset);

    await tapTab(tester, 1);
    expect(timelinePosition(tester).pixels, assetsOffset);
  });
}
