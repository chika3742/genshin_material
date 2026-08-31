import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/hoyolab_api.dart";
import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../core/secure_storage.dart";
import "../data/repositories/remote_config_repository.dart";
import "../models/hoyolab_api.dart";
import "pref_notifier.dart";

part "hoyolab_credential.g.dart";

typedef HoyolabCredentialSnapshot = ({
  String? hyvServer,
  String? hyvServerName,
  String? hyvUserName,
  String? hyvUid,
});

@riverpod
class HoyolabCredential extends _$HoyolabCredential {
  @override
  HoyolabCredentialSnapshot build() {
    return (
      hyvServer: ref.watch(prefProvider(PrefKeys.hyvServer)),
      hyvServerName: ref.watch(prefProvider(PrefKeys.hyvServerName)),
      hyvUserName: ref.watch(prefProvider(PrefKeys.hyvUserName)),
      hyvUid: ref.watch(prefProvider(PrefKeys.hyvUid)),
    );
  }

  Future<void> setServer(HyvServer server, String username) async {
    await ref.read(prefProvider(PrefKeys.hyvServer).notifier).set(server.region);
    await ref.read(prefProvider(PrefKeys.hyvServerName).notifier).set(server.name);
    await ref.read(prefProvider(PrefKeys.hyvUserName).notifier).set(username);
  }

  Future<void> setUid(String uid) async {
    await ref.read(prefProvider(PrefKeys.hyvUid).notifier).set(uid);
  }

  Future<void> clear() async {
    await HoyolabApi(
      cookie: await getHoyolabCookie(),
      remoteConfig: ref.read(remoteConfigProvider),
    ).logout();
    await Future.wait([
      deleteHoyolabCookie(),
      ref.read(prefProvider(PrefKeys.hyvServer).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvServerName).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvUserName).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvUid).notifier).set(null),
    ]);
    await ref.read(isHoyolabSignedInProvider.notifier).refresh();
  }
}

@riverpod
bool isLinkedWithHoyolab(Ref ref) {
  final cred = ref.watch(hoyolabCredentialProvider);
  return cred.hyvServer != null &&
      cred.hyvServerName != null &&
      cred.hyvUserName != null &&
      cred.hyvUid != null &&
      ref.watch(remoteConfigProvider).get(RemoteConfigKeys.hoyolabLinkEnabled);
}

@Riverpod(keepAlive: true)
bool isHoyolabSignedInInitial(Ref ref) {
  return false; // Will be overridden on runtime.
}

@Riverpod(keepAlive: true)
class IsHoyolabSignedIn extends _$IsHoyolabSignedIn {
  @override
  bool build() => ref.watch(isHoyolabSignedInInitialProvider);

  Future<void> refresh() async {
    state = await hasHoyolabCookie();
  }
}
