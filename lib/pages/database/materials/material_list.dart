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
import "../../../i18n/strings.g.dart";
import "../../../routes.dart";
import "../../../ui_core/tutorial.dart";

class MaterialListPage extends HookConsumerWidget {
  MaterialListPage({super.key});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fabKey = useMemoized(() => GlobalKey());

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (context.mounted) showIndexSheetTutorialIfNeeded(context, fabKey, ref);
      });
      return null;
    }, [],);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.materials),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: fabKey,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) => DataAssetScope(
              builder: (context, assetData) {
                var offset = 0.0;
                final materialsGroupedByCategory = assetData.materials.values
                    .groupListsBy((element) => element.category);

                return ListIndexSheet(
                  onSelected: (scrollOffset) {
                    _scrollController.animateTo(
                      min(scrollOffset, _scrollController.position.maxScrollExtent),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                    );
                  },
                  items: assetData.materialCategories.entries
                      .where((e) => materialsGroupedByCategory.containsKey(e.key))
                      .map((e) {
                        final categoryId = e.key;
                        final categoryText = e.value.localized;

                        final item = ListIndexItem(
                          title: categoryText,
                          image: materialsGroupedByCategory[categoryId]!
                              .first.getImageFile(assetData.assetDir),
                          scrollOffset: offset,
                        );
                        offset += stickyListHeaderHeight +
                            (listTileHeight *
                                materialsGroupedByCategory[categoryId]!.length);
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
        builder: (context, assetData) {
          final categories = assetData.materialCategories;
          final materialsGroupedByCategory = assetData.materials.values
              .groupListsBy((element) => element.category);
          return PrimaryScrollController(
            controller: _scrollController,
            child: Scrollbar(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: categories.entries.map((e) {
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
          );
        },
      ),
    );
  }
}
