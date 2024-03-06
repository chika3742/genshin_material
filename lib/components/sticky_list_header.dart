import "package:flutter/material.dart";

class StickyListHeader extends StatelessWidget {
  static const height = 38.0;

  final String text;

  const StickyListHeader(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Theme.of(context).colorScheme.surfaceVariant,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
