import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/list_tile.dart";
import "../../../components/search.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/artifact.dart";
import "../../../models/common.dart";
import "../../../routes.dart";
import "../../../utils/filtering.dart";

class ArtifactListPage extends HookWidget {
  final AssetData assetData;
  final CharacterId? equipCharacter;

  const ArtifactListPage({super.key, required this.assetData, required this.equipCharacter});

  @override
  Widget build(BuildContext context) {
    final filteringRarity = useState<int?>(null);
    final sets = useMemoized(
          () {
        if (filteringRarity.value != null) {
          return {...assetData.artifactSets}..removeWhere((key, value) => value.maxRarity != filteringRarity.value);
        } else {
          return assetData.artifactSets;
        }
      },
      [filteringRarity.value],
    );

    final String appBarTitle;
    if (equipCharacter != null) {
      appBarTitle = "${tr.pages.artifacts} (${tr.common.selected(character: assetData.characters[equipCharacter]!.name.localized)})";
    } else {
      appBarTitle = tr.pages.artifacts;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [
          SearchButton(
            hintTargetText: tr.pages.artifacts,
            queryCallback: (query) {
              return filterBySearchQuery(<ArtifactSetOrPiece>[
                ...assetData.artifactSets.values,
                ...assetData.artifactPieces.values,
              ], query).sorted((a, b) {
                if ((a is ArtifactSet && b is ArtifactSet)
                    || (a is ArtifactPiece && b is ArtifactPiece)) {
                  return 0;
                } else if (a is ArtifactSet) {
                  return -1; // Sets come before pieces
                } else {
                  return 1; // Pieces come after sets
                }
              });
            },
            resultItemBuilder: (context, item) {
              final image = switch (item) {
                ArtifactSet(:final getFirstPiece) =>
                    getFirstPiece(assetData).getImageFile(assetData.assetDir),
                ArtifactPiece(:final getImageFile) =>
                    getImageFile(assetData.assetDir),
              };
              return SearchResultListTile(
                image: Image.file(
                  image,
                  width: searchResultImageSize,
                  height: searchResultImageSize,
                ),
                title: item.name.localized,
                subtitle: switch (item) {
                  ArtifactSet() => tr.search.targets.artifactSet,
                  ArtifactPiece() => tr.search.targets.artifactPiece,
                },
                location: ArtifactDetailsRoute(id: switch (item) {
                  ArtifactSet(:final id) => id,
                  ArtifactPiece(:final id) => assetData.artifactPieces[id]!.parentId,
                }).location,
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8.0,
                children: [
                  for (final rarity in [3, 4, 5])
                    FilterChip(
                      label: Text("☆$rarity"),
                      selected: filteringRarity.value == rarity,
                      onSelected: (selected) {
                        filteringRarity.value = selected ? rarity : null;
                      },
                    ),
                  OutlinedButton.icon(
                    onPressed: () {
                      ArtifactEffectListRoute().push(context);
                    },
                    icon: const Icon(Symbols.list),
                    label: Text(tr.artifactsPage.effectList),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: sets.length,
            itemBuilder: (context, index) {
              final set = sets.values.elementAt(index);

              return GameItemListTile(
                image: set.getFirstPiece(assetData)
                    .getImageFile(assetData.assetDir),
                name: set.name.localized,
                rarity: set.maxRarity,
                onTap: () {
                  ArtifactDetailsRoute(id: set.id, initialSelectedCharacter: equipCharacter).push(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
