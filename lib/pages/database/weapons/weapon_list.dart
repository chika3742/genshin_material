
import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/list_tile.dart";
import "../../../components/search.dart";
import "../../../components/sticky_list_header.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../providers/filter_state.dart";
import "../../../routes.dart";
import "../../../ui_core/bottom_sheet.dart";
import "../../../ui_core/katakana_compare.dart";
import "../../../ui_core/list_index_bottom_sheet.dart";
import "../../../ui_core/tutorial.dart";
import "../../../utils/filtering.dart";
import "../../../utils/lists.dart";

class WeaponListPage extends HookConsumerWidget {
  final AssetData assetData;
  final CharacterId? equipCharacter;

  const WeaponListPage({super.key, required this.assetData, required this.equipCharacter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fabKey = useMemoized(() => GlobalKey());
    final filterState = ref.watch(weaponFilterStateProvider);

    final weaponsGroupedByType = useMemoized(
      () {
        final grouped = assetData.weapons.values.groupListsBy((element) => element.type);
        return grouped.map((key, value) {
          List sortedList;
          switch (filterState.sortType) {
            case WeaponSortType.defaultSort:
              // Keep the original data order (appearance order)
              sortedList = value;
              break;
            case WeaponSortType.name:
              sortedList = value.sorted((a, b) {
                return LocaleSettings.instance.currentLocale.languageCode == "ja"
                    ? katakanaCompare(a.jaPronunciation, b.jaPronunciation)
                    : a.name.localized.compareTo(b.name.localized);
              });
              break;
            case WeaponSortType.rarity:
              // Stable sort by rarity (maintains data order for same rarity)
              sortedList = value.sortedDescendingByRarity();
              break;
          }
          return MapEntry(key, sortedList);
        });
      },
      [assetData.weapons, filterState.sortType],
    );
    final listIndexItems = useMemoized(() {
      return assetData.weaponTypes.entries.map((e) {
        final typeId = e.key;
        final entries = weaponsGroupedByType[typeId]!;

        return ListIndexItem(
          title: e.value.name.localized,
          image: entries.first.getImageFile(assetData.assetDir),
          value: typeId,
          itemCount: entries.length,
        );
      }).toList();
    }, [assetData.weapons]);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (context.mounted) showIndexSheetTutorialIfNeeded(context, fabKey, ref);
      });
      return null;
    }, [],);

    double initialScrollOffset = 0;
    if (equipCharacter != null) {
      initialScrollOffset = getIndexScrollOffset(
        listIndexItems,
        assetData.characters[equipCharacter]!.weaponType,
      );
    }
    final scrollController = useScrollController(initialScrollOffset: initialScrollOffset);

    final String appBarTitle;
    if (equipCharacter != null) {
      appBarTitle = "${tr.pages.weapons} (${tr.common.selected(character: assetData.characters[equipCharacter]!.name.localized)})";
    } else {
      appBarTitle = tr.pages.weapons;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Symbols.sort),
            tooltip: tr.common.sortType,
            onPressed: () {
              _showSortBottomSheet(context, ref);
            },
          ),
          SearchButton(
            hintTargetText: tr.search.targets.weapons,
            queryCallback: (query) {
              return filterBySearchQuery(assetData.weapons.values, query);
            },
            resultItemBuilder: (context, item) {
              return SearchResultListTile(
                image: Image.file(
                  item.getImageFile(assetData.assetDir),
                  width: searchResultImageSize,
                  height: searchResultImageSize,
                ),
                title: item.name.localized,
                location: WeaponDetailsRoute(id: item.id).location,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: fabKey,
        onPressed: () {
          _showIndexSheet(context, scrollController, listIndexItems);
        },
        icon: const Icon(Symbols.list),
        label: Text(tr.common.index),
      ),
      body: Scrollbar(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            ...assetData.weaponTypes.entries.map((e) {
              final typeId = e.key;
              final categoryText = e.value.name.localized;
              final weapons = weaponsGroupedByType[typeId] ?? [];

              return SliverStickyHeader.builder(
                builder: (_, _) => StickyListHeader(categoryText),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final weapon = weapons[index];

                      return GameItemListTile(
                        image: weapon.getImageFile(assetData.assetDir),
                        name: weapon.name.localized,
                        rarity: weapon.rarity,
                        onTap: () {
                          WeaponDetailsRoute(id: weapon.id, initialSelectedCharacter: equipCharacter).push(context);
                        },
                      );
                    },
                    childCount: weapons.length,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _showIndexSheet(
    BuildContext context,
    ScrollController scrollController,
    List<ListIndexItem> items,
  ) async {
    await showListIndexBottomSheetWithScroll(
      context: context,
      items: items,
      scrollController: scrollController,
    );
  }

  void _showSortBottomSheet(BuildContext context, WidgetRef ref) {
    final currentSortType = ref.read(weaponFilterStateProvider).sortType;
    
    showSelectBottomSheet<WeaponSortType>(
      context: context,
      title: Text(tr.common.sortType),
      selectedValue: currentSortType,
      items: [
        for (final type in WeaponSortType.values)
          SelectBottomSheetItem(
            text: tr.common.sortTypes[type.name]!,
            value: type,
          ),
      ],
    ).then((value) {
      if (value != null) {
        ref.read(weaponFilterStateProvider.notifier).setSortType(value);
      }
    });
  }
}
