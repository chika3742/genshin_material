import "package:flutter/material.dart";

import "../../../components/character_list_item.dart";
import "../../../components/data_asset_scope.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.characters),
      ),
      body: DataAssetScope(
        builder: (assetData, _) {
          final characters = assetData.characters.values
              .whereType<CharacterWithLargeImage>()
              .toList();
          return Scrollbar(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 2,
              ),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return CharacterListItem(characters[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
