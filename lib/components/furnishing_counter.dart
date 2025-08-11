import "dart:math";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

class FurnishingCounter extends StatelessWidget {
  final int requiredCount;
  final int currentCount;
  final ValueChanged<int> onChanged;

  const FurnishingCounter({
    super.key,
    required this.requiredCount,
    required this.currentCount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Symbols.remove),
          onPressed: () {
            onChanged(max(0, currentCount - 1));
          },
        ),
        Text.rich(TextSpan(
          children: [
            TextSpan(
              text: currentCount.toString(),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextSpan(text: "/"),
            TextSpan(text: requiredCount.toString()),
            TextSpan(text: "(${currentCount - requiredCount})"),
          ],
          style: GoogleFonts.titilliumWeb(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: currentCount >= requiredCount
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.error,
          ),
        )),
        IconButton(
          icon: Icon(Symbols.add),
          onPressed: () {
            onChanged(min(requiredCount, currentCount + 1));
          },
        ),
      ],
    );
  }
}
