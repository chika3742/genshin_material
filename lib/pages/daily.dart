import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

class DailyPage extends StatelessWidget {
  const DailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.daily),
      ),
      body: const Placeholder(),
    );
  }
}
