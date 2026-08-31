import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/rarity_stars.dart";
import "package:genshin_material/core/theme.dart";

import "../../utils.dart";

void main() {
  Future<void> pumpStars(WidgetTester tester, int count) async {
    await tester.pumpWidget(
      createScreenWithApp(
        Scaffold(
          body: RarityStars(count: count),
        ),
      ),
    );
  }

  testWidgets("draws as many stars as the given count", (tester) async {
    await pumpStars(tester, 3);

    expect(find.byIcon(Icons.star), findsNWidgets(3));
  });

  testWidgets("draws a single star for the lowest rarity", (tester) async {
    await pumpStars(tester, 1);

    expect(find.byIcon(Icons.star), findsOne);
  });

  testWidgets("draws five stars for the highest rarity", (tester) async {
    await pumpStars(tester, 5);

    expect(find.byIcon(Icons.star), findsNWidgets(5));
  });

  testWidgets("draws nothing for a count of zero", (tester) async {
    await pumpStars(tester, 0);

    expect(find.byIcon(Icons.star), findsNothing);
    expect(find.byType(RarityStars), findsOne);
  });

  testWidgets("falls back to no color when the component theme is missing", (tester) async {
    await pumpStars(tester, 2);

    final icons = tester.widgetList<Icon>(find.byIcon(Icons.star));
    expect(icons, everyElement(isA<Icon>().having((e) => e.color, "color", isNull)));
  });

  testWidgets("takes the star color from the component theme extension", (tester) async {
    const starColor = Color(0xFF123456);
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: [
            ComponentThemeExtension(
              starColor: starColor,
              rarity1Color: null,
              rarity2Color: null,
              rarity3Color: null,
              rarity4Color: null,
              rarity5Color: null,
            ),
          ],
        ),
        home: const Scaffold(
          body: RarityStars(count: 2),
        ),
      ),
    );

    final icons = tester.widgetList<Icon>(find.byIcon(Icons.star));
    expect(icons, everyElement(isA<Icon>().having((e) => e.color, "color", starColor)));
  });
}
