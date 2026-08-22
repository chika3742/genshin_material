import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../data/repositories/remote_config_repository.dart";
import "../data/repositories/secure_storage_repository.dart";
import "../data/services/hoyolab_api/hoyolab_api.dart";
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
    await Future.wait([
      ref.read(prefProvider(PrefKeys.hyvServer).notifier).set(server.region),
      ref.read(prefProvider(PrefKeys.hyvServerName).notifier).set(server.name),
      ref.read(prefProvider(PrefKeys.hyvUserName).notifier).set(username),
    ]);
  }

  Future<void> setUid(String uid) async {
    await ref.read(prefProvider(PrefKeys.hyvUid).notifier).set(uid);
  }

  Future<void> clear() async {
    final api = await ref.read(hoyolabAuthenticatedApiProvider.future);
    await api.logout();
    await Future.wait([
      ref.read(secureStorageRepositoryProvider).deleteHoyolabCookie(),
      ref.read(prefProvider(PrefKeys.hyvServer).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvServerName).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvUserName).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvUid).notifier).set(null),
    ]);
    await ref.read(isHoyolabSignedInProvider.notifier).refresh();
  }
}

@riverpod
bool isHoyolabLinkAvailable(Ref ref) {
  final cred = ref.watch(hoyolabCredentialProvider);
  return ref.watch(isHoyolabSignedInProvider) &&
      cred.hyvServer != null &&
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
    state = await ref.read(secureStorageRepositoryProvider).hasHoyolabCookie();
  }
}
