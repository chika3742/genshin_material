import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../models/hoyolab_api.dart";
import "pref_notifier.dart";
import "remote_config.dart";

part "hoyolab_game_server.freezed.dart";
part "hoyolab_game_server.g.dart";

/// The HoYoLAB game server the app is linked to, together with the game role
/// played on it, as persisted locally.
///
/// The four values are always written together, so they are modelled as a
/// sealed type: a state where the server is known but the uid is not simply
/// cannot be constructed.
@freezed
sealed class HoyolabGameServerState with _$HoyolabGameServerState {
  const HoyolabGameServerState._();

  /// No server has been selected yet (the user may still be signed in).
  const factory HoyolabGameServerState.unlinked() = UnlinkedHoyolabGameServer;

  const factory HoyolabGameServerState.linked({
    /// The region of the selected server, e.g. `os_asia`.
    required String server,
    required String serverName,
    required String userName,
    required String uid,
  }) = LinkedHoyolabGameServer;

  /// Convenience accessor for the consumers that only need the uid.
  String? get uidOrNull => switch (this) {
    LinkedHoyolabGameServer(:final uid) => uid,
    UnlinkedHoyolabGameServer() => null,
  };
}

/// The single read/write path for the HoYoLAB server and user identity.
///
/// The preferences behind it are a persistence backend only; nothing outside
/// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
/// what lets the notifier own the state: it reads the preferences once in
/// [build] and afterwards emits exactly one update per mutation, instead of one
/// per written key.
@Riverpod(keepAlive: true)
class HoyolabGameServer extends _$HoyolabGameServer {
  @override
  HoyolabGameServerState build() {
    // Deliberately `read`, not `watch`: this notifier is the only writer, so
    // re-reading on every key write would only produce redundant rebuilds.
    final server = ref.read(prefProvider(PrefKeys.hyvServer));
    final serverName = ref.read(prefProvider(PrefKeys.hyvServerName));
    final userName = ref.read(prefProvider(PrefKeys.hyvUserName));
    final uid = ref.read(prefProvider(PrefKeys.hyvUid));

    if (server == null || serverName == null || userName == null || uid == null) {
      return const HoyolabGameServerState.unlinked();
    }
    return HoyolabGameServerState.linked(
      server: server,
      serverName: serverName,
      userName: userName,
      uid: uid,
    );
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

    state = HoyolabGameServerState.linked(
      server: server.region,
      serverName: server.name,
      userName: role.nickname,
      uid: role.uid,
    );
  }

  Future<void> clear() async {
    await Future.wait([
      ref.read(prefProvider(PrefKeys.hyvServer).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvServerName).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvUserName).notifier).set(null),
      ref.read(prefProvider(PrefKeys.hyvUid).notifier).set(null),
    ]);

    state = const HoyolabGameServerState.unlinked();
  }
}

@riverpod
bool isLinkedWithHoyolab(Ref ref) {
  return ref.watch(hoyolabGameServerProvider) is LinkedHoyolabGameServer &&
      ref.watch(remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled));
}
