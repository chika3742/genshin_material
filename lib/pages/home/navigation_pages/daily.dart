import "package:flutter/material.dart";

import "../../../i18n/strings.g.dart";

class DailyNavPage extends StatelessWidget {
  const DailyNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.homeNavDestinations.daily),
      ),
      body: const Placeholder(),
    );
  }
}
