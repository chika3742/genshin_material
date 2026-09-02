import "../../../core/silent_exception.dart";

/// Thrown when a HoYoLAB endpoint answers with a non-zero `retcode`.
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

/// Thrown by every HoYoLAB API method while the integration is switched off
/// remotely. It is raised on the call, not on construction, so building an API
/// instance never fails and unlinking stays possible.
class HoyolabLinkDisabledException extends SilentException
    implements Exception {
  const HoyolabLinkDisabledException();

  @override
  String toString() => "HoyolabLinkDisabledException: the HoYoLAB link is disabled by remote config";
}

/// Thrown when an API that needs a cookie is requested but the user has not
/// signed in to HoYoLAB.
class HoyolabNotSignedInException extends SilentException implements Exception {
  const HoyolabNotSignedInException();

  @override
  String toString() => "HoyolabNotSignedInException: not signed in to HoYoLAB";
}

/// Thrown when an API that needs a game account is requested but no server has
/// been selected yet.
class HoyolabServerNotSelectedException extends SilentException
    implements Exception {
  const HoyolabServerNotSelectedException();

  @override
  String toString() => "HoyolabServerNotSelectedException: no HoYoLAB server is selected";
}

/// Thrown when the cookie handed over by the sign-in flow is rejected by
/// HoYoLAB.
class CredentialVerificationException implements Exception {
  final String message;

  const CredentialVerificationException({required this.message});

  @override
  String toString() {
    return "HoYoLAB Credential verification failed: $message";
  }
}
