import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../models/character.dart";
import "../providers/versions.dart";
import "../routes.dart";

class CharacterListItem extends ConsumerWidget {
  final CharacterWithLargeImage character;

  const CharacterListItem(this.character, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDir = ref.watch(assetDataProvider).value?.assetDir;
    if (assetDir == null) {
      return const SizedBox();
    }

    const containerBorderRadius = 8.0;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(containerBorderRadius),
      ),
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(containerBorderRadius),
        onTap: () {
          CharacterDetailsRoute(id: character.id).go(context);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(character.getImageFile(assetDir)),
            ),
            borderRadius: BorderRadius.circular(containerBorderRadius),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: const [0.0, 0.2, 1.0],
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.surface.withOpacity(0.6),
                    Theme.of(context).colorScheme.surface.withOpacity(0.6),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(containerBorderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: containerBorderRadius,
                  horizontal: 16.0,
                ),
                child: Text(
                  character.name.localized,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
