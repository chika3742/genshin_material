import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "secure_storage_repository.g.dart";

class SecureStorageRepository {
  final FlutterSecureStorage _secureStorage;

  const SecureStorageRepository({
    this._secureStorage = const FlutterSecureStorage(aOptions: AndroidOptions()),
  });

  Future<void> setHoyolabCookie(String cookie) async {
    await _secureStorage.write(key: "hoyolab_cookie", value: cookie);
  }

  Future<void> deleteHoyolabCookie() async {
    await _secureStorage.delete(key: "hoyolab_cookie");
  }

  Future<String?> getHoyolabCookie() async {
    return await _secureStorage.read(key: "hoyolab_cookie");
  }

  Future<bool> hasHoyolabCookie() async {
    return await _secureStorage.containsKey(key: "hoyolab_cookie");
  }
}

@Riverpod(keepAlive: true)
SecureStorageRepository secureStorageRepository(Ref ref) {
  return SecureStorageRepository();
}
