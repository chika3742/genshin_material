import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "hoyolab_cookie_repository.g.dart";

const _secureStorage = FlutterSecureStorage(
  aOptions: AndroidOptions(),
);

const _hoyolabCookieKey = "hoyolab_cookie";

@Riverpod(keepAlive: true)
class HoyolabCookieRepository extends _$HoyolabCookieRepository {
  @override
  Future<String?> build() {
    return _secureStorage.read(key: _hoyolabCookieKey);
  }

  Future<void> store(String cookie) async {
    await _secureStorage.write(key: _hoyolabCookieKey, value: cookie);
    state = AsyncValue.data(cookie);
  }

  Future<void> delete() async {
    await _secureStorage.delete(key: _hoyolabCookieKey);
    state = AsyncValue.data(null);
  }
}
