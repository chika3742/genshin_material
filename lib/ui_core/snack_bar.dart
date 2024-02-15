import "package:flutter/material.dart";

void showSnackBar({
  required BuildContext context,
  required String message,
  Duration duration = const Duration(seconds: 4),
}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(createSnackBar(
    message: message,
    duration: duration,
  ),);
}

SnackBar createSnackBar({
  required String message,
  Duration duration = const Duration(seconds: 4),
}) {
  return SnackBar(
    content: Text(message),
    duration: duration,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
  );
}
