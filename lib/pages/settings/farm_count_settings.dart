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
    final (advRank, condensedMultiplier) = ref.watch(preferencesStateProvider
        .select((e) => (e.adventureRank, e.condensedMultiplier)));

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
          PopupMenuListTile(
            title: Text(tr.farmCountSettingsPage.adventureRank),
            subtitle: Text(advRank.toString()),
            trailing: Icon(Symbols.menu_open),
            value: advRank,
            onSelected: (value) {
              ref.read(preferencesStateProvider.notifier)
                  .setAdventureRank(value);
            },
            items: [
              for (final i in List.generate(maxAdventureRank, (idx) => idx + 1))
                PopupMenuItem(
                  value: i,
                  child: Text(i.toString()),
                ),
            ],
          ),
          SimpleListTile(
            title: tr.farmCountSettingsPage.skipRate,
            subtitle: multiplierText(condensedMultiplier),
            trailingIcon: Symbols.menu_open,
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
