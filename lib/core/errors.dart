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

class CredentialVerificationException implements Exception {
  final String message;

  const CredentialVerificationException({required this.message});

  @override
  String toString() {
    return "HoYoLAB Credential verification failed: $message";
  }
}

class HoyolabApiException extends SilentException implements Exception {
  final int retcode;
  final String originalMessage;

  const HoyolabApiException(this.retcode, this.originalMessage);

  @override
  String toString() {
    return "HoyolabApiException: $originalMessage, retcode: $retcode";
  }

  static const _knownRetcodes = [
    -502002, // character data access not allowed
    -502001, // character does not exist
    10102, // realtime notes not enabled
    -100, // login expired
  ];

  @override
  bool get isSilent => _knownRetcodes.contains(retcode);
}

class HoyolabLinkDisabledException extends SilentException implements Exception {
  const HoyolabLinkDisabledException();

  @override
  String toString() => "HoYoLAB link feature has been disabled by the remote.";
}

class HoyolabUnauthenticatedException extends SilentException implements Exception {
  const HoyolabUnauthenticatedException();

  @override
  String toString() => "Not signed in to HoYoLAB";
}

class HoyolabServerNotSelectedException extends SilentException implements Exception {
  const HoyolabServerNotSelectedException();

  @override
  String toString() => "HoYoLAB server is not selected";
}
