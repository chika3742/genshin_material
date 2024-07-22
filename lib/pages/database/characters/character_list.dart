import "package:assorted_layout_widgets/assorted_layout_widgets.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/character_list_item.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/layout.dart";
import "../../../components/list_subheader.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../providers/character_filter_state.dart";

class CharacterListPage extends ConsumerWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(characterFilterStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.characters),
      ),
      body: DataAssetScope(
        builder: (assetData, _) {
          var charactersIterable = assetData.characters.values
              .whereType<CharacterWithLargeImage>();
          if (filterState.rarity != null) {
            charactersIterable = charactersIterable.where((e) => e.rarity == filterState.rarity);
          }
          if (filterState.element != null) {
            charactersIterable = charactersIterable.where((e) => e is ListedCharacter ? e.element == filterState.element : false);
          }
          if (filterState.weaponType != null) {
            charactersIterable = charactersIterable.where((e) => e.weaponType == filterState.weaponType);
          }

          final characters = charactersIterable.toList();
          return Scrollbar(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GappedRow(
                        children: [
                          FilterChip( // rarity
                            selected: filterState.rarity != null,
                            label: Row(
                              children: [
                                Text(tr.common.rarity),
                                const SizedBox(width: 8),
                                const Icon(Symbols.arrow_drop_down),
                              ],
                            ),
                            onSelected: (_) {
                              _showFilterBottomSheet(context);
                            },
                          ),

                          FilterChip( // element
                            selected: filterState.element != null,
                            label: Row(
                              children: [
                                Text(tr.common.element),
                                const SizedBox(width: 8),
                                const Icon(Symbols.arrow_drop_down),
                              ],
                            ),
                            onSelected: (_) {
                              _showFilterBottomSheet(context);
                            },
                          ),

                          FilterChip( // weapon type
                            selected: filterState.weaponType != null,
                            label: Row(
                              children: [
                                Text(tr.common.weaponType),
                                const SizedBox(width: 8),
                                const Icon(Symbols.arrow_drop_down),
                              ],
                            ),
                            onSelected: (_) {
                              _showFilterBottomSheet(context);
                            },
                          ),

                          FilterChip( // clear
                            label: Row(
                              children: [
                                const Icon(Symbols.clear),
                                const SizedBox(width: 8),
                                Text(tr.common.clear),
                              ],
                            ),
                            onSelected: filterState.isFiltering ? (_) {
                              ref.read(characterFilterStateNotifierProvider.notifier)
                                  .clear();
                            } : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 2,
                    ),
                    itemCount: characters.length,
                    itemBuilder: (context, index) {
                      return CharacterListItem(characters[index]);
                    },
                  ),
                ),
              ],
              // child: GridView.builder(
              //   padding: const EdgeInsets.all(16.0),
              //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //     maxCrossAxisExtent: 200,
              //     mainAxisSpacing: 8.0,
              //     crossAxisSpacing: 8.0,
              //     childAspectRatio: 2,
              //   ),
              //   itemCount: characters.length,
              //   itemBuilder: (context, index) {
              //     return CharacterListItem(characters[index]);
              //   },
              // ),
            ),
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
        return const CharacterFilterBottomSheet();
      },
    );
  }
}

class CharacterFilterBottomSheet extends ConsumerWidget {
  const CharacterFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataAssetScope(
      builder: (assetData, assetDir) {
        return SizedBox(
          width: double.infinity,
          child: GappedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListSubheader(tr.common.rarity),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  children: [
                    for (final rarity in [4, 5]) FilterChip(
                      selected: ref.watch(characterFilterStateNotifierProvider.select((it) => it.rarity == rarity)),
                      label: RowSuper(
                        mainAxisSize: MainAxisSize.min,
                        innerDistance: -4,
                        children: List.generate(rarity, (_) => const Icon(Symbols.star)),
                      ),
                      onSelected: (selected) {
                        ref.read(characterFilterStateNotifierProvider.notifier)
                            .setRarity(selected ? rarity : null);
                      },
                    ),
                  ],
                ),
              ),

              ListSubheader(tr.common.element),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  children: [
                    for (final element in assetData.elements.entries) FilterChip(
                      selected: ref.watch(characterFilterStateNotifierProvider.select((it) => it.element == element.key)),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.file(element.value.getImageFile(assetDir), width: 24, color: Theme.of(context).colorScheme.onSurface),
                          const SizedBox(width: 8),
                          Text(element.value.text.localized),
                        ],
                      ),
                      onSelected: (selected) {
                        ref.read(characterFilterStateNotifierProvider.notifier)
                            .setElement(selected ? element.key : null);
                      },
                    ),
                  ],
                ),
              ),

              ListSubheader(tr.common.weaponType),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  children: [
                    for (final weaponType in assetData.weaponTypes.entries) FilterChip(
                      selected: ref.watch(characterFilterStateNotifierProvider.select((it) => it.weaponType == weaponType.key)),
                      label: Text(weaponType.value.name.localized),
                      onSelected: (selected) {
                        ref.read(characterFilterStateNotifierProvider.notifier)
                            .setWeaponType(selected ? weaponType.key : null);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
