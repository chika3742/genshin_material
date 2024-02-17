import "package:flutter/material.dart";

import "../../../i18n/strings.g.dart";

class ToolsNavPage extends StatelessWidget {
  const ToolsNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.homeNavDestinations.tools),
      ),
      body: const Placeholder(),
    );
  }
}
