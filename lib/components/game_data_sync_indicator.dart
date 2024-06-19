import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

class GameDataSyncIndicator extends StatelessWidget {
  final bool show;

  const GameDataSyncIndicator({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: show ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Durations.medium3,
      sizeCurve: Easing.emphasizedDecelerate,
      firstChild: const SizedBox.shrink(),
      secondChild: Column(
        children: [
          const LinearProgressIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(tr.hoyolab.charaDataSyncInProgress),
          ),
        ],
      ),
    );
  }
}
