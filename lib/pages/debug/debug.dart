import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../components/list_tile.dart";
import "../../database.dart";
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
              (await AppDatabase.getDbFile()).delete();
              ref.invalidate(appDatabaseProvider);

              if (context.mounted) {
                showSnackBar(context: context, message: "Database recreated");
              }
            },
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
        ],
      ),
    );
  }
}
