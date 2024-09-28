import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/data_asset_scope.dart";
import "../../../components/list_index_sheet.dart";
import "../../../components/list_tile.dart";
import "../../../components/sticky_list_header.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../routes.dart";
import "../../../ui_core/tutorial.dart";

class WeaponListPage extends HookConsumerWidget {
  final AssetData assetData;

  const WeaponListPage({super.key, required this.assetData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final fabKey = useMemoized(() => GlobalKey());

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (context.mounted) showIndexSheetTutorialIfNeeded(context, fabKey, ref);
      });
      return null;
    }, [],);

    final weaponsGroupedByType = useMemoized(
          () => assetData.weapons.values
          .groupListsBy((element) => element.type)
          .map((key, value) => MapEntry(key, value.sorted((a, b) => b.rarity - a.rarity))),
      [assetData.weapons],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.weapons),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: fabKey,
        onPressed: () {
          _showIndexSheet(context, scrollController);
        },
        icon: const Icon(Symbols.list),
        label: Text(tr.common.index),
      ),
      body: Scrollbar(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            ...weaponsGroupedByType.entries.map((e) {
              final categoryId = e.key;
              final categoryText = assetData.weaponTypes[categoryId]!.name.localized;
              final weapons = e.value;

              return SliverStickyHeader.builder(
                builder: (_, __) => StickyListHeader(categoryText),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final weapon = weapons[index];

                      return GameItemListTile(
                        image: weapon.getImageFile(assetData.assetDir),
                        name: weapon.name.localized,
                        rarity: weapon.rarity,
                        onTap: () {
                          WeaponDetailsRoute(id: weapon.id).go(context);
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

  void _showIndexSheet(BuildContext context, ScrollController scrollController) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => DataAssetScope(
        useScaffold: false,
        builder: (context, assetData) {
          var offset = 0.0;
          final weaponsGroupedByType = assetData.weapons.values
              .groupListsBy((element) => element.type);

          return ListIndexSheet(
            onSelected: (scrollOffset) {
              scrollController.animateTo(
                min(scrollOffset, scrollController.position.maxScrollExtent),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutQuint,
              );
            },
            items: weaponsGroupedByType.entries.map((e) {
              final typeId = e.key;
              final items = e.value;

              final item = ListIndexItem(
                title: assetData.weaponTypes[typeId]!.name.localized,
                image: items.first.getImageFile(assetData.assetDir),
                scrollOffset: offset,
              );

              offset += stickyListHeaderHeight + (listTileHeight * items.length);

              return item;
            }).toList(),
          );
        },
      ),
    );
  }
}
