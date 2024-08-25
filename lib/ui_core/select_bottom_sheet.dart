
import "package:flutter/material.dart";


class SelectBottomSheet<T> extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final T? selectedValue;
  final List<SelectBottomSheetItem<T>> items;

  const SelectBottomSheet({
    super.key,
    required this.title,
    required this.items,
    this.subtitle,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              DefaultTextStyle(
                style: Theme.of(context).textTheme.titleMedium!,
                child: title,
              ),
              const SizedBox(height: 8),
              if (subtitle != null) DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyMedium!,
                child: subtitle!,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        for (final item in items)
          _buildItem(context, item),
      ],
    );
  }

  Widget _buildItem(BuildContext context, SelectBottomSheetItem<T> item) {
    return ListTile(
      leading: selectedValue == item.value ? const Icon(Icons.check) : const SizedBox(),
      title: Text(item.text),
      selected: selectedValue == item.value,
      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      onTap: () {
        Navigator.of(context).pop(item.value);
      },
    );
  }
}

Future<T?> showSelectBottomSheet<T>({
  required BuildContext context,
  required Widget title,
  required List<SelectBottomSheetItem<T>> items,
  Widget? subtitle,
  T? selectedValue,
}) {
  return showModalBottomSheet<T>(
    context: context,
    showDragHandle: true,
    builder: (_) {
      return SelectBottomSheet(
        title: title,
        subtitle: subtitle,
        items: items,
        selectedValue: selectedValue,
      );
    },
  );
}

class SelectBottomSheetItem<T> {
  final String text;
  final T value;

  const SelectBottomSheetItem({
    required this.text,
    required this.value,
  });
}
