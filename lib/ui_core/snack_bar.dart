import "package:flutter/material.dart";

void showSnackBar({
  required BuildContext context,
  required String message,
  Duration? duration,
  bool error = false,
}) {
  duration ??= error ? const Duration(seconds: 10) : const Duration(seconds: 4);
  final messenger = ScaffoldMessenger.of(context);
  messenger.clearSnackBars();
  messenger.showSnackBar(
    createSnackBar(
      message: message,
      duration: duration,
      backgroundColor: error ? Theme.of(context).colorScheme.error : null,
      messageFontWeight: error ? FontWeight.bold : FontWeight.normal,
    ),
  );
}

SnackBar createSnackBar({
  required String message,
  SnackBarAction? action,
  Duration duration = const Duration(seconds: 4),
  Color? backgroundColor,
  FontWeight messageFontWeight = FontWeight.normal,
}) {
  return SnackBar(
    content: Text(message, style: TextStyle(fontWeight: messageFontWeight)),
    action: action,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    backgroundColor: backgroundColor,
  );
}
