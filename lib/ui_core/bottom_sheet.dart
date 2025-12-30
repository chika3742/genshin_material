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
      selectedTileColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
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
  final Widget? title;
  final List<Widget> actions;
  final bool ignoreChildSize;
  final WidgetBuilder builder;
  final double maxChildSize;
  final double initialChildSize;

  const ScrollableBottomSheet({
    super.key,
    required this.builder,
    this.title,
    this.actions = const [],
    this.ignoreChildSize = false,
    this.maxChildSize = 0.9,
    this.initialChildSize = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    final contentKey = useMemoized(() => GlobalKey());

    final childRenderBoxSize = useState<Size?>(null);
    final availableHeight = useRef<double?>(null);

    void updateChildSize() {
      childRenderBoxSize.value = (contentKey.currentContext?.findRenderObject() as RenderBox?)?.size;
    }

    double calculateIntrinsicChildSize() {
      if (childRenderBoxSize.value == null || availableHeight.value == null) {
        return maxChildSize;
      }

      return min(childRenderBoxSize.value!.height / availableHeight.value!, maxChildSize);
    }

    final calculatedMaxChildSize = calculateIntrinsicChildSize();
    final calculatedInitialChildSize = ignoreChildSize
        ? initialChildSize
        : min(initialChildSize, calculatedMaxChildSize);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        updateChildSize();
      });
      return null;
    }, [],);

    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (notification) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          updateChildSize();
        });
        return false;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title case final title when title != null) title,
          Flexible(
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    availableHeight.value = constraints.maxHeight;

                    return DraggableScrollableSheet(
                      minChildSize: 0,
                      maxChildSize: calculatedMaxChildSize,
                      initialChildSize: calculatedInitialChildSize,
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
                            child: SizeChangedLayoutNotifier(
                              child: KeyedSubtree(
                                key: contentKey,
                                child: builder(context),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom + 16.0,
                  right: 16.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
