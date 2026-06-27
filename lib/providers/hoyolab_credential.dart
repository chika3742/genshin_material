import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../constants/remote_config_key.dart";
import "../core/hoyolab_api.dart";
import "../core/pref_keys.dart";
import "../core/secure_storage.dart";
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
    await HoyolabApi(cookie: await getHoyolabCookie()).logout();
    await deleteHoyolabCookie();
    await ref.read(prefProvider(PrefKeys.hyvServer).notifier).set(null);
    await ref.read(prefProvider(PrefKeys.hyvServerName).notifier).set(null);
    await ref.read(prefProvider(PrefKeys.hyvUserName).notifier).set(null);
    await ref.read(prefProvider(PrefKeys.hyvUid).notifier).set(null);
  }
}

@riverpod
bool isLinkedWithHoyolab(Ref ref) {
  final cred = ref.watch(hoyolabCredentialProvider);
  return cred.hyvServer != null &&
      cred.hyvServerName != null &&
      cred.hyvUserName != null &&
      cred.hyvUid != null &&
      FirebaseRemoteConfig.instance.getBool(RemoteConfigKey.hoyolabLinkEnabled);
}
