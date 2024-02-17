import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

class DatabasePage extends StatelessWidget {
  const DatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.database),
      ),
      body: const Placeholder(),
    );
  }
}
