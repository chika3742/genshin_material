import "package:flutter/material.dart";

/// A clickable button wrapper with rounded border and padding
class ItemLinkButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget? child;

  const ItemLinkButton({super.key, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}
