import "package:material_ui/material_ui.dart";

import "../utils/text_style_parser.dart";

class StyleParsedText extends StatelessWidget {
  final TextStyle? defaultStyle;
  final TextStyle strongStyle;

  StyleParsedText(
    String text, {
    super.key,
    this.defaultStyle,
    this.strongStyle = const TextStyle(fontWeight: FontWeight.bold),
  }) : fragments = parseStyledText(text);

  final List<Fragment> fragments;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: fragments.map((e) {
            return TextSpan(
              text: e.text,
              style: e.type == FragmentType.boldText ? strongStyle : null,
            );
          }).toList(),
      ),
      style: defaultStyle,
    );
  }
}
