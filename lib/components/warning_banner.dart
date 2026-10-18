import "package:flutter/material.dart";
import "package:material_symbols_icons/symbols.dart";

class WarningBanner extends StatelessWidget {
  final String text;

  const WarningBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 8,
          children: [
            Icon(Symbols.warning),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
