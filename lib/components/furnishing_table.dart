import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../db/furnishing_db_extension.dart";
import "../i18n/strings.g.dart";
import "../models/common.dart";
import "../models/furnishing_set.dart";
import "../providers/database_provider.dart";
import "../providers/versions.dart";
import "../routes.dart";
import "../ui_core/dialog.dart";
import "furnishing_counter.dart";
import "item_source_widget.dart";

class FurnishingSetComponentItem {
  final Furnishing furnishing;
  final int quantity;

  const FurnishingSetComponentItem({
    required this.furnishing,
    required this.quantity,
  });
}

class FurnishingTable extends HookConsumerWidget {
  final FurnishingSetId setId;
  final List<FurnishingSetComponentItem> items;
  final bool hideCompleted;

  const FurnishingTable({
    super.key,
    required this.setId,
    required this.items,
    this.hideCompleted = false,
  });

  static const tableHorizontalMargin = 16.0;
  static const tableColumnSpacing = 32.0;
  static const tableDataRowMinHeight = 70.0;
  static const tableDataRowMaxHeight = tableDataRowMinHeight;
  static const tableImageSize = 44.0;
  static const tableItemNameMaxWidthRatio = 0.35;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;
    final db = ref.watch(appDatabaseProvider);

    final counts = useStream(
      useMemoized(() => db.watchFurnishingCraftCounts(setId), [setId]),
    ).data;

    var items = this.items;
    if (hideCompleted && counts != null) {
      items = items.where((e) {
        final count = counts.firstWhereOrNull((c) => c.furnishingId == e.furnishing.id)?.count;
        if (count == null) {
          return true;
        }
        return count < e.quantity;
      }).toList();
    }

    if (hideCompleted && items.isEmpty) {
      return ListTile(
        title: Text(tr.bookmarksPage.allFurnishingsAreCrafted),
        trailing: IconButton(
          icon: Icon(Symbols.reset_settings),
          onPressed: () {
            showSimpleDialog(
              context: context,
              title: tr.furnishingSetsPage.resetCraftCount,
              content: tr.furnishingSetsPage.resetCraftCountConfirm,
              onOkPressed: () {
                if (ref.context.mounted) {
                  ref.read(appDatabaseProvider).resetFurnishingCraftCounts(setId);
                }
              },
              showCancel: true,
            );
          },
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        horizontalMargin: tableHorizontalMargin,
        columnSpacing: tableColumnSpacing,
        dataRowMinHeight: tableDataRowMinHeight,
        dataRowMaxHeight: tableDataRowMaxHeight,
        columns: [
          DataColumn(
            label: Text(tr.furnishingSetsPage.image),
            columnWidth: FixedColumnWidth(
              tableImageSize
                  + tableHorizontalMargin
                  + (tableColumnSpacing / 2),
            ),
          ),
          DataColumn(
            label: Text(tr.furnishingSetsPage.name),
            columnWidth: MinColumnWidth(
              FixedColumnWidth(MediaQuery.of(context).size.width * tableItemNameMaxWidthRatio),
              IntrinsicColumnWidth(),
            ),
          ),
          DataColumn(
            label: Text(tr.furnishingSetsPage.requiredQuantity),
          ),
          DataColumn(
            label: Text(tr.furnishingSetsPage.source),
          ),
        ],
        rows: [
          for (final item in items)
            DataRow(
              cells: [
                DataCell(
                  Image.file(
                    item.furnishing.getImageFile(assetData.assetDir),
                    height: tableImageSize,
                  ),
                  onTap: () {
                    FurnishingDetailsRoute(id: item.furnishing.id)
                        .push(context);
                  },
                ),
                DataCell(
                  Text(item.furnishing.name.localized),
                ),
                DataCell(
                  FurnishingCounter(
                    requiredCount: item.quantity,
                    currentCount: counts
                        ?.firstWhereOrNull((e) => e.furnishingId == item.furnishing.id)
                        ?.count ?? 0,
                    onChanged: (value) {
                      db.updateFurnishingCraftCount(
                        setId, item.furnishing.id, value,
                      );
                    },
                  ),
                ),
                DataCell(
                  item.furnishing.source != null
                      ? ItemSourceWidget(item.furnishing.source!)
                      : SizedBox.shrink(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
