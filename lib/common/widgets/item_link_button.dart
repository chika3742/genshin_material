import "package:flutter/material.dart";

/// Button wrapper that provides tap feedback for navigation links.
///
/// A reusable component that wraps any widget to make it tappable with
/// visual feedback (InkWell ripple effect). Commonly used for item navigation
/// links throughout the app.
class ItemLinkButton extends StatelessWidget {
  const ItemLinkButton({
    required this.onTap,
    required this.child,
    super.key,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: child,
      ),
    );
  }
}
