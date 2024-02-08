import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/style_parsed_text.dart";

import "../utils.dart";

void main() {
  testWidgets("StyleParsedText: The specified part becomes bold",
      (tester) async {
    const input = "normal **bold** normal";

    await tester.pumpWidget(createScreenWithApp(StyleParsedText(input)));

    expect(
      find.byWidgetPredicate(
        (widget) {
          if (widget is! Text || widget.textSpan is! TextSpan){
            return false;
          }

          final boldSpan = (widget.textSpan as TextSpan).children![1];
          return boldSpan.toPlainText() == "bold" && boldSpan.style!.fontWeight == FontWeight.bold;
        },
        description: "Second TextSpan's fontWeight is bold",
      ),
      findsOne,
    );
  });
}
