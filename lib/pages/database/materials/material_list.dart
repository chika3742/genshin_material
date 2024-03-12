import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/data_asset_scope.dart";
import "../../../components/list_index_sheet.dart";
import "../../../components/sticky_list_header.dart";
import "../../../core/theme.dart";
import "../../../i18n/strings.g.dart";
import "../../../routes.dart";

class MaterialListPage extends StatelessWidget {
  MaterialListPage({super.key});

  final _scrollController = ScrollController();

  static const _listTileHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.materials),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) => DataAssetScope(
              builder: (assetData) {
                var offset = 0.0;
                final materialsGroupedByCategory = assetData.materials!
                    .groupListsBy((element) => element.category);

                return ListIndexSheet(
                  listScrollController: _scrollController,
                  items: assetData.materialCategories!.entries
                      .map((e) {
                        final categoryId = e.key;
                        final categoryText = e.value.localized;

                        final item = ListIndexItem(
                          title: categoryText,
                          image: materialsGroupedByCategory[categoryId]!.first.getImageFile(assetData.assetDir!),
                          scrollOffset: offset,
                        );
                        offset += StickyListHeader.height + (_listTileHeight * materialsGroupedByCategory[categoryId]!.length);
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
        builder: (assetData) {
          final categories = assetData.materialCategories!;
          final materialsGroupedByCategory = assetData.materials!
              .groupListsBy((element) => element.category);
          return CustomScrollView(
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

                      return ListTile(
                        leading: Image.file(
                          material.getImageFile(assetData.assetDir!),
                          width: 36,
                          height: 36,
                        ),
                        title: Text(material.name.localized),
                        trailing: Container(
                          width: 48,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .extension<ComponentThemeExtension>()!
                                  .getRarityColor(material.rarity),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "★${material.rarity}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .extension<ComponentThemeExtension>()!
                                  .getRarityColor(material.rarity),
                            ),
                          ),
                        ),
                        onTap: () {
                          MaterialDetailsRoute(id: material.id).go(context);
                        },
                      );
                    },
                    childCount: materialsGroupedByCategory[categoryId]!.length,
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
