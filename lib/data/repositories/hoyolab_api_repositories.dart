import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/errors.dart";
import "../../core/pref_keys.dart";
import "../../core/remote_config_keys.dart";
import "../../providers/pref_notifier.dart";
import "../services/hoyolab_api/hoyolab_api.dart";
import "hoyolab_credential.dart";
import "remote_config_repository.dart";
import "secure_storage_repository.dart";

part "hoyolab_api_repositories.g.dart";

@Riverpod(keepAlive: true)
HoyolabPreAuthApi hoyolabPreAuthApi(Ref ref) {
  if (!ref.watch(remoteConfigProvider).get(RemoteConfigKeys.hoyolabLinkEnabled)) {
    throw HoyolabLinkDisabledException();
  }

  final api = HoyolabPreAuthApi();
  ref.onDispose(api.close);
  return api;
}

@Riverpod(keepAlive: true)
Future<HoyolabAuthenticatedApi> hoyolabAuthenticatedApi(Ref ref) async {
  if (!ref.watch(remoteConfigProvider).get(RemoteConfigKeys.hoyolabLinkEnabled)) {
    throw HoyolabLinkDisabledException();
  }
  if (!ref.watch(isHoyolabSignedInProvider)) {
    throw HoyolabUnauthenticatedException();
  }

  final secureStorage = ref.watch(secureStorageRepositoryProvider);

  final cookie = await secureStorage.getHoyolabCookie();
  if (cookie == null) {
    throw HoyolabUnauthenticatedException();
  }

  final api = HoyolabAuthenticatedApi(cookie);
  ref.onDispose(api.close);
  return api;
}

@Riverpod(keepAlive: true)
Future<HoyolabAuthenticatedServerApi> hoyolabAuthenticatedServerApi(Ref ref) async {
  final region = ref.watch(prefProvider(PrefKeys.hyvServer));
  final uid = ref.watch(prefProvider(PrefKeys.hyvUid));

  if (!ref.watch(remoteConfigProvider).get(RemoteConfigKeys.hoyolabLinkEnabled)) {
    throw HoyolabLinkDisabledException();
  }
  if (!ref.watch(isHoyolabSignedInProvider)) {
    throw HoyolabUnauthenticatedException();
  }

  final secureStorage = ref.watch(secureStorageRepositoryProvider);
  final cookie = await secureStorage.getHoyolabCookie();
  if (cookie == null) {
    throw HoyolabUnauthenticatedException();
  }

  if (region == null || uid == null) {
    throw HoyolabServerNotSelectedException();
  }

  final api = HoyolabAuthenticatedServerApi(cookie, region, uid);
  ref.onDispose(api.close);
  return api;
}
