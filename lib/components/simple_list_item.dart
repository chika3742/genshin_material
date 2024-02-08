import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

class SimpleListItem extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  /// Exclusive with [onTap]
  final String? location;

  /// Exclusive with [location]
  final void Function()? onTap;

  const SimpleListItem({
    super.key,
    this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.location,
    this.onTap,
  })  : assert(location == null || onTap == null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title != null ? Text(title!) : null,
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: leadingIcon != null ? Icon(leadingIcon) : null,

      trailing: trailingIcon != null
          ? Icon(trailingIcon)
          : location != null
              ? const Icon(Symbols.chevron_right)
              : null,
      onTap: location != null
          ? () {
              context.go(location!);
            }
          : onTap,
    );
  }
}
