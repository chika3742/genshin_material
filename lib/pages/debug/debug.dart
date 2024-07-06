import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:path_provider/path_provider.dart";

import "../../components/list_tile.dart";
import "../../core/asset_updater.dart";
import "../../i18n/strings.g.dart";
import "../../main.dart";
import "../../providers/asset_updating_state.dart";
import "../../providers/versions.dart";
import "../../routes.dart";
import "../../ui_core/install_latest_assets.dart";
import "../../ui_core/snack_bar.dart";

class DebugMenuPage extends ConsumerWidget {
  const DebugMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debug Menu"),
      ),
      body: ListView(
        children: [
          SimpleListTile(
            title: "Shared Preferences Editor",
            location: DebugSharedPreferencesEditorRoute().location,
          ),
          SimpleListTile(
            title: "Drift DB Editor",
            location: DebugDriftDbViewerRoute().location,
          ),
          SimpleListTile(
            title: "Component Gallery",
            location: DebugComponentGalleryRoute().location,
          ),
          PopupMenuListTile(
            title: const Text("Change App Language"),
            subtitle: Text("Current: ${LocaleSettings.currentLocale.languageCode}"),
            items: [
              PopupMenuItem(
                value: "en",
                child: const Text("English"),
                onTap: () {
                  LocaleSettings.setLocale(AppLocale.en);
                  Restartable.restartApp(context);
                },
              ),
              PopupMenuItem(
                value: "ja",
                child: const Text("Japanese"),
                onTap: () {
                  LocaleSettings.setLocale(AppLocale.ja);
                  Restartable.restartApp(context);
                },
              ),
            ],
          ),
          SimpleListTile(
            title: "Check for Asset Update",
            enabled: ref.watch(assetUpdatingStateNotifierProvider).state == null,
            onTap: () async {
              final assetDir = ref.read(assetDataProvider).value!.assetDir;
              final tempDir = await getTemporaryDirectory();
              final updater = AssetUpdater(assetDir, tempDir: tempDir.path);
              await updater.checkForUpdate();
              if (context.mounted) {
                if (updater.isUpdateAvailable) {
                  await installLatestAssets(context: context, ref: ref, updater: updater);
                } else {
                  showSnackBar(context: context, message: "No updates found.");
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
