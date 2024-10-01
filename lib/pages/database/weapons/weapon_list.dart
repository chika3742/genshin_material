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
  final CharacterId? equipCharacter;

  const WeaponListPage({super.key, required this.assetData, required this.equipCharacter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fabKey = useMemoized(() => GlobalKey());

    final weaponsGroupedByType = useMemoized(
          () => assetData.weapons.values
          .groupListsBy((element) => element.type)
          .map((key, value) => MapEntry(key, value.sorted((a, b) => b.rarity - a.rarity))),
      [assetData.weapons],
    );

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (context.mounted) showIndexSheetTutorialIfNeeded(context, fabKey, ref);
      });
      return null;
    }, [],);

    double initialScrollOffset = 0;
    if (equipCharacter != null) {
      initialScrollOffset = _getHeaderScrollOffset(weaponsGroupedByType, assetData.characters[equipCharacter]!.weaponType);
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
      final offset = _getHeaderScrollOffset(weaponsGroupedByType, result);
      scrollController.animateTo(
        min(offset, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutQuint,
      );
    }
  }

  double _getHeaderScrollOffset(Map<WeaponType, List<Weapon>> weaponsGroupedByType, WeaponType weaponType) {
    double offset = 0.0;
    for (final e in assetData.weaponTypes.keys) {
      if (e == weaponType) {
        return offset;
      }
      offset += stickyListHeaderHeight + (listTileHeight * weaponsGroupedByType[e]!.length);
    }
    return offset;
  }
}
