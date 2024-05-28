import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/data_asset_scope.dart";
import "../../../components/list_index_sheet.dart";
import "../../../components/list_tile.dart";
import "../../../components/sticky_list_header.dart";
import "../../../constants/dimens.dart";
import "../../../i18n/strings.g.dart";
import "../../../routes.dart";

class WeaponListPage extends StatelessWidget {
  WeaponListPage({super.key});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.weapons),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) => DataAssetScope(
              builder: (assetData, assetDir) {
                var offset = 0.0;
                final weaponsGroupedByType = assetData.weapons.values
                    .groupListsBy((element) => element.type);

                return ListIndexSheet(
                  onSelected: (scrollOffset) {
                    _scrollController.animateTo(
                      min(scrollOffset, _scrollController.position.maxScrollExtent),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                    );
                  },
                  items: weaponsGroupedByType.entries.map((e) {
                    final typeId = e.key;
                    final items = e.value;

                    final item = ListIndexItem(
                      title: assetData.weaponTypes[typeId]!.localized,
                      image: items.first.getImageFile(assetDir),
                      scrollOffset: offset,
                    );
                    offset += stickyListHeaderHeight +
                        (listTileHeight * items.length);
                    return item;
                  }).toList(),
                );
              },
            ),
          );
        },
        icon: const Icon(Symbols.list),
        label: Text(tr.common.index),
      ),
      body: DataAssetScope(
        builder: (assetData, assetDir) {
          final weaponsGroupedByType = assetData.weapons.values
              .groupListsBy((element) => element.type);

          return CustomScrollView(
            controller: _scrollController,
            slivers: weaponsGroupedByType.entries.map((e) {
              final categoryId = e.key;
              final categoryText = assetData.weaponTypes[categoryId]!.localized;

              return SliverStickyHeader.builder(
                builder: (_, __) => StickyListHeader(categoryText),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final weapon = weaponsGroupedByType[categoryId]![index];

                      return GameItemListTile(
                        image: weapon.getImageFile(assetDir),
                        name: weapon.name.localized,
                        rarity: weapon.rarity,
                        onTap: () {
                          WeaponDetailsRoute(id: weapon.id).go(context);
                        },
                      );
                    },
                    childCount: weaponsGroupedByType[categoryId]!.length,
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
