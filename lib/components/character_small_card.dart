import "package:flutter/material.dart";

import "../core/asset_cache.dart";
import "../models/character.dart";
import "../routes.dart";

class CharacterSmallCard extends StatelessWidget {
  final CharacterWithSmallImage character;

  const CharacterSmallCard(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          CharacterDetailsRoute(id: character.id).push(context);
        },
        child: Column(
          children: [
            Image.file(
              character.getSmallImageFile(AssetDataCache.instance.assetDir!),
              width: 75,
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(character.name.localized),
            ),
          ],
        ),
      ),
    );
  }
}
