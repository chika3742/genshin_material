import "package:flutter/material.dart";

import "../utils/text_style_parser.dart";

class StyleParsedText extends StatelessWidget {
  final String text;
  final TextStyle? defaultStyle;
  final TextStyle strongStyle;

  StyleParsedText(
    this.text, {
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
