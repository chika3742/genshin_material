import "dart:io";

import "package:assorted_layout_widgets/assorted_layout_widgets.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:intl/intl.dart";
import "package:material_symbols_icons/symbols.dart";

import "../core/kv_preferences.dart";
import "../core/theme.dart";
import "../models/common.dart";
import "../pages/database/characters/character_details.dart";
import "../providers/preferences.dart";
import "../routes.dart";
import "../ui_core/layout.dart";

class MaterialCard extends StatelessWidget {
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

  final int? lackNum;
  final int? craftedLackNum;

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
    this.lackNum,
    this.craftedLackNum,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
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
                      if (dailyMaterialAvailable)
                        const Icon(Symbols.event_available, color: Colors.green, weight: 700),
                      _QuantityCrossFade(
                        requiredNumChild: _AnimatedQuantity(quantity),
                        lackNumChild: lackNum != null ? Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Icon(
                                    Symbols.shopping_bag,
                                    size: 20,
                                  ),
                                ),
                                alignment: PlaceholderAlignment.middle,
                              ),
                              TextSpan(
                                text: "${lackNum! >= 0 ? "+" : ""}$lackNum",
                                style: GoogleFonts.titilliumWeb(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(color: lackNum! < 0 ? Colors.red : Colors.green),
                        ) : null,
                        craftedLackNumChild: craftedLackNum != null ? Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Icon(
                                    Symbols.orbit,
                                    size: 20,
                                  ),
                                ),
                                alignment: PlaceholderAlignment.middle,
                              ),
                              TextSpan(
                                text: "${craftedLackNum! >= 0 ? "+" : ""}$craftedLackNum",
                                style: GoogleFonts.titilliumWeb(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(color: craftedLackNum! < 0 ? Colors.red : Colors.green),
                        ) : null,
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

class _QuantityCrossFade extends HookConsumerWidget {
  final Widget requiredNumChild;
  final Widget? lackNumChild;
  final Widget? craftedLackNumChild;
  
  const _QuantityCrossFade({required this.requiredNumChild, this.lackNumChild, this.craftedLackNumChild});

  static const _animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = useValueListenable(QuantityDisplayState.of(context).state);
    final mode = ref.watch(preferencesStateNotifierProvider.select((e) => e.lackNumDisplayMethod));
    switch (mode) {
      case LackNumDisplayMethod.requiredNumOnly:
        state = MaterialCrossFadeState.requiredNum;
        break;
      case LackNumDisplayMethod.lackNumOnly:
        state = MaterialCrossFadeState.lackNum;
        break;
      case LackNumDisplayMethod.craftedLackNumOnly:
        state = MaterialCrossFadeState.craftedLackNum;
        break;
      case LackNumDisplayMethod.alternate:
        // do nothing
    }

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AnimatedOpacity(
          duration: _animationDuration,
          opacity: state == MaterialCrossFadeState.requiredNum ||
              lackNumChild == null ||
              (craftedLackNumChild == null && state == MaterialCrossFadeState.requiredNum) ? 1 : 0,
          child: requiredNumChild,
        ),
        if (lackNumChild != null)
          AnimatedOpacity(
            duration: _animationDuration,
            opacity: state == MaterialCrossFadeState.lackNum ||
                (craftedLackNumChild == null && state != MaterialCrossFadeState.requiredNum) ? 1 : 0,
            child: lackNumChild,
          ),
        if (craftedLackNumChild != null)
          AnimatedOpacity(
            duration: _animationDuration,
            opacity: state == MaterialCrossFadeState.craftedLackNum ? 1 : 0,
            child: craftedLackNumChild,
          ),
      ],
    );
  }
}

class _AnimatedQuantity extends HookWidget {
  final int quantity;
  
  const _AnimatedQuantity(this.quantity);

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: useSingleTickerProvider(),
    );
    final tween = useState(IntTween(begin: quantity, end: quantity));

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

enum MaterialCrossFadeState {
  requiredNum,
  lackNum,
  craftedLackNum,
}
