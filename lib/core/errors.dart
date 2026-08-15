import "package:flutter/foundation.dart";

import "silent_exception.dart";

void handleError(Object error, StackTrace stackTrace) {
  debugPrint(error.toString());
  debugPrintStack(stackTrace: stackTrace);
}

class NoCompatibleAssetException implements Exception {
  const NoCompatibleAssetException();

  @override
  String toString() => "No version compatible for current asset schema version.";
}

class NoInstalledAssetException extends SilentException implements Exception {
  const NoInstalledAssetException();

  @override
  String toString() => "No available asset is installed.";
}
