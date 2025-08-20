import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/list_tile.dart";
import "../../../components/search.dart";
import "../../../components/sticky_list_header.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../models/furnishing_set.dart";
import "../../../routes.dart";
import "../../../ui_core/list_index_bottom_sheet.dart";
import "../../../ui_core/tutorial.dart";
import "../../../utils/filtering.dart";

typedef FurnishingSetsGrouped = Map<FurnishingSetTypeId, List<FurnishingSet>>;

class FurnishingSetListPage extends HookConsumerWidget {
  final AssetData assetData;

  const FurnishingSetListPage({super.key, required this.assetData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fabKey = useMemoized(() => GlobalKey());
    final scrollController = useScrollController();

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (context.mounted) showIndexSheetTutorialIfNeeded(context, fabKey, ref);
      });
      return null;
    }, []);

    final furnishingSetsGrouped = useMemoized(() {
      return assetData.furnishingSets.values.groupListsBy((e) => e.type);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.furnishingSets),
        actions: [
          SearchButton<FurnishingSet>(
            hintTargetText: tr.pages.furnishingSets,
            queryCallback: (query) {
              return filterBySearchQuery(
                assetData.furnishingSets.values,
                query,
              );
            },
            resultItemBuilder: (context, item) {
              return SearchResultListTile(
                image: Image.file(
                  item.getImageFile(assetData.assetDir),
                  width: searchResultImageSize,
                  height: searchResultImageSize,
                ),
                title: item.name.localized,
                location: FurnishingSetDetailsRoute(id: item.id).location,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: fabKey,
        onPressed: () {
          _showIndexSheet(context, scrollController, furnishingSetsGrouped);
        },
        icon: const Icon(Symbols.list),
        label: Text(tr.common.index),
      ),
      body: Scrollbar(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: SimpleListTile(
                title: tr.furnishingSetsPage.furnishingList,
                trailingIcon: Symbols.chevron_right,
                location: const FurnishingListRoute().location,
              ),
            ),
            ...assetData.furnishingSetTypes.entries.map((e) {
              final typeId = e.key;
              final categoryText = e.value.localized;
              final sets = furnishingSetsGrouped[typeId] ?? [];

              return SliverStickyHeader.builder(
                builder: (_, __) => StickyListHeader(categoryText),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final set = sets[index];
                      return SizedBox(
                        height: listTileHeight,
                        child: SimpleListTile(
                          key: ValueKey(set.id),
                          leading: Image.file(
                            set.getImageFile(assetData.assetDir),
                            width: listTileFurnishingSetImageWidth,
                          ),
                          title: set.name.localized,
                          location: FurnishingSetDetailsRoute(id: set.id).location,
                        ),
                      );
                    },
                    childCount: sets.length,
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
    FurnishingSetsGrouped furnishingSetsGrouped,
  ) async {
    await showListIndexBottomSheetWithScroll(
      context: context,
      items: assetData.furnishingSetTypes.entries.map((e) {
        final typeId = e.key;
        final entries = furnishingSetsGrouped[typeId]!;

        return ListIndexItem(
          title: e.value.localized,
          image: entries.first.getImageFile(assetData.assetDir),
          value: typeId,
          itemCount: entries.length,
        );
      }).toList(),
      scrollController: scrollController,
      headerOffset: listTileHeight, // the height of the link to furnishing list page
    );
  }
}
