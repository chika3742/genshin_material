import "package:flutter/material.dart";

import "../../i18n/strings.g.dart";

class ResinCalcPage extends StatelessWidget {
  const ResinCalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.resinCalc),
      ),
      body: Center(
        child: Text(tr.pages.resinCalc),
      ),
    );
  }
}
