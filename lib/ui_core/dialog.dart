import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

Future<void> showSimpleDialog({
  required BuildContext context,
  required String title,
  required String content,
  void Function()? onOkPressed,
  bool showCancel = false,
}) {
  Widget adaptiveAction({required Widget child, required void Function() onPressed}) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(title),
        content: Text(content),
        actions: [
          if (showCancel) adaptiveAction(
            child: Text(tr.common.cancel),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          if (onOkPressed != null) adaptiveAction(
            child: Text(tr.common.ok),
            onPressed: () {
              Navigator.pop(context);
              onOkPressed();
            },
          ),
        ],
      );
    },
  );
}
