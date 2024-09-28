import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/data_asset_scope.dart";
import "../../../components/list_tile.dart";
import "../../../i18n/strings.g.dart";
import "../../../routes.dart";
import "../../../ui_core/layout.dart";

class ArtifactListPage extends StatelessWidget {
  const ArtifactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.artifacts),
      ),
      body: DataAssetScope(
        builder: (context, assetData) {

          return HookBuilder(
            builder: (context) {
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

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: GappedRow(
                        mainAxisSize: MainAxisSize.min,
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
                          ArtifactDetailsRoute(id: set.id).push(context);
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
