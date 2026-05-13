import "dart:io";

import "package:flutter/material.dart" hide Material;
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:signed_spacing_flex/signed_spacing_flex.dart";

import "../core/theme.dart";
import "../models/common.dart";
import "../routes.dart";

class MaterialCardEntry {
  /// Material ID for the link to material detail page.
  final String id;

  /// Image of the material.
  final File image;

  /// Name of the material. If null, the name won't be shown.
  final String? name;

  /// Rarity of the material.
  final int? rarity;

  final int quantity;

  /// If null, this value won't be shown.
  final int? lackNum;

  const MaterialCardEntry({
    required this.id,
    required this.image,
    required this.name,
    required this.rarity,
    required this.quantity,
    this.lackNum,
  });
}

class MaterialCard extends HookWidget {
  final List<MaterialCardEntry> entries;

  final int? farmCount;

  final BookmarkState? bookmarkState;

  final bool dailyMaterialAvailable;

  /// Callback for bookmarking the material.
  final void Function(int entryIndex)? onBookmark;

  const MaterialCard({
    super.key,
    required this.entries,
    this.farmCount,
    this.bookmarkState,
    this.dailyMaterialAvailable = false,
    this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    assert(entries.isNotEmpty);

    final currentMaterialIndex = useState(0);
    final material = entries[currentMaterialIndex.value];
    void swapMaterial() {
      currentMaterialIndex.value = (currentMaterialIndex.value + 1) % entries.length;
    }

    return SizedBox(
      height: 60,
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: Stack(
          children: [
            // rarity marker
            if (material.rarity case final rarity?)
              SizedBox(
                width: 6,
                height: 60,
                child: CustomPaint(
                  painter: _RarityCornerMarkerPainter(
                    Theme.of(context).extension<ComponentThemeExtension>()!
                        .getRarityColor(rarity).withValues(alpha: 0.8),
                  ),
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (entries.length >= 2) IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Symbols.swap_horiz),
                  onPressed: swapMaterial,
                ),
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {
                      MaterialDetailsRoute(id: material.id).push(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        spacing: 4,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.file(material.image, width: 35, height: 35),
                          if (material.name case final name?) Flexible(
                            child: Text(name, style: const TextStyle(fontSize: 16)),
                          ),
                          if (dailyMaterialAvailable)
                            const Icon(Symbols.event_available, color: Colors.green, weight: 700),
                          SignedSpacingColumn(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: -4.0,
                            children: [
                              Flexible(
                                child: FittedBox(child: _AnimatedQuantity(material.quantity)),
                              ),
                              if (material.lackNum case final lackNum?)
                                Flexible(
                                  child: Row(
                                    spacing: 4.0,
                                    children: [
                                      Icon(Symbols.shopping_bag, size: 18),
                                      FittedBox(child: _buildLackNumIndicator(lackNum)),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          if (farmCount != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: SignedSpacingColumn(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: -4.0,
                                children: [
                                  Icon(Symbols.agriculture, size: 20),
                                  Text(
                                    farmCount!.toString(),
                                    style: GoogleFonts.titilliumWeb(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (onBookmark == null) const SizedBox(width: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                if (onBookmark != null && bookmarkState != null)
                  const SizedBox(width: 36),
              ],
            ),
            if (onBookmark != null && bookmarkState != null) Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: IconTheme(
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
                    }),
                    onPressed: () {
                      onBookmark!(currentMaterialIndex.value);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLackNumIndicator(int lackNum) {
    if (lackNum <= 0) {
      return Icon(Symbols.check, weight: 700, size: 22, color: Colors.green);
    }

    return DefaultTextStyle(
      style: TextStyle(color: Colors.red),
      child: _AnimatedQuantity(-lackNum, showCross: false),
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

class _AnimatedQuantity extends HookWidget {
  final int quantity;
  final bool showCross;
  
  const _AnimatedQuantity(this.quantity, {this.showCross = true});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: useSingleTickerProvider(),
    );
    final tween = useRef(IntTween(begin: quantity, end: quantity));

    final animatedNum = useAnimation(
      tween.value.animate(animationController.drive(CurveTween(curve: Easing.emphasizedDecelerate))),
    );

    useValueChanged<int, int>(quantity, (prev, _) {
      animationController.reset();
      tween.value = IntTween(begin: prev, end: quantity);
      animationController.forward();
      return null;
    });
    
    return Text.rich(
      TextSpan(
        children: [
          if (showCross)
            TextSpan(text: "x", style: GoogleFonts.titilliumWeb(fontSize: 18)),
          TextSpan(
            text: NumberFormat.decimalPattern().format(animatedNum),
            style: GoogleFonts.titilliumWeb(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
