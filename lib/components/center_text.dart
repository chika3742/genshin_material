import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

class CenterText extends StatelessWidget {
  final String text;

  const CenterText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(text),
      ),
    );
  }
}


class CenterError extends StatelessWidget {
  final Object error;

  const CenterError(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return CenterText("${tr.common.error} ($error)");
  }
}
