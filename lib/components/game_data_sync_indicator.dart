import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../i18n/strings.g.dart";

class GameDataSyncIndicator extends HookWidget {
  final bool show;
  final String? message;

  const GameDataSyncIndicator({super.key, required this.show, this.message});

  @override
  Widget build(BuildContext context) {
    final showIndicator = useState(show);

    useValueChanged<bool, void>(show, (oldValue, _) {
      if (oldValue && message != null) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          showIndicator.value = false;
        });
      } else {
        showIndicator.value = show;
      }
    });

    return AnimatedCrossFade(
      crossFadeState: showIndicator.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Durations.medium3,
      sizeCurve: Easing.emphasizedDecelerate,
      firstChild: const SizedBox.shrink(),
      secondChild: Column(
        children: [
          Opacity(
            opacity: show ? 1.0 : 0.0,
            child: const LinearProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(show || message == null ? tr.hoyolab.charaDataSyncInProgress : message!),
          ),
        ],
      ),
    );
  }
}
