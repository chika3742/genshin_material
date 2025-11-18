import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../components/list_subheader.dart";
import "../../components/list_tile.dart";
import "../../i18n/strings.g.dart";
import "../../models/common.dart";
import "../../providers/asset_updating_state.dart";
import "../../providers/preferences.dart";
import "../../routes.dart";
import "../../ui_core/bottom_sheet.dart";

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesStateProvider);

    final updatingState = ref.watch(assetUpdatingStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.settings),
      ),
      body: ListView(
        children: [
          ListSubheader(tr.settingsPage.display),
          CheckboxListTile(
            title: Text(tr.settingsPage.showItemNameOnCard),
            subtitle: Text(tr.settingsPage.showItemNameOnCardDesc),
            value: prefs.showItemNameOnCard,
            onChanged: (value) {
              ref.read(preferencesStateProvider.notifier).setShowItemNameOnCard(value!);
            },
          ),
          SimpleListTile(
            title: tr.settingsPage.dailyResetServer,
            subtitle: prefs.dailyResetServer.description,
            trailingIcon: Symbols.menu_open,
            onTap: () {
              showSelectBottomSheet(
                context: context,
                title: Text(tr.settingsPage.dailyResetServer),
                subtitle: Text(tr.settingsPage.dailyResetServerDesc),
                selectedValue: prefs.dailyResetServer,
                items: [
                  for (final server in GameServer.values)
                    SelectBottomSheetItem(
                      text: server.description,
                      value: server,
                    ),
                ],
              ).then((value) {
                if (value != null) {
                  ref.read(preferencesStateProvider.notifier).setDailyResetServer(value);
                }
              });
            },
          ),
          SimpleListTile(
            leadingIcon: Symbols.agriculture,
            title: tr.pages.farmCountSettings,
            subtitle: tr.settingsPage.farmCountSettingsDesc,
            location: FarmCountSettingsRoute().location,
          ),
          ListSubheader(tr.settingsPage.assetData),
          SimpleListTile(
            title: tr.settingsPage.checkAssetUpdate,
            subtitle: tr.settingsPage.checkAssetUpdateDesc,
            trailingIcon: Symbols.update,
            enabled: !updatingState.state.isBusy,
            onTap: () {
              ref.read(assetUpdatingStateProvider.notifier).checkForUpdate(silent: false);
            },
          ),
          SimpleListTile(
            title: tr.settingsPage.reDownloadAssets,
            subtitle: tr.settingsPage.reDownloadAssetsDesc,
            trailingIcon: Symbols.download,
            enabled: !updatingState.state.isBusy,
            onTap: () {
              ref.read(assetUpdatingStateProvider.notifier).checkForUpdate(silent: false, force: true);
            },
          ),
        ],
      ),
    );
  }
}
