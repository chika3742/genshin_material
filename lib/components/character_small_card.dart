import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../models/character.dart";
import "../providers/asset_image_resolver.dart";
import "../providers/versions.dart";
import "../routes.dart";

class CharacterSmallCard extends ConsumerWidget {
  final Character character;

  const CharacterSmallCard(this.character, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(assetDataProvider).value == null) {
      return const SizedBox();
    }
    final images = ref.watch(assetImageResolverProvider);

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          CharacterDetailsRoute(id: character.id).push(context);
        },
        child: Column(
          children: [
            Image.file(
              images.getSmallFile(character),
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
