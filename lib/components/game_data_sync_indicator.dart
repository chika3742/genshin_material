import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../i18n/strings.g.dart";

class GameDataSyncIndicator extends HookWidget {
  final bool show;
  final String? message;

  final _height = 32.0;

  const GameDataSyncIndicator({super.key, required this.show, this.message});

  @override
  Widget build(BuildContext context) {
    final showIndicator = useState(show);
    final visibleIndicator = useState(show);

    useValueChanged<bool, void>(show, (oldValue, _) {
      if (oldValue && message != null) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          showIndicator.value = false;
        });
      } else {
        showIndicator.value = show;
      }

      if (show) {
        visibleIndicator.value = true;
      }
    });

    return TweenAnimationBuilder(
      tween: Tween(end: showIndicator.value ? 1.0 : 0.0),
      duration: Durations.medium3,
      curve: Easing.standardDecelerate,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: SizedBox(
            height: value * _height,
            child: ClipRect(
              child: OverflowBox(
                alignment: Alignment.topCenter,
                maxHeight: _height,
                child: child,
              ),
            ),
          ),
        );
      },
      onEnd: () {
        visibleIndicator.value = showIndicator.value;
      },
      child: Visibility(
        visible: visibleIndicator.value,
        child: Column(
          children: [
            const LinearProgressIndicator(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(show || message == null ? tr.hoyolab.charaDataSyncInProgress : message!),
            ),
          ],
        ),
      ),
    );
  }
}
