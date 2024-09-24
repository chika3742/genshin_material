import "dart:io";

import "package:assorted_layout_widgets/assorted_layout_widgets.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:material_symbols_icons/symbols.dart";

import "../core/theme.dart";
import "../models/common.dart";
import "../routes.dart";
import "../ui_core/layout.dart";

class MaterialCard extends HookWidget {
  /// Image file of the material.
  final File image;

  /// Name of the material.
  final String name;

  final bool showName;

  /// Rarity of the material.
  final int? rarity;

  final int quantity;

  /// Material ID for linking to the material details.
  final String? id;

  final BookmarkState? bookmarkState;

  final bool dailyMaterialAvailable;

  /// Callback for bookmarking the material.
  final void Function()? onBookmark;

  final void Function()? onSwapExpItem;

  const MaterialCard({
    super.key,
    required this.image,
    required this.name,
    this.showName = true,
    this.rarity,
    required this.quantity,
    this.id,
    this.bookmarkState,
    this.dailyMaterialAvailable = false,
    this.onBookmark,
    this.onSwapExpItem,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: useSingleTickerProvider(),
    );
    final tween = useState(IntTween(begin: quantity, end: quantity));

    final animatedQuantity = useAnimation(
      tween.value.animate(animationController.drive(CurveTween(curve: Easing.emphasizedDecelerate))),
    );

    useValueChanged<int, int>(quantity, (prev, _) {
      animationController.reset();
      tween.value = IntTween(begin: prev, end: quantity);
      animationController.forward();
      return null;
    });

    return SizedBox(
      height: 60,
      child: Card(
        child: RowSuper(
          mainAxisSize: MainAxisSize.min,
          innerDistance: -8,
          children: [
            if (rarity != null)
              SizedBox(
                width: 6,
                height: 60,
                child: CustomPaint(
                  painter: _RarityCornerMarkerPainter(
                    Theme.of(context).extension<ComponentThemeExtension>()!
                        .getRarityColor(rarity!).withOpacity(0.8),
                  ),
                ),
              ),
            const SizedBox(width: 16),
            if (onSwapExpItem != null) IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Symbols.swap_horiz),
              onPressed: onSwapExpItem,
            ),
            SizedBox(
              height: 60,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: id != null ? () {
                  MaterialDetailsRoute(id: id!).push(context);
                } : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GappedRow(
                    gap: 4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.file(image, width: 35, height: 35),
                      if (showName) Expanded(
                        child: Text(name, style: const TextStyle(fontSize: 16)),
                      ),
                      if (dailyMaterialAvailable) const Icon(Symbols.event_available, color: Colors.green, weight: 700),
                      const SizedBox(),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "x", style: GoogleFonts.titilliumWeb(fontSize: 18)),
                            TextSpan(
                              text: NumberFormat.decimalPattern().format(animatedQuantity),
                              style: GoogleFonts.titilliumWeb(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (onBookmark != null && bookmarkState != null) IconTheme(
              data: Theme.of(context).iconTheme.copyWith(
                fill: switch (bookmarkState!) {
                  BookmarkState.bookmarked => 1,
                  BookmarkState.partial => 1,
                  BookmarkState.none => 1,
                },
                color: switch (bookmarkState!) {
                  BookmarkState.bookmarked => Colors.orange,
                  BookmarkState.partial => Colors.lightGreen,
                  BookmarkState.none => null,
                },
              ),
              child: Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(switch (bookmarkState!) {
                    BookmarkState.bookmarked => Symbols.bookmark_added,
                    BookmarkState.partial => Symbols.bookmark_remove,
                    BookmarkState.none => Symbols.bookmark_add,
                  },),
                  onPressed: onBookmark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RarityCornerMarkerPainter extends CustomPainter {
  final Color color;

  const _RarityCornerMarkerPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(size.width, 0) // upper right corner
      ..lineTo(size.width, size.height) // lower right corner
      ..arcToPoint(
        Offset(0, size.height - size.width),
        radius: Radius.circular(size.width),
      ) // end of the arc at the LOWER LEFT corner
      ..lineTo(0, size.width) // end of the arc at the UPPER LEFT corner
      ..arcToPoint(
        Offset(size.width, 0),
        radius: Radius.circular(size.width),
      ); // upper right corner
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
