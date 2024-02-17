import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.tools),
      ),
      body: const Placeholder(),
    );
  }
}
