import "package:flutter/material.dart";

import "../../components/list_tile.dart";
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
        ],
      ),
    );
  }
}
