
import "dart:io";
import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "scroll_blur_effect.dart";


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

class ScrollableBottomSheet extends HookWidget {
  final WidgetBuilder builder;
  final double maxChildSize;
  final double initialChildSize;

  const ScrollableBottomSheet({
    super.key,
    required this.builder,
    this.maxChildSize = 0.9,
    this.initialChildSize = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    final contentKey = useMemoized(() => GlobalKey());

    final calculatedMaxChildSize = useState(maxChildSize);
    final calculatedInitialChildSize = useState(initialChildSize);
    final availableHeight = useRef<double?>(null);

    double calculateIntrinsicChildSize() {
      final renderBox = contentKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null || availableHeight.value == null) {
        return maxChildSize;
      }

      return min(renderBox.size.height / availableHeight.value!, maxChildSize);
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        calculatedMaxChildSize.value = calculateIntrinsicChildSize();
        calculatedInitialChildSize.value = min(initialChildSize, calculatedMaxChildSize.value);
      });
      return null;
    }, [],);

    return LayoutBuilder(
      builder: (context, constraints) {
        availableHeight.value = constraints.maxHeight;

        return DraggableScrollableSheet(
          maxChildSize: calculatedMaxChildSize.value,
          initialChildSize: calculatedInitialChildSize.value,
          expand: false,
          snap: true,
          builder: (context, scrollController) {
            return ScrollBlurEffect(
              scrollController: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                physics: scrollController.hasClients && scrollController.position.maxScrollExtent == 0
                    ? const NeverScrollableScrollPhysics()
                    : null,
                child: KeyedSubtree(
                  key: contentKey,
                  child: builder(context),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

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

class ListIndexItem<T> {
  final T value;
  final String title;
  final File image;

  const ListIndexItem({
    required this.value,
    required this.title,
    required this.image,
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
