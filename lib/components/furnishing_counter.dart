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
          visualDensity: VisualDensity.compact,
          icon: Icon(Symbols.remove),
          onPressed: currentCount > 0 ? () {
            onChanged(max(0, currentCount - 1));
          } : null,
        ),
        AnimatedDefaultTextStyle(
          duration: Durations.short4,
          style: TextStyle(
            color: currentCount >= requiredCount
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.error,
          ),
          child: Text.rich(TextSpan(
            children: [
              TextSpan(
                text: currentCount.toString(),
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              TextSpan(text: "/"),
              TextSpan(text: requiredCount.toString()),
              if (currentCount < requiredCount)
                TextSpan(text: "(${currentCount - requiredCount})"),
            ],
            style: GoogleFonts.titilliumWeb(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          )),
        ),
        if (currentCount < requiredCount)
          IconButton(
            icon: Icon(Symbols.add),
            onPressed: currentCount < requiredCount ? () {
              onChanged(min(requiredCount, currentCount + 1));
            } : null,
          )
        else
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(Symbols.check, color: Colors.green, weight: 800),
          ),
      ],
    );
  }
}
