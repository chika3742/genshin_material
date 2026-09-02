import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;

import "hoyolab_api.dart";

const secureStorage = FlutterSecureStorage(
  aOptions: AndroidOptions(),
);

/// [client] is taken as an argument because this function has no `Ref` to read
/// `httpClientProvider` from; the caller passes the app's client.
Future<void> setHoyolabCookie(String cookie, {required http.Client client}) async {
  // verify credential
  final api = HoyolabApi(cookie: cookie, client: client);
  final verificationResult = await api.verifyLToken();
  if (verificationResult.hasError) {
    throw CredentialVerificationException(message: verificationResult.message);
  }

  await secureStorage.write(key: "hoyolab_cookie", value: cookie);
}

class CredentialVerificationException implements Exception {
  final String message;

  const CredentialVerificationException({required this.message});

  @override
  String toString() {
    return "HoYoLAB Credential verification failed: $message";
  }
}

Future<void> deleteHoyolabCookie() async {
  await secureStorage.delete(key: "hoyolab_cookie");
}

Future<String?> getHoyolabCookie() async {
  return await secureStorage.read(key: "hoyolab_cookie");
}

Future<bool> hasHoyolabCookie() async {
  return await secureStorage.containsKey(key: "hoyolab_cookie");
}
