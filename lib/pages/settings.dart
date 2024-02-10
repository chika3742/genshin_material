import "package:flutter/material.dart";
import "package:genshin_material/i18n/strings.g.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.settings),
      ),
      body: const Placeholder(),
    );
  }
}
