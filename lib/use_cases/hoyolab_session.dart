import "package:riverpod_annotation/riverpod_annotation.dart";

import "../data/repositories/hoyolab_cookie_repository.dart";
import "../data/services/crashlytics_service.dart";
import "../data/services/hoyolab/hoyolab_exceptions.dart";
import "../providers/hoyolab_api.dart";
import "../providers/hoyolab_game_server.dart";

part "hoyolab_session.g.dart";

class HoyolabStoreCookieUseCase {
  final Ref _ref;

  const HoyolabStoreCookieUseCase(this._ref);

  Future<void> call(String cookie) async {
    try {
      await (await _ref.read(hoyolabPublicApiProvider.future))
        .verifyLToken(cookie);
    } on HoyolabApiException catch (e, st) {
      _ref.read(crashlyticsServiceProvider).reportIfNonSilent(e, st);
      throw CredentialVerificationException(message: e.originalMessage);
    }

    await _ref.read(hoyolabCookieRepositoryProvider.notifier).store(cookie);
  }
}

@Riverpod(keepAlive: true)
HoyolabStoreCookieUseCase hoyolabStoreCookieUseCase(Ref ref) {
  return HoyolabStoreCookieUseCase(ref);
}

class HoyolabUnlinkUseCase {
  final Ref _ref;

  const HoyolabUnlinkUseCase(this._ref);

  Future<void> call() async {
    try {
      await (await _ref.read(hoyolabAccountApiProvider.future)).logout();
    } catch (e, st) {
      // Notify the API of sign-out as a courtesy, but ignore it if it fails.
      _ref.read(crashlyticsServiceProvider).reportIfNonSilent(e, st);
    }
    await _ref.read(hoyolabCookieRepositoryProvider.notifier).delete();
    await _ref.read(hoyolabGameServerProvider.notifier).clear();
  }
}

@Riverpod(keepAlive: true)
HoyolabUnlinkUseCase hoyolabUnlinkUseCase(Ref ref) {
  return HoyolabUnlinkUseCase(ref);
}
