import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/chips.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/effect_description.dart";
import "../../../components/filter_bottom_sheet.dart";
import "../../../components/layout.dart";
import "../../../components/list_subheader.dart";
import "../../../i18n/strings.g.dart";
import "../../../providers/filter_state.dart";

class ArtifactEffectListPage extends HookConsumerWidget {
  const ArtifactEffectListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(artifactFilterStateNotifierProvider);

    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData, assetDir) {
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
                      child: GappedRow(
                        children: [
                          FilterChipWithMenu(
                            label: Text(tr.artifactsPage.kindOfEffect),
                            selected: filterState.tags.isNotEmpty,
                            onSelected: (_) {
                              _showFilterBottomSheet(context);
                            },
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
                                GappedRow(
                                  children: [
                                    Image.file(set.consistsOf.values.first.getImageFile(assetDir), width: 35, height: 35),
                                    Text(set.name.localized),
                                  ],
                                ),
                                for (final bonus in set.bonuses) ...[
                                  ListSubheader(tr.artifactsPage.bonusTypes[bonus.type]!, padding: const EdgeInsets.only(top: 8.0)),
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
      },
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
      builder: (assetData, assetDir) {
        return FilterBottomSheet(
          categories: [
            const Text("※本フィルタリング機能は☆5聖遺物に対してのみ機能します。また、複数選択時の扱いは「かつ(AND)」です。"),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                icon: const Icon(Symbols.clear),
                label: const Text("Clear"),
                onPressed: () {
                  ref.read(artifactFilterStateNotifierProvider.notifier).clear();
                },
              ),
            ),
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
          ],
        );
      },
    );
  }
}
