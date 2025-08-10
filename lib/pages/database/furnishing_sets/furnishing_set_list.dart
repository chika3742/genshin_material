import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/list_tile.dart";
import "../../../components/sticky_list_header.dart";
import "../../../constants/dimens.dart";
import "../../../core/asset_cache.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/common.dart";
import "../../../models/furnishing_set.dart";
import "../../../ui_core/bottom_sheet.dart";
import "../../../ui_core/tutorial.dart";

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
              ),
            ),
            ...assetData.furnishingSetTypes.entries.map((e) {
              final typeId = e.key;
              final categoryText = e.value.title.localized;
              final sets = furnishingSetsGrouped[typeId] ?? [];

              return SliverStickyHeader.builder(
                builder: (_, __) => StickyListHeader(categoryText),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final set = sets[index];
                      return GameItemListTile(
                        image: set.getImageFile(assetData.assetDir),
                        name: set.name.localized,
                      );
                    },
                    childCount: sets.length,
                  ),
                ),
              );
            })
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
    final result = await showListIndexBottomSheet(
      context: context,
      items: assetData.furnishingSetTypes.entries.map((e) {
        final typeId = e.key;
        final items = furnishingSetsGrouped[typeId]!;

        return ListIndexItem(
          image: items.first.getImageFile(assetData.assetDir),
          title: e.value.localized,
          value: typeId,
        );
      }).toList(),
    );
    if (result != null) {
      final offset = _getHeaderScrollOffset(furnishingSetsGrouped, result);
      scrollController.animateTo(
        min(offset, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutQuint,
      );
    }
  }

  double _getHeaderScrollOffset(
    FurnishingSetsGrouped furnishingSetsGrouped,
    FurnishingSetTypeId typeId,
  ) {
    double offset = 0.0;
    for (final e in assetData.furnishingSetTypes.keys) {
      if (e == typeId) {
        return offset;
      }
      offset += stickyListHeaderHeight + (listTileHeight * furnishingSetsGrouped[e]!.length)
        + listTileHeight; // height of furnishing list link at the top
    }
    return offset;
  }
}
