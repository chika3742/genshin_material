import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:path_provider/path_provider.dart";

import "../components/list_subheader.dart";
import "../components/list_tile.dart";
import "../core/asset_updater.dart";
import "../core/handle_error.dart";
import "../i18n/strings.g.dart";
import "../main.dart";
import "../models/common.dart";
import "../providers/asset_updating_state.dart";
import "../providers/preferences.dart";
import "../routes.dart";
import "../ui_core/bottom_sheet.dart";
import "../ui_core/install_latest_assets.dart";
import "../ui_core/snack_bar.dart";

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesStateNotifierProvider);

    final checkingForUpdates = useState(false);

    final updating = checkingForUpdates.value || ref.watch(assetUpdatingStateNotifierProvider).state != null;

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
              ref.read(preferencesStateNotifierProvider.notifier).setShowItemNameOnCard(value!);
            },
          ),
          SimpleListTile(
            title: tr.settingsPage.dailyResetServer,
            subtitle: prefs.dailyResetServer.description,
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
                  ref.read(preferencesStateNotifierProvider.notifier).setDailyResetServer(value);
                }
              });
            },
          ),
          ListSubheader(tr.settingsPage.assetData),
          SimpleListTile(
            title: tr.settingsPage.checkAssetUpdate,
            subtitle: tr.settingsPage.checkAssetUpdateDesc,
            trailingIcon: Symbols.update,
            enabled: !updating,
            onTap: () async {
              final updater = AssetUpdater(
                (await getLocalAssetDirectory()).path,
                tempDir: (await getTemporaryDirectory()).path,
              );
              try {
                checkingForUpdates.value = true;
                await updater.checkForUpdate();
              } catch (e, st) {
                handleError(e, st);
                showSnackBar(context: routerContext!, message: tr.updates.failedToUpdate);
                return;
              } finally {
                checkingForUpdates.value = false;
              }

              if (updater.isUpdateAvailable) {
                await installLatestAssets(
                  context: routerContext!,
                  ref: ref,
                  updater: updater,
                );
              } else {
                showSnackBar(context: routerContext!, message: tr.settingsPage.noUpdateAvailable);
              }
            },
          ),
          SimpleListTile(
            title: tr.settingsPage.reDownloadAssets,
            subtitle: tr.settingsPage.reDownloadAssetsDesc,
            trailingIcon: Symbols.download,
            enabled: !updating,
            onTap: () async {
              final updater = AssetUpdater(
                (await getLocalAssetDirectory()).path,
                tempDir: (await getTemporaryDirectory()).path,
              );
              try {
                checkingForUpdates.value = true;
                await updater.checkForUpdate(force: true);
              } catch (e, st) {
                handleError(e, st);
                showSnackBar(context: routerContext!, message: tr.updates.failedToUpdate);
                return;
              } finally {
                checkingForUpdates.value = false;
              }

              await installLatestAssets(
                context: routerContext!,
                ref: ref,
                updater: updater,
              );
            },
          ),
          ListSubheader(tr.settingsPage.others),
          SimpleListTile(
            title: tr.settingsPage.openSourceLicenses,
            onTap: () {
              LicensesRoute().go(context);
            },
          ),
        ],
      ),
    );
  }
}
