import "package:flutter/material.dart";

import "style_parsed_text.dart";

class EffectDescription extends StatelessWidget {
  final String input;

  const EffectDescription(this.input, {super.key});

  @override
  Widget build(BuildContext context) {
    return StyleParsedText(
      input,
      strongStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
