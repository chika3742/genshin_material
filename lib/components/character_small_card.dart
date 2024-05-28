import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../models/character.dart";
import "../providers/versions.dart";
import "../routes.dart";

class CharacterSmallCard extends ConsumerWidget {
  final CharacterWithSmallImage character;

  const CharacterSmallCard(this.character, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDir = ref.watch(assetDataProvider).value?.assetDir;
    if (assetDir == null) {
      return const SizedBox();
    }

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          CharacterDetailsRoute(id: character.id).push(context);
        },
        child: Column(
          children: [
            Image.file(
              character.getSmallImageFile(assetDir),
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
