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
import "../../../models/material.dart" as models;
import "../../../routes.dart";
import "../../../ui_core/bottom_sheet.dart";
import "../../../ui_core/tutorial.dart";

class MaterialListPage extends HookConsumerWidget {
  final AssetData assetData;

  const MaterialListPage({super.key, required this.assetData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fabKey = useMemoized(() => GlobalKey());
    final scrollController = useScrollController();

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (context.mounted) showIndexSheetTutorialIfNeeded(context, fabKey, ref);
      });
      return null;
    }, [],);

    final materialsGroupedByCategory = useMemoized(
      () => assetData.materials.values.groupListsBy((element) => element.category),
      [assetData.materials],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.materials),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: fabKey,
        onPressed: () {
          _showIndexSheet(context, scrollController, materialsGroupedByCategory);
        },
        icon: const Icon(Symbols.list),
        label: Text(tr.common.index),
      ),
      body: PrimaryScrollController(
        controller: scrollController,
        child: Scrollbar(
          child: CustomScrollView(
            controller: scrollController,
            slivers: assetData.materialCategories.entries.map((e) {
              final categoryId = e.key;
              final categoryText = e.value.localized;

              return SliverStickyHeader.builder(
                builder: (_, __) => StickyListHeader(categoryText),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final material = materialsGroupedByCategory[categoryId]![index];

                      return GameItemListTile(
                        image: material.getImageFile(assetData.assetDir),
                        name: material.name.localized,
                        rarity: material.rarity,
                        onTap: () {
                          MaterialDetailsRoute(id: material.id).go(context);
                        },
                      );
                    },
                    childCount: materialsGroupedByCategory[categoryId]?.length ?? 0,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Future<void> _showIndexSheet(BuildContext context, ScrollController scrollController, Map<MaterialCategoryType, List<models.Material>> materialsGroupedByCategory) async {
    final result = await showListIndexBottomSheet(
      context: context,
      items: assetData.materialCategories.entries.map((e) {
        final categoryId = e.key;

        return ListIndexItem(
          title: e.value.localized,
          image: materialsGroupedByCategory[categoryId]!.first.getImageFile(assetData.assetDir),
          value: categoryId,
        );
      }).toList(),
    );
    if (result != null) {
      _scrollToMaterialCategory(scrollController, materialsGroupedByCategory, result);
    }
  }

  void _scrollToMaterialCategory(ScrollController scrollController, Map<MaterialCategoryType, List<models.Material>> materialsGroupedByCategory, MaterialCategoryType category) {
    double offset = 0.0;
    for (final e in assetData.materialCategories.keys) {
      if (e == category) {
        scrollController.animateTo(
          min(offset, scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutQuint,
        );
        break;
      }
      offset += stickyListHeaderHeight + (listTileHeight * (materialsGroupedByCategory[e]?.length ?? 0));
    }
  }
}
