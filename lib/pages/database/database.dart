import "package:flutter/material.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../components/list_tile.dart";
import "../../i18n/strings.g.dart";
import "../../routes.dart";

class DatabasePage extends StatelessWidget {
  const DatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.database),
      ),
      body: ListView(
        children: [
          SimpleListTile(
            title: tr.pages.characters,
            leadingIcon: Symbols.account_circle,
            location: CharacterListRoute().location,
          ),
          SimpleListTile(
            title: tr.pages.weapons,
            leadingIcon: Symbols.swords,
            location: WeaponListRoute().location,
          ),
          SimpleListTile(
            title: tr.pages.materials,
            leadingIcon: Symbols.grass,
            location: MaterialListRoute().location,
          ),
        ],
      ),
    );
  }
}
