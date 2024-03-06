
import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/data_asset_scope.dart";
import "../../../components/list_index_sheet.dart";
import "../../../i18n/strings.g.dart";
import "../../../routes.dart";

class MaterialListPage extends StatelessWidget {
  MaterialListPage({super.key});

  final _scrollController = ScrollController();

  final _listTileHeight = 56.0;
  final _listHeaderHeight = 38.0;

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
                  items: assetData.materialCategories!
                      .map((e) {
                        final item = ListIndexItem(
                          title: e.text.localized,
                          image: materialsGroupedByCategory[e.id]!.first.getImageFile(assetData.assetDir!),
                          scrollOffset: offset,
                        );
                        offset += _listHeaderHeight + _listTileHeight * materialsGroupedByCategory[e.id]!.length;
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
            slivers: categories.map((e) {
              return SliverStickyHeader.builder(
                key: GlobalObjectKey(e.id),
                builder: (context, state) {
                  return Container(
                    height: _listHeaderHeight,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e.text.localized,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final material = materialsGroupedByCategory[e.id]![index];
                      return ListTile(
                        leading: Image.file(
                          material.getImageFile(assetData.assetDir!),
                          width: 36,
                          height: 36,
                        ),
                        title: Text(material.name.localized),
                        onTap: () {
                          MaterialDetailsRoute(id: material.id).go(context);
                        },
                      );
                    },
                    childCount: materialsGroupedByCategory[e.id]!.length,
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
