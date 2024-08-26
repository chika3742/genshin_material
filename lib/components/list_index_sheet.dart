import "dart:io";

import "package:flutter/material.dart";

import "../ui_core/bottom_sheet.dart";

class ListIndexSheet extends StatelessWidget {
  final List<ListIndexItem> items;
  final void Function(double scrollOffset)? onSelected;

  const ListIndexSheet({
    super.key,
    required this.items,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollableBottomSheet(
      maxChildSize: 0.8,
      initialChildSize: 0.8,
      builder: (context) {
        return Column(
          children: [
            for (final item in items)
              ListTile(
                leading: Image.file(
                  item.image,
                  width: 36,
                  height: 36,
                ),
                title: Text(item.title),
                onTap: () {
                  Navigator.pop(context);
                  onSelected?.call(item.scrollOffset);
                },
              ),
          ],
        );
      },
    );
  }
}

class ListIndexItem {
  final String title;
  final File image;
  final double scrollOffset;

  const ListIndexItem({
    required this.title,
    required this.image,
    required this.scrollOffset,
  });
}
