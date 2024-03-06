import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../../components/data_asset_scope.dart";
import "../../../i18n/strings.g.dart";

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
                return DraggableScrollableSheet(
                  expand: false,
                  snap: true,
                  initialChildSize: 0.8,
                  maxChildSize: 0.8,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          for (final category in assetData.materialCategories!)
                            ListTile(
                              leading: Image.file(
                                assetData.materials!.firstWhere((e) => e.category == category.id)
                                    .getImageFile(assetData.assetDir!),
                                width: 36,
                                height: 36,
                              ),
                              title: Text(category.text.localized),
                              onTap: () {
                                Navigator.pop(context);

                                var offset = 0.0;
                                final grouped = assetData.materials!.groupListsBy((element) => element.category);
                                for (final element in assetData.materialCategories!) {
                                  if (element.id == category.id) {
                                    break;
                                  }
                                  offset += _listHeaderHeight + _listTileHeight * grouped[element.id]!.length;
                                }
                                _scrollController.animateTo(
                                  min(offset, _scrollController.position.maxScrollExtent),
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOutQuint,
                                );
                              },
                            ),
                        ],
                      ),
                    );
                  },
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
