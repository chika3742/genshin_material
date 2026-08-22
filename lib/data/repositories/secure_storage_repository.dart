import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/errors.dart";
import "../services/hoyolab_api/hoyolab_api.dart";

part "secure_storage_repository.g.dart";

class SecureStorageRepository {
  final HoyolabPreAuthApi? _hoyolabApi;
  final FlutterSecureStorage _secureStorage;

  const SecureStorageRepository({
    this._hoyolabApi,
    this._secureStorage = const FlutterSecureStorage(aOptions: AndroidOptions()),
  });

  Future<void> setHoyolabCookie(String cookie) async {
    if (_hoyolabApi == null) {
      throw StateError("setHoyolabCookie must be called via provider");
    }

    // verify credential
    final verificationResult = await _hoyolabApi.verifyLToken(cookie);
    if (verificationResult.hasError) {
      throw CredentialVerificationException(message: verificationResult.message);
    }

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
  return SecureStorageRepository(
    hoyolabApi: ref.watch(hoyolabPreAuthApiProvider),
  );
}
