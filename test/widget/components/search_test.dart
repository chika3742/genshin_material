import "package:flutter/material.dart" hide Material;
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/search.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/material.dart";
import "package:genshin_material/utils/filtering.dart";
import "package:go_router/go_router.dart";

import "../../utils.dart";
import "../../utils/asset_data.dart";

void main() {
  Material item(String name, {String jaPronunciation = ""}) {
    return buildTestMaterial(
      id: name,
      name: LocalizedText.untranslatable(text: name),
      jaPronunciation: jaPronunciation,
    );
  }

  final berry = item("Berry");
  final cranberry = item("Cranberry");
  final amethyst = item("Amethyst", jaPronunciation: "アメジスト");
  final items = [cranberry, berry, amethyst];

  late List<Material> tapped;

  setUp(() {
    tapped = [];
  });

  Future<void> openSearch(
    WidgetTester tester, {
    List<Material>? candidates,
    String hintTargetText = "",
  }) async {
    await tester.pumpWidget(
      createScreenWithApp(
        Scaffold(
          appBar: AppBar(
            actions: [
              SearchButton<Material>(
                hintTargetText: hintTargetText,
                queryCallback: (query) =>
                    filterBySearchQuery(candidates ?? items, query),
                resultItemBuilder: (context, item) => ListTile(
                  key: Key(item.id),
                  title: Text(item.name.localized),
                  onTap: () => tapped.add(item),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();
  }

  Future<void> search(WidgetTester tester, String query) async {
    await tester.enterText(find.byType(TextField), query);
    await tester.pumpAndSettle();
  }

  testWidgets("opens the search page from the button", (tester) async {
    await openSearch(tester);

    expect(find.byType(TextField), findsOne);
  });

  testWidgets("shows the hint for the given target", (tester) async {
    const target = "materials";
    await openSearch(tester, hintTargetText: target);

    final decoration = tester.widget<TextField>(find.byType(TextField)).decoration!;
    expect(decoration.hintText, tr.search.hint(target: target));
  });

  testWidgets("shows no result for an empty query", (tester) async {
    await openSearch(tester);

    expect(find.byType(ListTile), findsNothing);
    expect(find.text(tr.search.noResults), findsNothing);
  });

  testWidgets("lists the matching items", (tester) async {
    await openSearch(tester);

    await search(tester, "berry");

    expect(find.byType(ListTile), findsNWidgets(2));
  });

  testWidgets("puts a prefix match before a partial one", (tester) async {
    await openSearch(tester);

    await search(tester, "berry");

    final titles = tester
        .widgetList<ListTile>(find.byType(ListTile))
        .map((e) => (e.title! as Text).data)
        .toList();
    expect(titles, [berry.name.localized, cranberry.name.localized]);
  });

  testWidgets("matches the japanese pronunciation of a hiragana query", (tester) async {
    await openSearch(tester);

    await search(tester, "あめじ");

    expect(find.byKey(Key(amethyst.id)), findsOne);
    expect(find.byType(ListTile), findsOne);
  });

  testWidgets("tells the user when nothing matches", (tester) async {
    await openSearch(tester);

    await search(tester, "nothing matches this");

    expect(find.text(tr.search.noResults), findsOne);
    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets("goes back to an empty list when the query is cleared", (tester) async {
    await openSearch(tester);

    await search(tester, "nothing matches this");
    await search(tester, "");

    expect(find.text(tr.search.noResults), findsNothing);
    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets("reports the tapped result", (tester) async {
    await openSearch(tester);

    await search(tester, "cran");
    await tester.tap(find.byKey(Key(cranberry.id)));
    await tester.pumpAndSettle();

    expect(tapped, [cranberry]);
  });

  testWidgets("shows no result when there is nothing to search", (tester) async {
    await openSearch(tester, candidates: []);

    await search(tester, "berry");

    expect(find.text(tr.search.noResults), findsOne);
  });

  group("SearchResultListTile", () {
    // The tile navigates through go_router, so this group needs a router
    // instead of the plain MaterialApp of createScreenWithApp.
    const imageKey = Key("search-result-image");
    late GoRouter router;

    Future<void> openSearchWithRouter(WidgetTester tester) async {
      router = GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
            path: "/",
            builder: (context, state) => Scaffold(
              appBar: AppBar(
                actions: [
                  SearchButton<Material>(
                    queryCallback: (query) => filterBySearchQuery(items, query),
                    resultItemBuilder: (context, item) => SearchResultListTile(
                      image: const SizedBox(key: imageKey, width: 24, height: 24),
                      title: item.name.localized,
                      location: "/materials/${item.id}",
                    ),
                  ),
                ],
              ),
            ),
          ),
          GoRoute(
            path: "/materials/:id",
            builder: (context, state) =>
                Scaffold(body: Text("details:${state.pathParameters["id"]}")),
          ),
        ],
      );

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      await search(tester, "cran");
    }

    tearDown(() {
      router.dispose();
    });

    testWidgets("navigates to the location of the tapped result", (tester) async {
      await openSearchWithRouter(tester);

      await tester.tap(find.byType(SearchResultListTile));
      await tester.pumpAndSettle();

      expect(router.state.uri.toString(), "/materials/${cranberry.id}");
      expect(find.text("details:${cranberry.id}"), findsOne);
    });

    testWidgets("closes the search page before navigating", (tester) async {
      await openSearchWithRouter(tester);

      await tester.tap(find.byType(SearchResultListTile));
      await tester.pumpAndSettle();

      // A route that was only covered would still be in the tree offstage, so
      // the search page is gone from the navigator, not merely hidden.
      expect(find.byType(TextField, skipOffstage: false), findsNothing);
    });

    testWidgets("shows the given title and image", (tester) async {
      await openSearchWithRouter(tester);

      expect(find.text(cranberry.name.localized), findsOne);
      // The trailing chevron builds a SizedBox of its own, so only the key
      // tells the given image apart from it.
      expect(
        find.descendant(
          of: find.byType(SearchResultListTile),
          matching: find.byKey(imageKey),
        ),
        findsOne,
      );
    });
  });
}
