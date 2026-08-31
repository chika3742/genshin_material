import "package:flutter/material.dart" hide Material;
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/search.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/material.dart";
import "package:genshin_material/utils/filtering.dart";

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
}
