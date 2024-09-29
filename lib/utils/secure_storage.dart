import "package:flutter_secure_storage/flutter_secure_storage.dart";

import "../core/hoyolab_api.dart";

const secureStorage = FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ),
);

Future<void> setHoyolabCookie(String cookie) async {
  // verify credential
  final api = HoyolabApi(cookie: cookie);
  final verificationResult = await api.verifyLToken();
  if (verificationResult.hasError) {
    throw Exception("Credential verification failed: ${verificationResult.message}");
  }

  await secureStorage.write(key: "hoyolab_cookie", value: cookie);
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
