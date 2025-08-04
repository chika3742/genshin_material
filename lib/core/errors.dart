import "package:flutter/foundation.dart";

void handleError(Object error, StackTrace stackTrace) {
  debugPrint(error.toString());
  debugPrintStack(stackTrace: stackTrace);
}

class NoCompatibleAssetException implements Exception {
  const NoCompatibleAssetException();

  @override
  String toString() => "No version compatible for current asset schema version.";
}
