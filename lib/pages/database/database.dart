import "package:flutter/material.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../components/simple_list_item.dart";
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
          SimpleListItem(
            title: tr.pages.characters,
            leadingIcon: Symbols.account_circle,
            location: CharacterListRoute().location,
          ),
          SimpleListItem(
            title: tr.pages.materials,
            leadingIcon: Symbols.grass,
            location: MaterialListRoute().location,
          ),
        ],
      ),
    );
  }
}
