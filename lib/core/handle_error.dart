import "package:flutter/foundation.dart";

void handleError(Object error, StackTrace stackTrace) {
  debugPrint(error.toString());
  debugPrintStack(stackTrace: stackTrace);
}
