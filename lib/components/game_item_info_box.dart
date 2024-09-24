
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../ui_core/layout.dart";

class GameItemInfoBox extends StatelessWidget {
  final Widget itemImage;
  final List<Widget> children;

  const GameItemInfoBox({
    super.key,
    required this.itemImage,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GappedRow(
      children: [
        itemImage,
        Expanded(
          child: GappedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: 4,
            children: children,
          ),
        ),
      ],
    );
  }
}
