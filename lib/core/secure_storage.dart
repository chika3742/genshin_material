import "package:flutter_secure_storage/flutter_secure_storage.dart";

const secureStorage = FlutterSecureStorage(
  aOptions: AndroidOptions(),
);

/// Persists [cookie]. Verifying it beforehand is the caller's job — see
/// `HoyolabCredential.signIn`.
Future<void> setHoyolabCookie(String cookie) async {
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
