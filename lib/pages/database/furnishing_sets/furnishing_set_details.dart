import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/center_text.dart";
import "../../../components/character_small_card.dart";
import "../../../components/furnishing_counter.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/item_source_widget.dart";
import "../../../core/asset_cache.dart";
import "../../../db/furnishing_db_extension.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";
import "../../../providers/database_provider.dart";
import "../../../routes.dart";
import "../../../ui_core/dialog.dart";
import "../../../ui_core/layout.dart";

class FurnishingSetDetailsPage extends ConsumerWidget {
  final AssetData assetData;
  final FurnishingSetId id;

  const FurnishingSetDetailsPage({
    super.key,
    required this.id,
    required this.assetData,
  });

  static const tableHorizontalMargin = 16.0;
  static const tableColumnSpacing = 32.0;
  static const tableDataRowMinHeight = 70.0;
  static const tableDataRowMaxHeight = tableDataRowMinHeight;
  static const tableImageWidth = 44.0;
  static const tableItemNameMaxWidthRatio = 0.35;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = assetData.furnishingSets[id];
    if (set == null) {
      return Scaffold(
        appBar: AppBar(),
        body: CenterText(tr.common.error),
      );
    }

    final components = set.consistsOf.map((e) => (
      furnishing: assetData.furnishings[e.furnishingId]!,
      quantity: e.quantity,
    ));

    final charactersFavored = assetData.characters.values.where((e) {
      return e is ListedCharacter
          && e.hyvIds.any((id) => set.favoriteCharacterHyvIds.contains(id));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.furnishingSetDetails(furnishingSet: set.name.localized)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GameItemInfoBox(
                itemImage: Image.file(set.getImageFile(assetData.assetDir), width: 90),
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "${tr.furnishingSetsPage.type}  ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: assetData.furnishingSetTypes[set.type]!.localized),
                  ])),
                ],
              ),

              // scroll hint text
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Symbols.arrow_range,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Text(
                    tr.furnishingSetsPage.canBeScrolledHorizontally,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              FullWidth(
                child: SingleChildScrollView(
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
                      for (final component in components)
                        DataRow(
                          cells: [
                            DataCell(
                              Image.file(
                                component.furnishing.getImageFile(assetData.assetDir),
                              ),
                              onTap: () {
                                FurnishingDetailsRoute(id: component.furnishing.id)
                                    .push(context);
                              },
                            ),
                            DataCell(
                              Text(component.furnishing.name.localized),
                            ),
                            DataCell(
                              HookConsumer(
                                builder: (context, ref, _) {
                                  final db = ref.watch(appDatabaseProvider);
                                  final count = useStream(
                                      db.watchFurnishingCraftCount(set.id, component.furnishing.id));
                                  return FurnishingCounter(
                                    requiredCount: component.quantity,
                                    currentCount: count.data ?? 0,
                                    onChanged: (value) {
                                      ref.read(appDatabaseProvider).updateFurnishingCraftCount(
                                        set.id, component.furnishing.id, value,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            DataCell(
                              ItemSourceWidget(component.furnishing.source!),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              OutlinedButton.icon(
                icon: Icon(Symbols.reset_settings),
                label: Text(tr.furnishingSetsPage.resetCraftCount),
                onPressed: () => _showResetCraftCountDialog(context, ref),
              ),

              ...charactersFavored.isNotEmpty ? [
                SectionHeading(tr.furnishingSetsPage.favoredBy),
                Wrap(
                  children: charactersFavored.map((character) {
                    return CharacterSmallCard(character);
                  }).toList(),
                ),
              ] : [],
            ],
          ),
        ),
      ),
    );
  }

  void _showResetCraftCountDialog(BuildContext context, WidgetRef ref) {
    showSimpleDialog(
      context: context,
      title: tr.furnishingSetsPage.resetCraftCount,
      content: tr.furnishingSetsPage.resetCraftCountConfirm,
      onOkPressed: () {
        if (ref.context.mounted) {
          ref.read(appDatabaseProvider).resetFurnishingCraftCounts(id);
        }
      },
      showCancel: true,
    );
  }
}
