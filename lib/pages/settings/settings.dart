import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../components/list_subheader.dart";
import "../../components/list_tile.dart";
import "../../core/pref_keys.dart";
import "../../i18n/strings.g.dart";
import "../../models/common.dart";
import "../../providers/asset_updating_state.dart";
import "../../providers/pref_notifier.dart";
import "../../routes.dart";
import "../../ui_core/bottom_sheet.dart";

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showItemNameOnCard = ref.watch(prefProvider(PrefKeys.showItemNameOnCard));
    final dailyResetServer = ref.watch(prefProvider(PrefKeys.dailyResetServer));

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
            value: showItemNameOnCard,
            onChanged: (value) {
              ref.read(prefProvider(PrefKeys.showItemNameOnCard).notifier).set(value!);
            },
          ),
          SimpleListTile(
            title: tr.settingsPage.dailyResetServer,
            subtitle: dailyResetServer.description,
            trailingIcon: Symbols.menu_open,
            onTap: () {
              showSelectBottomSheet(
                context: context,
                title: Text(tr.settingsPage.dailyResetServer),
                subtitle: Text(tr.settingsPage.dailyResetServerDesc),
                selectedValue: dailyResetServer,
                items: [
                  for (final server in GameServer.values)
                    SelectBottomSheetItem(
                      text: server.description,
                      value: server,
                    ),
                ],
              ).then((value) {
                if (value != null) {
                  ref.read(prefProvider(PrefKeys.dailyResetServer).notifier).set(value);
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
