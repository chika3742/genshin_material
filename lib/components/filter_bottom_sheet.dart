import "package:flutter/material.dart";

import "../ui_core/bottom_sheet.dart";
import "../ui_core/layout.dart";
import "list_subheader.dart";

class FilterBottomSheet extends StatelessWidget {
  final List<Widget> categories;

  const FilterBottomSheet({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ScrollableBottomSheet(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: GappedColumn(
            gap: 16,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: categories,
          ),
        );
      },
    );
  }
}


class FilteringCategory extends StatelessWidget {
  final String labelText;
  final List<Widget> items;

  const FilteringCategory({super.key, required this.labelText, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListSubheader(
            labelText,
            padding: EdgeInsets.zero,
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: items,
          ),
        ],
      ),
    );
  }
}
