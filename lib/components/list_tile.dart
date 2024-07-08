import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:go_router/go_router.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../core/theme.dart";

class SimpleListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool enabled;

  /// Exclusive with [onTap]
  final String? location;

  /// Exclusive with [location]
  final void Function()? onTap;

  const SimpleListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.enabled = true,
    this.location,
    this.onTap,
  })  : assert(location == null || onTap == null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title != null ? Text(title!) : null,
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: leadingIcon != null ? Icon(leadingIcon) : null,
      enabled: enabled,
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

class GameItemListTile extends StatelessWidget {
  final File image;
  final String name;
  final int rarity;
  final bool rounded;
  final void Function()? onTap;

  const GameItemListTile({
    super.key,
    required this.image,
    required this.name,
    required this.rarity,
    this.rounded = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.file(
        image,
        width: 36,
        height: 36,
      ),
      title: Text(name),
      trailing: Container(
        width: 48,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context)
                .extension<ComponentThemeExtension>()!
                .getRarityColor(rarity),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          "★$rarity",
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context)
                .extension<ComponentThemeExtension>()!
                .getRarityColor(rarity),
          ),
        ),
      ),
      shape: rounded ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ) : null,
      onTap: onTap,
    );
  }
}

class PopupMenuListTile extends HookWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final List<PopupMenuEntry> items;

  const PopupMenuListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final listTileKey = useMemoized(() => GlobalKey());

    return ListTile(
      key: listTileKey,
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      onTap: () {
        final renderBox = listTileKey.currentContext!.findRenderObject() as RenderBox;
        final size = renderBox.size;
        final offset = renderBox.localToGlobal(Offset.zero);
        final position = RelativeRect.fromLTRB(16, offset.dy + size.height, 16, offset.dy + size.height);
        showMenu(
          context: context,
          position: position,
          items: items,
        );
      },
    );
  }
}
