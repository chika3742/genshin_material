import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/character_list_item.dart";
import "../../../components/chips.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/filter_bottom_sheet.dart";
import "../../../components/search.dart";
import "../../../constants/dimens.dart";
import "../../../constants/remote_config_key.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../providers/filter_state.dart";
import "../../../providers/miscellaneous.dart";
import "../../../providers/preferences.dart";
import "../../../routes.dart";
import "../../../utils/filtering.dart";

class CharacterListPage extends HookConsumerWidget {
  final AssetData assetData;

  const CharacterListPage({super.key, required this.assetData});

  static const alwaysOwnedCharacters = ["traveler"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(characterFilterStateNotifierProvider);

    var charactersIterable = assetData.characters.values
        .whereType<CharacterWithLargeImage>();
    if (filterState.possessionStatus != null) {
      final ownedCharacters = ref.watch(ownedCharactersProvider);

      if (ownedCharacters.value != null) {
        bool isCharacterOwned(String id, PossessionStatus? filterStatus, List<String> ownedIds) {
          if (filterStatus == null) return true;
          final isOwned = ownedIds.contains(id) || alwaysOwnedCharacters.contains(id);
          return filterStatus == PossessionStatus.owned ? isOwned : !isOwned;
        }
        charactersIterable = charactersIterable.where((e) {
          return isCharacterOwned(e.id, filterState.possessionStatus, ownedCharacters.value!);
        });
      }
    }
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

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.characters),
        actions: [
          SearchButton<CharacterWithLargeImage>(
            hintTargetText: tr.pages.characters,
            queryCallback: (query) {
              return filterBySearchQuery(
                assetData.characters.values,
                query,
              ).whereType<CharacterWithLargeImage>().toList();
            },
            resultItemBuilder: (context, item) {
              return SearchResultListTile(
                image: Image.file(
                  item.getSmallImageFile(assetData.assetDir),
                  width: searchResultImageSize,
                  height: searchResultImageSize,
                ),
                title: item.name.localized,
                location: CharacterDetailsRoute(id: item.id).location,
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 64.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ChipTheme(
              data: ChipThemeData(
                elevation: 2,
              ),
              child: Row(
                spacing: 8.0,
                children: [
                  if (FirebaseRemoteConfig.instance.getBool(RemoteConfigKey.hoyolabLinkEnabled))
                    FilterChipWithMenu( // possession
                      selected: filterState.possessionStatus != null,
                      label: Text(tr.common.possession),
                      onSelected: (_) {
                        _showFilterBottomSheet(context);
                      },
                    ),

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
      ),
      body: Scrollbar(
        child: GridView.builder(
          padding: EdgeInsets.all(16.0),
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
    final prefs = ref.watch(preferencesStateNotifierProvider);

    return DataAssetScope(
      useScaffold: false,
      builder: (context, assetData) {
        return FilterBottomSheet(
          categories: [
            if (FirebaseRemoteConfig.instance.getBool(RemoteConfigKey.hoyolabLinkEnabled))
              ...[
                FilteringCategory(
                  labelText: tr.common.possession,
                  items: [
                    for (final status in PossessionStatus.values)
                      FilterChipWithIcon(
                        selected: ref.watch(characterFilterStateNotifierProvider.select((it) => it.possessionStatus == status)),
                        leading: Icon(status == PossessionStatus.owned ? Symbols.place_item : Symbols.hide_source),
                        label: Text(tr.common.possessionStatus[status.name]!),
                        onSelected: prefs.isLinkedWithHoyolab ? (selected) {
                          ref.read(characterFilterStateNotifierProvider.notifier)
                              .setPossessionStatus(selected ? status : null);
                        } : null,
                      ),
                  ],
                ),
                if (!prefs.isLinkedWithHoyolab)
                  Text(tr.common.possessionNoteNotSignedIn, style: Theme.of(context).textTheme.labelMedium)
                else
                  Text(tr.common.possessionNote, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
              ],
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
                      element.value.getImageFile(assetData.assetDir),
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
