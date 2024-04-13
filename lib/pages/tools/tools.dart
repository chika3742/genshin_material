import "package:flutter/material.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/list_tile.dart";
import "../../i18n/strings.g.dart";
import "../../routes.dart";

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.tools),
      ),
      body: ListView(
        children: [
          SimpleListTile(
             leadingIcon: Symbols.diamond,
            title: tr.pages.resinCalc,
            location: ResinCalcRoute().location,
          ),
        ],
      ),
    );
  }
}
