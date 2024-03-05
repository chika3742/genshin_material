import "package:flutter/material.dart";

import "../core/theme.dart";

class RarityStars extends StatelessWidget {
  const RarityStars({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < count; i++)
          Icon(
            Icons.star,
            size: 20,
            color: Theme.of(context)
                .extension<ComponentThemeExtension>()
                ?.starColor,
          ),
      ],
    );
  }
}
