import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/list_tile.dart";
import "../../core/asset_cache.dart";
import "../../i18n/strings.g.dart";
import "../../models/drop_rates.dart";
import "../../providers/preferences.dart";
import "../../ui_core/bottom_sheet.dart";
import "../../ui_core/layout.dart";

const maxAdventureRank = 60;

class FarmCountSettingsPage extends ConsumerWidget {
  const FarmCountSettingsPage({super.key, required this.assetData});

  final AssetData assetData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      advRank,
      condensedMultiplier,
      showFarmCount,
    ) = ref.watch(preferencesStateProvider.select((e) => (
      e.adventureRank,
      e.condensedMultiplier,
      e.showFarmCount,
    )));

    String multiplierText(double n) {
      return tr.farmCountSettingsPage.multiplier(n: n.toStringAsFixed(0))
          + (n == 1.0 ? tr.farmCountSettingsPage.noUseCondensed : "");
    }

    String formatDropRate(DropRateEntry entry) {
      final rate = entry.getDropRateForAR(advRank);
      if (rate == null) return "";
      return (rate * (entry.condensedAvailable ? condensedMultiplier : 1.0))
          .toStringAsFixed(3);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.farmCountSettings),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text(tr.farmCountSettingsPage.showFarmCount),
            value: showFarmCount,
            onChanged: (value) {
              ref.read(preferencesStateProvider.notifier)
                  .setShowFarmCount(value);
            },
          ),
          SimpleListTile(
            title: tr.farmCountSettingsPage.adventureRank,
            subtitle: advRank.toString(),
            trailingIcon: Symbols.menu_open,
            enabled: showFarmCount,
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (context) {
                  return SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Text(tr.farmCountSettingsPage.adventureRank,
                          style: Theme.of(context).textTheme.titleMedium),
                        Expanded(
                          child: CupertinoPicker(
                            itemExtent: 32,
                            scrollController: FixedExtentScrollController(initialItem: advRank - 1),
                            magnification: 1.2,
                            squeeze: 1.2,
                            useMagnifier: true,
                            onSelectedItemChanged: (int value) {
                              ref.read(preferencesStateProvider.notifier)
                                  .setAdventureRank(value + 1);
                            },
                            children: List.generate(maxAdventureRank, (idx) {
                              return Center(
                                child: Text((idx + 1).toString()),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          SimpleListTile(
            title: tr.farmCountSettingsPage.skipRate,
            subtitle: multiplierText(condensedMultiplier),
            trailingIcon: Symbols.menu_open,
            enabled: showFarmCount,
            onTap: () async {
              final values = [1.0, 2.0, 3.0];

              final result = await showSelectBottomSheet(
                context: context,
                title: Text(tr.farmCountSettingsPage.skipRate),
                selectedValue: condensedMultiplier,
                items: [
                  for (final value in values)
                    SelectBottomSheetItem(
                      text: multiplierText(value),
                      value: value,
                    ),
                ],
              );

              if (result != null) {
                await ref.read(preferencesStateProvider.notifier)
                    .setCondensedMultiplier(result);
              }
            },
          ),

          SectionInnerHeading(tr.farmCountSettingsPage.dropRateList),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text(tr.farmCountSettingsPage.kind),
                ),
                DataColumn(
                  label: Text(tr.farmCountSettingsPage.rate),
                ),
                DataColumn(
                  label: Text(tr.farmCountSettingsPage.note),
                ),
              ],
              rows: [
                for (final entry in assetData.dropRates)
                  DataRow(
                    cells: [
                      DataCell(Text(entry.description.localized)),
                      DataCell(Text(formatDropRate(entry))),
                      DataCell(Text(entry.note?.localized ?? "")),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
