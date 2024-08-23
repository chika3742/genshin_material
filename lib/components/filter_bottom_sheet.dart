import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "layout.dart";
import "list_subheader.dart";
import "scroll_blur_effect.dart";

class FilterBottomSheet extends HookWidget {
  final List<Widget> categories;

  const FilterBottomSheet({super.key, required this.categories});


@override
  Widget build(BuildContext context) {
    final contentKey = useMemoized(() => GlobalKey());

    const maxChildSize = 0.9;
    const initialChildSize = 0.6;

    final currentMaxChildSize = useState(maxChildSize);
    final availableHeight = useRef<double?>(null);

    double calculateIntrinsicChildSize() {
      final renderBox = contentKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null || availableHeight.value == null) {
        return maxChildSize;
      }

      return max(initialChildSize, min(renderBox.size.height / availableHeight.value!, maxChildSize));
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        currentMaxChildSize.value = calculateIntrinsicChildSize();
      });
      return null;
    }, [],);

    return LayoutBuilder(
      builder: (context, constraints) {
        availableHeight.value = constraints.maxHeight;

        return DraggableScrollableSheet(
          maxChildSize: currentMaxChildSize.value,
          initialChildSize: initialChildSize,
          expand: false,
          snap: true,
          builder: (context, scrollController) {
            return ScrollBlurEffect(
              scrollController: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                physics: maxChildSize != currentMaxChildSize.value ? const NeverScrollableScrollPhysics() : null,
                child: Padding(
                  key: contentKey,
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child: GappedColumn(
                    gap: 16,
                    mainAxisSize: MainAxisSize.min,
                    children: categories,
                  ),
                ),
              ),
            );
          },
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
            children: items,
          ),
        ],
      ),
    );
  }
}
