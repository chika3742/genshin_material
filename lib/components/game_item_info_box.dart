import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

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
    return Row(
      spacing: 8.0,
      children: [
        itemImage,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: children,
          ),
        ),
      ],
    );
  }
}
