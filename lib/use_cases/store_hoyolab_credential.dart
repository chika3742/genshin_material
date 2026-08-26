import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/errors.dart";
import "../data/repositories/hoyolab_api_repositories.dart";
import "../data/repositories/secure_storage_repository.dart";
import "../data/services/hoyolab_api/hoyolab_api.dart";

part "store_hoyolab_credential.g.dart";

class StoreHoyolabCredential {
  final HoyolabPreAuthApi _api;
  final SecureStorageRepository _secureStorage;

  const StoreHoyolabCredential(this._api, this._secureStorage);

  Future<void> execute(String cookie) async {
    // verify credential
    final verificationResult = await _api.verifyLToken(cookie);
    if (verificationResult.hasError) {
      throw CredentialVerificationException(message: verificationResult.message);
    }

    await _secureStorage.setHoyolabCookie(cookie);
  }
}

@riverpod
StoreHoyolabCredential storeHoyolabCredential(Ref ref) {
  return StoreHoyolabCredential(
    ref.watch(hoyolabPreAuthApiProvider),
    ref.watch(secureStorageRepositoryProvider),
  );
}
