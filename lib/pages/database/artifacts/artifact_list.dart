import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/list_tile.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../routes.dart";

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
                image: set.consistsOf.values.first.getImageFile(assetData.assetDir),
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
