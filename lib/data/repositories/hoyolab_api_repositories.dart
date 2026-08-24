import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/errors.dart";
import "../../core/pref_keys.dart";
import "../../core/remote_config_keys.dart";
import "../../providers/pref_notifier.dart";
import "../services/hoyolab_api/hoyolab_api.dart";
import "../services/http_client.dart";
import "hoyolab_credential.dart";
import "remote_config_value.dart";
import "secure_storage_repository.dart";

part "hoyolab_api_repositories.g.dart";

@Riverpod(keepAlive: true)
HoyolabPreAuthApi hoyolabPreAuthApi(Ref ref) {
  if (!ref.watch(remoteConfigValueProvider(RemoteConfigKeys.hoyolabLinkEnabled))) {
    throw HoyolabLinkDisabledException();
  }

  return HoyolabPreAuthApi(client: ref.watch(httpClientProvider));
}

@Riverpod(keepAlive: true)
Future<HoyolabAuthenticatedApi> hoyolabAuthenticatedApi(Ref ref) async {
  if (!ref.watch(remoteConfigValueProvider(RemoteConfigKeys.hoyolabLinkEnabled))) {
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

  return HoyolabAuthenticatedApi(cookie, client: ref.watch(httpClientProvider));
}

@Riverpod(keepAlive: true)
Future<HoyolabAuthenticatedServerApi> hoyolabAuthenticatedServerApi(Ref ref) async {
  final region = ref.watch(prefProvider(PrefKeys.hyvServer));
  final uid = ref.watch(prefProvider(PrefKeys.hyvUid));

  if (!ref.watch(remoteConfigValueProvider(RemoteConfigKeys.hoyolabLinkEnabled))) {
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

  return HoyolabAuthenticatedServerApi(cookie, region, uid, client: ref.watch(httpClientProvider));
}
