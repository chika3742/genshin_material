import "package:flutter/material.dart";

import "../core/theme.dart";

class RarityBadge extends StatelessWidget {
  final int rarity;

  const RarityBadge(this.rarity, {super.key});

  @override
  Widget build(BuildContext context) {
    final rarityColor = Theme.of(context)
        .extension<ComponentThemeExtension>()!
        .getRarityColor(rarity);

    return Container(
      width: 48,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: rarityColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        "★$rarity",
        style: TextStyle(
          fontSize: 14,
          color: rarityColor,
        ),
      ),
    );
  }
}
