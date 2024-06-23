import "package:flutter/material.dart";

import "../../components/list_tile.dart";
import "../../i18n/strings.g.dart";
import "../../main.dart";
import "../../routes.dart";

class DebugMenuPage extends StatelessWidget {
  const DebugMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
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
