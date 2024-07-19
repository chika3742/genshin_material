import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:path_provider/path_provider.dart";

import "../components/list_subheader.dart";
import "../components/list_tile.dart";
import "../core/asset_updater.dart";
import "../core/handle_error.dart";
import "../i18n/strings.g.dart";
import "../main.dart";
import "../providers/asset_updating_state.dart";
import "../providers/preferences.dart";
import "../providers/versions.dart";
import "../routes.dart";
import "../ui_core/install_latest_assets.dart";
import "../ui_core/snack_bar.dart";
import "../utils/show_loading_modal.dart";

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final prefs = ref.watch(preferencesStateNotifierProvider);

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
          ListSubheader(tr.settingsPage.assetData),
          SimpleListTile(
            title: tr.settingsPage.reDownloadAssets,
            subtitle: tr.settingsPage.reDownloadAssetsDesc,
            trailingIcon: Symbols.download,
            enabled: ref.watch(assetUpdatingStateNotifierProvider).state == null,
            onTap: () async {
              showLoadingModal(context);

              // Delete existing assets in the device
              try {
                (await getLocalAssetDirectory()).delete(recursive: true);
              } catch (_) {}

              ref.invalidate(assetDataProvider);

              final updater = AssetUpdater(
                (await getLocalAssetDirectory()).path,
                tempDir: (await getTemporaryDirectory()).path,
              );
              try {
                await updater.checkForUpdate();
              } catch (e, st) {
                handleError(e, st);

                showSnackBar(context: routerContext!, message: tr.updates.failed);
                return;
              } finally {
                if (context.mounted) {
                  Navigator.of(context, rootNavigator: true).pop();
                }
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
