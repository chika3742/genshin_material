import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/character_list_item.dart";
import "../../../components/chips.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/filter_bottom_sheet.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../providers/filter_state.dart";
import "../../../ui_core/layout.dart";

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
                          FilterChipWithMenu( // rarity
                            selected: filterState.rarity != null,
                            label: Text(tr.common.rarity),
                            onSelected: (_) {
                              _showFilterBottomSheet(context);
                            },
                          ),

                          FilterChipWithMenu( // element
                            selected: filterState.element != null,
                            label: Text(tr.common.element),
                            onSelected: (_) {
                              _showFilterBottomSheet(context);
                            },
                          ),

                          FilterChipWithMenu( // weapon type
                            selected: filterState.weaponType != null,
                            label: Text(tr.common.weaponType),
                            onSelected: (_) {
                              _showFilterBottomSheet(context);
                            },
                          ),

                          FilterChipWithIcon( // clear
                            leading: const Icon(Symbols.clear),
                            label: Text(tr.common.clear),
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
        return FilterBottomSheet(
          categories: [
            FilteringCategory(
              labelText: tr.common.rarity,
              items: [
                for (final rarity in [4, 5])
                  FilterChipWithIcon(
                    selected: ref.watch(characterFilterStateNotifierProvider.select((it) => it.rarity == rarity)),
                    leading: const Icon(Symbols.star),
                    label: Text(rarity.toString()),
                    onSelected: (selected) {
                      ref.read(characterFilterStateNotifierProvider.notifier)
                          .setRarity(selected ? rarity : null);
                    },
                  ),
              ],
            ),
            FilteringCategory(
              labelText: tr.common.element,
              items: [
                for (final element in assetData.elements.entries)
                  FilterChipWithIcon(
                    selected: ref.watch(characterFilterStateNotifierProvider.select((it) => it.element == element.key)),
                    leading: Image.file(
                      element.value.getImageFile(assetDir),
                      width: 24,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    label: Text(element.value.text.localized),
                    onSelected: (selected) {
                      ref.read(characterFilterStateNotifierProvider.notifier)
                          .setElement(selected ? element.key : null);
                    },
                  ),
              ],
            ),
            FilteringCategory(
              labelText: tr.common.weaponType,
              items: [
                for (final weaponType in assetData.weaponTypes.entries)
                  FilterChipWithIcon(
                    selected: ref.watch(characterFilterStateNotifierProvider.select((it) => it.weaponType == weaponType.key)),
                    label: Text(weaponType.value.name.localized),
                    onSelected: (selected) {
                      ref.read(characterFilterStateNotifierProvider.notifier)
                          .setWeaponType(selected ? weaponType.key : null);
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
