import "package:flutter/material.dart";

import "../../../i18n/strings.g.dart";

class DatabaseNavPage extends StatelessWidget {
  const DatabaseNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.homeNavDestinations.database),
      ),
      body: const Placeholder(),
    );
  }
}
