import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/remote_config_keys.dart";
import "../core/secure_storage.dart";
import "../data/repositories/remote_config_repository.dart";
import "../data/services/hoyolab/hoyolab_account_api.dart";
import "../data/services/hoyolab/hoyolab_exceptions.dart";
import "../data/services/hoyolab/hoyolab_game_api.dart";
import "../data/services/hoyolab/hoyolab_public_api.dart";
import "hoyolab_credential.dart";
import "http_client.dart";

part "hoyolab_api.g.dart";

/// The API instances are only ever obtained from here, so that nothing has to
/// assemble the credentials by hand.
///
/// Missing credentials are reported as a typed exception rather than as null,
/// which keeps "unavailable" a single concept together with
/// [HoyolabLinkDisabledException]. Consumers are expected to check
/// [isHoyolabSignedInProvider] / [isLinkedWithHoyolabProvider] first; reaching
/// an exception past those guards means the stored state is inconsistent, and
/// is worth surfacing as an error.
///
/// The two asynchronous providers are kept alive on purpose. They read the
/// cookie from the secure storage, which takes several event loop turns, and an
/// auto-disposed provider that nobody listens to yet — `clear()` reads it
/// through `ref.read` — would be torn down mid-load. Watching
/// [isHoyolabSignedInProvider] and [hoyolabCredentialProvider] instead rebuilds
/// them whenever the stored identity actually changes.

/// Riverpod retries a failed provider build on its own, which is right for a
/// flaky read but wrong for a missing credential: nothing will appear until the
/// user signs in or picks a server, and each retry leaves the provider stuck in
/// a loading state that consumers await forever.
Duration? _retryUnlessCredentialIsMissing(int retryCount, Object error) {
  if (error is HoyolabNotSignedInException ||
      error is HoyolabServerNotSelectedException) {
    return null;
  }
  return ProviderContainer.defaultRetry(retryCount, error);
}

bool _linkEnabled(Ref ref) =>
    ref.watch(remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled));

@riverpod
HoyolabPublicApi hoyolabPublicApi(Ref ref) {
  return HoyolabPublicApi(
    enabled: _linkEnabled(ref),
    client: ref.watch(httpClientProvider),
  );
}

@Riverpod(keepAlive: true, retry: _retryUnlessCredentialIsMissing)
Future<HoyolabAccountApi> hoyolabAccountApi(Ref ref) async {
  final enabled = _linkEnabled(ref);
  final client = ref.watch(httpClientProvider);
  // Rebuild whenever the user signs in or out, which is when the cookie behind
  // `getHoyolabCookie()` changes. The storage stays the authority on it.
  ref.watch(isHoyolabSignedInProvider);
  final cookie = await getHoyolabCookie();
  if (cookie == null) {
    throw const HoyolabNotSignedInException();
  }
  return HoyolabAccountApi(enabled: enabled, cookie: cookie, client: client);
}

@Riverpod(keepAlive: true, retry: _retryUnlessCredentialIsMissing)
Future<HoyolabGameApi> hoyolabGameApi(Ref ref) async {
  final enabled = _linkEnabled(ref);
  final client = ref.watch(httpClientProvider);
  ref.watch(isHoyolabSignedInProvider);
  final credential = ref.watch(hoyolabCredentialProvider);
  final cookie = await getHoyolabCookie();
  if (cookie == null) {
    throw const HoyolabNotSignedInException();
  }
  if (credential is! LinkedHoyolabCredential) {
    throw const HoyolabServerNotSelectedException();
  }
  return HoyolabGameApi(
    enabled: enabled,
    cookie: cookie,
    client: client,
    region: credential.server,
    uid: credential.uid,
  );
}
