import "dart:io";

import "package:flutter/material.dart";
import "package:material_symbols_icons/symbols.dart";

import "../core/theme.dart";
import "../models/common.dart";
import "../routes.dart";

class MaterialCard extends StatelessWidget {
  /// Image file of the material.
  final File image;

  /// Name of the material.
  final String name;

  /// Rarity of the material.
  final int? rarity;

  final int? quantity;

  /// Material ID for linking to the material details.
  final String? id;

  final BookmarkState? bookmarkState;

  /// Callback for bookmarking the material.
  final void Function()? onBookmark;

  final void Function()? onSwapExpItem;

  const MaterialCard({
    super.key,
    required this.image,
    required this.name,
    this.rarity,
    this.quantity,
    this.id,
    this.bookmarkState,
    this.onBookmark,
    this.onSwapExpItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (onSwapExpItem != null) IconButton(
                icon: const Icon(Symbols.swap_horiz),
                onPressed: onSwapExpItem,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: id != null ? () {
                  MaterialDetailsRoute(id: id!).push(context);
                } : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.file(image, width: 35, height: 35),
                      // Text(name),
                      if (quantity != null) Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            "x$quantity",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20,),
                          ),
                        ),
                    ],
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
                child: IconButton(
                  icon: Icon(switch (bookmarkState!) {
                    BookmarkState.bookmarked => Symbols.bookmark_added,
                    BookmarkState.partial => Symbols.bookmark_remove,
                    BookmarkState.none => Symbols.bookmark_add,
                  },),
                  onPressed: onBookmark,
                ),
              ),
            ],
          ),
          if (rarity != null) Positioned.fill(
            right: null,
            child: SizedBox(
              width: 6,
              child: CustomPaint(
                painter: _RarityCornerMarkerPainter(
                  Theme.of(context).extension<ComponentThemeExtension>()!
                      .getRarityColor(rarity!).withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
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
