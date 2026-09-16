import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/api_request_queue.dart";
import "../core/remote_config_keys.dart";
import "../core/secure_storage.dart";
import "../data/services/hoyolab/hoyolab_account_api.dart";
import "../data/services/hoyolab/hoyolab_exceptions.dart";
import "../data/services/hoyolab/hoyolab_game_api.dart";
import "../data/services/hoyolab/hoyolab_public_api.dart";
import "hoyolab_game_server.dart";
import "http_client.dart";
import "remote_config.dart";

part "hoyolab_api.g.dart";

// The API instances are only ever obtained from here, so that nothing has to
// assemble the cookie and the game server by hand.
//
// These providers are kept alive because they are not tied to the lifecycle
// of the widgets.

/// Retrying is right for a flaky read but wrong for a link that is unavailable
/// by design: it would leave the provider loading forever.
Duration? _retryUnlessLinkIsUnavailable(int retryCount, Object error) {
  if (error is HoyolabLinkDisabledException ||
      error is HoyolabNotSignedInException ||
      error is HoyolabServerNotSelectedException) {
    return null;
  }
  return ProviderContainer.defaultRetry(retryCount, error);
}

/// The kill switch of every API calls
void _ensureLinkEnabled(Ref ref) {
  if (!ref.watch(remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled))) {
    throw const HoyolabLinkDisabledException();
  }
}

/// One queue for every HoYoLAB call, so the throttle holds across the three
/// API classes instead of per instance.
@Riverpod(keepAlive: true)
ApiRequestQueue hoyolabRequestQueue(Ref ref) =>
    ApiRequestQueue(interval: const Duration(milliseconds: 500));

@Riverpod(keepAlive: true, retry: _retryUnlessLinkIsUnavailable)
Future<HoyolabPublicApi> hoyolabPublicApi(Ref ref) async {
  _ensureLinkEnabled(ref);

  return HoyolabPublicApi(
    client: ref.watch(httpClientProvider),
    queue: ref.watch(hoyolabRequestQueueProvider),
  );
}

@Riverpod(keepAlive: true, retry: _retryUnlessLinkIsUnavailable)
Future<HoyolabAccountApi> hoyolabAccountApi(Ref ref) async {
  _ensureLinkEnabled(ref);
  final client = ref.watch(httpClientProvider);
  // Rebuild whenever the user signs in or out, which is when the cookie behind
  // `getHoyolabCookie()` changes. The storage stays the authority on it.
  ref.watch(isHoyolabSignedInProvider);
  final cookie = await getHoyolabCookie();
  if (cookie == null) {
    throw const HoyolabNotSignedInException();
  }
  return HoyolabAccountApi(
    cookie: cookie,
    client: client,
    queue: ref.watch(hoyolabRequestQueueProvider),
  );
}

@Riverpod(keepAlive: true, retry: _retryUnlessLinkIsUnavailable)
Future<HoyolabGameApi> hoyolabGameApi(Ref ref) async {
  _ensureLinkEnabled(ref);
  final client = ref.watch(httpClientProvider);
  // See `hoyolabAccountApi`: the sign-in state is watched for its invalidation,
  // the storage is still what answers.
  ref.watch(isHoyolabSignedInProvider);
  final gameServer = ref.watch(hoyolabGameServerProvider);
  final cookie = await getHoyolabCookie();
  if (cookie == null) {
    throw const HoyolabNotSignedInException();
  }
  if (gameServer is! LinkedHoyolabGameServer) {
    throw const HoyolabServerNotSelectedException();
  }
  return HoyolabGameApi(
    cookie: cookie,
    client: client,
    queue: ref.watch(hoyolabRequestQueueProvider),
    region: gameServer.server,
    uid: gameServer.uid,
  );
}
