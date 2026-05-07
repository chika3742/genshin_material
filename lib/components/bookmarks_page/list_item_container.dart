import "package:flutter/material.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../models/bookmark.dart";
import "purpose_header.dart";

class BookmarkListItemContainer extends StatelessWidget {
  final Widget child;
  final int index;
  final BookmarkGroup group;

  const BookmarkListItemContainer({
    super.key,
    required this.child,
    required this.index,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          // group header
          Row(
            children: [
              ReorderableDragStartListener(
                index: index,
                child: const Icon(Symbols.drag_handle, size: 32),
              ),
              Expanded(child: BookmarkPurposeHeader(group: group)),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
