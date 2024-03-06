import "dart:io";
import "dart:math";

import "package:flutter/material.dart";

class ListIndexSheet extends StatelessWidget {
  final ScrollController listScrollController;
  final List<ListIndexItem> items;

  const ListIndexSheet({
    super.key,
    required this.listScrollController,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      initialChildSize: 0.8,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
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

                    listScrollController.animateTo(
                      min(item.scrollOffset, listScrollController.position.maxScrollExtent),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                    );
                  },
                ),
            ],
          ),
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
