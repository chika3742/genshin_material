import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:path_provider/path_provider.dart";

import "../components/list_subheader.dart";
import "../components/simple_list_item.dart";
import "../core/asset_updater.dart";
import "../core/handle_error.dart";
import "../i18n/strings.g.dart";
import "../main.dart";
import "../providers/asset_updating_state.dart";
import "../providers/versions.dart";
import "../ui_core/install_latest_assets.dart";
import "../ui_core/snack_bar.dart";

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.settings),
      ),
      body: ListView(
        children: [
          ListSubheader(tr.settingsPage.assetData),
          SimpleListItem(
            title: tr.settingsPage.reDownloadAssets,
            subtitle: tr.settingsPage.reDownloadAssetsDesc,
            trailingIcon: Symbols.download,
            enabled: ref.watch(assetUpdatingStateNotifierProvider).state == null,
            onTap: () async {
              // Delete existing assets in the device
              try {
                (await getLocalAssetDirectory()).delete(recursive: true);
              } catch (_) {}

              ref.invalidate(assetVersionDataProvider);

              final updater = AssetUpdater(
                await getLocalAssetDirectory(),
                tempDir: await getTemporaryDirectory(),
              );
              try {
                await updater.checkForUpdate();
              } catch (e, st) {
                handleError(e, st);

                showSnackBar(context: routerContext!, message: tr.updates.failed);
                return;
              }

              await installLatestAssets(
                context: routerContext!,
                ref: ref,
                updater: updater,
              );
            },
          ),
        ],
      ),
    );
  }
}
