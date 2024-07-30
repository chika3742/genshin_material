import "package:flutter/material.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

class FilterChipWithIcon extends StatelessWidget {
  final Widget label;
  final bool selected;
  final void Function(bool value)? onSelected;
  final Widget? leading;
  final Widget? trailing;

  const FilterChipWithIcon({
    super.key,
    required this.label,
    required this.onSelected,
    this.selected = false,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            IconTheme(
              data: const IconThemeData(size: 18),
              child: leading!,
            ),
            const SizedBox(width: 8),
          ],
          label,
          if (trailing != null) ...[
            const SizedBox(width: 8),
            IconTheme(
              data: const IconThemeData(size: 18),
              child: trailing!,
            ),
          ],
        ],
      ),
      selected: selected,
      onSelected: onSelected,
    );
  }
}

class FilterChipWithMenu extends FilterChipWithIcon {
  const FilterChipWithMenu({
    super.key,
    required super.label,
    required super.onSelected,
    super.leading,
    super.selected,
  }) : super(trailing: const Icon(Symbols.arrow_drop_down));
}
