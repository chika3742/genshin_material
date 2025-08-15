import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/chips.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/effect_description.dart";
import "../../../components/filter_bottom_sheet.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../providers/filter_state.dart";

class ArtifactEffectListPage extends HookConsumerWidget {
  final AssetData assetData;

  const ArtifactEffectListPage({super.key, required this.assetData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(artifactFilterStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.artifactsPage.effectList),
      ),
      body: HookBuilder(
        builder: (context) {
          final sets = useMemoized(() => assetData.artifactSets.values.where((e) {
            if (filterState.tags.isEmpty) {
              return true;
            }
            if (e.tags == null) {
              return false;
            }

            return filterState.tags.every(e.tags!.contains);
          }).toList(), [filterState],);

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    spacing: 8.0,
                    children: [
                      FilterChipWithMenu(
                        label: Text(tr.artifactsPage.kindOfEffect),
                        selected: filterState.tags.isNotEmpty,
                        onSelected: (_) {
                          _showFilterBottomSheet(context);
                        },
                      ),
                      FilterChipWithIcon(
                        leading: const Icon(Symbols.clear),
                        label: Text(tr.common.clear),
                        onSelected: filterState.tags.isNotEmpty ? (_) {
                          ref.read(artifactFilterStateNotifierProvider.notifier).clear();
                        } : null,
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: sets.length,
                itemBuilder: (context, index) {
                  final set = sets[index];

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 8.0,
                              children: [
                                Image.file(set.consistsOf.values.first.getImageFile(assetData.assetDir), width: 35, height: 35),
                                Text(set.name.localized),
                              ],
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
                      const Divider(indent: 16, endIndent: 16),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return const _ArtifactEffectFilterBottomSheet();
      },
    );
  }
}

class _ArtifactEffectFilterBottomSheet extends ConsumerWidget {
  const _ArtifactEffectFilterBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(artifactFilterStateNotifierProvider);

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
                      selected: state.tags.contains(tag.id),
                      onSelected: (value) {
                        final notifier = ref.read(artifactFilterStateNotifierProvider.notifier);
                        if (value) {
                          notifier.addTag(tag.id);
                        } else {
                          notifier.removeTag(tag.id);
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
