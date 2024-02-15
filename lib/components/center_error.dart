import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

class CenterError extends StatelessWidget {
  final Object error;

  const CenterError(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text("${tr.common.error} ($error)"),
      ),
    );
  }
}
