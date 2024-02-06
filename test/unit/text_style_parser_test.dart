import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/text_style_parser.dart";

void main() {
  group("Text Style Parser", () {
    test("Bold string in the middle can be parsed", () {
      const input = "Lorem ipsum **dolor sit** amet,";

      final parsed = parseStyledText(input);

      final expectedFragments = [
        const Fragment(type: FragmentType.text, text: "Lorem ipsum "),
        const Fragment(type: FragmentType.boldText, text: "dolor sit"),
        const Fragment(type: FragmentType.text, text: " amet,"),
      ];

      expect(parsed, expectedFragments);
    });

    test("Bold string from the start can be parsed", () {
      const input = "**Lorem ipsum** dolor sit amet,";

      final parsed = parseStyledText(input);

      final expectedFragments = [
        const Fragment(type: FragmentType.boldText, text: "Lorem ipsum"),
        const Fragment(type: FragmentType.text, text: " dolor sit amet,"),
      ];

      expect(parsed, expectedFragments);
    });

    test("Bold string with no closing marker should be bold to the end", () {
      const input = "Lorem ipsum **dolor sit amet,";

      final parsed = parseStyledText(input);

      final expectedFragments = [
        const Fragment(type: FragmentType.text, text: "Lorem ipsum "),
        const Fragment(type: FragmentType.boldText, text: "dolor sit amet,"),
      ];

      expect(parsed, expectedFragments);
    });

    test("Nested modification CANNOT be parsed properly", () {
      const input = "Lorem **ipsum ~~dolor sit~~ amet**,";

      final parsed = parseStyledText(input);

      final expectedFragments = [
        const Fragment(type: FragmentType.text, text: "Lorem "),
        const Fragment(type: FragmentType.boldText, text: "ipsum "),
        const Fragment(type: FragmentType.strikethroughText, text: "dolor sit"),
        const Fragment(type: FragmentType.text, text: " amet"),
        const Fragment(type: FragmentType.boldText, text: ","),
      ];

      expect(parsed, expectedFragments);
    });
  });
}
