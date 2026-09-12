// ignore_for_file: better_require_trailing_commas/better_require_trailing_commas

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/center_text.dart";
import "../../../components/chips.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/effect_description.dart";
import "../../../components/filter_bottom_sheet.dart";
import "../../../components/horizontal_chip_list.dart";
import "../../../components/item_link_button.dart";
import "../../../components/search.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../core/theme.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/artifact.dart";
import "../../../models/common.dart";
import "../../../providers/asset_image_resolver.dart";
import "../../../routes.dart";
import "../../../utils/filtering.dart";

class ArtifactListPage extends HookConsumerWidget {
  final AssetData assetData;
  final CharacterId? equipCharacter;

  const ArtifactListPage({super.key, required this.assetData, required this.equipCharacter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(assetImageResolverProvider);

    final rarityFilter = useState<int?>(null);
    final tagFilter = useState<List<String>>([]);

    final rarityFilterDisplay = tagFilter.value.isNotEmpty ? 5 : rarityFilter.value;

    final String appBarTitle;
    if (equipCharacter != null) {
      appBarTitle = "${tr.pages.artifacts} (${tr.common.selected(character: assetData.characters[equipCharacter]!.name.localized)})";
    } else {
      appBarTitle = tr.pages.artifacts;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 64),
          child: SizedBox(
            width: double.infinity,
            child: HorizontalChipList(
              chips: [
                FilterChipWithMenu(
                  label: Text(tr.artifactsPage.kindOfEffect),
                  selected: tagFilter.value.isNotEmpty,
                  onSelected: (_) {
                    _showFilterBottomSheet(
                      context: context,
                      initialSelections: tagFilter.value,
                      onChanged: (value) {
                        tagFilter.value = value;
                      }
                    );
                  },
                ),
                for (final rarity in [3, 4, 5])
                  FilterChip(
                    label: Text("☆$rarity"),
                    selected: rarityFilterDisplay == rarity,
                    onSelected: tagFilter.value.isEmpty ? (selected) {
                      rarityFilter.value = selected ? rarity : null;
                    } : null,
                  ),
                FilterChipWithIcon(
                  leading: const Icon(Symbols.clear),
                  label: Text(tr.common.clear),
                  onSelected: rarityFilter.value != null || tagFilter.value.isNotEmpty ? (_) {
                    rarityFilter.value = null;
                    tagFilter.value = [];
                  } : null,
                ),
              ],
            ),
          ),
        ),
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
                ArtifactSet() => images.getFile(item.getFirstPiece(assetData)),
                ArtifactPiece() => images.getFile(item),
              };
              return SearchResultListTile(
                image: Image.file(
                  image,
                  width: searchResultImageSize,
                  height: searchResultImageSize,
                ),
                title: item.name.localized,
                subtitle: switch (item) {
                  ArtifactSet() => tr.search.targets.artifactSets,
                  ArtifactPiece() => tr.search.targets.artifactPieces,
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
      body: _buildList(ref, rarityFilter.value, tagFilter.value),
    );
  }

  Widget _buildList(WidgetRef ref, int? rarityFilter, List<String> tagFilter) {
    final images = ref.watch(assetImageResolverProvider);

    List<ArtifactSet> filterAndSortSetsByTags(Iterable<ArtifactSet> sets) {
      final filtered = sets.where((e) => e.tags != null && e.tags!.any(tagFilter.contains));
      final sorted = filtered.sorted((a, b) {
        final aCount = a.tags!.fold(0, (prev, e) => tagFilter.contains(e) ? prev + 1 : prev);
        final bCount = b.tags!.fold(0, (prev, e) => tagFilter.contains(e) ? prev + 1 : prev);
        return bCount - aCount;
      });
      return sorted;
    }

    final sets = useMemoized(
      () {
        var sets = assetData.artifactSets.values;
        if (rarityFilter == null && tagFilter.isEmpty) {
          return sets.toList();
        }

        if (rarityFilter != null) {
          sets = sets.where((set) => set.maxRarity == rarityFilter);
        }

        if (tagFilter.isNotEmpty) {
          sets = filterAndSortSetsByTags(sets);
        }

        return sets.toList();
      },
      [rarityFilter, tagFilter],
    );
    final flattenedTags = useMemoized(() {
      return Map.fromEntries(assetData.artifactTags.map((e) => e.items)
          .flattened.map((e) => MapEntry(e.id, e)));
    }, [assetData]);

    if (sets.isEmpty) {
      return CenterText(tr.artifactsPage.noSearchResultsFound);
    }

    return ListView.builder(
      itemCount: sets.length,
      itemBuilder: (context, index) {
        final set = sets[index];
        final rarityColor = Theme.of(context)
            .extension<ComponentThemeExtension>()!
            .getRarityColor(set.maxRarity);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemLinkButton(
                    padding: .all(4),
                    onTap: () {
                      ArtifactDetailsRoute(id: set.id).push(context);
                    },
                    child: Row(
                      spacing: 8.0,
                      children: [
                        Image.file(images.getFile(set.getFirstPiece(assetData)), width: 35, height: 35),
                        Text(set.name.localized),
                        Spacer(),
                        Container(
                          width: 48,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: rarityColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "★${set.maxRarity}",
                            style: TextStyle(
                              fontSize: 14,
                              color: rarityColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  if (set.tags case final tags?)
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: tags.map((tag) => Chip(
                        label: Text(flattenedTags[tag]!.desc.localized),
                        shape: RoundedRectangleBorder(borderRadius: .circular(32)),
                        padding: .symmetric(horizontal: 4),
                        materialTapTargetSize: .shrinkWrap,
                        backgroundColor: tagFilter.contains(tag)
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        side: tagFilter.contains(tag)
                            ? BorderSide.none
                            : null,
                      )).toList(),
                    ),
                  for (final bonus in set.bonuses) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      child: Text(
                        tr.artifactsPage.bonusTypes[bonus.type]!,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: EffectDescription(bonus.description.localized),
                    ),
                  ],
                ],
              ),
            ),
            const Divider(indent: 16, endIndent: 16, height: 4),
          ],
        );
      },
    );
  }
}

void _showFilterBottomSheet({
  required BuildContext context,
  required List<String> initialSelections,
  required ValueChanged<List<String>> onChanged,
}) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (context) {
      return _ArtifactEffectFilterBottomSheet(
        initialSelections: initialSelections,
        onChanged: onChanged,
      );
    },
  );
}

class _ArtifactEffectFilterBottomSheet extends HookWidget {
  final List<String> initialSelections;
  final ValueChanged<List<String>> onChanged;

  const _ArtifactEffectFilterBottomSheet({
    required this.initialSelections,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final state = useState(initialSelections);

    useValueChanged<List<String>, void>(state.value, (_, _) {
      Future(() {
        onChanged(state.value);
      });
    });

    return DataAssetScope(
      useScaffold: false,
      builder: (context, assetData) {
        return FilterBottomSheet(
          categories: [
            for (final cat in assetData.artifactTags)
              FilteringCategory(
                labelText: cat.desc.localized,
                items: [
                  for (final tag in cat.items)
                    FilterChip(
                      label: Text(tag.desc.localized),
                      selected: state.value.contains(tag.id),
                      onSelected: (value) {
                        if (value) {
                          state.value = [...state.value, tag.id];
                        } else {
                          state.value = state.value.where((t) => t != tag.id).toList();
                        }
                      },
                    ),
                ],
              ),
            Text(tr.artifactsPage.effectFilteringNote),
          ],
        );
      },
    );
  }
}
