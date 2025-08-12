import "dart:io";
import "dart:math";

import "package:flutter/material.dart";

import "../constants/dimens.dart";
import "bottom_sheet.dart";

class ListIndexBottomSheet<T> extends StatelessWidget {
  final List<ListIndexItem<T>> items;

  const ListIndexBottomSheet({
    super.key,
    required this.items,
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
                  Navigator.pop(context, item.value);
                },
              ),
          ],
        );
      },
    );
  }
}

/// Represents an item in the ListIndexBottomSheet.
///
/// [T] is the type of the value associated with the item.
class ListIndexItem<T> {
  /// The value returned when this item is selected.
  final T value;
  /// The display title of the item.
  final String title;
  /// The image file shown as the leading icon.
  final File image;
  /// The number of sub-items this item represents.
  ///
  /// Used for scroll offset calculations to determine how much space occupies
  /// in the list, especially when animating to a specific index.
  final int itemCount;

  /// Creates a [ListIndexItem] with the given properties.
  const ListIndexItem({
    required this.value,
    required this.title,
    required this.image,
    required this.itemCount,
  });
}

Future<T?> showListIndexBottomSheet<T>({required BuildContext context, required List<ListIndexItem<T>> items}) {
  return showModalBottomSheet<T>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) {
      return ListIndexBottomSheet<T>(items: items);
    },
  );
}

Future<void> showListIndexBottomSheetWithScroll<T>({
  required BuildContext context,
  required List<ListIndexItem<T>> items,
  required ScrollController scrollController,
  double headerOffset = 0.0,
}) async {
  final result = await showListIndexBottomSheet<T>(context: context, items: items);
  if (result != null && scrollController.hasClients) {
    final offset = getIndexScrollOffset(items, result, headerOffset);
    scrollController.animateTo(
      min(offset, scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutQuint,
    );
  }
}

double getIndexScrollOffset<T>(
  List<ListIndexItem<T>> items,
  T value, [
  double headerOffset = 0.0,
]) {
  double offset = headerOffset;
  for (final e in items) {
    if (e.value == value) {
      return offset;
    }
    offset += stickyListHeaderHeight + (listTileHeight * e.itemCount);
  }
  return offset;
}
