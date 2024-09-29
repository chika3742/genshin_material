import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/list_tile.dart";
import "../../../components/sticky_list_header.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../models/weapon.dart";
import "../../../routes.dart";
import "../../../ui_core/bottom_sheet.dart";
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
          _showIndexSheet(context, scrollController, weaponsGroupedByType);
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

  Future<void> _showIndexSheet(BuildContext context, ScrollController scrollController, Map<WeaponType, List<Weapon>> weaponsGroupedByType) async {
    final result = await showListIndexBottomSheet(
      context: context,
      items: assetData.weaponTypes.entries.map((e) {
        final typeId = e.key;
        final items = weaponsGroupedByType[typeId]!;

        return ListIndexItem(
          title: e.value.name.localized,
          image: items.first.getImageFile(assetData.assetDir),
          value: typeId,
        );
      }).toList(),
    );
    if (result != null) {
      _scrollToWeaponType(scrollController, weaponsGroupedByType, result);
    }
  }

  void _scrollToWeaponType(ScrollController scrollController, Map<WeaponType, List<Weapon>> weaponsGroupedByType, WeaponType weaponType) {
    double offset = 0.0;
    for (final e in assetData.weaponTypes.keys) {
      if (e == weaponType) {
        scrollController.animateTo(
          min(offset, scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutQuint,
        );
        break;
      }
      offset += stickyListHeaderHeight + (listTileHeight * weaponsGroupedByType[e]!.length);
    }
  }
}
