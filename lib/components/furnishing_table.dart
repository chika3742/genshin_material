import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../db/furnishing_db_extension.dart";
import "../i18n/strings.g.dart";
import "../models/common.dart";
import "../models/furnishing_set.dart";
import "../providers/database_provider.dart";
import "../providers/versions.dart";
import "../routes.dart";
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

  const FurnishingTable({super.key, required this.setId, required this.items});

  static const tableHorizontalMargin = 16.0;
  static const tableColumnSpacing = 32.0;
  static const tableDataRowMinHeight = 70.0;
  static const tableDataRowMaxHeight = tableDataRowMinHeight;
  static const tableImageWidth = 44.0;
  static const tableItemNameMaxWidthRatio = 0.35;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;
    final db = ref.watch(appDatabaseProvider);

    final counts = useStream(
      useMemoized(() => db.watchFurnishingCraftCounts(setId), [setId]),
    ).data;

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
              tableImageWidth
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
                  ItemSourceWidget(item.furnishing.source!),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
