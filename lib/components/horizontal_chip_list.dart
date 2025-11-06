import "package:flutter/material.dart";

class HorizontalChipList extends StatelessWidget {
  final List<Widget> chips;

  const HorizontalChipList({
    super.key,
    required this.chips,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ChipTheme(
        data: ChipThemeData(
          elevation: 2,
        ),
        child: Row(
          spacing: 8.0,
          children: chips,
        ),
      ),
    );
  }
}
