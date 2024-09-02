import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:material_symbols_icons/symbols.dart";

import "../i18n/strings.g.dart";
import "../models/material.dart";
import "../utils/teyvat_map.dart";
import "list_tile.dart";

class ItemSourceWidget extends StatelessWidget {
  final ItemSource source;

  const ItemSourceWidget(this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return switch (source) {
      TeyvatMapItemSource(:final typeId, :final center) => OverflowBox(
        fit: OverflowBoxFit.deferToChild,
        maxWidth: MediaQuery.of(context).size.width,
        child: SimpleListTile(
          leadingIcon: Symbols.map,
          title: tr.materialDetailsPage.toTeyvatMap,
          trailingIcon: Symbols.chevron_right,
          onTap: () {
            openTeyvatMap(typeId, initialPosition: center);
          },
        ),
      ),
      TextItemSource(:final text) => Text(text.localized),
    };
  }
}
