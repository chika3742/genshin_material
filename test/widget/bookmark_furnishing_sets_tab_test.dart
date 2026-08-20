import "package:drift/native.dart";
import "package:material_ui/material_ui.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/bookmarks_page/furnishing_sets_tab.dart";
import "package:genshin_material/components/furnishing_table.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/furnishing_db_extension.dart";
import "package:genshin_material/models/furnishing_set.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/versions.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../utils.dart";
import "../utils/asset_data.dart";

void main() {
  late AppDatabase db;
  late PageController pageController;

  final furnishing = Furnishing(
    id: "chair",
    hyvId: 0,
    name: LocalizedText.untranslatable(text: "Chair"),
    jaPronunciation: "",
    imageUrl: "",
  );
  final set = FurnishingSet(
    id: "set1",
    hyvId: 0,
    name: LocalizedText.untranslatable(text: "Set 1"),
    jaPronunciation: "",
    imageUrl: "",
    type: "",
    favoriteCharacterHyvIds: [],
    consistsOf: [FurnishingSetComponent(furnishingId: furnishing.id, quantity: 1)],
  );

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db.setFurnishingSetBookmark(set.id, true);
    pageController = PageController();
  });

  tearDown(() async {
    pageController.dispose();
    await db.close();
  });

  // Mirrors the bookmarks page: the tab lives in a [PageView], which disposes
  // it as soon as another tab is shown.
  Future<void> pumpTab(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          // Returned synchronously: the tab calls `requireValue` on it.
          assetDataProvider.overrideWith((ref) => buildTestAssetData(
            furnishingSets: {set.id: set},
            furnishings: {furnishing.id: furnishing},
          )),
        ],
        child: createScreenWithApp(
          Scaffold(
            body: PageView(
              controller: pageController,
              children: const [
                BookmarkFurnishingSetsTab(key: PageStorageKey("bookmarks_furnishing-sets")),
                SizedBox.shrink(), // stands in for the sibling tabs
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> goToPage(WidgetTester tester, int page) async {
    pageController.jumpToPage(page);
    await tester.pumpAndSettle();
  }

  // Cancelling a drift query stream schedules a zero-duration timer, which the
  // test framework flags as pending unless the tree goes away during the test.
  // The pump needs an explicit duration: without one it only flushes
  // microtasks, leaving the timer behind.
  Future<void> disposeTree(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(Duration.zero);
  }

  testWidgets("restores the expanded state after leaving and re-entering the tab", (tester) async {
    await pumpTab(tester);

    // The body is only built while expanded, so it doubles as the expansion state.
    expect(find.byType(FurnishingTable), findsNothing);

    await tester.tap(find.text("Set 1"));
    await tester.pumpAndSettle();
    expect(find.byType(FurnishingTable), findsOne);

    await goToPage(tester, 1);
    expect(find.byType(BookmarkFurnishingSetsTab), findsNothing);

    await goToPage(tester, 0);
    expect(find.byType(FurnishingTable), findsOne);

    await disposeTree(tester);
  });

  testWidgets("keeps a collapsed tile collapsed", (tester) async {
    await pumpTab(tester);

    await goToPage(tester, 1);
    await goToPage(tester, 0);

    expect(find.byType(FurnishingTable), findsNothing);

    await disposeTree(tester);
  });
}
