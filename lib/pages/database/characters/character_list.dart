import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/character_bulk_sync_button.dart";
import "../../../components/character_list_item.dart";
import "../../../components/chips.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/filter_bottom_sheet.dart";
import "../../../components/search.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../core/pref_keys.dart";
import "../../../data/repositories/character_state_repository.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../providers/asset_image_resolver.dart";
import "../../../providers/filter_state.dart";
import "../../../providers/hoyolab_game_server.dart";
import "../../../providers/pref_notifier.dart";
import "../../../routes.dart";
import "../../../ui_core/character_bulk_sync_dialog.dart";
import "../../../ui_core/katakana_compare.dart";
import "../../../utils/filtering.dart";

class CharacterListPage extends HookConsumerWidget {
  final AssetData assetData;

  const CharacterListPage({super.key, required this.assetData});

  static const alwaysOwnedCharacters = ["traveler"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);

    final filterState = ref.watch(characterFilterStateProvider);
    final images = ref.watch(assetImageResolverProvider);
    final isLinked = ref.watch(isLinkedWithHoyolabProvider);
    final ownedCharacters = ref.watch(characterStateRepositoryProvider.select((d) => d.value?.keys.toSet()));
    final lastBulkSync = ref.watch(prefProvider(PrefKeys.lastCharacterFetchAll));
    final fetchState = ref.watch(CharacterStateRepository.fetchAllMutation);

    var charactersIterable = assetData.characters.values;

    bool filterByPossession(Character character, bool filterByOwned) {
      if (ownedCharacters == null) {
        return true; // show all characters if owned list is unavailable
      }

      final isOwned = ownedCharacters.contains(character.id)
          || alwaysOwnedCharacters.contains(character.id);
      return filterByOwned ? isOwned : !isOwned;
    }

    if (filterState.rarity != null) {
      charactersIterable = charactersIterable.where((e) => e.rarity == filterState.rarity);
    }
    if (filterState.element != null) {
      charactersIterable = charactersIterable.where((e) => e.variants.any((v) => v.element == filterState.element));
    }
    if (filterState.weaponType != null) {
      charactersIterable = charactersIterable.where((e) => e.weaponType == filterState.weaponType);
    }

    final characters = charactersIterable.toList();
    mergeSort(characters, compare: (Character a, Character b) {
      switch (filterState.sortType) {
        case CharacterSortType.name:
          return LocaleSettings.instance.currentLocale == .ja
              ? katakanaCompare(a.jaPronunciation, b.jaPronunciation)
              : a.name.localized.compareTo(b.name.localized);
        case CharacterSortType.element:
          return switch ((a.element, b.element)) {
            (final aElement?, final bElement?) => aElement.compareTo(bElement) != 0
                ? aElement.compareTo(bElement)
                : a.name.localized.compareTo(b.name.localized),
            (_?, null) => -1,
            (null, _?) => 1,
            (null, null) => a.name.localized.compareTo(b.name.localized),
          };
        case CharacterSortType.defaultSort:
          return 0;
      }
    });

    if (filterState.sortMode == .descending) {
      characters.reverseRange(0, characters.length);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.characters),
        actions: [
          if (isLinked) CharacterBulkSyncButton(),
          IconButton(
            icon: Badge(
              isLabelVisible: filterState.isFiltering,
              child: Icon(Symbols.tune),
            ),
            tooltip: tr.common.filterAndSort,
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
          SearchButton<Character>(
            hintTargetText: tr.search.targets.characters,
            queryCallback: (query) {
              return filterBySearchQuery(
                assetData.characters.values,
                query,
              );
            },
            resultItemBuilder: (context, item) {
              return SearchResultListTile(
                image: Image.file(
                  images.getSmallFile(item),
                  width: searchResultImageSize,
                  height: searchResultImageSize,
                ),
                title: item.name.localized,
                location: CharacterDetailsRoute(id: item.id).location,
              );
            },
          ),
        ],
        bottom: isLinked ? TabBar(
          controller: tabController,
          tabs: [
            Tab(text: tr.characterListPage.owned),
            Tab(text: tr.characterListPage.unowned),
          ],
        ) : null,
      ),
      body: isLinked ? Column(
        children: [
          if (lastBulkSync == null && !fetchState.isPending)
            MaterialBanner(
              content: Text(tr.characterListPage.firstSyncBanner.text),
              actions: [TextButton(
                onPressed: () {
                  showCharacterBulkSyncConfirmDialog(ref);
                },
                child: Text(tr.characterListPage.firstSyncBanner.action),
              )],
            ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                _buildGrid(
                  characters.where((c) => filterByPossession(c, true)).toList(),
                  key: PageStorageKey("owned_tab"),
                ),
                _buildGrid(
                  characters.where((c) => filterByPossession(c, false)).toList(),
                  key: PageStorageKey("unowned_tab"),
                ),
              ],
            ),
          ),
        ],
      ) : _buildGrid(characters),
    );
  }

  Widget _buildGrid(List<Character> characters, {Key? key}) {
    return GridView.builder(
      key: key,
      padding: EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 2,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterListItem(
          key: ValueKey(characters[index].id),
          characters[index],
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
        return const CharacterFilterBottomSheet();
      },
    );
  }
}

class CharacterFilterBottomSheet extends StatelessWidget {
  const CharacterFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      useScaffold: false,
      builder: (context, assetData) {
        return Consumer(
          builder: (context, ref, _) {
            final state = ref.watch(characterFilterStateProvider);

            return FilterBottomSheet(
              categories: [
                FilteringCategory(
                  labelText: tr.common.sort,
                  items: [
                    for (final sortType in CharacterSortType.values)
                      ChoiceChip(
                        selected: state.sortType == sortType,
                        label: Text(tr.common.sortTypes[sortType.name]!),
                        onSelected: (_) {
                          ref.read(characterFilterStateProvider.notifier)
                              .setSortType(sortType);
                        },
                      ),
                  ],
                  bottom: SegmentedButton<SortMode>(
                    segments: [
                      ButtonSegment(
                        value: .ascending,
                        icon: Icon(Symbols.arrow_upward),
                        label: Text(tr.common.ascending),
                      ),
                      ButtonSegment(
                        value: .descending,
                        icon: Icon(Symbols.arrow_downward),
                        label: Text(tr.common.descending),
                      ),
                    ],
                    selected: {state.sortMode},
                    showSelectedIcon: false,
                    onSelectionChanged: (mode) {
                      ref.read(characterFilterStateProvider.notifier)
                          .setSortMode(mode.first);
                    },
                  ),
                ),
                Align(
                  alignment: .centerRight,
                  child: ElevatedButton.icon(
                    icon: Icon(Symbols.clear),
                    label: Text(tr.characterListPage.clearFilters),
                    onPressed: state.isFiltering ? () {
                      ref.read(characterFilterStateProvider.notifier)
                          .clearFilters();
                    } : null,
                  ),
                ),
                FilteringCategory(
                  labelText: tr.common.rarity,
                  items: [
                    for (final rarity in [4, 5])
                      FilterChipWithIcon(
                        selected: state.rarity == rarity,
                        leading: const Icon(Symbols.star),
                        label: Text(rarity.toString()),
                        onSelected: (selected) {
                          ref.read(characterFilterStateProvider.notifier)
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
                        selected: state.element == element.key,
                        leading: Image.file(
                          element.value.getImageFile(assetData.assetDir),
                          width: 24,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        label: Text(element.value.text.localized),
                        onSelected: (selected) {
                          ref.read(characterFilterStateProvider.notifier)
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
                        selected: state.weaponType == weaponType.key,
                        label: Text(weaponType.value.name.localized),
                        onSelected: (selected) {
                          ref.read(characterFilterStateProvider.notifier)
                              .setWeaponType(selected ? weaponType.key : null);
                        },
                      ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
