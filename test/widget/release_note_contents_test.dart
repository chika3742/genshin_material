import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/release_note_contents.dart";

import "../utils.dart";

void main() {
  testWidgets("ReleaseNoteContents", (tester) async {
    const input = """# Heading
- List item
  - Nested list item
""";

    await tester.pumpWidget(
      createScreenWithApp(
        const ReleaseNoteContents(contentsText: input),
      ),
    );

    final columnFinder = find.byType(Column);
    expect(columnFinder, findsOne); // content columns

    final column = columnFinder.found.first.widget as Column;

    var colIndex = 0;

    expect(
      find.descendant(
        of: find.byWidget(column.children[colIndex]),
        matching: find.byIcon(Icons.arrow_right),
      ),
      findsOne,
    ); // find heading triangle icon
    expect(
      find.descendant(
        of: find.byWidget(column.children[colIndex]),
        matching: find.text("Heading"),
      ),
      findsOne,
    ); // find heading text

    colIndex = 2;

    expect(
      find.descendant(
        of: find.byWidget(column.children[colIndex]),
        matching: find.byType(CustomPaint),
      ),
      findsOne,
    );

    expect(
      find.descendant(
        of: find.byWidget(column.children[colIndex]),
        matching: find.byWidgetPredicate((widget) {
          return widget is CustomPaint &&
              (widget.painter as ListMarkerPainter?)?.style ==
                  MarkerStyle.filled;
        }),
      ),
      findsOne,
    ); // find list item bullet
    expect(
      find.descendant(
        of: find.byWidget(column.children[colIndex]),
        matching: find.text("List item"),
      ),
      findsOne,
    ); // find list item text

    colIndex = 4;

    expect(
      find.descendant(
        of: find.byWidget(column.children[colIndex]),
        matching: find.byWidgetPredicate((widget) {
          return widget is CustomPaint &&
              (widget.painter as ListMarkerPainter?)?.style ==
                  MarkerStyle.outlined;
        }),
      ),
      findsOne,
    ); // find list item bullet
    expect((column.children[colIndex] as Padding).padding, const EdgeInsets.only(left: 32)); // check list item padded
    expect(
      find.descendant(
        of: find.byWidget(column.children[colIndex]),
        matching: find.text("Nested list item"),
      ),
      findsOne,
    ); // find list item text
  });
}
