import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:path/path.dart";
import "package:path_provider/path_provider.dart";

import "../../components/list_tile.dart";
import "../../core/asset_updater.dart";
import "../../i18n/strings.g.dart";
import "../../main.dart";
import "../../providers/database_provider.dart";
import "../../routes.dart";
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
            title: "Drift DB Viewer",
            location: DebugDriftDbViewerRoute().location,
          ),
          SimpleListTile(
            title: "Component Gallery",
            location: DebugComponentGalleryRoute().location,
          ),
          SimpleListTile(
            title: "Recreate Database",
            onTap: () async {
              await ref.read(appDatabaseProvider).close();
              File(join(
                (await getApplicationDocumentsDirectory()).path,
                "db.sqlite",
              )).delete();
              ref.invalidate(appDatabaseProvider);

              if (context.mounted) {
                showSnackBar(context: context, message: "Database recreated");
              }
            },
          ),
          PopupMenuListTile(
            title: const Text("Change App Language"),
            subtitle: Text("Current: ${LocaleSettings.currentLocale.languageCode}"),
            onSelected: (value) {
              LocaleSettings.setLocaleSync(value);
              Restartable.restartApp(context);
            },
            items: [
              PopupMenuItem(
                value: AppLocale.en,
                child: const Text("English"),
              ),
              PopupMenuItem(
                value: AppLocale.ja,
                child: const Text("Japanese"),
              ),
            ],
          ),
          SimpleListTile(
            title: "Test Crash",
            onTap: () {
              throw Exception("Test Crash");
            },
          ),
          SimpleListTile(
            title: "Copy Asset Data Path",
            onTap: () async {
              final path = getCurrentAssetDirectoryPath(await getAssetsDirectoryPath());
              await Clipboard.setData(ClipboardData(text: path));
              if (context.mounted) {
                showSnackBar(context: context, message: "Asset data path copied to clipboard");
              }
            },
          ),
        ],
      ),
    );
  }
}
