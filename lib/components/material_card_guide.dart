import "package:google_fonts/google_fonts.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:material_ui/material_ui.dart";

import "../core/theme.dart";
import "../i18n/strings.g.dart";
import "../ui_core/bottom_sheet.dart";

Future<void> showMaterialCardGuide(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    useRootNavigator: true,
    isScrollControlled: true,
    builder: (_) => const _MaterialCardGuide(),
  );
}

class _MaterialCardGuide extends StatelessWidget {
  const _MaterialCardGuide();

  @override
  Widget build(BuildContext context) {
    final t = tr.materialCard.guide;
    final rarityColor = Theme.of(context).extension<ComponentThemeExtension>()!.getRarityColor(5);
    final lackText = Text(
      "-9",
      style: GoogleFonts.titilliumWeb(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
    );

    // shortcut: icons, colors and fonts are copied from material_card.dart; update both together.
    return ScrollableBottomSheet(
      title: Text(t.title, style: Theme.of(context).textTheme.titleMedium),
      builder: (context) {
        return SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _row(
                Container(
                  width: 6,
                  height: 32,
                  decoration: BoxDecoration(
                    color: rarityColor.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      bottomLeft: Radius.circular(3),
                    ),
                  ),
                ),
                t.rarity,
              ),
              _row(const Icon(Symbols.swap_horiz), t.swap, t.swapNote),
              _row(const Icon(Symbols.event_available, color: Colors.green, weight: 700), t.dailyAvailable),
              _row(
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "x", style: GoogleFonts.titilliumWeb(fontSize: 18)),
                      TextSpan(text: "99", style: GoogleFonts.titilliumWeb(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                t.quantity,
              ),
              _row(_lackIcon(Symbols.shopping_bag, lackText), t.bagLack, t.bagNote),
              _row(_lackIcon(Symbols.shopping_bag, const Icon(Symbols.check, weight: 700, size: 22, color: Colors.green)), t.bagEnough, t.bagNote),
              _row(_lackIcon(Symbols.orbit, const Icon(Symbols.check, weight: 700, size: 22, color: Colors.blue)), t.craftEnough, t.craftNote),
              _row(_lackIcon(Symbols.orbit, lackText), t.craftLack, t.craftNote),
              _row(const Icon(Symbols.agriculture), t.farmCount, t.farmCountNote),
              _row(const Icon(Symbols.bookmark_remove, fill: 1, color: Colors.lightGreen), t.bookmarkPartial),
            ],
          ),
        );
      },
    );
  }

  Widget _row(Widget leading, String title, [String? subtitle]) {
    return ListTile(
      leading: SizedBox(width: 48, child: FittedBox(fit: BoxFit.scaleDown, child: leading)),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
    );
  }

  Widget _lackIcon(IconData icon, Widget status) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4.0,
      children: [Icon(icon, size: 18), status],
    );
  }
}
