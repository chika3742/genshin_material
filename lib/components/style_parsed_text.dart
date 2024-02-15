import "package:flutter/material.dart";

import "../utils/text_style_parser.dart";

class StyleParsedText extends StatelessWidget {
  final String text;
  final TextStyle? defaultStyle;

  StyleParsedText(this.text, {super.key, this.defaultStyle})
      : fragments = parseStyledText(text);

  final List<Fragment> fragments;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: fragments.map((e) {
            return TextSpan(
              text: e.text,
              style: TextStyle(
                fontWeight:
                    e.type == FragmentType.boldText ? FontWeight.bold : null,
              ),
            );
          }).toList(),
      ),
      style: defaultStyle,
    );
  }
}
