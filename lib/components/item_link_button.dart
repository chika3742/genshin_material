import "package:flutter/material.dart";

class ItemLinkButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final GestureTapCallback? onTap;
  final Widget? child;

  const ItemLinkButton({
    super.key,
    this.onTap,
    this.child,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
