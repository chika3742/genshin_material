import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/hoyolab_api.dart";
import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../core/secure_storage.dart";
import "../data/repositories/remote_config_repository.dart";
import "../data/services/remote_config_service.dart";
import "../models/hoyolab_api.dart";
import "http_client.dart";
import "pref_notifier.dart";

part "hoyolab_credential.freezed.dart";
part "hoyolab_credential.g.dart";

/// The HoYoLAB account state that is persisted locally.
///
/// The four values are always written together, so they are modelled as a
/// sealed type: a state where the server is known but the uid is not simply
/// cannot be constructed.
@freezed
sealed class HoyolabCredentialState with _$HoyolabCredentialState {
  const HoyolabCredentialState._();

  /// No server has been selected yet (the user may still be signed in).
  const factory HoyolabCredentialState.unlinked() = UnlinkedHoyolabCredential;

  const factory HoyolabCredentialState.linked({
    /// The region of the selected server, e.g. `os_asia`.
    required String server,
    required String serverName,
    required String userName,
    required String uid,
  }) = LinkedHoyolabCredential;

  /// Convenience accessor for the consumers that only need the uid.
  String? get uidOrNull => switch (this) {
    LinkedHoyolabCredential(:final uid) => uid,
    UnlinkedHoyolabCredential() => null,
  };
}

/// The single read/write path for the HoYoLAB server and user identity.
///
/// The preferences behind it are a persistence backend only; nothing outside
/// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
/// what lets the notifier own the state: it reads the preferences once in
/// [build] and afterwards emits exactly one update per mutation, instead of one
/// per written key.
@riverpod
class HoyolabCredential extends _$HoyolabCredential {
  @override
  HoyolabCredentialState build() {
    // Deliberately `read`, not `watch`: this notifier is the only writer, so
    // re-reading on every key write would only produce redundant rebuilds.
    final server = ref.read(prefProvider(PrefKeys.hyvServer));
    final serverName = ref.read(prefProvider(PrefKeys.hyvServerName));
    final userName = ref.read(prefProvider(PrefKeys.hyvUserName));
    final uid = ref.read(prefProvider(PrefKeys.hyvUid));

    if (server == null || serverName == null || userName == null || uid == null) {
      return const HoyolabCredentialState.unlinked();
    }
    return HoyolabCredentialState.linked(
      server: server,
      serverName: serverName,
      userName: userName,
      uid: uid,
    );
  }

  /// Verifies [cookie] against HoYoLAB and stores it once it is known good.
  Future<void> signIn(String cookie) async {
    final result = await HoyolabApi(
      cookie: cookie,
      remoteConfig: ref.read(remoteConfigServiceProvider),
      client: ref.read(httpClientProvider),
    ).verifyLToken();
    if (result.hasError) {
      throw CredentialVerificationException(message: result.message);
    }

    await setHoyolabCookie(cookie);
    await ref.read(isHoyolabSignedInProvider.notifier).refresh();
  }

  /// Binds the account to [server] and the game role played on it.
  ///
  /// All four keys are written before the state is replaced, so listeners
  /// observe the change exactly once and never see a half-updated identity.
  Future<void> link({
    required HyvServer server,
    required HyvUserGameRole role,
  }) async {
    await Future.wait([
      ref.read(prefProvider(PrefKeys.hyvServer).notifier).set(server.region),
      ref.read(prefProvider(PrefKeys.hyvServerName).notifier).set(server.name),
      ref.read(prefProvider(PrefKeys.hyvUserName).notifier).set(role.nickname),
      ref.read(prefProvider(PrefKeys.hyvUid).notifier).set(role.uid),
    ]);

    state = HoyolabCredentialState.linked(
      server: server.region,
      serverName: server.name,
      userName: role.nickname,
      uid: role.uid,
    );
  }

  Future<void> clear() async {
    await HoyolabApi(
      cookie: await getHoyolabCookie(),
      remoteConfig: ref.read(remoteConfigServiceProvider),
      client: ref.read(httpClientProvider),
    ).logout();
    await Future.wait([
      deleteHoyolabCookie(),
      ref.read(prefProvider(PrefKeys.hyvServer).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvServerName).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvUserName).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvUid).notifier).set(null),
    ]);

    state = const HoyolabCredentialState.unlinked();
    await ref.read(isHoyolabSignedInProvider.notifier).refresh();
  }
}

@riverpod
bool isLinkedWithHoyolab(Ref ref) {
  return ref.watch(hoyolabCredentialProvider) is LinkedHoyolabCredential &&
      ref.watch(remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled));
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
